
*&---------------------------------------------------------------------*
*&  Include           ZRJPG_02_V
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
* Se Definen los tipos de Estructuras.
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gtp_selopt,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
         ernam TYPE vbrk-ernam,
       END OF gtp_selopt,

       BEGIN OF gtp_alv,
         vbeln      TYPE vbeln,
         fkart      TYPE fkart,
         fkdat      TYPE fkdat,
         ernam      TYPE ernam,
         kunnr      TYPE kunnr,   "Número del codeudor, Clave de KNA1
         kunrg      TYPE kunrg,
         kna1_name1 TYPE name1,  "Nombre del Pagador
         kunag      TYPE kunag,
         kna1_name2 TYPE name2,  "Nombre del Solicitante
         netwr      TYPE netwr,
         waerk      TYPE waerk,
         posnr      TYPE posnr,  "Posición
         matnr      TYPE matnr,  "Número de material
         dias       TYPE i,      "Calcula los dias que han pasado desde que se creo la fact.
       END OF gtp_alv,

       BEGIN OF gtp_vbrk,
         vbeln TYPE vbeln,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
         kunrg TYPE kunrg,
         kunag TYPE kunag,
         netwr TYPE netwr,
         waerk TYPE waerk,
         ernam TYPE ernam,
       END OF gtp_vbrk,

       BEGIN OF gtp_kna1,
         kunnr      TYPE kunnr,  "Número del codeudo, Clave de KNA1
         kna1_name1 TYPE name1,  "Nombre del Pagador
         kna1_name2 TYPE name2,  "Nombre del Solicitante
       END OF gtp_kna1,

       BEGIN OF gtp_vbrp,
         vbeln      TYPE vbeln,    "Clave en Vbrp
         posnr      TYPE posnr,    "Clave en Vbrp
         vbrp_matnr TYPE matnr,
       END OF gtp_vbrp.

*&---------------------------------------------------------------------*
* Se Definen los tipos de Tablas internas
*&---------------------------------------------------------------------*
TYPES: gtp_ti_alv  TYPE STANDARD TABLE OF gtp_alv,
       gtp_ti_kna1 TYPE STANDARD TABLE OF gtp_kna1,
       gtp_ti_vbrp TYPE STANDARD TABLE OF gtp_vbrp,
       gtp_ti_vbrk TYPE STANDARD TABLE OF gtp_vbrk.

*&---------------------------------------------------------------------*
* Se Definen las Tablas internas
*&---------------------------------------------------------------------*
DATA: gti_alv      TYPE gtp_ti_alv,
      gti_kna1     TYPE gtp_ti_kna1,
      gti_vbrp     TYPE gtp_ti_vbrp,
      gti_vbrk     TYPE ZTTJPG_03,
      gti_vbrk_aux TYPE ZTTJPG_03.

*&---------------------------------------------------------------------*
* Se Definen las Estructuras
*&---------------------------------------------------------------------*
DATA: ges_selopt TYPE gtp_selopt,
      ges_alv    TYPE gtp_alv,
      ges_vbrk   TYPE gtp_vbrk,
      ges_kna1   TYPE gtp_kna1,
      ges_vbrp   TYPE gtp_vbrp.
