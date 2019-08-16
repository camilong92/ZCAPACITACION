*&---------------------------------------------------------------------*
*& Report  Z_EJERCICIO_NETW01
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrjpc_03.

*----------Estructura---------------
TYPES: BEGIN OF gtp_so,
         vbeln TYPE vbeln,
         fkart TYPE fkart,
         fktyp TYPE fktyp,
         vbtyp TYPE vbtyp,
         waerk TYPE waerk,
         vkorg TYPE vkorg,
         vtweg TYPE vtweg,
         netwr TYPE netwr,
         fkdat TYPE fkdat,
       END OF gtp_so,
*----------Estructura para los datos de ingreso-----
       BEGIN OF gtp_si,
         fkart TYPE fkart,
         fkdat TYPE fkdat,
       END OF gtp_si,

       BEGIN OF gtp_mo,
         mes      TYPE string,
         cantidad TYPE string,
       END OF gtp_mo.



*-----------Tabla para contar los dias del mes-----------


*------------------Tabla-------------------------------------
TYPES: gtp_ti_resultado TYPE STANDARD TABLE OF gtp_so.

*----------------Tipo estructura y tabla--------------------
DATA: ges_si        TYPE gtp_so,
      gti_resultado TYPE gtp_ti_resultado,
      alv_ti        TYPE REF TO cl_salv_table,
      wa            TYPE gtp_so.


SELECT-OPTIONS:
so_fkart FOR ges_si-fkart NO INTERVALS NO-EXTENSION,
so_fkdat FOR ges_si-fkdat.

SELECT vbeln
      fkart
      fktyp
      vbtyp
      waerk
      vkorg
      vtweg
      netwr
      fkdat
   FROM vbrk
   INTO TABLE gti_resultado
  WHERE fkart IN so_fkart OR fkdat IN so_fkdat
  ORDER BY fkdat ASCENDING.



LOOP at gti_resultado INTO wa.

IF  wa-fkdat+4(2) eq 01.
WRITE: / 'Enero', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 02.
WRITE: / 'Febrero', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 03.
WRITE: / 'Marzo', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 04.
WRITE: / 'Abril', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 05.
WRITE: / 'Mayo', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 06.
WRITE: / 'Junio', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 07.
WRITE: / 'Julio', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 08.
WRITE: / 'Agosto', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 09.
WRITE: / 'Septiembre', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 10.
WRITE: / 'Octubre', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 11.
WRITE: / 'Noviembre', wa-fkdat+4(2).
ELSEIF  wa-fkdat+4(2) eq 12.
WRITE: / 'Diciembre', wa-fkdat+4(2).
ENDIF.
endloop.
