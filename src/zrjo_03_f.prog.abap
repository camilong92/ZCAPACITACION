*&---------------------------------------------------------------------*
*&  Include           ZRJO_03_F
*&---------------------------------------------------------------------*
SELECT vbeln  fkart fktyp vbtyp waerk netwr vkorg vtweg fkdat    "select a los campos de la tabla
                                                                 "vbrk
       FROM vbrk INTO TABLE ti_vbrk
       WHERE fkart IN fact AND fkdat IN fecha.
IF sy-subrc NE 0.
  WRITE 'no hay datos en este intervalo de fechas'.



ELSE.
LOOP AT ti_vbrk INTO wa_vbrk.   "se recorre la wa y se muestran los campos seleccionados}



     CASE wa_vbrk-fkdat+4(2).
       	WHEN '01'.
          le_cont1 = le_cont1 + 1.
       	WHEN '02'.
          le_cont2 = le_cont2 + 1.
        WHEN '03'.
          le_cont3 = le_cont3 + 1.
        WHEN '04'.
          le_cont4 = le_cont4 + 1.
       	WHEN '05'.
          le_cont5 = le_cont5 + 1.
        WHEN '06'.
          le_cont6 = le_cont6 + 1.
        WHEN '07'.
          le_cont7 = le_cont7 + 1.
       	WHEN '08'.
          le_cont8 = le_cont8 + 1.
        WHEN '09'.
          le_cont9 = le_cont9 + 1.
        WHEN '10'.
          le_cont10 = le_cont10 + 1.
       	WHEN '11'.
          le_cont11 = le_cont11 + 1.
        WHEN '12'.
          le_cont12 = le_cont12 + 1.

       	WHEN OTHERS.
       ENDCASE.



ENDLOOP.


       wa_mes-mes = 'ENERO'.
       wa_mes-cant = le_cont1.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'FEBRERO'.
       wa_mes-cant = le_cont2.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'MARZO'.
       wa_mes-cant = le_cont3.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'ABRIL'.
       wa_mes-cant = le_cont4.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'MAYO'.
       wa_mes-cant = le_cont4.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'JUNIO'.
       wa_mes-cant = le_cont6.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'JULIO'.
       wa_mes-cant = le_cont7.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'AGOSTO'.
       wa_mes-cant = le_cont8.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'SEPTIEMBRE'.
       wa_mes-cant = le_cont9.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'OCTUBRE'.
       wa_mes-cant = le_cont10.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'NOVIEMBRE'.
       wa_mes-cant = le_cont11.
        APPEND wa_mes to ti_mes.
        clear wa_mes.
       wa_mes-mes = 'DICIEMBRE'.
       wa_mes-cant = le_cont12.
        APPEND wa_mes to ti_mes.
        clear wa_mes.


   LOOP AT ti_mes INTO wa_mes.

     WRITE: /  wa_mes-mes, wa_mes-cant.

   ENDLOOP.

ENDIF.
