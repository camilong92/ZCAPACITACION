FUNCTION ZFM_JOC_01.
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
if i_i_op1 is INITIAL.
  RAISE division_cero.
  endif.
  e_i_resultado = i_i_op1/i_i_op2.




ENDFUNCTION.
