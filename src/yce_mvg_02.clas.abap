class YCE_MVG_02 definition
  public
  inheriting from YCL_DBA_01
  create public .

public section.

  data GC_SEMESTRE type CHAR20 .

  methods ASIGNAR_SEMESTRE
    importing
      !I_C_SEMESTRE type CHAR20 .
protected section.
private section.
ENDCLASS.



CLASS YCE_MVG_02 IMPLEMENTATION.


  method ASIGNAR_SEMESTRE.

ME->GC_SEMESTRE = I_C_SEMESTRE.
  endmethod.
ENDCLASS.
