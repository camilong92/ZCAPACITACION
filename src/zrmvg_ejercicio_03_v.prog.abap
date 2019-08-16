*&---------------------------------------------------------------------*
*&  Include           ZRMVG_EJERCICIO_03_V
*&---------------------------------------------------------------------*

TYPES: BEGIN OF gtp_so,               " Parametros de entrada
         vbeln TYPE  vbeln_va,        " Documento de ventas
         auart TYPE auart,            " Clase de pedido
         erdat TYPE  erdat,           " Fecha de creacion de registro
       END OF gtp_so,

       BEGIN OF gtp_kovn,             " Tabla que relaciona las tablas VBAK y KONV
         knumv TYPE knumv,            " Numero condicion del documento
         kbetr TYPE kbetr,            " Precio neto
         kschl TYPE kscha,            " Clase de condición
         waers TYPE waers,            " Clave moneda
       END OF gtp_kovn,

       BEGIN OF gtp_vbak,
         vbeln TYPE vbeln_va,         " Documento de ventas
         erdat TYPE erdat,            " Fechas de creacion
         auart TYPE auart,            " Clase de documento
         knumv TYPE knumv,            " Numero de la condicion del documento
         waers TYPE waers,            " Clave Moneda
       END OF gtp_vbak,

       BEGIN OF gtp_alv,
         vbeln TYPE vbeln_va,         " Documento de ventas
         erdat TYPE erdat,            " Fecha de creacion
         auart TYPE auart,            " Clase de documento
         knumv TYPE knumv,            " Numero de la condicion del documento
         kbetr TYPE kbetr,            " Precio neto
         waers TYPE waers,            " Clave Moneda
         kschl TYPE kscha,            " Clase de condición
       END OF gtp_alv,

       BEGIN OF gtp_pejercicio_03,
         programm TYPE programm,        " Nombre del Programa
         datum    TYPE datum,           " Fecha de ultima ejecucion de tipo
         uzeit    TYPE  uzeit,          " Hora de ultima ejecucion de tipo
         uname    TYPE uname,           " Usuario que ejecuto el programa de tipo
       END OF  gtp_pejercicio_03.

" Se definen los tipos de tablas internas
TYPES:
  gtp_ti_vbak     TYPE STANDARD TABLE OF gtp_vbak,
  gtp_ti_gtp_kovn TYPE STANDARD TABLE OF gtp_kovn,
  gtp_ti_alv      TYPE STANDARD TABLE OF gtp_alv.

" se definen las tablas internas
DATA:
  gti_aux_vbak TYPE gtp_ti_vbak,
  gti_vbak     TYPE gtp_ti_vbak,
  gti_kovn     TYPE gtp_ti_gtp_kovn,
  gti_alv      TYPE gtp_ti_alv.


" se definen las estructuras
DATA:
  ges_vbak          TYPE gtp_vbak,
  ges_kovn          TYPE gtp_kovn,
  ges_alv           TYPE gtp_alv,
  ges_so            TYPE gtp_so,
  ges_pejercicio_03 TYPE gtp_pejercicio_03.
