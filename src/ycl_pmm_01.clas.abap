class YCL_PMM_01 definition
  public
  inheriting from YCL_DBA_01
  final
  create public .

public section.

  data GC_SEXO type CHAR1 .
  data GC_EDAD type NUMC2 .
  data GC_MESES type I .

  class-methods COMPLETAR_CEROS_IZQUIERDA .
  methods ASIGNAR_MESES
    importing
      !I_C_MESES type I .
protected section.
private section.
ENDCLASS.



CLASS YCL_PMM_01 IMPLEMENTATION.


  method ASIGNAR_MESES.
    me->gc_meses = i_c_meses.
  endmethod.


  method COMPLETAR_CEROS_IZQUIERDA.
  endmethod.
ENDCLASS.
