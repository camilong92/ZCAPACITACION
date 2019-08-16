class YCL_DBA_01 definition
  public
  create public .

public section.

  data GC_ID type CHAR15 .

  methods ASIGANAR_ID
    importing
      !I_C_ID type CHAR15 .
  methods CONSTRUCTOR
    importing
      !I_C_SEXO type CHAR2 .
protected section.

  methods ASIGNAR_SEXO
    importing
      !I_C_SEXO type CHAR02 .
private section.

  data GC_SEXO type CHAR1 .
ENDCLASS.



CLASS YCL_DBA_01 IMPLEMENTATION.


  METHOD asiganar_id.

    me->gc_id = i_c_id.

  ENDMETHOD.


  method ASIGNAR_SEXO.
    me->gc_sexo = i_c_sexo.
  endmethod.


  method CONSTRUCTOR.

    CALL METHOD me->asignar_sexo
      EXPORTING
        i_c_sexo = i_c_sexo.

  endmethod.
ENDCLASS.
