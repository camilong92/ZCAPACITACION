*&---------------------------------------------------------------------*
*&  Include           ZRJPG_02_P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
SELECT-OPTIONS: so_fkart FOR ges_selopt-fkart NO INTERVALS NO-EXTENSION,
                so_ernam for ges_selopt-ernam NO INTERVALS NO-EXTENSION,
                so_fkdat FOR ges_selopt-fkdat OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.
