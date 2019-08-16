FUNCTION zfmmvg_06.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(GTI_VBAK) TYPE  ZTTMVG_07
*"  CHANGING
*"     REFERENCE(GTI_KOVN) TYPE  ZTTMVG_06
*"----------------------------------------------------------------------
  IF sy-subrc EQ 0.

    DATA: gti_vbak_aux TYPE zttmvg_07.

    gti_vbak_aux = gti_vbak.
    SORT gti_vbak_aux BY knumv.
    DELETE ADJACENT DUPLICATES FROM gti_vbak_aux COMPARING knumv.

    SELECT knumv kbetr kschl waers
   FROM konv
      INTO TABLE gti_kovn
      FOR ALL ENTRIES IN gti_vbak_aux
      WHERE knumv = gti_vbak_aux-knumv
       AND  kschl = 'PR00'.
  ENDIF.



ENDFUNCTION.
