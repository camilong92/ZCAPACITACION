*&---------------------------------------------------------------------*
*& Report  ZRJPG_06
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrjpg_06.

*sp01 log de impresiones.

*No es el mismo en calidad, ni en productivo, cambia según el ambiente
*Siempre que llamo a un Smartform debo llamar a otro modulo de funcion

DATA: lc_forname   TYPE rs38l_fnam,
      lwa_cabecera TYPE zespmmcabecera_01,
      lti_detalle  TYPE zttmvg_detalle,
      lwa_detalle type ZESYGO_DETALLE,
      lwa_totales  TYPE zesbsz_sf_01.

START-OF-SELECTION.

  break netw01.

*iTEM 1.

  lwa_detalle-cantidad = 1.
  lwa_detalle-material = 22.
  lwa_detalle-vtotal = 1000.

  APPEND lwa_detalle TO lti_detalle.

  lwa_detalle-cantidad = 2.
  lwa_detalle-material = 23.
  lwa_detalle-vtotal = 10001.

  APPEND lwa_detalle TO lti_detalle.

  lwa_detalle-cantidad = 3.
  lwa_detalle-material = 24.
  lwa_detalle-vtotal = 10002.

  APPEND lwa_detalle TO lti_detalle.



  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname           = 'ZSFJPG_01'
*     VARIANT            = ' '
*     DIRECT_CALL        = ' '
    IMPORTING
      fm_name            = lc_forname
    EXCEPTIONS
      no_form            = 1
      no_function_module = 2
      OTHERS             = 3.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  BREAK-POINT.

  lwa_cabecera-logo = 'Z_LOGO'.

  CALL FUNCTION lc_forname
    EXPORTING
      i_es_cabecera    = lwa_cabecera
      i_ti_detalle     = lti_detalle
      i_es_totales     = lwa_totales
* IMPORTING
*     DOCUMENT_OUTPUT_INFO       =
*     JOB_OUTPUT_INFO  =
*     JOB_OUTPUT_OPTIONS         =
    EXCEPTIONS
      formatting_error = 1
      internal_error   = 2
      send_error       = 3
      user_canceled    = 4
      OTHERS           = 5.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  BREAK-POINT.
