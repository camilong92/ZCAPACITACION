*&---------------------------------------------------------------------*
*&  Include           ZRPMM_01P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
SELECT-OPTIONS:
 so_fkart  FOR ges_so-fkart NO INTERVALS NO-EXTENSION,
 so_fkdat  FOR ges_so-fkdat OBLIGATORY.
SELECTION-SCREEN END OF BLOCK a1.
