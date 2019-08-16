*&---------------------------------------------------------------------*
*&  Include           ZRBSZ_EJERCICIO03_P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
SELECT-OPTIONS:
  so_vbeln FOR gwa_so-vbeln ,
  so_auart FOR gwa_so-auart NO INTERVALS NO-EXTENSION ,
  so_erdat FOR gwa_so-erdat .
SELECTION-SCREEN END OF BLOCK b1.
