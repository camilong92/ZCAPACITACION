FUNCTION ZFMJOC_EJERCICIO03.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_TI_VBAK) TYPE  ZTTJOC_EJERCICIO03
*"  EXPORTING
*"     REFERENCE(E_TI_TVKOT) TYPE  ZTTJOC_EJERCICIO03_2
*"----------------------------------------------------------------------

 DATA: lti_vbak_aux TYPE ZTTJOC_EJERCICIO03.

 lti_vbak_aux[] = I_TI_VBAK[].
 sort lti_vbak_aux by VKORG.
 delete ADJACENT DUPLICATES FROM lti_vbak_aux COMPARING VKORG.

 select MANDT SPRAS VKORG VTEXT
   from TVKOT
   INTO TABLE e_ti_tvkot
   FOR ALL ENTRIES IN lti_vbak_aux
 WHERE SPRAS eq sy-langu and
       VKORG eq lti_vbak_aux-VKORG.




ENDFUNCTION.
