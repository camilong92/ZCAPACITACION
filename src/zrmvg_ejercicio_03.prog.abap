*&---------------------------------------------------------------------*
*& Report  ZRMVG_EJERCICIO_03
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrmvg_ejercicio_03.

INCLUDE: zrmvg_ejercicio_03_v,
         zrmvg_ejercicio_03_p,
         zrmvg_ejercicio_03_f.


START-OF-SELECTION.

" Parametros de entrada
  PERFORM start_of_selection.

" Llamada al modulo de funcion ZFMMVG_06
  PERFORM get_data USING     gti_vbak
                   CHANGING  gti_kovn.

" Carga de datos a la ALV
  PERFORM cargar_datos USING    gti_vbak
                                gti_kovn
                       CHANGING gti_alv
                                ges_vbak
                                ges_kovn.

  " Subrutina ALV, con la tabla interna gti_alv
  PERFORM alv CHANGING gti_alv.
