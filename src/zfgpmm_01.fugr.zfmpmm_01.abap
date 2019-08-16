FUNCTION zfmpmm_01.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_C_OP1) TYPE  INT4
*"     REFERENCE(I_C_OP2) TYPE  INT4
*"  EXPORTING
*"     REFERENCE(E_I_RESULTADO) TYPE  INT4
*"  EXCEPTIONS
*"      DIVISION_CERO
*"----------------------------------------------------------------------
  IF i_c_op1 EQ  0.
    RAISE division_cero.
  ENDIF.


  e_i_resultado = I_C_OP1 / I_C_OP2.







ENDFUNCTION.
