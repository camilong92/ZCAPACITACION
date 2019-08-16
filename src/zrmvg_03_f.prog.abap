*&---------------------------------------------------------------------*
*&  Include           ZRMVG_03_F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start_of_selection .

" Hago un select para obtener los datos de la tabla vbrk
  SELECT vbeln  fkdat fkart kunrg kunag netwr waerk ernam
  FROM vbrk
  INTO TABLE gti_vbrk
 WHERE fkart IN so_fkart
  AND  fkdat IN so_fkdat
  AND  ernam IN so_ernam.

  if sy-subrc eq 0.

" Para hacer el for all entries in debo primero asegurarme que los datos no esten duplicados

gti_vbrk_aux = gti_vbrk.
    SORT gti_vbrk_aux BY vbeln.
    DELETE ADJACENT DUPLICATES FROM gti_vbrk_aux COMPARING vbeln.

"Hago un select a la tabla VBELN, selecciono los datos tres datos de la tabla vbrp, de la tabla interna vbrp, utilizo el for all entries in y comparo
"que los datos el vbeln que sea igual a la tabla de la vbrk

     SELECT vbeln  posnr matnr
      FROM vbrp
      INTO TABLE gti_vbrp
      FOR ALL ENTRIES IN gti_vbrk_aux
     WHERE vbeln = gti_vbrk_aux-vbeln.


"Realizo lo mismo que en el select anterior, me aseguro primero que no tenga datos duplicados

    IF sy-subrc EQ 0.

         " la tabla interna auxiliar de la vbrk debe traerme lo mismo que la tabla interna vbrk, luego ordeno la tabla auxiliar por el campo Kunrg
      gti_vbrk_aux = gti_vbrk.
      SORT gti_vbrk_aux BY kunrg.
      DELETE ADJACENT DUPLICATES FROM gti_vbrk_aux COMPARING kunrg kunag.

" Hago un sleect a la tabla KNA1 los campos que tiene, esten en la tabla interna de la kna1, luego comparo qeu los datos de la tabla interna auxiliar
" de la vbrk debe estar en la tabla interna auxiliar kunrg

      SELECT kunnr name1 name2
         FROM kna1
         INTO TABLE gti_kna1
         FOR ALL ENTRIES IN gti_vbrk_aux
       WHERE kunnr = gti_vbrk_aux-kunrg
         AND kunnr = gti_vbrk_aux-kunag.
    ENDIF.
  endif.

"Con el loop recorro la tabla interna y almaceno los datos en las estructuras que cree en el fuction de variables

LOOP AT gti_vbrp INTO ges_vbrp.
      ges_alv-vbeln = ges_vbrp-vbeln.
      ges_alv-posnr = ges_vbrp-posnr.
      ges_alv-matnr = ges_vbrp-vbrp_matnr.

  " Con el Read table para recorrer linea por linea de la tabla interna vbrk dentro de la estructura vbrk
      "que pide que la llave vbeln este en ges_vbrp-vbeln

      READ TABLE gti_vbrk INTO ges_vbrk WITH KEY vbeln = ges_vbrp-vbeln.

      IF sy-subrc EQ 0.
 " Coloco los campos de la estructura de la ALV en los campos de la vbrk, los comparo con la los datos o campos que estan en la estructura de la vbrk

        ges_alv-fkart = ges_vbrk-fkart.
        ges_alv-fkdat = ges_vbrk-fkdat.
        ges_alv-ernam = ges_vbrk-ernam.
        ges_alv-kunrg = ges_vbrk-kunrg.
        ges_alv-kunag = ges_vbrk-kunag.
        ges_alv-netwr = ges_vbrk-netwr.
        ges_alv-waerk = ges_vbrk-waerk.
        ges_alv-dias   = sy-datum - ges_vbrk-fkdat.
      endif.

      if ges_kna1-kunnr is not INITIAL.

     "Voy a organizar los datos de la tabla interna kna1 y guardare lso resultados dentro de la estructura de la kna1 que tiene como clave kunnr

        READ TABLE  gti_kna1 into ges_kna1 with key kunnr.
        endif.
         IF sy-subrc EQ 0.
          ges_alv-kunnr = ges_kna1-kunnr.
          ges_alv-kna1_name1 = ges_kna1-kna1_name1.
          ges_alv-kna1_name2 = ges_kna1-kna1_name2.
        ENDIF.
      ENDIF.
   endloop.
    ENDLOOP.




ENDFORM.
