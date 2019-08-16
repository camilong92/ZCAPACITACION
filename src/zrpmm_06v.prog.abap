*&---------------------------------------------------------------------*
*&  Include           ZRPMM_06V
*&---------------------------------------------------------------------*
TABLES: zedba_04, KNA1,VBRK.
TYPES:
  BEGIN OF gtp_screen_0100,
    vbeln TYPE vbeln_vf,
    kunnr TYPE kunnr,
    fkart TYPE fkart,
    fkdat TYPE fkdat,
    netwr TYPE netwr,
    waers TYPE waers,
  END OF gtp_screen_0100,
  BEGIN OF gtp_screen_0110,
    posnr TYPE posnr,
    matnr TYPE matnr,
    fkimg TYPE fkimg,
    vrkme TYPE vrkme,
  END OF gtp_screen_0110.

TYPES gtp_ti_screen_0110 TYPE STANDARD TABLE OF gtp_screen_0110.



DATA:           ges_screen_0100     TYPE gtp_screen_0100,
                gwa_screen_0110 TYPE gtp_screen_0110,
                gti_screen_0110     TYPE gtp_ti_screen_0110.


CONTROLS:
        TC_DETALLE type tableview using Screen 0110,
              TS_INFORMACION TYPE TABSTRIP.
