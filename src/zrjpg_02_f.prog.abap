
*&---------------------------------------------------------------------*
*&      Form  SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM selection .

CALL FUNCTION 'ZMFJPG_02'
  EXPORTING
    so_fkart            = so_fkart[]
    so_fkdat            = so_fkdat[]
    so_ername           = so_ernam[]
 IMPORTING
   gti_vbrk       = gti_vbrk.
BREAK-POINT.
  IF sy-subrc EQ 0.
* SI obtuvo datos, aseguro la unicicidad de los datos de la GTI_VBRK.

    gti_vbrk_aux = gti_vbrk.
    SORT gti_vbrk_aux BY vbeln.
    DELETE ADJACENT DUPLICATES FROM gti_vbrk_aux COMPARING vbeln.

    SELECT vbeln posnr matnr
      FROM vbrp
      INTO TABLE gti_vbrp
      FOR ALL ENTRIES IN gti_vbrk_aux
     WHERE vbeln = gti_vbrk_aux-vbeln.

    IF sy-subrc EQ 0.
*   SI OBTUVO DATOS
*   aseguro la unicicidad de los datos de la GTI_KNA1.
      gti_vbrk_aux = gti_vbrk.
      SORT gti_vbrk_aux BY kunrg.
      DELETE ADJACENT DUPLICATES FROM gti_vbrk_aux COMPARING kunrg kunag.

      SELECT kunnr name1 name2
         FROM kna1
         INTO TABLE gti_kna1
         FOR ALL ENTRIES IN gti_vbrk_aux
       WHERE kunnr = gti_vbrk_aux-kunrg
         or kunnr = gti_vbrk_aux-kunag.

    ENDIF.
*   se recorre la tabla interna gti_vbrp y se almacenan los datos dentro de su estructura.
    LOOP AT gti_vbrp INTO ges_vbrp.
      ges_alv-vbeln = ges_vbrp-vbeln.
      ges_alv-posnr = ges_vbrp-posnr.
      ges_alv-matnr = ges_vbrp-vbrp_matnr.

*   SE AGREGAN LOS VALORES LINEA POR LINEA DE LA ESTRUCTURA VBRK DENTRO DE LA ESTRUCTURA GES_ALV.
      READ TABLE gti_vbrk INTO ges_vbrk WITH KEY vbeln = ges_vbrp-vbeln.

      IF sy-subrc EQ 0.

        ges_alv-fkart = ges_vbrk-fkart.
        ges_alv-fkdat = ges_vbrk-fkdat.
        ges_alv-ernam = ges_vbrk-ernam.
        ges_alv-kunrg = ges_vbrk-kunrg.
        ges_alv-kunag = ges_vbrk-kunag.
        ges_alv-netwr = ges_vbrk-netwr.
        ges_alv-waerk = ges_vbrk-waerk.


        CALL FUNCTION 'DAYS_BETWEEN_TWO_DATES'
          EXPORTING
            i_datum_bis             = sy-datum
            i_datum_von             = ges_vbrk-fkdat
          IMPORTING
            e_tage                  = ges_alv-dias
          EXCEPTIONS
            days_method_not_defined = 1
            OTHERS                  = 2.
      ENDIF.

      IF ges_vbrk-kunrg IS NOT INITIAL.
*     SE AGREGAN LOS VALORES DE LA ESTRUCTURA KNA1 DENTRO DE LA ESTRUCTURA GES_ALV.
        READ TABLE gti_kna1 INTO ges_kna1 WITH KEY kunnr = ges_vbrk-kunrg.

        IF sy-subrc EQ 0.
          ges_alv-kunnr = ges_kna1-kunnr.
          ges_alv-kna1_name1 = ges_kna1-kna1_name1.
          ges_alv-kna1_name2 = ges_kna1-kna1_name2.

        ENDIF.
      ENDIF.
*     SE GUARDAN LOS DATOS DE LA ESTRUCTURA DENTRO DE LA TABLA INTERNA DE GTI_ALV.
      APPEND ges_alv TO gti_alv.
      clear: ges_alv,
             ges_vbrp,
             ges_vbrk,
             ges_kna1.


    ENDLOOP.
  ELSE.
    MESSAGE  'NO SE HAN ENCONTRADO DATOS PARA EL RANGO DE FECHAS SELECCIONADO.' TYPE 'E'.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  DIS_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM alv CHANGING gti_resultado TYPE gtp_ti_alv.
  DATA:
    lo_salv TYPE REF TO cl_salv_table.
  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_resultado.

  lo_salv->display( ).
ENDFORM.
