*&---------------------------------------------------------------------*
*& Report  ZRJPG_01
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrjpg_01.


* Tipos Estructuras.
TYPES: BEGIN OF gtp_so,
         erdat TYPE erdat,
         auart TYPE auart,
         augru TYPE augru,
       END OF gtp_so,

       BEGIN OF gtp_resultado,
         vbeln TYPE vbeln_va,
         erdat TYPE erdat,
         erzet TYPE erzet,
         ernam TYPE ernam,
       END OF gtp_resultado.

*Se crea un Tipo Tabla Estandar del Tipo Estrucutra Resultado.
TYPES: gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado.



*Se crean las Tablas Internas del tipo de datos: Tipo Tabla Estandar gtp_ti_resultado.

DATA: ges_so        TYPE gtp_so,
      gti_resultado TYPE gtp_ti_resultado.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS: pa_vbeln TYPE vbeln_va, "Numero de Pedido
            pa_vkorg TYPE vkorg,    "Organización de Ventas
            pa_vtweg TYPE vtweg,    "Canal de Distribución
            pa_spart TYPE spart.    "Sector
SELECT-OPTIONS:
  so_erdat FOR ges_so-erdat NO INTERVALS NO-EXTENSION,
  so_auart FOR ges_so-auart,
  so_augru FOR ges_so-augru.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  SELECT vbeln erdat erzet ernam
    FROM vbak
    INTO TABLE gti_resultado
    WHERE erdat IN so_erdat.
