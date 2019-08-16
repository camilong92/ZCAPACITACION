*&---------------------------------------------------------------------*
*& Report  YRPMM_01
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT yrjoc_05.

INCLUDE YRJOC_01V.

INCLUDE YRJOC_01P.

INCLUDE YRJOC_01F.


START-OF-SELECTION.
PERFORM start_of_selection.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR pa_path.
PERFORM at_selection_screen_pa_path.
