*&---------------------------------------------------------------------*
*&  Include           ZRPMM_01F
*&---------------------------------------------------------------------*

START-OF-SELECTION.

  SELECT vbeln fkart fktyp vbtyp netwr waerk vkorg vtweg fkdat
    FROM vbrk
    INTO TABLE gti_resultado
    WHERE fkdat IN so_fkdat AND fkart IN so_fkart.

  IF sy-subrc EQ 0.

    LOOP AT gti_resultado  INTO ges_resultado.

      READ TABLE gti_consulta ASSIGNING <gfs_consulta>
      WITH KEY mes = ges_resultado-fkdat+4(2).

      IF sy-subrc EQ 0.

        <gfs_consulta>-cantidad = <gfs_consulta>-cantidad + 1.

      ELSE.

        ges_consulta-mes = ges_resultado-fkdat+4(2).
        ges_consulta-cantidad = 1.
        APPEND ges_consulta TO gti_consulta.
      ENDIF.
    ENDLOOP.

  ENDIF.

  LOOP AT gti_consulta ASSIGNING <gfs_consulta>.

    CASE <gfs_consulta>-mes.
      WHEN '01'.
        <gfs_consulta>-mes = 'Enero'.
      WHEN '02'.
        <gfs_consulta>-mes = 'Febrero'.
      WHEN '03'.
        <gfs_consulta>-mes = 'Marzo'.
      WHEN '04'.
        <gfs_consulta>-mes = 'Abril'.
      WHEN '05'.
        <gfs_consulta>-mes = 'Mayo'.
      WHEN '06'.
        <gfs_consulta>-mes = 'Junio'.
      WHEN '07'.
        <gfs_consulta>-mes = 'Julio'.
      WHEN '08'.
        <gfs_consulta>-mes = 'Agosto'.
      WHEN '09'.
        <gfs_consulta>-mes = 'Septiembre'.
      WHEN '10'.
        <gfs_consulta>-mes = 'Octubre'.
      WHEN '11'.
        <gfs_consulta>-mes = 'Noviembre'.
      WHEN '12'.
        <gfs_consulta>-mes = 'Diciembre'.
      WHEN OTHERS.
    ENDCASE.

  ENDLOOP.



  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = alv_ti
    CHANGING
      t_table      = gti_consulta.
  alv_ti->display( ).
