*&---------------------------------------------------------------------*
*&  Include           ZRMV_01_F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START-OF-SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM start-of-selection .

 BREAK-POINT.
  SELECT  vbeln fkart fktyp vbtyp waerk netwr vkorg vtweg fkdat FROM vbrk INTO TABLE gti_resultado WHERE   fkart EQ so_fkart.
  BREAK-POINT.

ENDFORM.