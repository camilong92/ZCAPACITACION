*&---------------------------------------------------------------------*
*&  Include           ZRPMM_EJERCICIO03_01V
*&---------------------------------------------------------------------*

*Estructura para el select-optión(datos de entrada)

TYPES: BEGIN OF gtp_entrada,
         vbeln TYPE vbeln_va, "Documento de ventas
         AUART TYPE AUART,
         erdat TYPE erdat,
       END OF gtp_entrada,

       BEGIN OF gtp_vbak,
         vbeln TYPE vbeln_va,
         erdat TYPE erdat,
         auart TYPE auart,
         bname TYPE bname_v,
       END OF gtp_vbak,

       BEGIN OF gtp_tvakt,
         auart TYPE auart,
         bezei TYPE bezei20,
       END OF gtp_tvakt,

       BEGIN OF gtp_resultado,
         vbeln TYPE vbeln_va,
         erdat TYPE erdat,
         auart TYPE auart,
         bezei TYPE bezei20,
         bname TYPE bname_v,
       END OF gtp_resultado,


       BEGIN OF gtp_ztpmm,
          uname    TYPE uname,
         programm TYPE programm,
         datum    TYPE datum,
         uzeit    TYPE  uzeit,
         cvep     TYPE integer,
       END OF gtp_ztpmm,
       BEGIN OF gtp_cantidad,
         cant TYPE integer,
       END OF gtp_cantidad.




TYPES: gtp_ti_vbak      TYPE STANDARD TABLE OF gtp_vbak,
       gtp_ti_tvakt     TYPE STANDARD TABLE OF gtp_tvakt,
       gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado,
       gtp_ti_ztpmm     TYPE STANDARD TABLE OF gtp_ztpmm,
       gtp_ti_cantidad  TYPE STANDARD TABLE OF gtp_cantidad.


DATA: ges_so        TYPE gtp_entrada,
      gti_aux_vbak  TYPE gtp_ti_vbak,
      gti_vbak      TYPE gtp_ti_vbak,
      gti_tvakt     TYPE gtp_ti_tvakt,
      gti_resultado TYPE gtp_ti_resultado,
      gwa_vbak      TYPE gtp_vbak,
      gwa_tvakt     TYPE gtp_tvakt,
      gwa_resultado TYPE gtp_resultado,
      gti_ztpmm     TYPE gtp_ti_ztpmm,
      gwa_ztpmm     TYPE ztpmm_ejercicio3,
      gti_cantidad  TYPE gtp_ti_cantidad,
      gwa_cantidad  TYPE  gtp_cantidad.
