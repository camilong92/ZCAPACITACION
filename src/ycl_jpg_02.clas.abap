class YCL_JPG_02 definition
  public
  inheriting from YCL_DBA_01
  create public .

public section.

  data GC_EXP type NUMC2 .

  methods TIEMPO_EXPERIENCIA
    importing
      !I_C_EXP type NUMC2 .
protected section.
private section.
ENDCLASS.



CLASS YCL_JPG_02 IMPLEMENTATION.


  method TIEMPO_EXPERIENCIA.
    me->gc_exp = i_c_exp.
  endmethod.
ENDCLASS.
