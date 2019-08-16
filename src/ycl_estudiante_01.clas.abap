class YCL_ESTUDIANTE_01 definition
  public
  inheriting from YCL_DBA_01
  final
  create public .

public section.

  data I_SEMESTRE type CHAR2 .

  methods ASIGNARSEMESTRE
    importing
      !SEMESTRE type CHAR2 .
protected section.
private section.
ENDCLASS.



CLASS YCL_ESTUDIANTE_01 IMPLEMENTATION.


  method ASIGNARSEMESTRE.
  endmethod.
ENDCLASS.
