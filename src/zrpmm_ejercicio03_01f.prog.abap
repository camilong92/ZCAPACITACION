*&---------------------------------------------------------------------*
*&  Include           ZRPMM_EJERCICIO03_01F
*&---------------------------------------------------------------------*

*Subrutina para grabar el log de ejecución del programa
FORM contador_de_ejecuciones CHANGING gti_cantidad type gtp_ti_cantidad
                                      gwa_cantidad type gtp_cantidad
                                      gwa_ztpmm type ztpmm_ejercicio3.

  SELECT cvep
  FROM ztpmm_ejercicio3
  INTO TABLE gti_cantidad
  WHERE uname = sy-uname.

  READ TABLE gti_cantidad INTO gwa_cantidad INDEX 1.

  gwa_ztpmm-programm = sy-repid.
  gwa_ztpmm-datum = sy-datum.
  gwa_ztpmm-uzeit = sy-uzeit.
  gwa_ztpmm-uname = sy-uname.
  gwa_ztpmm-cvep = gwa_cantidad-cant + 1.


  MODIFY  ztpmm_ejercicio3 FROM  gwa_ztpmm.

  IF sy-subrc = '0'.

COMMIT WORK.

ELSE.

ROLLBACK WORK.

ENDIF.

ENDFORM.



FORM seleccion_datos  CHANGING gti_aux_vbak TYPE gtp_ti_vbak
                               gti_vbak TYPE gtp_ti_vbak.

  SELECT vbeln erdat auart bname
  FROM vbak
  INTO TABLE gti_vbak
  WHERE vbeln IN so_vbeln OR AUART  IN so_AUART OR  erdat IN so_erdat.

  gti_aux_vbak = gti_vbak.

  CALL FUNCTION 'ZFMPMM_03'
    EXPORTING
      i_ed_idioma    = sy-langu
    IMPORTING
      e_ti_resultado = gti_tvakt
    CHANGING
      i_gti_tvakt    = gti_aux_vbak.

ENDFORM.


FORM proceso USING gti_vbak TYPE gtp_ti_vbak
                   gti_tvakt TYPE gtp_ti_tvakt
             CHANGING gwa_vbak TYPE gtp_vbak
                      gwa_resultado TYPE gtp_resultado
                      gwa_tvakt TYPE gtp_tvakt
                      gti_resultado TYPE gtp_ti_resultado.


  LOOP  AT gti_vbak  INTO gwa_vbak.
    gwa_resultado-vbeln = gwa_vbak-vbeln.
    gwa_resultado-erdat = gwa_vbak-erdat.
    gwa_resultado-bname = gwa_vbak-bname.
    gwa_resultado-auart = gwa_vbak-auart.

    IF sy-subrc EQ 0.

      READ TABLE gti_tvakt INTO gwa_tvakt WITH  KEY auart = gwa_vbak-auart.

      IF sy-subrc EQ 0.
        gwa_resultado-bezei = gwa_tvakt-bezei.

      ENDIF.

    ENDIF.

    APPEND gwa_resultado TO gti_resultado.

  ENDLOOP.

ENDFORM.



FORM resultado CHANGING gti_resultado TYPE gtp_ti_resultado.

  DATA:  alv_ti TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = alv_ti
    CHANGING
      t_table      = gti_resultado.
  alv_ti->display( ).

ENDFORM.
