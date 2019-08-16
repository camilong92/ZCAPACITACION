*&---------------------------------------------------------------------*
*&  Include           ZRPMM02_01F
*&---------------------------------------------------------------------*

START-OF-SELECTION.

SELECT vbeln fkart fkdat kunrg kunag netwr waerk
  FROM vbrk
  INTO  TABLE gti_vbrk
  WHERE fkart IN so_fkart AND fkdat IN so_fkdat AND ernam IN so_ernam.

ges_vbrk = gti_vbrk.

IF sy-subrc EQ 0.

  SORT ges_vbrk BY vbeln.

  DELETE ADJACENT DUPLICATES FROM ges_vbrk COMPARING vbeln.

  SELECT vbeln posnr matnr
    FROM vbrp INTO TABLE gti_vbrp
    FOR ALL ENTRIES IN ges_vbrk
    WHERE  vbeln = ges_vbrk-vbeln.

ENDIF.

IF sy-subrc EQ 0.

  SORT ges_vbrk BY vbeln.

  DELETE ADJACENT DUPLICATES FROM ges_vbrk COMPARING vbeln.

  SELECT kunnr name1 name2
  FROM kna1 INTO TABLE gti_kna1
  FOR ALL ENTRIES IN ges_vbrk
  WHERE  kunnr EQ ges_vbrk-kunrg or kunnr EQ ges_vbrk-kunag.

ENDIF.


IF sy-subrc EQ 0.

  LOOP AT gti_vbrp INTO ges_vbrp.
    ges_result-vbeln  = ges_vbrp-vbeln.
    ges_result-matnr  = ges_vbrp-matnr.
    ges_result-posnr  = ges_vbrp-posnr.



    READ TABLE gti_vbrk INTO gwa_vbrk WITH KEY vbeln = ges_vbrp-vbeln.

    IF sy-subrc EQ 0.

      ges_result-fkart  = gwa_vbrk-fkart.
      ges_result-fkdat  = gwa_vbrk-fkdat.
      ges_result-kunag  = gwa_vbrk-kunag.
      ges_result-kunrg  = gwa_vbrk-kunrg.
      ges_result-netwr  = gwa_vbrk-netwr.
      ges_result-waerk  = gwa_vbrk-waerk.


      CALL FUNCTION 'DAYS_BETWEEN_TWO_DATES'
        EXPORTING
          i_datum_bis             = sy-datum
          i_datum_von             = gwa_vbrk-fkdat
        IMPORTING
          e_tage                  = ges_result-dias
        EXCEPTIONS
          days_method_not_defined = 1
          OTHERS                  = 2.


        READ TABLE gti_kna1 INTO gwa_kna1 WITH KEY kunnr = gwa_vbrk-kunrg.

         IF sy-subrc EQ 0.
        ges_result-name1 = gwa_kna1-name1.
        ges_result-name2 = gwa_kna1-name2.

      ENDIF.
    ENDIF.
APPEND ges_result to gti_result.

  ENDLOOP.
ENDIF.



FORM dis_data CHANGING gti_result TYPE gtp_ti_result.

  DATA:
    lo_salv type REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table   = lo_salv
    CHANGING
      t_table        = gti_result.

  lo_salv->display( ).


ENDFORM.




*
* call method cl_salv_table=>factory
*   importing
*     r_salv_table = alv_ti
*   changing
*     t_table      = gti_kna1.
*alv_ti->display( ).


.
