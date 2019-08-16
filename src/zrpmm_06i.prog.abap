*&---------------------------------------------------------------------*
*&  Include           ZRPMM_06I
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      "RETORNAL AL LUGAR DONDE LA LLAMARON
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE TO SCREEN 0.
    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'CALLTC'.
      PERFORM UC_0110_CALLTC.
    WHEN 'CALLTS'.
      PERFORM UC_0120_CALLTS.
    WHEN 'CALLPOPUP'.
         PERFORM UC_0130_CALLPOPUP.
    WHEN 'CONSULTAR'.
      PERFORM uc_0100_consultar.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0110  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0110 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      "RETORNAL AL LUGAR DONDE LA LLAMARON
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE TO SCREEN 0.
    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.
      WHEN 'BTN_ADICIONARF'.
        PERFORM UC_0110_BTN_ADICIONARF.


    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0120  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0120 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      "RETORNAL AL LUGAR DONDE LA LLAMARON
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE TO SCREEN 0.
    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'TAB_CABECERA'.
       TS_INFORMACION-ACTIVETAB = 'TAB_CABECERA'.
     WHEN 'TAB_CLIENTE'.
        TS_INFORMACION-ACTIVETAB = 'TAB_CLIENTE'.
     WHEN 'CALLPOPUP'.
      PERFORM UC_0130_CALLPOPUP.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.


*&---------------------------------------------------------------------*
*&      Module  ACTUALIZAR_GTI_SCREEN_0110  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE actualizar_gti_screen_0110 INPUT.

modify gti_screen_0110 from gwa_screen_0110 index tc_detalle-current_line.

if sy-subrc <> 0.

  append gwa_screen_0110 to gti_screen_0110.

  ENDIF.



ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0130  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0130 INPUT.
  CASE SY-UCOMM.
    WHEN 'NETX'.
     LEAVE TO SCREEN 0.
    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.


ENDMODULE.
