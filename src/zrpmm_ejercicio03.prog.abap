*&---------------------------------------------------------------------*
*& Report  ZRPMM_EJERCICIO03
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrpmm_ejercicio03.

INCLUDE zrpmm_ejercicio03_01v.
INCLUDE zrpmm_ejercicio03_01p.
INCLUDE zrpmm_ejercicio03_01f.

START-OF-SELECTION.

  PERFORM contador_de_ejecuciones CHANGING gti_cantidad gwa_cantidad gwa_ztpmm.

  PERFORM seleccion_datos CHANGING  gti_aux_vbak  gti_vbak.
  PERFORM proceso  USING  gti_vbak  gti_tvakt
                   CHANGING  gwa_vbak gwa_resultado gwa_tvakt gti_resultado.

END-OF-SELECTION.

  PERFORM resultado CHANGING gti_resultado.
