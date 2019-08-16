*&---------------------------------------------------------------------*
*&  Include           ZRJPG_4F
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

  DATA: ls_filename TYPE dstring,
        lo_salv     TYPE REF TO cl_salv_table.

  ls_filename = pa_ruta.

  IF rb_dowlo EQ 'X'.
    SELECT vbeln erdat auart
      FROM vbak
      INTO TABLE gti_vbak
      WHERE erdat IN so_erdat.

    IF sy-subrc EQ 0.

      CALL FUNCTION 'GUI_DOWNLOAD'
        EXPORTING
*         BIN_FILESIZE            =
          filename                = ls_filename
*         FILETYPE                = 'ASC'
*         APPEND                  = ' '
          write_field_separator   = 'x'
*         HEADER                  = '00'
*         TRUNC_TRAILING_BLANKS   = ' '
*         WRITE_LF                = 'X'
*         COL_SELECT              = ' '
*         COL_SELECT_MASK         = ' '
*         DAT_MODE                = ' '
*         CONFIRM_OVERWRITE       = ' '
*         NO_AUTH_CHECK           = ' '
*         CODEPAGE                = ' '
*         IGNORE_CERR             = ABAP_TRUE
*         REPLACEMENT             = '#'
*         WRITE_BOM               = ' '
*         TRUNC_TRAILING_BLANKS_EOL       = 'X'
*         WK1_N_FORMAT            = ' '
*         WK1_N_SIZE              = ' '
*         WK1_T_FORMAT            = ' '
*         WK1_T_SIZE              = ' '
*         WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
*         SHOW_TRANSFER_STATUS    = ABAP_TRUE
*         VIRUS_SCAN_PROFILE      = '/SCET/GUI_DOWNLOAD'
*    IMPORTING
*         FILELENGTH              =
        TABLES
          data_tab                = gti_vbak
*         FIELDNAMES              =
        EXCEPTIONS
          file_write_error        = 1
          no_batch                = 2
          gui_refuse_filetransfer = 3
          invalid_type            = 4
          no_authority            = 5
          unknown_error           = 6
          header_not_allowed      = 7
          separator_not_allowed   = 8
          filesize_not_allowed    = 9
          header_too_long         = 10
          dp_error_create         = 11
          dp_error_send           = 12
          dp_error_write          = 13
          unknown_dp_error        = 14
          access_denied           = 15
          dp_out_of_memory        = 16
          disk_full               = 17
          dp_timeout              = 18
          file_not_found          = 19
          dataprovider_exception  = 20
          control_flush_error     = 21
          OTHERS                  = 22.
    ENDIF.

  ELSE.

    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = ls_filename
*       FILETYPE                = 'ASC'
*       HAS_FIELD_SEPARATOR     = ' '
*       HEADER_LENGTH           = 0
        read_by_line            = 'X'
*       DAT_MODE                = ' '
*       CODEPAGE                = ' '
*       IGNORE_CERR             = ABAP_TRUE
*       REPLACEMENT             = '#'
*       CHECK_BOM               = ' '
*       VIRUS_SCAN_PROFILE      =
*       NO_AUTH_CHECK           = ' '
*       IMPORTING
*       FILELENGTH              =
*       HEADER                  =
      TABLES
        data_tab                = gti_vbak
*       CHANGING
*       ISSCANPERFORMED         = ' '
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
    IF sy-subrc EQ 0.

*TRY.
      CALL METHOD cl_salv_table=>factory
*  EXPORTING
*    list_display   = IF_SALV_C_BOOL_SAP=>FALSE
*    r_container    =
*    container_name =
*  IMPORTING
*    r_salv_table   =
        CHANGING
          t_table = gti_vbak.
* CATCH cx_salv_msg .
*ENDTRY.

      CALL METHOD lo_salv->display.
    ELSE.

      WRITE: 'no nos dio'.

    ENDIF.


  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  AT_SELECTION_SCREEN_PA_RUTA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM at_selection_screen_pa_ruta .
*----------------------------------------------------------------------*
*Solicitar una Ruta al Usuario.
*----------------------------------------------------------------------*

  CALL FUNCTION 'C13Z_FRONTEND_FILENAME_GET'
* EXPORTING
*   I_WINDOW_TITLE             =
*   I_DEFAULT_FILENAME         =
*   I_INITIAL_DIRECTORY        =
    IMPORTING
      e_filename = pa_ruta.
* TABLES
*   I_FILE_EXTENSION_TAB       =
* EXCEPTIONS
*   INTERNAL_ERROR             = 1
*   OTHERS                     = 2
  .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.



ENDFORM.
