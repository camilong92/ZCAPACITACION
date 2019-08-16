*&---------------------------------------------------------------------*
*&  Include           ZRPMM02_01V
*&---------------------------------------------------------------------*
*Estructura para el select-optión(datos de entrada)
TYPES: BEGIN OF gtp_entrada,
         ernam TYPE ernam,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
       END OF gtp_entrada,

*Estructura para los campos solicitados de la tabla vbrk
       BEGIN OF gtp_vbrk,
         vbeln TYPE vbeln,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
         kunrg TYPE kunrg,
         kunag TYPE kunag,
         netwr TYPE netwr,
         waerk TYPE waerk,
       END OF gtp_vbrk,

*Estructura para los campos solicitados de la tabla kna1
       BEGIN OF gtp_kna1,
         kunnr TYPE kunnr,
         name1 TYPE  name1_gp,
         name2 TYPE  name2_gp,
       END OF gtp_kna1,

*Estructura para los campos solicitados de la tabla vbrp
       BEGIN OF gtp_vbrp,
         vbeln TYPE vbeln_vf,
         posnr TYPE posnr_vf,
         matnr TYPE matnr,
       END OF gtp_vbrp,

       BEGIN OF gtp_result,
         vbeln TYPE vbeln,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
         kunrg TYPE kunrg,
         name1 TYPE name1_gp,
         kunag TYPE kunag,
         name2 TYPE name2_gp,
         netwr TYPE netwr,
         waerk TYPE waerk,
         posnr TYPE posnr_vf,
         matnr TYPE matnr,
         dias  TYPE  i,
       END OF gtp_result.


TYPES: gtp_ti_vbrk   TYPE STANDARD TABLE OF gtp_vbrk,
       gtp_ti_kna1   TYPE STANDARD TABLE OF gtp_kna1,
       gtp_ti_vbrp   TYPE STANDARD TABLE OF gtp_vbrp,
       gtp_ti_result TYPE STANDARD TABLE OF gtp_result.

DATA:
  ges_entrada TYPE gtp_entrada,
  alv_ti      TYPE REF TO cl_salv_table,
  gti_vbrk    TYPE gtp_ti_vbrk,
  gti_kna1    TYPE gtp_ti_kna1,
  gti_vbrp    TYPE gtp_ti_vbrp,
  gti_result  TYPE  gtp_ti_result,
  ges_result  TYPE gtp_result,
  ges_vbrk    TYPE gtp_ti_vbrk,
  ges_kna1    TYPE gtp_kna1,
  ges_vbrp    TYPE gtp_vbrp,
  gwa_vbrk    type gtp_vbrk,
  gwa_kna1    type gtp_kna1.
