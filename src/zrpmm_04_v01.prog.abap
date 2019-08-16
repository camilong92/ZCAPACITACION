*&---------------------------------------------------------------------*
*&  Include           ZRPMM_04_V01
*&---------------------------------------------------------------------*
TYPES: BEGIN OF p_entrada,
         fecha  TYPE sy-datum,
         cedula TYPE char20,
         nombre TYPE char30,
       END OF p_entrada,

       BEGIN OF gtp_so,
         vbeln TYPE vbrp-vbeln,
         END OF gtp_so.


 TYPES:  gtp_ti_Cabecera TYPE STANDARD TABLE OF p_entrada.

 data: gti_cabecera TYPE gtp_ti_Cabecera,
       ges_so TYPE gtp_so.
