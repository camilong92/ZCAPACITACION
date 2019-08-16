*&---------------------------------------------------------------------*
*&  Include           YRPMM_01_01F
*&---------------------------------------------------------------------*

FORM at_selection_screen_pa_path .
*Función para habilitar la carga o descarga de un archivo en ABAP
  CALL FUNCTION 'C13Z_FRONTEND_FILENAME_GET'
    EXPORTING
      i_window_title = text-001
    IMPORTING
      e_filename     = pa_path
    EXCEPTIONS
      internal_error = 1
      OTHERS         = 2.



ENDFORM.

FORM start_of_selection .

  DATA:
    lti_bdcdata TYPE bdcdata_tab,
    lti_message TYPE  tab_bdcmsgcoll,
    lti_return_all type bapiret2_t.

  DATA:
    lwa_bdcdata  TYPE bdcdata,
    lwa_archivo  TYPE gtp_archivo,
    lwa_datos    TYPE gtp_datos,
    lwa_posicion TYPE zedba_01.

  DATA:
    lc_indicador TYPE char1.

  PERFORM get_datafile USING pa_path CHANGING gti_archivo.

  PERFORM set_data     USING gti_archivo
                       CHANGING gti_datos.


  IF pa_bi IS NOT INITIAL.


    LOOP AT gti_datos INTO lwa_datos.


      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '0101'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'VBAK-AUART'
                                lwa_datos-auart
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '/00'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4001'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'KUAGV-KUNNR'
                                lwa_datos-kunrg
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '/00'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4001'
                       CHANGING lti_bdcdata.

      DATA:
            li_indicador TYPE i.

      LOOP AT lwa_datos-posnr INTO lwa_posicion.


        DATA:
          lc_nombre TYPE char30.

        ADD 1 TO li_indicador.
        WRITE li_indicador TO lc_indicador.

        lc_nombre = |RV45A-MABNR(0{ lc_indicador })|.

        PERFORM set_bdcdata USING ''
                                  lc_nombre
                                  lwa_posicion-matnr
                         CHANGING lti_bdcdata.

        lc_nombre = |RV45A-KWMENG(0{ lc_indicador })|.

        PERFORM set_bdcdata USING ''
                                  lc_nombre
                                  lwa_posicion-zmeng
                         CHANGING lti_bdcdata.

        PERFORM set_bdcdata USING ''
                                  'BDC_OKCODE'
                                  '/00'
                         CHANGING lti_bdcdata.

        lc_indicador = 'X'.

      ENDLOOP.

      CLEAR: lc_indicador, li_indicador.



      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4001'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '=HEAD'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4002'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '=T\03'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4002'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'VBKD-INCO1'
                                lwa_datos-inco1
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'VBKD-INCO2'
                                lwa_datos-inco2
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '/00'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING 'X'
                                'SAPMV45A'
                                '4002'
                       CHANGING lti_bdcdata.

      PERFORM set_bdcdata USING ''
                                'BDC_OKCODE'
                                '=SICH'
                       CHANGING lti_bdcdata.

      DATA:
            lv_opt TYPE ctu_params.

      lv_opt-dismode = 'N'.
      lv_opt-nobinpt = 'X'.

      CALL TRANSACTION 'VA01' USING lti_bdcdata OPTIONS FROM lv_opt
            MESSAGES INTO lti_message.
      CLEAR lti_bdcdata.

    ENDLOOP.



    PERFORM resultado CHANGING  lti_message.

  ELSE.

    DATA:
      lwa_header       TYPE bapisdhd1,
      lc_salesdocument TYPE vbeln_va,
      lti_return       TYPE bapiret2_t,
      lti_items        TYPE esales_bapisditm_tab,
      lti_partners     TYPE isi_bapiparnr_tt,
      lti_schedules    TYPE isi_bapischdl_tt.

    DATA:
      lwa_return    TYPE bapiret2,
      lwa_items     TYPE bapisditm,
      lwa_partners  TYPE bapiparnr,
      lwa_schedules TYPE bapischdl.

    LOOP AT gti_datos INTO lwa_datos.

      lwa_header-doc_type   = lwa_datos-auart.
      lwa_header-sales_org  = lwa_datos-vkorg.
      lwa_header-distr_chan = lwa_datos-vtweg.
      lwa_header-division   = lwa_datos-spart.
      lwa_header-incoterms1 = lwa_datos-inco1.
      lwa_header-incoterms2 = lwa_datos-inco2.

      LOOP AT lwa_datos-posnr INTO lwa_posicion.

        ADD 10 TO lwa_items-itm_number.

        CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
          EXPORTING
            input        = lwa_posicion-matnr
          IMPORTING
            output       = lwa_items-material
          EXCEPTIONS
            length_error = 1
            OTHERS       = 2.

        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.

        APPEND lwa_items TO lti_items.

        lwa_schedules-itm_number = lwa_items-itm_number.
        lwa_schedules-req_qty = lwa_posicion-zmeng.
        APPEND lwa_schedules TO lti_schedules.

      ENDLOOP.

      lwa_partners-partn_role = 'AG'.

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = lwa_datos-kunrg
        IMPORTING
          output = lwa_partners-partn_numb.

      APPEND lwa_partners TO lti_partners.

      CALL FUNCTION 'BAPI_SALESORDER_CREATEFROMDAT2'
        EXPORTING
          order_header_in    = lwa_header
        IMPORTING
          salesdocument      = lc_salesdocument
        TABLES
          return             = lti_return
          order_items_in     = lti_items
          order_partners     = lti_partners
          order_schedules_in = lti_schedules.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.

      append LINES OF lti_return to lti_return_all.

      CLEAR: lti_return, lti_partners, lti_items, lti_schedules,
      lti_return, lwa_datos, lwa_posicion, lwa_items, lwa_partners.



    ENDLOOP.

      DATA:  alv_ti TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = alv_ti
    CHANGING
      t_table      = lti_return_all.
  alv_ti->display( ).


  ENDIF.



ENDFORM.

*Sub-rutina para cargar un archvo plano en ABAP

FORM get_datafile  USING    p_s_path TYPE eseftfront
                   CHANGING p_ti_archivo TYPE gtp_ti_archivo.

  DATA: ls_filename TYPE dstring.
  ls_filename = p_s_path.


  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename                = ls_filename
      has_field_separator     = 'X'
    TABLES
      data_tab                = p_ti_archivo
    EXCEPTIONS
      file_open_error         = 1
      file_read_error         = 2
      no_batch                = 3
      gui_refuse_filetransfer = 4
      invalid_type            = 5
      no_authority            = 6
      unknown_error           = 7
      bad_data_format         = 8
      header_not_allowed      = 9
      separator_not_allowed   = 10
      header_too_long         = 11
      unknown_dp_error        = 12
      access_denied           = 13
      dp_out_of_memory        = 14
      disk_full               = 15
      dp_timeout              = 16
      OTHERS                  = 17.



ENDFORM.

FORM resultado CHANGING gti_messages TYPE tab_bdcmsgcoll.

  DATA:  alv_ti TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = alv_ti
    CHANGING
      t_table      = gti_messages.
  alv_ti->display( ).

ENDFORM.

FORM set_bdcdata USING p_c_dynpro   TYPE char1
                       p_c_valor1   TYPE any
                       p_c_valor2   TYPE any
              CHANGING p_ti_bdcdata TYPE bdcdata_tab.

  DATA:
    lwa_bdcdata TYPE bdcdata.


  IF p_c_dynpro EQ 'X'.

    lwa_bdcdata-program  = p_c_valor1.
    lwa_bdcdata-dynpro   = p_c_valor2.
    lwa_bdcdata-dynbegin = p_c_dynpro.

  ELSE.

    lwa_bdcdata-fnam     = p_c_valor1.
    lwa_bdcdata-fval     = p_c_valor2.

  ENDIF.

  APPEND lwa_bdcdata TO p_ti_bdcdata.
  CLEAR lwa_bdcdata.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GTI_ARCHIVO  text
*      <--P_GTI_DATOS  text
*----------------------------------------------------------------------*
FORM set_data  USING    p_ti_archivo TYPE gtp_ti_archivo
               CHANGING p_ti_datos   TYPE gtp_ti_datos.

  DATA:
    lti_posiciones TYPE zttdba_04.

  DATA:
    lwa_archivo  TYPE gtp_archivo,
    lwa_datos    TYPE gtp_datos,
    lwa_posicion TYPE zedba_01.

  FIELD-SYMBOLS:
    <lfs_datos> TYPE gtp_datos.


  LOOP AT p_ti_archivo INTO lwa_archivo.

    lwa_datos-cont  = lwa_archivo-cont.
    lwa_datos-auart = lwa_archivo-auart.
    lwa_datos-kunrg = lwa_archivo-kunrg.
    lwa_datos-inco1 = lwa_archivo-inco1.
    lwa_datos-inco2 = lwa_archivo-inco2.
    lwa_datos-vkorg = lwa_archivo-vkorg.
    lwa_datos-vtweg = lwa_archivo-vtweg.
    lwa_datos-spart = lwa_archivo-spart.

    READ TABLE p_ti_datos ASSIGNING <lfs_datos>
    WITH KEY cont = lwa_archivo-cont.

    IF sy-subrc EQ 0.

      lwa_posicion-matnr = lwa_archivo-matnr.
      lwa_posicion-zmeng = lwa_archivo-dzmeng.
      APPEND lwa_posicion TO <lfs_datos>-posnr .

    ELSE.

      lwa_posicion-matnr = lwa_archivo-matnr.
      lwa_posicion-zmeng = lwa_archivo-dzmeng.
      APPEND lwa_posicion TO lwa_datos-posnr .

      APPEND lwa_datos TO p_ti_datos.

    ENDIF.

    CLEAR: lwa_posicion, lwa_datos, lwa_archivo.

  ENDLOOP.

ENDFORM.
