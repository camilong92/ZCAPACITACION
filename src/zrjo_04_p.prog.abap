*&---------------------------------------------------------------------*
*&  Include           ZRJO_04_P
*&---------------------------------------------------------------------*
TABLES: vbrk.
SELECTION-SCREEN BEGIN OF BLOCK b1 .
  SELECT-OPTIONS so_fkart FOR  gc_fkart no INTERVALS.
  SELECT-OPTIONS so_fkdat FOR  gc_fkdat.
  SELECT-OPTIONS so_ernam FOR  gc_usr no INTERVALS.

SELECTION-SCREEN END OF BLOCK b1.
