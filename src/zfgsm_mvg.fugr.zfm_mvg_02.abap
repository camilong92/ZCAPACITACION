FUNCTION ZFM_MVG_02.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_TI_FKART) TYPE  ZTTMVG_02
*"     REFERENCE(I_TI_FKDAT) TYPE  ZTTMVG_04
*"     REFERENCE(I_TI_ERNAM) TYPE  SHP_ERNAM_RANGE_T
*"  EXPORTING
*"     REFERENCE(E_TI_RESULTADO) TYPE  ZTTMVG_03
*"----------------------------------------------------------------------
select VBELN FKART FKDAT KUNRG KUNAG NETWR WAERK
  from vbrk
  into CORRESPONDING FIELDS OF TABLE E_TI_RESULTADO
  where FKART in I_TI_FKART and FKDAT in I_TI_FKDAT and ERNAM in I_TI_ERNAM.



ENDFUNCTION.
