class YCE_MVG_01 definition
  public
  create public .

public section.

  data GC_ID type CHAR15 .
  data GC_SEXO type CHAR1 .
  data GC_EDAD type CHAR2 .

  methods ASIGNAR_ID
    importing
      !I_C_ID type CHAR15 .
  methods ASIGNAR_SEXO
    importing
      !I_C_SEXO type CHAR2 .
protected section.
private section.
ENDCLASS.



CLASS YCE_MVG_01 IMPLEMENTATION.


  method ASIGNAR_ID.

    GC_ID = i_c_id.


  endmethod.


  method ASIGNAR_SEXO.

       GC_SEXO = i_c_sexo.
  endmethod.
ENDCLASS.
