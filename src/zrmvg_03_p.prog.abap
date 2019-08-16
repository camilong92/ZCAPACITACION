*&---------------------------------------------------------------------*
*&  Include           ZRMVG_03_P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1.
  SELECT-OPTIONS so_fkart FOR  ges_so-fkart   NO INTERVALS NO-EXTENSION.
  SELECT-OPTIONS so_fkdat FOR  ges_so-fkdat OBLIGATORY.
  SELECT-OPTIONS so_ernam FOR  ges_so-ernam NO INTERVALS NO-EXTENSION.

SELECTION-SCREEN END OF BLOCK b1.
