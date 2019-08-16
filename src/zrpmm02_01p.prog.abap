*&---------------------------------------------------------------------*
*&  Include           ZRPMM02_01P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
SELECT-OPTIONS:
 so_fkart  FOR ges_entrada-fkart NO INTERVALS no-EXTENSION,
 so_fkdat  FOR ges_entrada-fkdat OBLIGATORY,
 so_ernam FOR ges_entrada-ernam NO INTERVALS no-EXTENSION.
SELECTION-SCREEN END OF BLOCK a1.
