*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZTJPG_EJERCICIO3
*   generation date: 02.07.2019 at 08:41:47
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZTJPG_EJERCICIO3   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
