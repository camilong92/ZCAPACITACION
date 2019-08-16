*&---------------------------------------------------------------------*
*&  Include           ZR_JOC_BACH_IMPUT_F
*&---------------------------------------------------------------------*
TYPES:
 BEGIN OF gty_estru,
    nombre(200) type c,
    nomco(2) type c,
    pais(2)  type c,
    idioma(2) TYPE c,
 END OF gty_estru.

 TYPES:
    gtt_alv TYPE STANDARD TABLE OF gty_estru.


INCLUDE bdcrecx1.

DATA:
gti_mostrar TYPE STANDARD TABLE OF gty_estru,
gwa_mostrar TYPE gty_estru.


PARAMETERS:
  p_user LIKE apqi-userid OBLIGATORY DEFAULT sy-uname,
  p_fich LIKE rlgrap-filename OBLIGATORY DEFAULT pa_path.


START-OF-SELECTION.
  CALL FUNCTION 'UPLOAD'
    EXPORTING
      filename = p_fich
      filetype = 'DAT'
    TABLES
      data_tab = gti_mostrar.

  .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  PERFORM open_group.
  LOOP AT gti_mostrar INTO gwa_mostrar.
    PERFORM bdc_dynpro      USING 'SAPMF02K' '0100'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'RF02K-KTOKK'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'RF02K-KTOKK'
                                  'KRED'.
    PERFORM bdc_dynpro      USING 'SAPMF02K' '0110'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'LFA1-SPRAS'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=UPDA'.
    PERFORM bdc_field       USING 'LFA1-NAME1'
                                  gwa_mostrar-nombre.
    PERFORM bdc_field       USING 'LFA1-SORTL'
                                  gwa_mostrar-nomco.
    PERFORM bdc_field       USING 'LFA1-LAND1'
                                  gwa_mostrar-pais.
    PERFORM bdc_field       USING 'LFA1-SPRAS'
                                  gwa_mostrar-idioma.
    PERFORM bdc_transaction USING 'XK01'.
  ENDLOOP.
  PERFORM close_group.
  PERFORM alv CHANGING gti_mostrar.
*&---------------------------------------------------------------------*
*&      Form  ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_GTI_MOSTRAR  text
*----------------------------------------------------------------------*
FORM alv  CHANGING p_gti_mostrar TYPE gtt_alv.


  DATA:
    lo_salv TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = p_gti_mostrar.

  lo_salv->display( ).


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  AT_SELECTION_SCREEN_PA_PATH
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
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
*&---------------------------------------------------------------------*
*&      Form  STAR-OF-SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM star-of-selection .
PERFORM at_selection_screen_pa_path.
ENDFORM.
