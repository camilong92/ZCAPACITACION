*&---------------------------------------------------------------------*
*&  Include           ZRJO_03_P
*&---------------------------------------------------------------------*
TABLES: vbrk.

SELECTION-SCREEN: BEGIN OF BLOCK b_jo WITH FRAME TITLE text-001.

SELECT-OPTIONS: fact FOR vbrk-fkart NO INTERVALS.
SELECT-OPTIONS: fecha FOR vbrk-fkdat  OBLIGATORY.

SELECTION-SCREEN: END OF BLOCK b_jo.
