*&---------------------------------------------------------------------*
*&  Include           ZRJOC_05_P
*&---------------------------------------------------------------------*
TABLES: VBAK.
SELECTION-SCREEN BEGIN OF BLOCK b1 .
  SELECT-OPTIONS so_vbeln FOR  vbak-vbeln.
  SELECT-OPTIONS so_erdat FOR  vbak-erdat.
  SELECT-OPTIONS so_auart FOR  vbak-auart.

SELECTION-SCREEN END OF BLOCK b1.
