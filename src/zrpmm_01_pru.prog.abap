*&---------------------------------------------------------------------*
*& Report  ZRPMM_01_PRU
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrpmm_01_pru.

*START-OF-SELECTION.
*
*  TYPES: BEGIN OF gtp_ztpmm,
*           programm TYPE programm,
*           datum    TYPE datum,
*           uzeit    TYPE  uzeit,
*           uname    TYPE uname,
*           cvep     TYPE integer,
*         END OF gtp_ztpmm,
*         BEGIN OF gtp_cantidad,
*           cant TYPE integer,
*           END OF gtp_cantidad.
*
*  TYPES:
*  gtp_ti_ztpmm TYPE STANDARD TABLE OF gtp_ztpmm,
*   gtp_ti_cantidad TYPE STANDARD TABLE OF gtp_cantidad.
*
*
*  DATA: gti_ztpmm TYPE gtp_ti_ztpmm,
*        gwa_ztpmm type ztpmm_ejercicio3,
*        lo_salv type REF TO cl_salv_table,
*        gti_cantidad type gtp_ti_cantidad,
*        gwa_cantidad type  gtp_cantidad.
*
*
*
*
*select cvep
*  from ztpmm_ejercicio3
*  into TABLE gti_cantidad
*WHERE uname = sy-uname and programm = sy-repid.
*
*READ TABLE gti_cantidad into gwa_cantidad INDEX 1.
*
*
*gwa_ztpmm-programm = sy-repid.
*gwa_ztpmm-datum = sy-datum.
*gwa_ztpmm-uzeit = sy-uzeit.
*gwa_ztpmm-uname = sy-uname.
*gwa_ztpmm-cvep = gwa_cantidad-cant + 1.
*
*
*MODIFY  ztpmm_ejercicio3 from  gwa_ztpmm.
*
*IF sy-subrc = '0'.
*
*COMMIT WORK.
*
*ELSE.
*
*ROLLBACK WORK.
*
*ENDIF.
*
*
*
*
*  SELECT programm datum uzeit uname cvep
*    FROM ztpmm_ejercicio3
*    INTO TABLE gti_ztpmm
*    WHERE uname = sy-uname.
*
*
*  CALL METHOD cl_salv_table=>factory
*    IMPORTING
*      r_salv_table   = lo_salv
*    CHANGING
*      t_table        = gti_ztpmm.
*
*  lo_salv->display( ).

DATA: gs_notif_type TYPE bapi2080-notif_type,

gs_notifheader TYPE bapi2080_nothdri,

gs_notifheader_export TYPE bapi2080_nothdre,

gt_notitem TYPE TABLE OF bapi2080_notitemi WITH HEADER LINE,

gt_notifcaus TYPE TABLE OF bapi2080_notcausi WITH HEADER LINE,

gt_longtexts TYPE TABLE OF bapi2080_notfulltxti WITH HEADER LINE,

gt_return TYPE TABLE OF bapiret2 WITH HEADER LINE,

g_ind TYPE c.

START-OF-SELECTION.

"tipo de notificacion

gs_notif_type = 'M2'.

"cabecera de notificacion - QMEL

gs_notifheader-refobjecttype = ''.

gs_notifheader-short_text = 'FALLA DE MOTOR PRINCIPAL'.

gs_notifheader-funct_loc = 'JRL-1000-LNP-N132-LVV'.

gs_notifheader-equipment = '10000168'.

gs_notifheader-assembly = '110011'.

gs_notifheader-reportedby = 'RROJASC'.

gs_notifheader-breakdown = 'X'.

gs_notifheader-strmlfndate = '20070327'.

gs_notifheader-strmlfntime = '100200'.

gs_notifheader-endmlfndate = '20070327'.

gs_notifheader-endmlfntime = '100300'.

gs_notifheader-code_group = ''.

gs_notifheader-coding = ''.

"posicion de notificacion - QMFE

gt_notitem-item_key = '0001'.

gt_notitem-item_sort_no = '0001'.

gt_notitem-dl_codegrp = 'P.LAVBOT'. " parte objeto

gt_notitem-dl_code = '0010'.

gt_notitem-d_codegrp = 'S.LAVBOT'. " sint. averia

gt_notitem-d_code = '0010'.

gt_notitem-descript = 'SINTOMA DE AVERIA'.

APPEND gt_notitem.

"posicion de causa - QMUR

gt_notifcaus-cause_key = '0001'.

gt_notifcaus-cause_sort_no = '0001'.

gt_notifcaus-item_key = '0001'.

gt_notifcaus-cause_codegrp = 'C.LAVBOT'.

gt_notifcaus-cause_code = '0010'.

gt_notifcaus-causetext = 'CAUSAS PRUEBA'.

gt_notifcaus-item_sort_no = '0001'.

APPEND gt_notifcaus.

"texto de cabecera

gt_longtexts-objtype = 'QMEL'.

gt_longtexts-objkey = '0001'.

gt_longtexts-format_col = '*'.

gt_longtexts-text_line = 'Linea 1 Prueba de Texto'.

APPEND gt_longtexts.

"texto de notificacion

gt_longtexts-objtype = 'QMFE'.

gt_longtexts-objkey = '0001'.

gt_longtexts-format_col = '*'.

gt_longtexts-text_line = 'Linea 1A Prueba de Texto'.

APPEND gt_longtexts.

"texto de causa

gt_longtexts-objtype = 'QMUR'.

gt_longtexts-objkey = '00010001'.

gt_longtexts-format_col = '*'.

gt_longtexts-text_line = 'Linea 1B Prueba de Texto'.

APPEND gt_longtexts.

CALL FUNCTION 'BAPI_ALM_NOTIF_CREATE'

EXPORTING

notif_type = gs_notif_type

notifheader = gs_notifheader

task_determination = 'X'

IMPORTING

notifheader_export = gs_notifheader_export

TABLES

notitem = gt_notitem

notifcaus = gt_notifcaus

longtexts = gt_longtexts

return = gt_return.

LOOP AT gt_return WHERE type EQ 'E'.

WRITE: gt_return-message.

g_ind = 'X'.

ENDLOOP.

CHECK g_ind IS INITIAL.

CLEAR: gt_return.

REFRESH: gt_return.

CALL FUNCTION 'BAPI_ALM_NOTIF_SAVE'

EXPORTING

number = gs_notifheader_export-notif_no

TABLES

return = gt_return.

LOOP AT gt_return.

WRITE: 'Aviso No.', sy-msgv1.

ENDLOOP.

CLEAR: gt_return.

REFRESH: gt_return.

CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'

IMPORTING

return = gt_return.

LOOP AT gt_return.

WRITE: gt_return-message.

ENDLOOP.
