*&---------------------------------------------------------------------*
*&  Include           ZR_JOC_BACH_CAPAC_V
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gtp_archivo,
         cont  TYPE posnr,
         auart TYPE auart,
         kunrg TYPE kunrg,
         matnr TYPE matnr,
         zmeng TYPE dzmeng,
         inco1 TYPE inco1,
         inco2 TYPE inco2,
      END OF gtp_archivo.

TYPES: gtp_ti_archivo TYPE STANDARD TABLE OF gtp_archivo.

DATA: gti_archivo TYPE gtp_ti_archivo.
