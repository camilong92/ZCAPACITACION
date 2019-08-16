*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 18.07.2019 at 10:39:20
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTPMM_EJERCICIO3................................*
DATA:  BEGIN OF STATUS_ZTPMM_EJERCICIO3              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTPMM_EJERCICIO3              .
CONTROLS: TCTRL_ZTPMM_EJERCICIO3
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTPMM_EJERCICIO3              .
TABLES: ZTPMM_EJERCICIO3               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
