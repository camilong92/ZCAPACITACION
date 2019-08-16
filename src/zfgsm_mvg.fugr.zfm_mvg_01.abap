FUNCTION ZFM_MVG_01.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_C_OP1) TYPE  INT4
*"     REFERENCE(I_C_OP2) TYPE  INT4
*"  EXPORTING
*"     REFERENCE(E_I_RESULTADO) TYPE  INT4
*"  EXCEPTIONS
*"      DIVISIONCERO
*"----------------------------------------------------------------------

if I_C_OP1 eq o.
  raise division_cero.
  endif.

e_i_resultado = I_C_OP1 / I_C_OP2.

ENDFUNCTION.
