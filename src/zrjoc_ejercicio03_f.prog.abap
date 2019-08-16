*&---------------------------------------------------------------------*
*&  Include           ZRJOC_05_F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start_of_selection .
  DATA:
    lti_vbak  TYPE zttjoc_ejercicio03,
    lti_alv   TYPE gtt_alv,
    lti_tvkot TYPE zttjoc_ejercicio03_2,
    lti_tvtwt TYPE gtt_tvtwt.

  PERFORM validejecucion.
  PERFORM getdata CHANGING  lti_vbak
                            lti_tvkot
                            lti_tvtwt.

  PERFORM setdata USING lti_vbak
                        lti_tvkot
                        lti_tvtwt
                  CHANGING lti_alv.

  IF lti_alv IS NOT INITIAL.

    PERFORM dis_data USING lti_alv.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GETDATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM getdata CHANGING p_ti_vbak TYPE zttjoc_ejercicio03
                      p_ti_tvkot TYPE zttjoc_ejercicio03_2
                      p_ti_tvtwt TYPE gtt_tvtwt.
  .
  DATA: lti_vbak_aux TYPE zttjoc_ejercicio03.

  SELECT vbeln erdat auart vkorg vtweg
  FROM vbak
  INTO TABLE p_ti_vbak
   WHERE vbeln IN so_vbeln
     AND erdat IN so_erdat
     AND auart IN so_auart.

  IF sy-subrc EQ 0.

    CALL FUNCTION 'ZFMJOC_EJERCICIO03'
      EXPORTING
        i_ti_vbak  = p_ti_vbak
      IMPORTING
        e_ti_tvkot = p_ti_tvkot.



    lti_vbak_aux[] = p_ti_vbak[].
    SORT lti_vbak_aux BY vtweg.
    DELETE ADJACENT DUPLICATES FROM lti_vbak_aux COMPARING vtweg.

    SELECT mandt spras vtweg vtext
      FROM tvtwt
      INTO TABLE p_ti_tvtwt
      FOR ALL ENTRIES IN lti_vbak_aux
    WHERE spras EQ sy-langu AND
          vtweg EQ lti_vbak_aux-vtweg.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  INITIALIZATION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM initialization .

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SETDATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_LTI_VBAK  text
*      -->P_LTI_TVKOT  text
*      -->P_LTI_TVTWT  text
*      <--P_LTI_ALV  text
*----------------------------------------------------------------------*
FORM setdata  USING    p_ti_vbak TYPE zttjoc_ejercicio03
                       p_ti_tvkot TYPE zttjoc_ejercicio03_2
                       p_ti_tvtwt TYPE gtt_tvtwt
              CHANGING p_ti_alv TYPE gtt_alv.

  DATA: lwa_vbak  TYPE gty_vbak,
        lwa_alv   TYPE gty_alv,
        lwa_tvkot TYPE tvkot,
        lwa_tvtwt TYPE tvtwt.

  LOOP AT p_ti_vbak INTO lwa_vbak.

    lwa_alv-vbeln = lwa_vbak-vbeln.
    lwa_alv-erdat = lwa_vbak-erdat.
    lwa_alv-auart = lwa_vbak-auart.
    lwa_alv-vtweg = lwa_vbak-vtweg.
    lwa_alv-vkorg = lwa_vbak-vkorg.

    READ TABLE p_ti_tvkot INTO lwa_tvkot
      WITH KEY vkorg = lwa_vbak-vkorg.

    IF sy-subrc EQ 0.
      lwa_alv-vtext = lwa_tvkot-vtext.
    ENDIF.



    READ TABLE p_ti_tvtwt INTO lwa_tvtwt
     WITH KEY vtweg = lwa_vbak-vtweg.
    IF sy-subrc EQ 0.
      lwa_alv-canal = lwa_tvtwt-vtext.

    ENDIF.


    APPEND lwa_alv TO p_ti_alv.
    CLEAR lwa_alv.

  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DIS_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_LTI_ALV  text
*      -->P_ENDFORM  text
*----------------------------------------------------------------------*

FORM dis_data CHANGING pti_reporte TYPE gtt_alv.

  DATA:
    lo_salv TYPE REF TO cl_salv_table.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lo_salv
    CHANGING
      t_table      = pti_reporte.

  lo_salv->display( ).


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  VALIDEJECUCION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM validejecucion .
  DATA: lti_valid TYPE STANDARD TABLE OF ztjoc_ejercici03,
        lwa_vald  TYPE ztjoc_ejercici03.

  SELECT mandt usuar feult horult conta INTO TABLE lti_valid
    FROM ztjoc_ejercici03
    WHERE usuar EQ sy-uname.
  IF sy-subrc EQ 0.
    READ TABLE lti_valid INTO lwa_vald
    WITH KEY usuar = sy-uname.
    IF sy-subrc EQ 0.
      lwa_vald-conta = lwa_vald-conta + 1.
      lwa_vald-feult = sy-datum.
      lwa_vald-horult = sy-uzeit.
    ENDIF.
  ELSE.
    lwa_vald-conta = 1.
    lwa_vald-feult = sy-datum.
    lwa_vald-horult = sy-uzeit.
    lwa_vald-usuar = sy-uname.
  ENDIF.
  MODIFY ztjoc_ejercici03
  FROM lwa_vald.



ENDFORM.
