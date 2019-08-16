*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start_of_selection .
*&---------------------------------------------------------------------*
* SE LLAMA A LA SUBRUTINA QUE INDICA LA CANTIDAD DE EJECUCIONES.
*&---------------------------------------------------------------------*
  PERFORM tabla.

*&---------------------------------------------------------------------*
* SE LLENA LA TABLA INTERNA CON EL RESULTRADO DE LOS SELECT OPTIONS.
*&---------------------------------------------------------------------*
  SELECT vbeln auart erdat
    FROM vbak
    INTO TABLE gti_vbak
    WHERE vbeln IN so_vbeln
     AND  auart IN so_auart
     AND  erdat IN so_erdat.

  IF sy-subrc EQ 0.
*&---------------------------------------------------------------------*
* SE LLAMA AL MODULO DE FUNCIÓN, EN EL CUAL SE LLENAN LAS TABLAS INTERNAS
*&---------------------------------------------------------------------*
    PERFORM get_data USING gti_vbak CHANGING  gti_vbpa gti_kna1.
*&---------------------------------------------------------------------*
* SE LLENA LA TABLA INTERNA DEL ALV CON LOS VALORES DE LAS CONSULTAS.
*&---------------------------------------------------------------------*
    PERFORM llenar_alv USING gti_vbak gti_vbpa gti_kna1 CHANGING gti_alv.

  ELSE.

    MESSAGE 'Validar bien los parametros ingresados.' TYPE 'E'.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  TABLA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM tabla .
*&---------------------------------------------------------------------*
* SE CREAN lOS DATOS PARA HALLAR LA CANTIDAD.
*&---------------------------------------------------------------------*
  DATA:  gti_resultado        TYPE gtp_ti_resultado,
         ges_resultado        TYPE gtp_resultado,
         gti_ztjpg_ejercicio3 TYPE ztjpg_ejercicio3,
         gti_cantv            TYPE gtp_ti_cantv,
         ges_cantv            TYPE gtp_cantv,
         lo_salv              TYPE REF TO cl_salv_table.

  SELECT cantv
    FROM ztjpg_ejercicio3
    INTO TABLE gti_cantv
    WHERE uprog = sy-uname AND nprog = sy-repid.

  READ TABLE gti_cantv INTO ges_cantv INDEX 1.

  ges_resultado-fejec = sy-datum.
  ges_resultado-hejec = sy-uzeit.
  ges_resultado-nprog = sy-repid.
  ges_resultado-uprog = sy-uname.
  ges_resultado-cantv = ges_cantv-cantv + 1.

  MODIFY ztjpg_ejercicio3 FROM ges_resultado.

  SELECT mandt nprog fejec hejec uprog cantv
     FROM ztjpg_ejercicio3
     INTO TABLE gti_resultado
     WHERE uprog = sy-uname.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_resultado.

  lo_salv->display( ).

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_GTI_VBAK  text
*      <--P_GTI_VBPA  text
*      <--P_GTI_KNA1  text
*----------------------------------------------------------------------*
FORM get_data USING     p_gti_vbak TYPE gtp_ti_vbak
              CHANGING  p_gti_vbpa TYPE gtp_ti_vbpa
                        p_gti_kna1 TYPE gtp_ti_kna1.

*----------------------------------------------------------------------*
* Se llama al modulo de Función.
*----------------------------------------------------------------------*
  CALL FUNCTION 'ZMFJPG_03'
    EXPORTING
      gti_vbak = gti_vbak
    IMPORTING
      gti_vbpa = gti_vbpa
      gti_kna1 = gti_kna1.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  LLENAR_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GTI_VBAK  text
*      -->P_GTI_VBPA  text
*      -->P_GTI_KNA1  text
*      <--P_GTI_ALV  text
*----------------------------------------------------------------------*
FORM llenar_alv  USING    p_gti_vbak TYPE gtp_ti_vbak
                          p_gti_vbpa TYPE gtp_ti_vbpa
                          p_gti_kna1 TYPE gtp_ti_kna1
                 CHANGING p_gti_alv  TYPE gtp_ti_alv.
*
*&---------------------------------------------------------------------*
* SE LLENAN LAS ESTRUCTURAS DE LAS TABLAS INTERNAS PARA POSTERIORMENTE..
* LLENAR LA TABLA INTERNA DEL ALV.
*&---------------------------------------------------------------------*


  """""CORREGIR, LA TABLA PRINCIPAL ES LA VBAK""""".
  LOOP AT gti_vbpa INTO ges_vbpa.
    ges_alv-vbeln = ges_vbpa-vbeln.
    ges_alv-kunnr = ges_vbpa-kunnr.
    ges_alv-parvw = ges_vbpa-parvw.

    READ TABLE gti_vbak INTO ges_vbak WITH KEY vbeln = ges_vbpa-vbeln.

    IF sy-subrc EQ 0.
      ges_alv-erdat = ges_vbak-erdat.
      ges_alv-auart = ges_vbak-auart.
    ENDIF.

    IF ges_vbpa-kunnr IS NOT INITIAL.

      READ TABLE gti_kna1 INTO ges_kna1 WITH KEY kunnr = ges_vbpa-kunnr.

      IF sy-subrc EQ 0.

        ges_alv-stcdt = ges_kna1-stcdt.
        ges_alv-stcd1 = ges_kna1-stcd1.

      ENDIF.
    ENDIF.

    APPEND ges_alv TO gti_alv.
    CLEAR: ges_alv,
           ges_vbpa,
           ges_vbak,
           ges_kna1.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  END_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM end_of_selection .
*&---------------------------------------------------------------------*
* SE MUESTRA EN PANTALLA LA TABLA INTERNA GTI_ALV.
*&---------------------------------------------------------------------*
  PERFORM alv CHANGING gti_alv.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_GTI_ALV  text
*----------------------------------------------------------------------*
FORM alv  CHANGING gti_resultado TYPE gtp_ti_alv.
  DATA:
     lo_salv TYPE REF TO cl_salv_table.
  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = gti_resultado.

  lo_salv->display( ).
ENDFORM.
