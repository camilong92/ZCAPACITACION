*&---------------------------------------------------------------------*
*&  Include           ZR_JOC_BACH_CAPAC_F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start_of_selection .
  PERFORM get_datafile USING pa_path CHANGING gti_archivo.
*  PERFORM validacion.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATAFILE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_PA_PATH  text
*      <--P_LTI_ARCHIVO  text
*----------------------------------------------------------------------*
FORM get_datafile  USING    p_s_path TYPE eseftfront
                   CHANGING p_ti_archivo TYPE gtp_ti_archivo.
  DATA: ls_filename TYPE dstring.

  ls_filename = p_s_path.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = ls_filename
      has_field_separator = 'X'
    TABLES
      data_tab            = p_ti_archivo.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  AT_SELECTION_SCREEN_PA_PATH
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_PA_PATH  text
*----------------------------------------------------------------------*
FORM at_selection_screen_pa_path CHANGING p_c_path TYPE eseftfront.


  CALL FUNCTION 'C13Z_FRONTEND_FILENAME_GET'
    EXPORTING
      i_window_title = text-002
    IMPORTING
      e_filename     = p_c_path.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  END_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM end_of_selection .

  DATA: lo_salv TYPE REF TO cl_salv_table.

*  TRY.
  CALL METHOD cl_salv_table=>factory
*    EXPORTING
*      list_display   = IF_SALV_C_BOOL_SAP=>FALSE
*      r_container    =
*      container_name =
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_archivo.
*   CATCH cx_salv_msg .
*  ENDTRY.

  CALL METHOD lo_salv->display.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  VALIDACION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
*FORM validacion .
*  DATA: lwa_archivo  TYPE gtp_archivo,
*        lwa_archivo2 TYPE gtp_archivo,
*        lti_archivo type STANDARD TABLE OF gtp_archivo.
*
*  SORT gti_archivo BY cont ASCENDING.
*  LOOP AT gti_archivo INTO lwa_archivo.
*    AT NEW cont.
*      LOOP AT gti_archivo INTO lwa_archivo2
*      WHERE cont EQ lwa_archivo-cont.
*        APPEND lwa_archivo2 to lti_archivo.
*      ENDLOOP.
*    ENDAT.
*
*
*  ENDLOOP.
*
*ENDFORM.
