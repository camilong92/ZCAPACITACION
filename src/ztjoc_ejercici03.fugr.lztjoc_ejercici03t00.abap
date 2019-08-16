*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 18.07.2019 at 14:59:53
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTJOC_EJERCICI03................................*
DATA:  BEGIN OF STATUS_ZTJOC_EJERCICI03              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTJOC_EJERCICI03              .
CONTROLS: TCTRL_ZTJOC_EJERCICI03
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTJOC_EJERCICI03              .
TABLES: ZTJOC_EJERCICI03               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
