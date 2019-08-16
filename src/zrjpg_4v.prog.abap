*&---------------------------------------------------------------------*
*&  Include           ZRJPG_4V
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gtp_so,
         erdat TYPE erdat,
         end OF gtp_so,

         BEGIN OF gtp_vbak,
          vbeln TYPE vbeln,
          erdat TYPE erdat,
          auart TYPE auart,
         END OF gtp_vbak.

TYPES: gtp_ti_vbak type STANDARD TABLE OF gtp_vbak,
       gtp_ti_so TYPE STANDARD TABLE OF gtp_so.

DATA: gti_vbak TYPE gtp_ti_vbak.

DATA: ges_so TYPE gtp_so,
      ges_vbak type gtp_vbak.
