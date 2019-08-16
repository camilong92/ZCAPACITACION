*&---------------------------------------------------------------------*
*&  Include           ZRMV_01_V
*&---------------------------------------------------------------------*

TYPES:
  BEGIN OF  gtp_so,     "Creamos la estructura
    fkart TYPE fktyp,  "Clase de factura
    fktyp TYPE fktyp,   " Tipo de factura
  END OF gtp_so,
  BEGIN OF
    gtp_resultado,
    vbeln TYPE vbeln_vf,
    fkart TYPE fktyp,
    fktyp TYPE fktyp,
    vbtyp TYPE vbtyp,
    waerk TYPE waerk,
    netwr TYPE netwr,
    vkorg TYPE vkorg,
    vtweg TYPE vtweg,
    fkdat TYPE fkdat,

  END OF gtp_resultado.

TYPES:
gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado.  "Crear tabla interna llamada gtp_ti_resultado

DATA: ges_so        TYPE gtp_so,      "creo la variable
      gti_resultado TYPE gtp_ti_resultado.
