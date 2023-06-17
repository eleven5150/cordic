# cordic
Домашнее задание по курсу "Системотехника ЭВС"

Студенты: Кольцов И.Р и Кутаев К.С. ИУ4-21М

Преподаватель: Орлов А.О.

# Описание

Проект `cordic` представляет собой упрощённую реализацию алгоритма CORDIC для конвейерного вычисления модуля двухмерного вектора.
Ядро `cordic` состоит из 16ти вращателей `rotator`, выполняющих вычисления последующих координаты вектора. Вращатели `rotator` используют модули `signed_shifter` для сдвига значения каждой из координат. По итогу 16 "вращений" на выходе появляется вектор исходной длины, удлинённый на значение `CORDIC_GAIN` являющимся trade-off'ом алгоритма, но постоянным по своему значению.
Результатом тестбенча является работа алгоритма для данных, указанных в файле 'input_data' и вывод расчитанных и полученных выходных значений с указанием погрешности.

# Модель на языке Python
Сравнение результатов работы фильтра на языке Verilog и Python

Verilog
```
# Starting simulation
# input x = -32768.000000 and y = 10516.000000; ref magnitude is 34414.068054, cordic magnitude = 34420.000000, error 0.017234 percents
# input x = 4918.000000 and y = -32278.000000; ref magnitude is 32650.513135, cordic magnitude = 32655.000000, error 0.013740 percents
# input x = -19279.000000 and y = 25492.000000; ref magnitude is 31961.256311, cordic magnitude = 31965.000000, error 0.011712 percents
# input x = -9698.000000 and y = -1709.000000; ref magnitude is 9847.430375, cordic magnitude = 9851.000000, error 0.036236 percents
# input x = -30133.000000 and y = -11194.000000; ref magnitude is 32145.035775, cordic magnitude = 32151.000000, error 0.018551 percents
# input x = -23565.000000 and y = 24054.000000; ref magnitude is 33673.493151, cordic magnitude = 33679.000000, error 0.016351 percents
# input x = -32070.000000 and y = 6411.000000; ref magnitude is 32704.522944, cordic magnitude = 32710.000000, error 0.016744 percents
# input x = -11971.000000 and y = -17300.000000; ref magnitude is 21037.938136, cordic magnitude = 21040.000000, error 0.009800 percents
# input x = -28724.000000 and y = 19150.000000; ref magnitude is 34522.321417, cordic magnitude = 34528.000000, error 0.016446 percents
# input x = 8100.000000 and y = -24631.000000; ref magnitude is 25928.674494, cordic magnitude = 25935.000000, error 0.024390 percents
# input x = 18780.000000 and y = 27835.000000; ref magnitude is 33577.903821, cordic magnitude = 33581.000000, error 0.009220 percents
# input x = -2955.000000 and y = -32697.000000; ref magnitude is 32830.257903, cordic magnitude = 32835.000000, error 0.014442 percents
# input x = -30563.000000 and y = 28016.000000; ref magnitude is 41460.743180, cordic magnitude = 43004.000000, error 3.588636 percents
# input x = 26794.000000 and y = 20201.000000; ref magnitude is 33555.906142, cordic magnitude = 33561.000000, error 0.015178 percents
# input x = 14776.000000 and y = 691.000000; ref magnitude is 14792.148492, cordic magnitude = 14796.000000, error 0.026031 percents
# input x = 25645.000000 and y = -21926.000000; ref magnitude is 33740.413468, cordic magnitude = 33745.000000, error 0.013592 percents
# input x = 20596.000000 and y = -14460.000000; ref magnitude is 25165.190562, cordic magnitude = 25169.000000, error 0.015135 percents
# input x = -31715.000000 and y = -6616.000000; ref magnitude is 32397.726479, cordic magnitude = 32404.000000, error 0.019360 percents
# input x = -20834.000000 and y = -8587.000000; ref magnitude is 22534.243386, cordic magnitude = 22537.000000, error 0.012232 percents
# input x = -32703.000000 and y = -30954.000000; ref magnitude is 45029.282972, cordic magnitude = 46610.000000, error 3.391369 percents
# input x = -32454.000000 and y = 26412.000000; ref magnitude is 41843.229560, cordic magnitude = 43131.000000, error 2.985719 percents
# input x = -27917.000000 and y = -326.000000; ref magnitude is 27918.903363, cordic magnitude = 27924.000000, error 0.018252 percents
# input x = -4419.000000 and y = -27859.000000; ref magnitude is 28207.294128, cordic magnitude = 28211.000000, error 0.013136 percents
# input x = 28969.000000 and y = -7529.000000; ref magnitude is 29931.401604, cordic magnitude = 29934.000000, error 0.008680 percents
# input x = -6366.000000 and y = -2792.000000; ref magnitude is 6951.346632, cordic magnitude = 6955.000000, error 0.052529 percents
# input x = -29457.000000 and y = -23824.000000; ref magnitude is 37885.324665, cordic magnitude = 37890.000000, error 0.012339 percents
# input x = 25149.000000 and y = -31780.000000; ref magnitude is 40527.035433, cordic magnitude = 41757.000000, error 2.945529 percents
# input x = 14401.000000 and y = 28101.000000; ref magnitude is 31576.177761, cordic magnitude = 31579.000000, error 0.008937 percents
# input x = -29656.000000 and y = 17435.000000; ref magnitude is 34401.418009, cordic magnitude = 34405.000000, error 0.010411 percents
# input x = 10444.000000 and y = -9033.000000; ref magnitude is 13808.411386, cordic magnitude = 13812.000000, error 0.025982 percents
# input x = -12757.000000 and y = -6393.000000; ref magnitude is 14269.250085, cordic magnitude = 14272.000000, error 0.019268 percents
# input x = 7696.000000 and y = -29133.000000; ref magnitude is 30132.376358, cordic magnitude = 30137.000000, error 0.015342 percents
# input x = 32756.000000 and y = -8847.000000; ref magnitude is 33929.705937, cordic magnitude = 33937.000000, error 0.021493 percents
# input x = 811.000000 and y = 21495.000000; ref magnitude is 21510.293954, cordic magnitude = 21516.000000, error 0.026520 percents
# input x = -9428.000000 and y = -4616.000000; ref magnitude is 10497.363479, cordic magnitude = 10499.000000, error 0.015587 percents
# input x = -3172.000000 and y = 21897.000000; ref magnitude is 22125.555202, cordic magnitude = 22127.000000, error 0.006530 percents
# input x = -24168.000000 and y = 1148.000000; ref magnitude is 24195.250112, cordic magnitude = 24199.000000, error 0.015496 percents
# input x = -25196.000000 and y = -17873.000000; ref magnitude is 30891.463950, cordic magnitude = 30897.000000, error 0.017918 percents
# input x = 14574.000000 and y = -28454.000000; ref magnitude is 31969.228830, cordic magnitude = 31976.000000, error 0.021176 percents
# input x = 32568.000000 and y = 30100.000000; ref magnitude is 44347.318115, cordic magnitude = 45896.000000, error 3.374329 percents
# input x = -32756.000000 and y = -29278.000000; ref magnitude is 43933.550050, cordic magnitude = 45426.000000, error 3.285453 percents
# input x = 2620.000000 and y = -12918.000000; ref magnitude is 13181.013770, cordic magnitude = 13185.000000, error 0.030233 percents
# input x = -6552.000000 and y = -14823.000000; ref magnitude is 16206.481204, cordic magnitude = 16209.000000, error 0.015539 percents
# input x = -17073.000000 and y = -13232.000000; ref magnitude is 21600.304465, cordic magnitude = 21602.000000, error 0.007849 percents
# input x = -12529.000000 and y = -27752.000000; ref magnitude is 30449.127163, cordic magnitude = 30455.000000, error 0.019284 percents
# input x = 16643.000000 and y = 21608.000000; ref magnitude is 27274.440654, cordic magnitude = 27279.000000, error 0.016714 percents
# input x = 11577.000000 and y = -19050.000000; ref magnitude is 22291.913982, cordic magnitude = 22294.000000, error 0.009357 percents
# input x = -24268.000000 and y = 19964.000000; ref magnitude is 31424.466901, cordic magnitude = 31429.000000, error 0.014423 percents
# input x = -969.000000 and y = -5648.000000; ref magnitude is 5730.520482, cordic magnitude = 5735.000000, error 0.078108 percents
# input x = -29013.000000 and y = -7814.000000; ref magnitude is 30046.842846, cordic magnitude = 30049.000000, error 0.007179 percents
# input x = -24551.000000 and y = -20927.000000; ref magnitude is 32259.741629, cordic magnitude = 32263.000000, error 0.010099 percents
# input x = -18638.000000 and y = 26478.000000; ref magnitude is 32379.924768, cordic magnitude = 32384.000000, error 0.012584 percents
# input x = -20733.000000 and y = 1555.000000; ref magnitude is 20791.231661, cordic magnitude = 20794.000000, error 0.013313 percents
# input x = 837.000000 and y = -9735.000000; ref magnitude is 9770.915720, cordic magnitude = 9772.000000, error 0.011096 percents
# input x = -23062.000000 and y = -101.000000; ref magnitude is 23062.221164, cordic magnitude = 23066.000000, error 0.016383 percents
# input x = 4311.000000 and y = -22943.000000; ref magnitude is 23344.506206, cordic magnitude = 23347.000000, error 0.010681 percents
# input x = -26238.000000 and y = -1326.000000; ref magnitude is 26271.484922, cordic magnitude = 26275.000000, error 0.013378 percents
# input x = -18177.000000 and y = -5359.000000; ref magnitude is 18950.520046, cordic magnitude = 18952.000000, error 0.007809 percents
# input x = 21760.000000 and y = 22510.000000; ref magnitude is 31308.109173, cordic magnitude = 31315.000000, error 0.022005 percents
# input x = -9864.000000 and y = 3109.000000; ref magnitude is 10342.358387, cordic magnitude = 10345.000000, error 0.025535 percents
# input x = -1646.000000 and y = 32481.000000; ref magnitude is 32522.679425, cordic magnitude = 32527.000000, error 0.013283 percents
# input x = -20664.000000 and y = 6361.000000; ref magnitude is 21620.897692, cordic magnitude = 21624.000000, error 0.014347 percents
# input x = 21374.000000 and y = -15867.000000; ref magnitude is 26619.721355, cordic magnitude = 26624.000000, error 0.016071 percents
# input x = 1665.000000 and y = -9608.000000; ref magnitude is 9751.199362, cordic magnitude = 9752.000000, error 0.008210 percents
# input x = -30695.000000 and y = 23007.000000; ref magnitude is 38360.201694, cordic magnitude = 38364.000000, error 0.009901 percents
# input x = -32187.000000 and y = 2079.000000; ref magnitude is 32254.072766, cordic magnitude = 32259.000000, error 0.015274 percents
# input x = 5477.000000 and y = 15373.000000; ref magnitude is 16319.517701, cordic magnitude = 16322.000000, error 0.015208 percents
# input x = -5472.000000 and y = 13084.000000; ref magnitude is 14182.166266, cordic magnitude = 14184.000000, error 0.012928 percents
# input x = -22497.000000 and y = -6512.000000; ref magnitude is 23420.528453, cordic magnitude = 23424.000000, error 0.014820 percents
# input x = -9095.000000 and y = -24571.000000; ref magnitude is 26200.249350, cordic magnitude = 26205.000000, error 0.018129 percents
# input x = -17737.000000 and y = -26635.000000; ref magnitude is 32000.381154, cordic magnitude = 32005.000000, error 0.014432 percents
# input x = 29031.000000 and y = -9067.000000; ref magnitude is 30413.968008, cordic magnitude = 30419.000000, error 0.016542 percents
# input x = -22585.000000 and y = -20641.000000; ref magnitude is 30596.292357, cordic magnitude = 30601.000000, error 0.015384 percents
# input x = 21501.000000 and y = 22504.000000; ref magnitude is 31124.315527, cordic magnitude = 31129.000000, error 0.015049 percents
# input x = -10595.000000 and y = 32679.000000; ref magnitude is 34353.617946, cordic magnitude = 34360.000000, error 0.018574 percents
# input x = -18215.000000 and y = 29316.000000; ref magnitude is 34513.969360, cordic magnitude = 34518.000000, error 0.011677 percents
# input x = -30106.000000 and y = 1609.000000; ref magnitude is 30148.965438, cordic magnitude = 30152.000000, error 0.010064 percents
# input x = 15537.000000 and y = -28849.000000; ref magnitude is 32766.799813, cordic magnitude = 32773.000000, error 0.018919 percents
# input x = 8832.000000 and y = 25765.000000; ref magnitude is 27236.729778, cordic magnitude = 27239.000000, error 0.008334 percents
# input x = -1694.000000 and y = -9426.000000; ref magnitude is 9577.009554, cordic magnitude = 9577.000000, error 0.000100 percents
# input x = 6081.000000 and y = -9680.000000; ref magnitude is 11431.577363, cordic magnitude = 11435.000000, error 0.029931 percents
# input x = 22503.000000 and y = -27158.000000; ref magnitude is 35269.561565, cordic magnitude = 35273.000000, error 0.009748 percents
# input x = -2903.000000 and y = 8880.000000; ref magnitude is 9342.473388, cordic magnitude = 9346.000000, error 0.037734 percents
# input x = -19001.000000 and y = -18947.000000; ref magnitude is 26833.315300, cordic magnitude = 26836.000000, error 0.010004 percents
# input x = -29248.000000 and y = -25508.000000; ref magnitude is 38808.550192, cordic magnitude = 38814.000000, error 0.014041 percents
# input x = -18732.000000 and y = -31509.000000; ref magnitude is 36656.580651, cordic magnitude = 36660.000000, error 0.009327 percents
# input x = 31420.000000 and y = 31031.000000; ref magnitude is 44160.382256, cordic magnitude = 45788.000000, error 3.554682 percents
# input x = -32068.000000 and y = 9239.000000; ref magnitude is 33372.379972, cordic magnitude = 33378.000000, error 0.016838 percents
# input x = -27153.000000 and y = 30029.000000; ref magnitude is 40484.889156, cordic magnitude = 40774.000000, error 0.709057 percents
# input x = -20485.000000 and y = 19829.000000; ref magnitude is 28510.076570, cordic magnitude = 28516.000000, error 0.020772 percents
# input x = -19127.000000 and y = -4302.000000; ref magnitude is 19604.829329, cordic magnitude = 19609.000000, error 0.021269 percents
# input x = -6015.000000 and y = -31107.000000; ref magnitude is 31683.208076, cordic magnitude = 31688.000000, error 0.015122 percents
# input x = 4383.000000 and y = 26928.000000; ref magnitude is 27282.372936, cordic magnitude = 27287.000000, error 0.016957 percents
# input x = 18164.000000 and y = 2623.000000; ref magnitude is 18352.411967, cordic magnitude = 18356.000000, error 0.019547 percents
# input x = -12709.000000 and y = -27000.000000; ref magnitude is 29841.559627, cordic magnitude = 29846.000000, error 0.014878 percents
# input x = 29331.000000 and y = -4634.000000; ref magnitude is 29694.806229, cordic magnitude = 29700.000000, error 0.017487 percents
# input x = -145.000000 and y = -11995.000000; ref magnitude is 11995.876375, cordic magnitude = 11998.000000, error 0.017700 percents
# input x = 19538.000000 and y = 4596.000000; ref magnitude is 20071.289445, cordic magnitude = 20073.000000, error 0.008522 percents
# input x = 12330.000000 and y = -5309.000000; ref magnitude is 13424.394996, cordic magnitude = 13427.000000, error 0.019401 percents
# input x = 16866.000000 and y = -32589.000000; ref magnitude is 36694.752718, cordic magnitude = 36697.000000, error 0.006124 percents
# input x = 19039.000000 and y = -8696.000000; ref magnitude is 20930.932540, cordic magnitude = 20934.000000, error 0.014653 percents
```

Python
```
Numbers: -32768 10516
Result: 34414
Numbers: 4918 -32278
Result: 32650
Numbers: -19279 25492
Result: 31961
Numbers: -9698 -1709
Result: 9847
Numbers: -30133 -11194
Result: 32145
Numbers: -23565 24054
Result: 33673
Numbers: -32070 6411
Result: 32704
Numbers: -11971 -17300
Result: 21037
Numbers: -28724 19150
Result: 34522
Numbers: 8100 -24631
Result: 25928
Numbers: 18780 27835
Result: 33577
Numbers: -2955 -32697
Result: 32830
Numbers: -30563 28016
Result: 41460
Numbers: 26794 20201
Result: 33555
Numbers: 14776 691
Result: 14792
Numbers: 25645 -21926
Result: 33740
Numbers: 20596 -14460
Result: 25165
Numbers: -31715 -6616
Result: 32397
Numbers: -20834 -8587
Result: 22534
Numbers: -32703 -30954
Result: 45029
Numbers: -32454 26412
Result: 41843
Numbers: -27917 -326
Result: 27918
Numbers: -4419 -27859
Result: 28207
Numbers: 28969 -7529
Result: 29931
Numbers: -6366 -2792
Result: 6951
Numbers: -29457 -23824
Result: 37885
Numbers: 25149 -31780
Result: 40527
Numbers: 14401 28101
Result: 31576
Numbers: -29656 17435
Result: 34401
Numbers: 10444 -9033
Result: 13808
Numbers: -12757 -6393
Result: 14269
Numbers: 7696 -29133
Result: 30132
Numbers: 32756 -8847
Result: 33929
Numbers: 811 21495
Result: 21510
Numbers: -9428 -4616
Result: 10497
Numbers: -3172 21897
Result: 22125
Numbers: -24168 1148
Result: 24195
Numbers: -25196 -17873
Result: 30891
Numbers: 14574 -28454
Result: 31969
Numbers: 32568 30100
Result: 44347
Numbers: -32756 -29278
Result: 43933
Numbers: 2620 -12918
Result: 13181
Numbers: -6552 -14823
Result: 16206
Numbers: -17073 -13232
Result: 21600
Numbers: -12529 -27752
Result: 30449
Numbers: 16643 21608
Result: 27274
Numbers: 11577 -19050
Result: 22291
Numbers: -24268 19964
Result: 31424
Numbers: -969 -5648
Result: 5730
Numbers: -29013 -7814
Result: 30046
Numbers: -24551 -20927
Result: 32259
Numbers: -18638 26478
Result: 32379
Numbers: -20733 1555
Result: 20791
Numbers: 837 -9735
Result: 9770
Numbers: -23062 -101
Result: 23062
Numbers: 4311 -22943
Result: 23344
Numbers: -26238 -1326
Result: 26271
Numbers: -18177 -5359
Result: 18950
Numbers: 21760 22510
Result: 31308
Numbers: -9864 3109
Result: 10342
Numbers: -1646 32481
Result: 32522
Numbers: -20664 6361
Result: 21620
Numbers: 21374 -15867
Result: 26619
Numbers: 1665 -9608
Result: 9751
Numbers: -30695 23007
Result: 38360
Numbers: -32187 2079
Result: 32254
Numbers: 5477 15373
Result: 16319
Numbers: -5472 13084
Result: 14182
Numbers: -22497 -6512
Result: 23420
Numbers: -9095 -24571
Result: 26200
Numbers: -17737 -26635
Result: 32000
Numbers: 29031 -9067
Result: 30413
Numbers: -22585 -20641
Result: 30596
Numbers: 21501 22504
Result: 31124
Numbers: -10595 32679
Result: 34353
Numbers: -18215 29316
Result: 34513
Numbers: -30106 1609
Result: 30148
Numbers: 15537 -28849
Result: 32766
Numbers: 8832 25765
Result: 27236
Numbers: -1694 -9426
Result: 9577
Numbers: 6081 -9680
Result: 11431
Numbers: 22503 -27158
Result: 35269
Numbers: -2903 8880
Result: 9342
Numbers: -19001 -18947
Result: 26833
Numbers: -29248 -25508
Result: 38808
Numbers: -18732 -31509
Result: 36656
Numbers: 31420 31031
Result: 44160
Numbers: -32068 9239
Result: 33372
Numbers: -27153 30029
Result: 40484
Numbers: -20485 19829
Result: 28510
Numbers: -19127 -4302
Result: 19604
Numbers: -6015 -31107
Result: 31683
Numbers: 4383 26928
Result: 27282
Numbers: 18164 2623
Result: 18352
Numbers: -12709 -27000
Result: 29841
Numbers: 29331 -4634
Result: 29694
Numbers: -145 -11995
Result: 11995
Numbers: 19538 4596
Result: 20071
Numbers: 12330 -5309
Result: 13424
Numbers: 16866 -32589
Result: 36694
Numbers: 19039 -8696
Result: 20930
Numbers: 20651 -16649
Result: 26526
Numbers: -1107 -31249
Result: 31268
Numbers: -30932 11141
Result: 32877
Numbers: -29192 -23758
Result: 37637
Numbers: 10336 26455
Result: 28402
Numbers: 22715 8585
Result: 24283
Numbers: -28766 18794
Result: 34361
```
