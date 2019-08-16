

TYPES: BEGIN OF gtp_archivo,
  cont type char15,
  auart type auart,
  kunrg type kunrg,
  matnr type matnr,
  dzmeng type dzmeng,
  inco1 type inco1,
  inco2 type inco2,
  end of gtp_archivo.

  TYPES: gtp_ti_archivo type STANDARD TABLE OF gtp_archivo.

  DATA: gti_archivo type gtp_ti_archivo.
