FUNCTION-POOL ZFGJOC_EJERCICIO03.           "MESSAGE-ID ..

* INCLUDE LZFGJOC_EJERCICIO03D...            " Local class definition
TYPES:
  BEGIN OF gty_VBAK,
    vbeln TYPE VBAK-vbeln,
    erdat TYPE VBAK-erdat,
    auart TYPE VBAK-auart,
    vkorg TYPE VBAK-vkorg,
    vtweg TYPE VBAK-vtweg,
  END OF gty_VBAK.

 TYPES:
  gtt_vbak TYPE STANDARD TABLE OF gty_vbak.
