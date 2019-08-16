class YCLJOC_01 definition
  public
  create public .

public section.

  data GC_ID type CHAR15 .
  data GC_SEXO type CHAR1 .
  data GC_EDAD type CHAR2 .

  methods ASIGNAR_ID
    importing
      !I_C_ID type CHAR15 .
  class-methods COMPLETAR_CEROS_ALAIZQUIERDA .
  methods I_C_ASIGNAR_SEXO
    importing
      !I_ASIGNAR_SEXO type CHAR1 .
  methods ASIGNAR_EDAD
    importing
      !I_ASIGNAR_EDAD type CHAR2 .
protected section.
private section.
ENDCLASS.



CLASS YCLJOC_01 IMPLEMENTATION.


  method ASIGNAR_EDAD.
  endmethod.


  method ASIGNAR_ID.
    me->gc_id = i_c_id.
  endmethod.


  method COMPLETAR_CEROS_ALAIZQUIERDA.
  endmethod.


  method I_C_ASIGNAR_SEXO.

  endmethod.
ENDCLASS.
