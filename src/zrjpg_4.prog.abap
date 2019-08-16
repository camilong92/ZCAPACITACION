*&---------------------------------------------------------------------*
*& Report  ZRJPG_4
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZRJPG_4.

include: ZRJPG_4V,
         ZRJPG_4P,
         ZRJPG_4F.

START-OF-SELECTION.

PERFORM START_OF_SELECTION.

at SELECTION-SCREEN on VALUE-REQUEST FOR pa_ruta.
  PERFORM at_SELECTION_SCREEN_pa_ruta.
