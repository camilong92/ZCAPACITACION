*&---------------------------------------------------------------------*
*&  Include           ZRMVG_03_S
*&---------------------------------------------------------------------*
FORM dis_data CHANGING pti_reporte TYPE gtp_ti_reporte. ( Este GTP TI_REPORTE lo puse asi pero debe ser el tipo tabla que uds hayan construido para la tabla interna que contendra la información que se debe mostrar ).

  DATA:
    lo_salv type REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table   = lo_salv
    CHANGING
      t_table        = pti_reporte.

  lo_salv->display( ).


ENDFORM.
