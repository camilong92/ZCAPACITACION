*&---------------------------------------------------------------------*
*& Report  ZRBSZ_EJERCICIO03
*&
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
REPORT zrbsz_ejercicio03.

INCLUDE zrbsz_ejercicio03_v.
INCLUDE zrbsz_ejercicio03_p.
INCLUDE zrbsz_ejercicio03_f.

START-OF-SELECTION.
  PERFORM start-of-selection.

  INCLUDE zrbsz_ejercicio03_select_daf01.
  INCLUDE zrbsz_ejercicio03_merge_datf01.
  INCLUDE zrbsz_ejercicio03_call_alvf01.
  INCLUDE zrbsz_ejercicio03_get_userf01.
