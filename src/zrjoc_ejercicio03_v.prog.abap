*&---------------------------------------------------------------------*
*&  Include           ZRJOC_05_V
*&---------------------------------------------------------------------*
TYPES:
  BEGIN OF gty_vbak,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    auart TYPE vbak-auart,
    vkorg TYPE vbak-vkorg,
    vtweg TYPE vbak-vtweg,
  END OF gty_vbak,



  BEGIN OF gty_alv,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    auart TYPE vbak-auart,
    vkorg type VBAK-VKORG,
    vtext TYPE tvkot-vtext,
    vtweg TYPE VBAK-VTWEG,
    canal TYPE tvtwt-vtext,
  END OF gty_alv.

  TYPES: gtt_tvtwt TYPE STANDARD TABLE OF tvtwt,
         gtt_alv TYPE STANDARD TABLE OF gty_alv.
