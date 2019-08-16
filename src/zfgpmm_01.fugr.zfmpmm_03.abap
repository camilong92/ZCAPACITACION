FUNCTION ZFMPMM_03.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_ED_IDIOMA) TYPE  LANGU
*"  EXPORTING
*"     REFERENCE(E_TI_RESULTADO) TYPE  ZTTPMM_04
*"  CHANGING
*"     REFERENCE(I_GTI_TVAKT) TYPE  ZTTPMM_05
*"----------------------------------------------------------------------

    SORT I_GTI_TVAKT BY auart.

  DELETE ADJACENT DUPLICATES FROM I_GTI_TVAKT COMPARING auart.

SELECT  auart bezei
  FROM tvakt
  INTO TABLE E_TI_RESULTADO
  FOR ALL ENTRIES IN I_GTI_TVAKT
  WHERE  auart = I_GTI_TVAKT-auart AND spras = I_ED_IDIOMA.




ENDFUNCTION.
