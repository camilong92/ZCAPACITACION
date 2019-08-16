*&---------------------------------------------------------------------*
*&  Include           ZRJPG_4P
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

parameters:
  rb_uploa RADIOBUTTON GROUP rbg1,
  rb_dowlo RADIOBUTTON GROUP rbg1 DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK b1.




SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-001.

SELECT-OPTIONS: so_erdat FOR ges_so-erdat.

SELECTION-SCREEN END OF BLOCK b2.


SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE text-001.

PARAMETERS: pa_ruta TYPE eseftfront.

SELECTION-SCREEN END OF BLOCK b3.
