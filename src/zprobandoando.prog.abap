report ZPROBANDOANDO
       no standard page heading line-size 255.

include bdcrecx1.

start-of-selection.

perform open_group.

perform bdc_dynpro      using 'SAPMV45A' '0101'.
perform bdc_field       using 'BDC_CURSOR'
                              'VBAK-AUART'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'VBAK-AUART'
                              'or1'.
perform bdc_dynpro      using 'SAPMV45A' '4001'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'BDC_CURSOR'
                              'KUAGV-KUNNR'.
perform bdc_field       using 'KUAGV-KUNNR'
                              '900005'.
perform bdc_field       using 'RV45A-KETDAT'
                              '04.07.2019'.
perform bdc_field       using 'RV45A-KPRGBZ'
                              'D'.
perform bdc_field       using 'VBKD-PRSDT'
                              '04.07.2019'.
perform bdc_field       using 'VBAK-AUDAT'
                              '04.07.2019'.
perform bdc_dynpro      using 'SAPMV45A' '4001'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'KUAGV-KUNNR'
                              '900005'.
perform bdc_field       using 'KUWEV-KUNNR'
                              '900005'.
perform bdc_field       using 'RV45A-KETDAT'
                              '04.07.2019'.
perform bdc_field       using 'RV45A-KPRGBZ'
                              'D'.
perform bdc_field       using 'VBKD-PRSDT'
                              '04.07.2019'.
perform bdc_field       using 'VBAK-WAERK'
                              'COP'.
perform bdc_field       using 'VBKD-ZTERM'
                              '0001'.
perform bdc_field       using 'VBAK-VKBUR'
                              '0001'.
perform bdc_field       using 'VBAK-AUDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-KDGRP'
                              '01'.
perform bdc_field       using 'VBKD-BZIRK'
                              '000001'.
perform bdc_field       using 'VBAK-VSBED'
                              '01'.
perform bdc_field       using 'VBKD-FKDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-ABSSC'
                              '000002'.
perform bdc_field       using 'VBAK-TELF1'
                              '5785478'.
perform bdc_field       using 'BDC_CURSOR'
                              'RV45A-KWMENG(01)'.
perform bdc_field       using 'RV45A-MABNR(01)'
                              '22'.
perform bdc_field       using 'RV45A-KWMENG(01)'
                              '                  1'.
perform bdc_dynpro      using 'SAPMV45A' '4001'.
perform bdc_field       using 'BDC_OKCODE'
                              '=HEAD'.
perform bdc_field       using 'KUAGV-KUNNR'
                              '900005'.
perform bdc_field       using 'KUWEV-KUNNR'
                              '900005'.
perform bdc_field       using 'RV45A-KETDAT'
                              '04.07.2019'.
perform bdc_field       using 'RV45A-KPRGBZ'
                              'D'.
perform bdc_field       using 'VBKD-PRSDT'
                              '04.07.2019'.
perform bdc_field       using 'VBAK-WAERK'
                              'COP'.
perform bdc_field       using 'VBKD-ZTERM'
                              '0001'.
perform bdc_field       using 'VBAK-VKBUR'
                              '0001'.
perform bdc_field       using 'VBAK-AUDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-KDGRP'
                              '01'.
perform bdc_field       using 'VBKD-BZIRK'
                              '000001'.
perform bdc_field       using 'VBAK-VSBED'
                              '01'.
perform bdc_field       using 'VBKD-FKDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-ABSSC'
                              '000002'.
perform bdc_field       using 'VBAK-TELF1'
                              '5785478'.
perform bdc_field       using 'BDC_CURSOR'
                              'RV45A-MABNR(02)'.
perform bdc_dynpro      using 'SAPMV45A' '4002'.
perform bdc_field       using 'BDC_OKCODE'
                              '=T\03'.
perform bdc_field       using 'BDC_CURSOR'
                              'VBAK-AUDAT'.
perform bdc_field       using 'VBAK-AUDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBAK-VKBUR'
                              '0001'.
perform bdc_field       using 'VBAK-WAERK'
                              'COP'.
perform bdc_field       using 'VBKD-PRSDT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-KDGRP'
                              '01'.
perform bdc_field       using 'VBKD-BZIRK'
                              '000001'.
perform bdc_dynpro      using 'SAPMV45A' '4002'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'BDC_CURSOR'
                              'VBKD-INCO2'.
perform bdc_field       using 'VBKD-INCO1'
                              'cpt'.
perform bdc_field       using 'VBKD-INCO2'
                              'texto'.
perform bdc_field       using 'VBKD-ZTERM'
                              '0001'.
perform bdc_field       using 'VBKD-FKDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-ABSSC'
                              '000002'.
perform bdc_dynpro      using 'SAPMV45A' '4002'.
perform bdc_field       using 'BDC_OKCODE'
                              '=SICH'.
perform bdc_field       using 'BDC_CURSOR'
                              'VBKD-INCO1'.
perform bdc_field       using 'VBKD-INCO1'
                              'CPT'.
perform bdc_field       using 'VBKD-INCO2'
                              'texto'.
perform bdc_field       using 'VBKD-ZTERM'
                              '0001'.
perform bdc_field       using 'VBKD-FKDAT'
                              '04.07.2019'.
perform bdc_field       using 'VBKD-ABSSC'
                              '000002'.
perform bdc_transaction using 'VA01'.

perform close_group.
