*&---------------------------------------------------------------------*
*&  Include           ZRPMM_01V
*&---------------------------------------------------------------------*
*tipo estructura
TYPES: BEGIN OF tgp_so,
         fkdat TYPE fkdat,
         fkart TYPE fkart,
       END OF tgp_so,

       BEGIN OF gtp_resultados,
         vbeln TYPE vbeln_vf,
         fkart TYPE fkart,
         fktyp TYPE fktyp,
         vbtyp TYPE vbtyp,
         netwr TYPE netwr,
         waerk TYPE waerk,
         vkorg TYPE vkorg,
         vtweg TYPE vtweg,
         fkdat TYPE fkdat,
       END OF gtp_resultados,

       BEGIN OF gtp_consulta,
         mes      TYPE dstring,
         cantidad TYPE i,
       END OF gtp_consulta,

       BEGIN OF gtp_contmeses,
         enero      TYPE i,
         febrero    TYPE i,
         marzo      TYPE i,
         abril      TYPE i,
         mayo       TYPE i,
         junio      TYPE i,
         julio      TYPE i,
         agosto     TYPE i,
         septiembre TYPE i,
         octubre    TYPE i,
         noviembre  TYPE i,
         diciembre  TYPE i,
       END OF gtp_contmeses.


*se crea un tipo de tabla standard del tipo de estructura 'gtp_resultados' y 'gtp_consulta'
TYPES: gtp_ti_resultados TYPE STANDARD TABLE OF gtp_resultados,
       gtp_ti_consulta   TYPE STANDARD TABLE OF gtp_consulta.

*SE CREAN LAS TABLAS INTERNAS DEL TIPO DE DATO: TIPO DE TABLA STANDARD GTP_TI_RESULTADOS
DATA:ges_so        TYPE tgp_so,
     gti_resultado TYPE gtp_ti_resultados,
     gti_consulta  TYPE gtp_ti_consulta,
     alv_ti        TYPE REF TO cl_salv_table,
     gwa_resultado TYPE gtp_resultados,
     gwa_contmeses TYPE gtp_contmeses.

DATA:
  ges_resultado TYPE  gtp_resultados,
  ges_consulta  TYPE gtp_consulta,
   ZTTPMM_05 type ref to  ZTPMM_EJERCICIO3.

FIELD-SYMBOLS:
  <gfs_consulta> TYPE gtp_consulta.
*** INCLUDE ZRPMM01_01V
*** INCLUDE ZRPMM01_01V
