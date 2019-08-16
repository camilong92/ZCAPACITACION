FUNCTION zfmconsulta_ygo.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(I_GTI_SO) TYPE  ZGTP_TI_SO
*"  EXPORTING
*"     REFERENCE(E_GTI_VBAP) TYPE  ZGTP_TI_VBAP
*"----------------------------------------------------------------------

  DATA: gti_so_aux TYPE zgtp_ti_so.


  gti_so_aux = i_gti_so.

  SORT gti_so_aux BY vbeln.
  DELETE ADJACENT DUPLICATES FROM gti_so_aux COMPARING vbeln.


  SELECT vbeln posnr zmeng
       FROM vbap
       INTO TABLE e_gti_vbap
       FOR ALL ENTRIES IN gti_so_aux
       WHERE vbeln = gti_so_aux-vbeln.


ENDFUNCTION.
