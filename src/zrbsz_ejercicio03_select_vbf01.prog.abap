*----------------------------------------------------------------------*
***INCLUDE ZRBSZ_EJERCICIO03_SELECT_VBF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  SELECT_VBAK
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_SO_VBELN  text
*      -->P_SO_AUART  text
*      -->P_SO_ERDAT  text
*      <--P_GTI_VBAK  text
*----------------------------------------------------------------------*
FORM select_vbak  USING    p_so_vbeln
                           p_so_auart
                           p_so_erdat
                  CHANGING p_gti_vbak.

ENDFORM.
