*&---------------------------------------------------------------------*
*&  Include           ZRJO_04_V
*&---------------------------------------------------------------------*
TYPES:
  BEGIN OF gty_vbrk,
    vbeln TYPE vbrk-vbeln,
    fkart TYPE vbrk-fkart,
    waerk TYPE vbrk-waerk,
    fkdat TYPE vbrk-fkdat,
    netwr TYPE vbrk-netwr,
    ernam TYPE vbrk-ernam,
    kunrg TYPE vbrk-kunrg,
    kunag TYPE vbrk-kunag,
   END OF gty_vbrk,



   BEGIN OF gty_vbrp,
    vbeln TYPE vbrp-vbeln,
    posnr TYPE vbrp-posnr,
    matnr TYPE vbrp-matnr,
   END OF gty_vbrp,


BEGIN OF gty_cliente,
     kunnr TYPE kna1-kunnr,
   END OF gty_cliente,

   BEGIN OF gty_kna1,
     kunnr TYPE kna1-kunnr,
     name1 TYPE kna1-name1,
   END OF gty_kna1,

   BEGIN OF gty_alv,
     vbeln TYPE vbrk-vbeln,
     fkart TYPE vbrk-fkart,
     fkdat TYPE vbrk-fkdat,
     kunrg TYPE vbrk-kunrg,
     name1 TYPE kna1-name1,
     kunag TYPE vbrk-kunag,
     name2 TYPE kna1-name2,
     netwr TYPE vbrk-netwr,
     waerk TYPE vbrk-waerk,
     posnr TYPE vbrp-posnr,
     matnr TYPE vbrp-matnr,
     diasmora TYPE ZDEJOC_04,
   end of gty_alv.



TYPES:
  gtt_vbrk TYPE STANDARD TABLE OF gty_vbrk,
  gtt_vbrp TYPE STANDARD TABLE OF gty_vbrp,
  gtt_cliente TYPE STANDARD TABLE OF gty_cliente,
  gtt_kna1 TYPE STANDARD TABLE OF gty_kna1,
  gtt_alv TYPE STANDARD TABLE OF gty_alv.

DATA:
  gti_vbrk TYPE gtt_vbrk,
  gti_vbrp TYPE gtt_vbrp,
  gti_kna1 TYPE gtt_kna1,
  gti_alv TYPE gtt_alv.

DATA:
      gc_usr TYPE usr01-bname,
      gc_fkdat TYPE vbrk-fkdat,
      gc_fkart TYPE vbrk-fkart.
