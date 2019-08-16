**&---------------------------------------------------------------------*
**& Report  ZRJPG_EJERCICI03
**&
**&---------------------------------------------------------------------*
**&
**&
**&---------------------------------------------------------------------*
REPORT zrjpg_ejercici03.
*
*TYPES: BEGIN OF gtp_resultado,
*         mandt TYPE mandt,
*         nprog TYPE programm,
*         fejec TYPE datum,
*         hejec TYPE uzeit,
*         uprog TYPE uname,
*         cantv TYPE int4,
*       END OF gtp_resultado,
*
*       BEGIN OF gtp_cantv,
*         cantv TYPE integer,
*       END OF gtp_cantv.
*
*TYPES: gtp_ti_resultado TYPE STANDARD TABLE OF gtp_resultado,
*       gtp_ti_cantv     TYPE STANDARD TABLE OF gtp_cantv.
*
*DATA:  gti_resultado        TYPE gtp_ti_resultado,
*       ges_resultado        TYPE gtp_resultado,
*       gti_ztjpg_ejercicio3 TYPE ztjpg_ejercicio3,
*       gti_cantv            TYPE gtp_ti_cantv,
*       ges_cantv            type gtp_cantv,
*       lo_salv              type ref to cl_salv_table.
*
*SELECT cantv
*  FROM ztjpg_ejercicio3
*  INTO TABLE gti_cantv
*  WHERE uprog = sy-uname AND nprog = sy-repid.
*
*
*READ TABLE gti_cantv INTO ges_cantv INDEX 1.
*
**ges_resultado-mandt = ''.
*ges_resultado-fejec = sy-datum.
*ges_resultado-hejec = sy-uzeit.
*ges_resultado-nprog = sy-repid.
*ges_resultado-uprog = sy-uname.
*ges_resultado-cantv = ges_cantv-cantv + 1.
*
*modify ztjpg_ejercicio3 FROM ges_resultado.
*
* SELECT mandt nprog fejec hejec uprog cantv
*
*    FROM ztjpg_ejercicio3
*    INTO TABLE gti_resultado
*    WHERE uprog = sy-uname.
*
*
*  CALL METHOD cl_salv_table=>factory
*    IMPORTING
*      r_salv_table   = lo_salv
*    CHANGING
*      t_table        = gti_resultado.
*
*  lo_salv->display( ).
*
*break netw01.
