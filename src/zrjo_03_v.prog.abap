*&---------------------------------------------------------------------*
*&  Include           ZRJO_03_V
*&---------------------------------------------------------------------*

TYPES: BEGIN OF st_vbrk,            "estructura de la longitud de cuantos campos necesito
         vbeln TYPE vbrk-vbeln,  "factura
         fkart TYPE vbrk-fkart,  "clase factura
         fktyp TYPE vbrk-fktyp,  "Tipo factura
         vbtyp TYPE vbrk-vbtyp,  "Tipo doc.com
         waerk TYPE vbrk-waerk,  "Moneda doc
         netwr TYPE vbrk-netwr,  "Valor neto
         vtweg TYPE vbrk-vtweg,  "Canal distrib
         vkorg TYPE vbrk-vkorg,  "Organiz.ventas
         fkdat TYPE vbrk-fkdat,  "Fecha factura
       END OF st_vbrk,

       BEGIN OF st_mes,
         mes  TYPE char50,
         cant TYPE i,
       END OF st_mes.
       FIELD-SYMBOLS:
  <gfs_resu> TYPE st_mes.

DATA: ti_mes TYPE STANDARD TABLE OF st_mes.
DATA: ti_vbrk TYPE STANDARD TABLE OF st_vbrk.  "tabla interna del tipo de la estructura
DATA: wa_vbrk TYPE st_vbrk.
DATA: wa_mes TYPE st_mes.                 "wa del tipo de la estructura
DATA: le_cont1  TYPE i,
      le_cont2  TYPE i,
      le_cont3  TYPE i,
      le_cont4  TYPE i,
      le_cont5  TYPE i,
      le_cont6  TYPE i,
      le_cont7  TYPE i,
      le_cont8  TYPE i,
      le_cont9  TYPE i,
      le_cont10 TYPE i,
      le_cont11 TYPE i,
      le_cont12 TYPE i.
