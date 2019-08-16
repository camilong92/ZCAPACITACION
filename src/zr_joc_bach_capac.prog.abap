*&---------------------------------------------------------------------*
*& Report  ZR_JOC_BACH_CAPAC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZR_JOC_BACH_CAPAC.

INCLUDE: ZR_JOC_BACH_CAPAC_v,
         ZR_JOC_BACH_CAPAC_p,
         ZR_JOC_BACH_CAPAC_f.


START-OF-SELECTION.

  PERFORM start_of_selection.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR pa_path.

  PERFORM at_selection_screen_pa_path CHANGING pa_path.


end-of-SELECTION.

  PERFORM end_of_selection.
