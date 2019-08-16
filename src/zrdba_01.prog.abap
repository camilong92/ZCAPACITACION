REPORT zrdba_01.

TYPES:
  BEGIN OF gtp_so,
    fkdat TYPE fkdat,
  END OF gtp_so.

TYPES: gtp_ti_vbrk TYPE STANDARD TABLE OF vbrk.


DATA:
  gti_vbrk TYPE gtp_ti_vbrk,
  ges_so   TYPE gtp_so.

SELECT-OPTIONS:
  so_fkdat FOR ges_so-fkdat.


START-OF-SELECTION.
BREAK-POINT.
  SELECT *
    FROM vbrk
    INTO TABLE gti_vbrk
   WHERE fkdat IN so_fkdat.

*1. Definir una variable de referencia de la clase CL_SALV_TABLE
  DATA:
    lo_salv      TYPE REF TO cl_salv_table,
    lo_columns   TYPE REF TO cl_salv_columns_table,
    lo_column    TYPE REF TO cl_salv_column,
    lo_functions TYPE REF TO cl_salv_functions.

*2. Invocar el método factory
  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_vbrk.

*3. Implementar gallitos adicionales (Opcional)
  CALL METHOD lo_salv->get_functions
    RECEIVING
      value = lo_functions.

  CALL METHOD lo_functions->set_all
    EXPORTING
      value = if_salv_c_bool_sap=>true.

  CALL METHOD lo_salv->get_columns
    RECEIVING
      value = lo_columns.

*  TRY.
  CALL METHOD lo_columns->get_column
    EXPORTING
      columnname = 'GJAHR'
    receiving
      value      = lo_column
      .
*   CATCH cx_salv_not_found .
*  ENDTRY.

CALL METHOD lo_column->set_short_text
  EXPORTING
    value  = 'Año'
    .








*4. Invocar el método Display
  CALL METHOD lo_salv->display.
