*&---------------------------------------------------------------------*
*&  Include           ZRBSZ_EJERCICIO03_F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START-OF-SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start-of-selection.
  data: lc_subrc type sy-subrc.
  PERFORM get_user CHANGING gwa_program
                            gti_program
                            lc_subrc.



  IF lc_subrc EQ 0.
    PERFORM select_data CHANGING gti_vbap.
  ENDIF.

  IF sy-subrc EQ 0.
    PERFORM merge_data USING gti_vbak
                             gti_vbap
                       CHANGING
                             gwa_vbak
                             gwa_vbap
                             gwa_alv
                             gti_alv.

    PERFORM call_alv USING gti_alv.
  ENDIF.
ENDFORM.
