*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZTJOC_EJERCICI03
*   generation date: 18.07.2019 at 14:59:52
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZTJOC_EJERCICI03   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
