FUNCTION zmfjpg_02.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(SO_FKART) TYPE  ZTTJPG_01
*"     REFERENCE(SO_FKDAT) TYPE  ZTTJPG_02
*"     REFERENCE(SO_ERNAME) TYPE  SHP_ERNAM_RANGE_T
*"  EXPORTING
*"     REFERENCE(GTI_VBRK) TYPE  ZTTJPG_03
*"  EXCEPTIONS
*"      CLASE_VACIA
*"      FECHA_UNDEFINED
*"      NAME_UNDEFINED
*"----------------------------------------------------------------------

  SELECT vbeln fkart fkdat kunrg kunag netwr waerk ernam
    FROM vbrk
    INTO TABLE gti_vbrk
   WHERE ernam IN so_ername
    AND  fkdat IN so_fkart
    AND  fkart IN so_ername.





ENDFUNCTION.
