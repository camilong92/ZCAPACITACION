*&---------------------------------------------------------------------*
*&  Include           ZRYGO_EJERCICIO03_P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
SELECT-OPTIONS:
  so_vbeln FOR ges_so-vbeln,         "Documento de Ventas
  so_auart FOR ges_so-auart,         "Clase de documento de ventas
  so_erdat FOR ges_so-erdat.         "Fecha de Creación del Registro


SELECTION-SCREEN END OF BLOCK b1.
