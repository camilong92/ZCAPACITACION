*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 02.07.2019 at 08:41:51
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTJPG_EJERCICIO3................................*
DATA:  BEGIN OF STATUS_ZTJPG_EJERCICIO3              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTJPG_EJERCICIO3              .
CONTROLS: TCTRL_ZTJPG_EJERCICIO3
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTJPG_EJERCICIO3              .
TABLES: ZTJPG_EJERCICIO3               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
