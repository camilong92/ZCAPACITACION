*&---------------------------------------------------------------------*
*&  Include           ZFORM_JOC_V
*&---------------------------------------------------------------------*

TYPES:
     BEGIN OF ges_smart,
       material TYPE char10,
       cantidad TYPE char10,
       valorund TYPE char10,

       END OF ges_smart.

       DATA:
             gti_smart TYPE STANDARD TABLE OF ges_smart.
