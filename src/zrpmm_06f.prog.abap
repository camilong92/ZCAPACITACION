*&---------------------------------------------------------------------*
*&  Include           ZRPMM_06F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*

FORM uc_0100_consultar .

  PERFORM get_header CHANGING zedba_04 vbrk.
  PERFORM get_detalle USING zedba_04 CHANGING gti_screen_0110.
PERFORM get_cliente USING zedba_04 CHANGING kna1.



ENDFORM.

FORM get_header  CHANGING p_es_header type zedba_04 p_es_vbrk TYPE  vbrk.

  select SINGLE *
    from vbrk
    into p_es_vbrk
    where vbeln = p_es_header-vbeln.

    p_es_header-vbeln = p_es_vbrk-vbeln.
    p_es_header-fkart = p_es_vbrk-fkart.
    p_es_header-fkdat = p_es_vbrk-fkdat.
    p_es_header-kunnr = p_es_vbrk-kunrg.
    p_es_header-netwr = p_es_vbrk-netwr.
    p_es_header-waers = p_es_vbrk-waerk.


    if sy-subrc <> 0.
MESSAGE 'La Factura no existe' TYPE 'S'.
      endif.

ENDFORM.

FORM get_detalle  USING    p_zedba_04 TYPE zedba_04
                  CHANGING p_gti_screen_0110 type gtp_ti_screen_0110.

  select posnr matnr fkimg vrkme
    from vbrp into table p_gti_screen_0110
    where vbeln = p_zedba_04-vbeln.

ENDFORM.

FORM get_cliente  USING    p_zedba_04 type zedba_04
                  CHANGING p_kna1 type kna1.

select SINGLE MANDT KUNNR LAND1 NAME1 NAME2 ORT01 PSTLZ REGIO SORTL STRAS TELF1 TELFX XCPDK ADRNR MCOD1
from kna1
into p_kna1
where  KUNNR = p_zedba_04-kunnr.

ENDFORM.

FORM uc_0110_calltc .
CALL SCREEN 0110.
ENDFORM.



FORM uc_0120_callts .
CALL SCREEN 0120.
ENDFORM.





FORM uc_0110_btn_adicionarf .
  TC_DETALLE-LINES = TC_DETALLE-LINES + 1.

ENDFORM.

FORM uc_0130_callpopup .
CALL SCREEN '0130' starting at 50 5
              ending   at 120 100.
ENDFORM.
