*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 10.06.2019 at 11:48:42
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTJPG_02........................................*
DATA:  BEGIN OF STATUS_ZTJPG_02                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTJPG_02                      .
CONTROLS: TCTRL_ZTJPG_02
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTJPG_02                      .
TABLES: ZTJPG_02                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
