FORM initialization .

ENDFORM.                    " INITIALIZATION
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start_of_selection .

  DATA:
    lti_vbrk    TYPE gtt_vbrk,
    lti_cliente TYPE gtt_cliente,
    lwa_vbrk    TYPE gty_vbrk,
    lwa_cli     TYPE gty_cliente,
    lwa_alv     TYPE gty_alv,
    lwa_kna1    TYPE gty_kna1,
    lwa_vbrp    TYPE gty_vbrp.

  "consultar cabecera de factura
  SELECT vbeln fkart waerk fkdat netwr ernam kunrg kunag
    FROM vbrk
    INTO TABLE gti_vbrk
   WHERE fkart IN so_fkart
     AND fkdat IN so_fkdat
     AND ernam IN so_ernam.


  IF sy-subrc EQ 0.
    lti_vbrk[] = gti_vbrk[].

    SORT lti_vbrk BY vbeln.
    DELETE ADJACENT DUPLICATES FROM lti_vbrk COMPARING vbeln.
    " se consulta las posiciones de factura
    SELECT vbeln posnr matnr
      FROM vbrp
      INTO TABLE gti_vbrp
       FOR ALL ENTRIES IN lti_vbrk
     WHERE vbeln EQ lti_vbrk-vbeln.


    "consultar el nombre del cliente
    LOOP AT gti_vbrk INTO lwa_vbrk.

      lwa_cli-kunnr = lwa_vbrk-kunag.
      APPEND lwa_cli TO lti_cliente.

      lwa_cli-kunnr = lwa_vbrk-kunrg.
      APPEND lwa_cli TO lti_cliente.

    ENDLOOP.

    IF lti_cliente IS NOT INITIAL.

      SORT lti_cliente BY kunnr.
      DELETE ADJACENT DUPLICATES FROM lti_cliente
      COMPARING kunnr.

      SELECT kunnr name1
        FROM kna1
        INTO TABLE gti_kna1
         FOR ALL ENTRIES IN lti_cliente
       WHERE kunnr EQ lti_cliente-kunnr.

    ENDIF.

    "se lee cabecera de factura
    LOOP AT gti_vbrk INTO lwa_vbrk.

      lwa_alv-vbeln = lwa_vbrk-vbeln.
      lwa_alv-fkart = lwa_vbrk-fkart.
      lwa_alv-fkdat = lwa_vbrk-fkdat.
      lwa_alv-kunrg = lwa_vbrk-kunrg.
      lwa_alv-kunag = lwa_vbrk-kunag.
      lwa_alv-netwr = lwa_vbrk-netwr.
      lwa_alv-waerk = lwa_vbrk-waerk.
      "calcular dias de vencimiento
      lwa_alv-diasmora = sy-datum - lwa_alv-fkdat.

      "se lee el nombre del cliente pagador
      READ TABLE gti_kna1 INTO lwa_kna1
      WITH KEY kunnr = lwa_vbrk-kunag.
      IF sy-subrc EQ 0.
        lwa_alv-name2 = lwa_kna1-name1.
      ENDIF.
      " se lee el nombre del cliente solicitante
      READ TABLE gti_kna1 INTO lwa_kna1
      WITH KEY kunnr = lwa_vbrk-kunrg.
      IF sy-subrc EQ 0.
        lwa_alv-name1 = lwa_kna1-name1.
      ENDIF.

      "se leen las posiciones.
      LOOP AT gti_vbrp INTO lwa_vbrp
        WHERE vbeln =  lwa_vbrk-vbeln.

        lwa_alv-matnr = lwa_vbrp-matnr.
        lwa_alv-posnr = lwa_vbrp-posnr.

        APPEND lwa_alv TO gti_alv.
        CLEAR: lwa_alv-matnr,lwa_alv-posnr.
      ENDLOOP.

      CLEAR: lwa_alv.
    ENDLOOP.
    IF gti_alv IS NOT INITIAL.
      PERFORM dis_data CHANGING gti_alv.
    ENDIF .

  ENDIF.

ENDFORM.

FORM dis_data CHANGING pti_reporte TYPE gtt_alv.

  DATA:
    lo_salv TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = pti_reporte.

  lo_salv->display( ).


ENDFORM.
