REPORT zr_joc_bach_imput.



include zr_joc_bach_imput_p.
include zr_joc_bach_imput_f.

START-OF-SELECTION.
PERFORM star-of-selection.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR pa_path.
PERFORM at_selection_screen_pa_path.

*       NO STANDARD PAGE HEADING LINE-SIZE 255.
