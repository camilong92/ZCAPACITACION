*&---------------------------------------------------------------------*
*&  Include           ZRPMM_EJERCICIO03_01P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
SELECT-OPTIONS:
so_vbeln  FOR ges_so-vbeln NO INTERVALS NO-EXTENSION,
so_AUART  FOR ges_so-AUART NO INTERVALS NO-EXTENSION,
so_erdat FOR  ges_so-erdat NO-EXTENSION OBLIGATORY.

SELECTION-SCREEN END OF BLOCK a1.
