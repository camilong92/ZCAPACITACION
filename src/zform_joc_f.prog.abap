*&---------------------------------------------------------------------*
*&  Include           ZFORM_JOC_F
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

  PERFORM smartform.
  PERFORM select.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SMARTFORM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM smartform .


  DATA:
          lc_name TYPE rs38l_fnam.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname           = 'ZSFJOC_01'
*     VARIANT            = ' '
      direct_call        = 'X'
    IMPORTING
      fm_name            = lc_name
    EXCEPTIONS
      no_form            = 1
      no_function_module = 2
      OTHERS             = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid
    TYPE sy-msgty
    NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  DATA:
    lwa_cab TYPE zespmmcabecera_01,
    lti_det TYPE zttmvg_detalle,
    lwa_det TYPE zesygo_detalle,
    lwa_tot TYPE zesbsz_sf_01,
    l_fecha TYPE string.




  CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
    EXPORTING
      date_internal            = p_fecha
    IMPORTING
      date_external            = l_fecha
    EXCEPTIONS
      date_internal_is_invalid = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  lwa_cab-logo = 'Z_LOGO'.
  lwa_cab-fecha = l_fecha.
  lwa_cab-nombre = p_nombre.
  lwa_cab-cedula = p_cedula.
*  lwa_det-cantidad = '45'.
*  lwa_det-material = '78'.
*  lwa_det-vtotal = '38.500'.
*  APPEND lwa_det to lti_det.
  lwa_tot-subt = '322323232'.
  lwa_tot-iva = '32'.
  lwa_tot-total = '322323232'.


  CALL FUNCTION lc_name
    EXPORTING
      t_es_cabecera    = lwa_cab
      i_ti_detalle     = lti_det
      i_es_totales     = lwa_tot
    EXCEPTIONS
      formatting_error = 1
      internal_error   = 2
      send_error       = 3
      user_canceled    = 4
      OTHERS           = 5.
  IF sy-subrc <> 0.
*Implement suitable error handling here
  ENDIF.






ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM select .


SELECT matnr fkimg netwr
  FROM vbrp INTO TABLE gti_smart
  WHERE matnr in gti_smart and
        matnr eq gti_smart-material and
        fkimg eq gti_smart-cantidad and
        netw eq gti_smart-valorund.


ENDFORM.
