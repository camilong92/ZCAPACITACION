*&---------------------------------------------------------------------*
*&  Include           ZRMVG_06_F
*&---------------------------------------------------------------------*

" LLamado al boton consultar
FORM uc_011_consultar .

  PERFORM get_header CHANGING zedba_04 VBRK.

  PERFORM get_detalle  USING zedba_04
                       CHANGING gti_screen0110.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_HEADER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_ZEDBA_04  text
*----------------------------------------------------------------------*
FORM get_header  CHANGING p_es_header TYPE zedba_04
                  P_ES_VBRK TYPE VBRK.

  SELECT SINGLE *
      FROM vbrk
      INTO p_es_VBRK
    WHERE vbeln = p_es_header-vbeln.

    p_es_header-vbeln = p_es_vbrk-vbeln.
    p_es_header-fkart = p_es_vbrk-fkart.
    p_es_header-fkdat = p_es_vbrk-fkdat.
    p_es_header-kunnr = p_es_vbrk-kunrg.
    p_es_header-netwr = p_es_vbrk-netwr.
    p_es_header-waers = p_es_vbrk-waerk.


  IF sy-subrc NE 0.
    MESSAGE 'LA FACTURA NO EXISTE' TYPE 'W'.
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  UC_110_CALLTC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM uc_100_calltc .
CALL SCREEN 0110.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  UC_110_CALLTB
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM uc_110_calltb .
CALL SCREEN 0120.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  UC_120_CALLSS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM uc_120_callss .
CALL SCREEN 0130.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DETALLE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ZEDBA_04  text
*      <--P_GTI_SCREEN0110  text
*----------------------------------------------------------------------*

" Detalle
FORM get_detalle  USING    p_zedba_04 TYPE zedba_04  " Aca pongo la estructura
                  CHANGING p_gti_screen0110 TYPE gtp_ti_screen0110. " Aca la tabla interna

  SELECT posnr matnr fkimg vrkme
    FROM vbrp
    INTO TABLE p_gti_screen0110    " Coloco el parametro changing
    WHERE vbeln = p_zedba_04-vbeln.  "

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  UC_110_BTN_ADDFILA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

" Subrutina para el boton adicionar fila

*&---------------------------------------------------------------------*
*&      Form  UC_110_BTN_ADDFILA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM uc_110_btn_addfila .
tc_detalle-lines = tc_detalle-lines + 1.


ENDFORM.