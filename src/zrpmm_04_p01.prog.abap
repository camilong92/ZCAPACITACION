*&---------------------------------------------------------------------*
*&  Include           ZRPMM_04_P01
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
PARAMETERS:
  fecha   TYPE datum,
  cc      TYPE char20,
  nombre  TYPE char30.
SELECT-OPTIONS:
            fact for ges_so-vbeln no INTERVALS.

SELECTION-SCREEN END OF BLOCK a1.
