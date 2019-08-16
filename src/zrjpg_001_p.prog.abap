*&---------------------------------------------------------------------*
*&  Include           ZRJPG_001_P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

SELECT-OPTIONS: so_meses FOR  ges_so-meses NO INTERVALS NO-EXTENSION,
                so_sexo FOR ges_so-sexo NO INTERVALS NO-EXTENSION.

SELECTION-SCREEN END OF BLOCK b1.
