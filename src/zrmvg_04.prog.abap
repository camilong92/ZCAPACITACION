*&---------------------------------------------------------------------*
*& Report  ZRMVG_04
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZRMVG_04.

TYPES:

BEGIN OF gtp_so,
   sexo TYPE char2,
  seme TYPE char20,
    id TYPE char15,

  END OF gtp_so.

  DATA: ges_so type gtp_so.

  SELECT-OPTIONS:
 so_sexo FOR  ges_so-sexo NO INTERVALS NO-EXTENSION,
so_seme FOR ges_so-seme NO INTERVALS NO-EXTENSION,
so_id FOR ges_so-id NO INTERVALS NO-EXTENSION.

DATA: estudiante TYPE REF TO YCE_MVG_02 .

CREATE OBJECT estudiante
  EXPORTING
    i_c_sexo = so_sexo-low.

CALL METHOD estudiante->asignar_semestre
  EXPORTING
    i_c_semestre = so_seme-low.

CALL METHOD estudiante->asiganar_id
  EXPORTING
    i_c_id = so_id-low.

WRITE: estudiante->gc_id.
WRITE: estudiante->gc_semestre.
