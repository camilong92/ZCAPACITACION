*&---------------------------------------------------------------------*
*&  Include           YRPMM_01_01P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
PARAMETERS: pa_path TYPE eseftfront,
            pa_bi RADIOBUTTON GROUP rbg1,
            pa_bapi RADIOBUTTON GROUP rbg1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK a1.
