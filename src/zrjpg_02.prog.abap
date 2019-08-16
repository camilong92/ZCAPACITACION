*&---------------------------------------------------------------------*
*& Report  ZRJPG_02
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrjpg_02.

INCLUDE: zrjpg_02_v,
         zrjpg_02_p,
         zrjpg_02_f.

*&---------------------------------------------------------------------*
* Esta subrutina Extrae los datos de las tablas VBRK, VBRP; KNA1.
* Se Almacenan los Datos dentro de la tabla interna GTI_ALV.
*&---------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM selection.

*get_data
*set_data
*

*&---------------------------------------------------------------------*
* Esta subrutina, ejecuta un ALV que muestra en pantalla los datos de
* La tabla interna GTI_ALV.
*&---------------------------------------------------------------------*
END-OF-SELECTION.
  PERFORM alv CHANGING gti_alv.
