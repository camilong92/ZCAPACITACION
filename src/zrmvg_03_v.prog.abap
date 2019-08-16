*&---------------------------------------------------------------------*
*&  Include           ZRMVG_03_V
*&---------------------------------------------------------------------*

TYPES:

  BEGIN OF gtp_so,
    fkdat TYPE fkdat,
    fkart TYPE fkart,
    ernam TYPE vbrk-ernam,
  END OF gtp_so,

  BEGIN OF gtp_alv,
    vbeln      TYPE vbeln,        "Numero de factura
    fkdat      TYPE fkdat,        "Fecha de la factura
    fkart     TYPE fkart,         " Clase de factura
    ernam      TYPE ernam,        " quien creo el objeto
    kunnr      TYPE kunnr,
    kunrg      TYPE kunrg,        "Codigo del pagador
    kunag      TYPE kunag,        " Codigo del solicitante
    netwr      TYPE netwr,        "Valor neto en la moneda
    waerk      TYPE waerk,        " Moneda
    kna1_name1 TYPE name1,        " Nombre del pagador
    kna1_name2 TYPE name2,        " Nombre solicitante
    posnr      TYPE posnr,        " Numero de posiciones
    matnr      TYPE matnr,        " Material solicitado
    dias       TYPE i,            " Dias Mora
  END OF gtp_alv,

  BEGIN OF gtp_kna1,
    kunnr      TYPE kunnr,
    kna1_name1 TYPE name1,
    kna1_name2 TYPE name2,

  END OF gtp_kna1,

  BEGIN OF gtp_vbrk,
    vbeln TYPE vbeln,
    fkdat TYPE fkdat,
    fkart TYPE fkart,
    kunrg TYPE kunrg,
    kunag TYPE kunag,
    netwr TYPE netwr,
    waerk TYPE waerk,
    ernam TYPE ernam,
  END OF gtp_vbrk,

  BEGIN OF gtp_vbrp,
    vbeln      TYPE vbeln,
    posnr      TYPE posnr,
    vbrp_matnr TYPE matnr,
  END OF gtp_vbrp.

" Tipo de tablas internas

TYPES: gtp_ti_alv  TYPE STANDARD TABLE OF gtp_alv,
       gtp_ti_kna1 TYPE STANDARD TABLE OF gtp_kna1,
       gtp_ti_vbrk TYPE STANDARD TABLE OF gtp_vbrk,
       gtp_ti_vbrp TYPE STANDARD TABLE OF  gtp_vbrp.

" Declaro Tablas internas
DATA: gti_alv      TYPE gtp_ti_alv,
      gti_kna1     TYPE gtp_ti_kna1,
      gti_vbrk     TYPE gtp_ti_vbrk,
      gti_vbrp     TYPE gtp_ti_vbrp,
      gti_vbrk_aux TYPE gtp_ti_vbrk,
      ges_so       TYPE gtp_so,
      ges_alv      TYPE gtp_alv,
      ges_kna1     TYPE gtp_kna1,
      ges_vbrk     TYPE gtp_vbrk,
      ges_vbrp     TYPE gtp_vbrp.
