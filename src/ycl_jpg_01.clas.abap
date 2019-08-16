class YCL_JPG_01 definition
  public
  create public .

public section.

  data GC_ID type CHAR15 .
  data GC_SEXO type CHAR2 .
  data GC_EDAD type NUMC2 .

  methods ASIGNAR_ID
    importing
      !I_C_ID type CHAR15 .
  methods ASIGNAR_SEXO
    importing
      !I_C_SEXO type CHAR2 .
  methods ASIGNAR_EDAD
    importing
      !I_C_EDAD type NUMC2 .
protected section.
private section.
ENDCLASS.



CLASS YCL_JPG_01 IMPLEMENTATION.


  method ASIGNAR_EDAD.

   me->gc_edad = i_c_edad.

  endmethod.


  method ASIGNAR_ID.

    me->gc_id = i_c_id.

  endmethod.


  method ASIGNAR_SEXO.

    me->GC_SEXO = i_c_sexo.

  endmethod.
ENDCLASS.
