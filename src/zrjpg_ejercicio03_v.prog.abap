*&---------------------------------------------------------------------*
*&  Include           ZRJPG_EJERCICIO03_V
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
* SE CREAN LOS TIPOS DE ESTRUCTURAS.
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gtp_so,  "Utilizo esta Estructura tanto para los SO, como para la tabla VBAK.
         vbeln TYPE vbak-vbeln,
         auart TYPE vbak-auart,
         erdat TYPE vbak-erdat,
       END OF gtp_so,

       BEGIN OF gtp_alv,
         vbeln TYPE vbeln, "Dcto de Ventas
         erdat TYPE erdat, "Fecha Creación de Registros.
         auart TYPE auart, "Clase Dcto de Ventas
         kunnr TYPE kunnr, "Numero de Deudor
         stcdt TYPE kna1-stcdt, "Tipo Identificación fiscal
         stcd1 TYPE kna1-stcd1, "Nombre del Deudor pero aparece en la tabla como "Número de identificación fiscal 1".
         parvw TYPE parvw,      "Función de interlocutor "en el programa se iguala siempre a 'AG'.
       END OF gtp_alv,

       BEGIN OF gtp_vbpa,
         vbeln TYPE vbeln,
         kunnr TYPE vbpa-kunnr,
         parvw TYPE parvw,
       END OF gtp_vbpa,

       BEGIN OF gtp_kna1,
         kunnr TYPE kunnr,
         stcdt TYPE kna1-stcdt,
         stcd1 TYPE kna1-stcd1,
       END OF gtp_kna1,

       BEGIN OF gtp_resultado,
         mandt TYPE mandt,
         nprog TYPE programm,
         fejec TYPE datum,
         hejec TYPE uzeit,
         uprog TYPE uname,
         cantv TYPE int4,
       END OF gtp_resultado,

       BEGIN OF gtp_cantv,
         cantv TYPE integer,
       END OF gtp_cantv.
*&---------------------------------------------------------------------*
* SE CREAN LOS TIPOS TABLAS INTERNAS.
*&---------------------------------------------------------------------*
TYPES: gtp_ti_alv  TYPE STANDARD TABLE OF gtp_alv,
       gtp_ti_vbak TYPE STANDARD TABLE OF gtp_so,
       gtp_ti_vbpa TYPE STANDARD TABLE OF gtp_vbpa,
       gtp_ti_kna1 TYPE STANDARD TABLE OF gtp_kna1,
       gtp_ti_user TYPE STANDARD TABLE OF ztjpg_ejercicio3,
       gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado,
       gtp_ti_cantv     TYPE STANDARD TABLE OF gtp_cantv.

*&---------------------------------------------------------------------*
* SE CREAN LAS TABLAS INTERNAS.
*&---------------------------------------------------------------------*
DATA: gti_alv        TYPE gtp_ti_alv,
      gti_vbak       TYPE gtp_ti_vbak,
      gti_ejercicio3 TYPE zttjpg_ejercicio3,
      gti_vbpa       TYPE gtp_ti_vbpa,
      gti_kna1       TYPE gtp_ti_kna1,
      gti_vbak_aux   TYPE gtp_ti_vbak,
      gti_user       TYPE gtp_ti_user.
*&---------------------------------------------------------------------*
* SE CREAN LAS ESTRUCTURAS.
*&---------------------------------------------------------------------*
DATA: ges_so       TYPE gtp_so,
      ges_alv      TYPE gtp_alv,
      ges_vbak     TYPE gtp_so,
      ges_vbpa     TYPE gtp_vbpa,
      ges_kna1     TYPE gtp_kna1,
      ges_vbak_aux TYPE gtp_so,
      ges_user     TYPE gtp_ti_user.
