*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZTPMM_EJERCICIO3
*   generation date: 17.07.2019 at 17:41:20
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZTPMM_EJERCICIO3   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
