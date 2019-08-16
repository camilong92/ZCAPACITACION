*----------------------------------------------------------------------*
***INCLUDE ZRBSZ_EJERCICIO03_MERGE_DATF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  MERGE_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GTI_VBAK  text
*      -->P_GTI_VBAP  text
*      <--P_GTI_ALV  text
*----------------------------------------------------------------------*
FORM merge_data  USING    p_gti_vbak TYPE gtp_ti_vbak
                          p_gti_vbap TYPE gtp_ti_vbap
                 CHANGING p_gwa_vbak TYPE gtp_vbak
                          p_gwa_vbap TYPE gtp_vbap
                          p_gwa_alv  TYPE gtp_alv
                          p_gti_alv  TYPE gtp_ti_alv.

  LOOP AT p_gti_vbak INTO p_gwa_vbak.
    p_gwa_alv-vbeln = p_gwa_vbak-vbeln.
    p_gwa_alv-erdat = p_gwa_vbak-erdat.
    p_gwa_alv-auart = p_gwa_vbak-auart.
    p_gwa_alv-netwr = p_gwa_vbak-netwr.
    p_gwa_alv-waerk = p_gwa_vbak-waerk.
    p_gwa_alv-count = 0.
    LOOP AT p_gti_vbap INTO p_gwa_vbap WHERE vbeln EQ p_gwa_vbak-vbeln.
      "Itero las posiciones de las facturas y las voy sumano
      p_gwa_alv-count = p_gwa_alv-count + 1.
    ENDLOOP.
    APPEND p_gwa_alv TO p_gti_alv.
  ENDLOOP.
ENDFORM.
