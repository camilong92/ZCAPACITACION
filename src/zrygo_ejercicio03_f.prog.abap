
FORM start_of_selection .

SELECT cont
    FROM ztsdcontador
    INTO TABLE gti_cantidad
    WHERE uname = sy-uname.



  READ TABLE gti_cantidad INTO ges_cantidad index 1.

  ges_programa-programm = sy-repid.
  ges_programa-datum = sy-datum.
  ges_programa-uzeit = sy-uzeit.
  ges_programa-uname = sy-uname.
  ges_programa-cont = ges_cantidad-cantidad + 1.

 MODIFY ztsdcontador from ges_programa.


*----------------------------------------------------------------------*

  SELECT vbeln auart erdat
    FROM vbak
    INTO TABLE gti_so
    WHERE vbeln IN so_vbeln AND
          auart IN so_auart AND
          erdat IN so_erdat.


  IF sy-subrc EQ 0.
    CALL FUNCTION 'ZFMCONSULTA_YGO'
      EXPORTING
        i_gti_so   = gti_so
      IMPORTING
        e_gti_vbap = gti_vbap.

*    gti_so_aux = gti_so.
*
*    SORT gti_so_aux BY vbeln.
*    DELETE ADJACENT DUPLICATES FROM gti_so_aux COMPARING vbeln.
*
*    SELECT vbeln posnr zmeng
*      FROM vbap
*      INTO TABLE gti_vbap
*      FOR ALL ENTRIES IN gti_so_aux
*      WHERE vbeln = gti_so_aux-vbeln.

  ENDIF.

ENDFORM.

FORM procesar .
  IF sy-subrc EQ 0.

    LOOP AT gti_vbap INTO ges_vbap.

      DATA: vtotal TYPE char20.
      vtotal = vtotal + ges_vbap-zmeng.
      AT END OF vbeln.

        ges_alv-vbeln = ges_vbap-vbeln.
        ges_alv-titem = vtotal.

        IF sy-subrc EQ 0.

          READ TABLE gti_so INTO ges_so WITH KEY vbeln = ges_vbap-vbeln.

          ges_alv-vbeln = ges_so-vbeln.
          ges_alv-auart = ges_so-auart.
          ges_alv-erdat = ges_so-erdat.

          APPEND ges_alv TO gti_alv.
          CLEAR vtotal.
        ENDIF.
      ENDAT.
    ENDLOOP.
  ENDIF.

ENDFORM.

FORM mostrar CHANGING gti_alv TYPE gtp_ti_alv.

  DATA:
    lo_salv TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_alv.

  lo_salv->display( ).

ENDFORM.
