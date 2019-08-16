class YCLJOC_02 definition
  public
  inheriting from YCL_DBA_01
  create public .

public section.

  data GC_EXPERIENCIA type CHAR2 .

  methods ASIGNAR_EXPERIENCIA
    importing
      !I_C_EXPERIENCIA type CHAR2 .
protected section.
private section.
ENDCLASS.



CLASS YCLJOC_02 IMPLEMENTATION.


  method ASIGNAR_EXPERIENCIA.
me->gc_experiencia = i_c_experiencia.
  endmethod.
ENDCLASS.
