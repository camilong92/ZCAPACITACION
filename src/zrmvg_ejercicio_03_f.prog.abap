*&---------------------------------------------------------------------*
*&  Include           ZRMVG_EJERCICIO_03_F
*&---------------------------------------------------------------------*

FORM start_of_selection.

  " Hago un select a la tabla vbak(Parametros que se muestran por pantalla)
  SELECT vbeln erdat auart knumv
  FROM vbak
  INTO TABLE gti_vbak
  WHERE  vbeln    IN so_vbeln
    AND  auart   IN so_auart
    AND  erdat    IN so_erdat.

ENDFORM.

FORM get_data USING     p_gti_vbak
              CHANGING  p_gti_kovn.

  CALL FUNCTION 'ZFMMVG_06'
    EXPORTING
      gti_vbak = p_gti_vbak
    CHANGING
      gti_kovn = p_gti_kovn.



ENDFORM.

FORM cargar_datos USING    p_gti_vbak
                          p_gti_kovn
                CHANGING p_gti_alv
                          p_ges_vbak
                          p_ges_kovn.

  IF sy-subrc EQ 0.

    " Con el loop recorro la tabla interna y almaceno los datos en las estructuras que cree en el include de variables
    LOOP  AT gti_kovn  INTO ges_kovn.
      ges_alv-kbetr = ges_kovn-kbetr.
      ges_alv-kschl = ges_kovn-kschl.
      ges_alv-knumv = ges_kovn-knumv.
      ges_alv-waers = ges_kovn-waers.

      " Con el Read table para recorrer linea por linea de la tabla interna vbak dentro de la estructura vbak
      " que pide que la llave knumv este en ges_kovn-knumv

      IF ges_kovn-knumv IS NOT INITIAL.
        READ TABLE gti_vbak INTO ges_vbak WITH KEY knumv = ges_kovn-knumv.

        IF sy-subrc EQ 0.

          ges_alv-vbeln = ges_vbak-vbeln.
          ges_alv-erdat = ges_vbak-erdat.
          ges_alv-auart = ges_vbak-auart.
          ges_alv-knumv = ges_vbak-knumv.
          ges_alv-waers = ges_vbak-waers.

        ENDIF.
      ENDIF.

      APPEND ges_alv TO gti_alv.
      CLEAR: ges_alv,
             ges_kovn,
             ges_vbak.

    ENDLOOP.
  ENDIF.
ENDFORM.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hago la llamada a la ALV
FORM alv CHANGING gti_alv TYPE gtp_ti_alv.

  DATA:
    lo_salv TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_alv.

  lo_salv->display( ).

ENDFORM.
