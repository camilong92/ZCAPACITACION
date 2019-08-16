*&---------------------------------------------------------------------*
*&  Include           YRPMM_01_01V
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gtp_archivo,
         cont   TYPE char15,
         auart  TYPE char4,
         kunrg  TYPE kunrg,
         matnr  TYPE matnr,
         dzmeng TYPE char16,
         inco1  TYPE inco1,
         inco2  TYPE inco2,
         vkorg  TYPE vkorg,
         vtweg  TYPE vtweg,
         spart  TYPE spart,
       END OF gtp_archivo,

       BEGIN OF gtp_datos,
         cont  TYPE char15,
         auart TYPE auart,
         kunrg TYPE kunrg,
         inco1 TYPE inco1,
         inco2 TYPE inco2,
         vkorg  TYPE vkorg,
         vtweg  TYPE vtweg,
         spart  TYPE spart,
         posnr TYPE zttdba_04,
       END OF gtp_datos.

TYPES: gtp_ti_archivo TYPE STANDARD TABLE OF gtp_archivo,
       gtp_ti_datos   TYPE STANDARD TABLE OF gtp_datos.

DATA: gti_archivo TYPE gtp_ti_archivo,
      gti_datos   TYPE gtp_ti_datos.
