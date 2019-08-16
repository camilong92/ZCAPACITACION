*----------------------------------------------------------------------*
***INCLUDE ZRBSZ_EJERCICIO03_GET_USERF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  GET_USER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_GWA_PROGRAM  text
*      <--P_GTI_PROGRAM  text
*----------------------------------------------------------------------*
FORM get_user  CHANGING p_gwa_program
                        p_gti_program
                        p_c_subr.

  "Estructura para guardar usuario en pantalla si existe en ztbsz_ejercicio3
  DATA: gwa_program_aux TYPE ztbsz_ejercicio3.

  "Se asignan variables de usuario a la estructura
  gwa_program-progr = sy-repid.
  gwa_program-datum = sy-datum.
  gwa_program-uname = sy-uname.
  gwa_program-uzeit = sy-uzeit.

  "Buscamos en ztbsz_ejercicio3 si existe un usuario igual a sy-uname
  SELECT SINGLE * FROM ztbsz_ejercicio3 INTO gwa_program_aux WHERE uname EQ sy-uname.

  IF sy-subrc EQ 0.
    "Si existe, sumamos una ejecion al numero total de ejecuciones al programa
    gwa_program-count_ = gwa_program_aux-count_ + 1.
  ELSE.
    "sino, es primera vez que se ejecuta el programa, por lo tanto, número de ejecución es igual a 1.
    gwa_program-count_ = 1.
  ENDIF.

  "Inserta cuando no exista usuario, de lo contrario, modifica.
  MODIFY ztbsz_ejercicio3 FROM gwa_program.
  if sy-subrc <> 0.
    p_c_subr = sy-subrc.
    endif.

ENDFORM.
