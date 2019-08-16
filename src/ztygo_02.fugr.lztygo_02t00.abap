*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 10.06.2019 at 15:55:52
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTYGO_02........................................*
DATA:  BEGIN OF STATUS_ZTYGO_02                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTYGO_02                      .
CONTROLS: TCTRL_ZTYGO_02
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTYGO_02                      .
TABLES: ZTYGO_02                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
