*&---------------------------------------------------------------------*
*&  Include           ZRJPG_EJERCICIO03_P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
SELECT-OPTIONS: so_vbeln FOR ges_so-vbeln,
                so_auart FOR ges_so-auart,
                so_erdat FOR ges_so-erdat.
SELECTION-SCREEN END OF BLOCK b1.
