*&---------------------------------------------------------------------*
*&  Include           ZRPMM_04_F01
*&---------------------------------------------------------------------*

  DATA: nombre_modulo_funcion TYPE rs38l_fnam,
        lwa_cabecera          TYPE zespmmcabecera_01,
        lti_detalle           TYPE zttmvg_detalle,
        lwa_detalle           TYPE zesygo_detalle,
        lwa_totales           TYPE zesbsz_sf_01.


  FORM consulta  CHANGING lti_detalle TYPE zttmvg_detalle.

    SELECT vbeln ARKTX POSNR netwr
      FROM vbrp INTO TABLE lti_detalle
      WHERE vbeln IN fact.

  ENDFORM.

  FORM start_of_selection.


    PERFORM consulta CHANGING lti_detalle.
*    PERFORM resultado CHANGING lti_detalle.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname           = 'ZSFPMM_01'
      direct_call        = 'X'
    IMPORTING
      fm_name            = nombre_modulo_funcion
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


*
*  "Asisgnar parametros
  lwa_cabecera-logo = 'Z_LOGO'.
  lwa_cabecera-fecha = '01/01/2019'.
  lwa_cabecera-cedula = '1234567890'.
  lwa_cabecera-nombre = 'Juan Jaramillo'.

*  lwa_detalle-material = '23'.
*  lwa_detalle-cantidad = '10'.
*  lwa_detalle-vtotal = '1000'.
*
*  APPEND lwa_detalle TO lti_detalle.
*
  lwa_totales-subt = '1000'.
  lwa_totales-iva = '200'.
  lwa_totales-total = '1200'.

*
*
*
*
  "Enviar datos al formulario e imprimirlo.

  CALL FUNCTION nombre_modulo_funcion
    EXPORTING
      i_es_cabecera    = lwa_cabecera
      i_ti_detalle     = lti_detalle
      i_es_totales     = lwa_totales
    EXCEPTIONS
      formatting_error = 1
      internal_error   = 2
      send_error       = 3
      user_canceled    = 4
      OTHERS           = 5.

* Si se produce un error, reportarlo.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid
    TYPE sy-msgty
    NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  ENDFORM.

  FORM resultado CHANGING lti_detalle TYPE zttmvg_detalle.

    DATA:  alv_ti TYPE REF TO cl_salv_table.

    CALL METHOD cl_salv_table=>factory
      IMPORTING
        r_salv_table = alv_ti
      CHANGING
        t_table      = lti_detalle.
    alv_ti->display( ).

  ENDFORM.
