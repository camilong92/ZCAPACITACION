FUNCTION zmfjpg_03.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(GTI_VBAK) TYPE  ZTTJPG_EJ03
*"  EXPORTING
*"     REFERENCE(GTI_VBPA) TYPE  ZTTJPG_EJ03_VBPA
*"     REFERENCE(GTI_KNA1) TYPE  ZTTJPG_EJ03_KNA1
*"----------------------------------------------------------------------
  DATA: gti_vbak_aux TYPE zttjpg_ej03.


  gti_vbak_aux = gti_vbak.
  SORT gti_vbak_aux BY vbeln.
  DELETE ADJACENT DUPLICATES FROM gti_vbak_aux COMPARING vbeln.
IF gti_vbak_aux IS NOT INITIAL.
  SELECT vbeln kunnr parvw
    FROM vbpa
    INTO TABLE gti_vbpa
    FOR ALL ENTRIES IN gti_vbak_aux
    WHERE vbeln = gti_vbak_aux-vbeln
     AND parvw = 'AG'.
ENDIF.
*----------------------------------------------------------------------*
*Se realiza la union de las tablas VBPA y KNA1.
*----------------------------------------------------------------------*
* Se crea una tabla interna auxiliar para la tabla VBPA.
*----------------------------------------------------------------------*
  DATA: gti_vbpa_aux TYPE ZTTJPG_EJ03_VBPA.

*----------------------------------------------------------------------*
* Se asegura la unicicidad de los datos de la consulta a la tabla VBPA
*----------------------------------------------------------------------*
  gti_vbpa_aux = gti_vbpa.
  SORT gti_vbpa_aux BY kunnr.
  DELETE ADJACENT DUPLICATES FROM gti_vbpa_aux COMPARING kunnr.

  SELECT kunnr stcdt stcd1
    FROM kna1
    INTO TABLE gti_kna1
    FOR ALL ENTRIES IN gti_vbpa_aux
    WHERE kunnr = gti_vbpa_aux-kunnr.




ENDFUNCTION.
