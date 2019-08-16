*&---------------------------------------------------------------------*
*&  Include           ZRMVG_EJERCICIO_03_P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK bl WITH FRAME TITLE text-001.
SELECT-OPTIONS so_vbeln  FOR ges_so-vbeln NO INTERVALS NO-EXTENSION.
SELECT-OPTIONS so_auart  FOR ges_so-auart NO INTERVALS NO-EXTENSION.
SELECT-OPTIONS so_erdat FOR  ges_so-erdat NO-EXTENSION OBLIGATORY.

SELECTION-SCREEN END OF BLOCK bl.
