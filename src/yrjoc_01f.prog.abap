*&---------------------------------------------------------------------*
*&  Include           YRPMM_01_01F
*&---------------------------------------------------------------------*

FORM at_selection_screen_pa_path .

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
    lti_message type  TAB_BDCMSGCOLL.

  DATA:
    lwa_bdcdata TYPE bdcdata,
    lwa_archivo TYPE gtp_archivo.

  PERFORM get_datafile USING pa_path CHANGING gti_archivo.


  LOOP AT gti_archivo INTO lwa_archivo.


    PERFORM set_bdcdata USING 'X'
                              'SAPMV45A'
                              '0101'
                     CHANGING lti_bdcdata.

    PERFORM set_bdcdata USING ''
                              'VBAK-AUART'
                              lwa_archivo-auart
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
                              lwa_archivo-kunrg
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
                              'RV45A-MABNR(01)'
                              lwa_archivo-matnr
                     CHANGING lti_bdcdata.

    PERFORM set_bdcdata USING ''
                              'RV45A-KWMENG(01)'
                              lwa_archivo-dzmeng
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
                              lwa_archivo-inco1
                     CHANGING lti_bdcdata.

    PERFORM set_bdcdata USING ''
                              'VBKD-INCO2'
                              lwa_archivo-inco2
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


    CALL TRANSACTION 'VA01' USING lti_bdcdata mode 'A'
          MESSAGES INTO lti_message.
    CLEAR lti_bdcdata.

  ENDLOOP.



  PERFORM resultado CHANGING  gti_archivo.



ENDFORM.

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

FORM resultado CHANGING gti_archivo TYPE gtp_ti_archivo.

  DATA:  alv_ti TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = alv_ti
    CHANGING
      t_table      = gti_archivo.
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
