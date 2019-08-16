*&---------------------------------------------------------------------*
*& Report  ZRYGO_01
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrygo_01.
"creado la tipo estructura
TYPES:
  BEGIN OF gtp_so,
    erdat TYPE erdat,
    auart TYPE auart,
    augru TYPE augru,
  END OF gtp_so,

  BEGIN OF gtp_resultado,
    vbeln TYPE  vbeln_va,
    erdat TYPE  erdat,
    erzet TYPE  erzet,
    ernam	TYPE ernam,
  END OF gtp_resultado.

TYPES: gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado.

DATA:
  ges_so        TYPE gtp_so,
  gti_resultado TYPE gtp_ti_resultado.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS:
  pa_vbeln TYPE vbeln_va,
  pa_vkorg TYPE vkorg,
  pa_vtweg TYPE vtweg,
  pa_spart TYPE spart.

SELECT-OPTIONS:
"so_erdat FOR  gc_erdat NO INTERVALS NO-EXTENSION.
so_erdat FOR ges_so-erdat,
so_auart FOR ges_so-auart,
so_augru FOR ges_so-augru.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
BREAK netw01.
  SELECT vbeln erdat erzet ernam
    FROM vbak
    INTO TABLE gti_resultado
   WHERE erdat IN so_erdat.

    data:
      lo_salv type REF TO cl_salv_table.

*    TRY.
    CALL METHOD cl_salv_table=>factory
*      EXPORTING
*        list_display   = IF_SALV_C_BOOL_SAP=>FALSE
*        r_container    =
*        container_name =
      IMPORTING
        r_salv_table   = lo_salv
      CHANGING
        t_table        = gti_resultado
        .
*     CATCH cx_salv_msg .
*    ENDTRY.

    lo_salv->display( ).
