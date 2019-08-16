*----------------------------------------------------------------------*
***INCLUDE ZRBSZ_EJERCICIO03_SELECT_DAF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  SELECT_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_SO_BSARK  text
*----------------------------------------------------------------------*
FORM select_data CHANGING p_gti_vbap.
  "Select a la tabla VBAK con los parametros de entrada
  SELECT vbeln erdat auart netwr waerk
      FROM vbak
      INTO TABLE gti_vbak
      WHERE vbeln IN so_vbeln AND
            auart IN so_auart AND
            erdat IN so_erdat.

  "Se valida que el select se haya ejecutado correctamente para proceder a llamar el modulo de funciones
  IF sy-subrc EQ 0.
    CALL FUNCTION 'ZFMBSZ_EJERCICIO03'
      EXPORTING
        gti_vbak = gti_vbak
      IMPORTING
        gti_vbap = p_gti_vbap.
  ENDIF.
ENDFORM.
