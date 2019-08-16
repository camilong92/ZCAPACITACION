*&---------------------------------------------------------------------*
*&  INCLUDE           ZRYGO_EJERCICIO03_V
*&---------------------------------------------------------------------*
TYPES:
  BEGIN OF gtp_so,
    vbeln TYPE vbeln_va, "DOCUMENTO DE VENTAS
    auart TYPE auart,    "Clase de documento de ventas
    erdat TYPE erdat,    "FECHA DE CREACIÓN DEL REGISTRO
  END OF gtp_so,

  BEGIN OF gtp_vbap,
    vbeln  TYPE vbeln_va, "DOCUMENTO DE VENTAS
    posnr  TYPE posnr_va, "POSICIÓN DOCUMENTO VENTAS
    zmeng  TYPE dzmeng,
    unidad TYPE meinb,   "CANTIDAD PREVISTA EN UNIDAD DE MEDIDA DE VENTA
  END OF gtp_vbap,

  BEGIN OF gtp_alv,
    vbeln TYPE vbeln_va, "DOCUMENTO DE VENTAS
    erdat TYPE erdat,    "FECHA DE CREACIÓN DEL REGISTRO
    auart TYPE auart,    "Clase de documento de ventas
    titem TYPE char20, "CALCULAR TOTAL DE ITEMS DE TODAS LAS POSICIONES
  END OF gtp_alv,

  BEGIN OF gtp_programa,
    programm TYPE programm,
    datum    TYPE datum,
    uzeit    TYPE uzeit,
    uname    TYPE uname,
    cont     TYPE integer,
  END OF gtp_programa,

  BEGIN OF gtp_cantidad,
    cantidad TYPE integer,
    END OF gtp_cantidad.


TYPES: gtp_ti_so   TYPE STANDARD TABLE OF gtp_so,
       gtp_ti_vbap TYPE STANDARD TABLE OF gtp_vbap,
       gtp_ti_alv  TYPE STANDARD TABLE OF gtp_alv,
       gtp_ti_cantidad TYPE STANDARD TABLE OF gtp_cantidad,
       gtp_ti_programa TYPE STANDARD TABLE OF gtp_programa.

DATA: ges_so   TYPE gtp_so,
      ges_vbap TYPE gtp_vbap,
      ges_alv  TYPE gtp_alv,
      ges_cantidad TYPE gtp_cantidad,
      ges_programa TYPE ZTSDCONTADOR.

DATA: gti_so       TYPE  gtp_ti_so,
      gti_vbap     TYPE  gtp_ti_vbap,
      gti_alv      TYPE gtp_ti_alv,
      gti_so_aux   TYPE TABLE OF gtp_so,
      gti_vbap_aux TYPE TABLE OF gtp_vbap,
      gti_programa TYPE gtp_ti_programa,
      gti_cantidad TYPE gtp_ti_cantidad,
      lwa_programa TYPE gtp_ti_programa.
