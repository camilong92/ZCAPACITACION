*&---------------------------------------------------------------------*
*& Report  ZRYGO_EJERCICIO03
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrygo_ejercicio03.

INCLUDE: zrygo_ejercicio03_v,
         zrygo_ejercicio03_p,
         zrygo_ejercicio03_f.

AT SELECTION-SCREEN.
  PERFORM start_of_selection.
  PERFORM procesar.
  PERFORM mostrar CHANGING gti_alv.
