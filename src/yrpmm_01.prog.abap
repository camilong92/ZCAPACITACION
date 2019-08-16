*&---------------------------------------------------------------------*
*& Report  YRPMM_01
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT yrpmm_01.

INCLUDE yrpmm_01_01v.
INCLUDE yrpmm_01_01p.
INCLUDE yrpmm_01_01f.

START-OF-SELECTION.
  PERFORM start_of_selection.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR pa_path.
  PERFORM at_selection_screen_pa_path.
