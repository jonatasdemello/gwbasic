10 KEY OFF:CLS
20 SCREEN 0
30 WIDTH 40
40 PRINT"같같같같같같같같같같같같같같같같같같같�"
50 PRINT"겠컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커�"
60 PRINT"개                                   낡"
70 PRINT"개            4029-A.BAS             낡"
80 PRINT"개             WORLD MAP             낡"
90 PRINT"개                                   낡"
100 PRINT"개                                   낡"
110 PRINT"개 BROUGHT TO YOU BY THE MEMBERS OF  낡"
120 PRINT"개      複複� 複複� 複複� 複複�      낡"
130 PRINT"개        �   �   � �     �   �      낡"
140 PRINT"개        �   白複� �     �   �      낡"
150 PRINT"개        �   �     �     �   �      낡"
160 PRINT"개      複白� �     白複� 白複�      낡"
170 PRINT"개                                   낡"
180 PRINT"개      International PC Owners      낡"
190 PRINT"개                                   낡"
200 PRINT"개P.O. Box 10426, Pittsburgh PA 15234낡"
210 PRINT"개                                   낡"
220 PRINT"걋컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸�"
230 PRINT"같같같같같같같같같같같같같같같같같같같�"
240 PRINT
250 PRINT "       PRESS ANY KEY TO CONTINUE
260 A$=INKEY$: IF A$="" THEN 260
270 WIDTH 80
280 CLS
1000 '**************************************************************************
1010 '*                                                                        *
1020 '*                          MAP OF THE WORLD                              *
1030 '*                                                                        *
1040 '*  Published in the Premier Edition of DIALOGUE Magazine (March, 1983)   *
1050 '*                                                                        *
1060 '*                  REQUIRES COLOR-GRAPHICS BOARD!!                       *
1070 '*                                                                        *
1080 '*  Uploaded to PCanada by Mark Magner (PC296) April 10, 1983             *
1090 '*                                                                       *
1100 '*************************************************************************
1110 '
1120 SCREEN 0,0 : CLS : KEY OFF : COLOR 9,0 : WIDTH 80
1130 PRINT TAB(20) "MAP OF THE WORLD" : PRINT
1140 PRINT "Choose one of the following:"
1150 PRINT "      Half-scale map of the world - video display only....(1)"
1160 PRINT "      Full-scale map of the world - video display only....(2)"
1170 PRINT "      Same as (1) above except for colouring..............(3)"
1180 PRINT "      Same as (2) above except for colouring..............(4)"
1190 PRINT "      Half-scale printed map - outline only...............(5)"
1200 PRINT "      Full-scale printed map - outline only...............(6)"
1210 PRINT "      Half-scale printed map with shading.................(7)"
1220 PRINT "      Full-scale printed map with shading.................(8)"
1230 COLOR 15,0 : PRINT : LOCATE ,20 : INPUT "YOUR CHOICE?  (1 - 8) ",CHC
1240 IF CHC<1 OR CHC>8 THEN BEEP : PRINT "Illegal choice........Try again!" : FOR J=1 TO 3000 : NEXT J : GOTO 1120
1250 PRINT : IF CHC>4 THEN PRINT "Is printer ready and has VIDEOGRAPH been installed?  (Y/N)"; : INPUT Z$ : IF Z$="n" OR Z$="N" THEN 1120 '                        **** VIDEOGRAPH is a graphics screen dump program for the PC
1260 SCREEN 1,0 : CLS
1270 READ N
1280 IF N < 0 THEN 2440
1290 READ X1,Y1,X,Y
1300 IF CHC = 1 OR CHC = 3 OR CHC = 5 OR CHC = 7 THEN LINE (X1+50, Y1+20) - (X+50,Y+20),3
1310 IF CHC = 2 OR CHC = 4 OR CHC = 6 OR CHC = 8 THEN LINE (X1*2, Y1*2) - (X*2, Y*2),3
1320     FOR J=3 TO N
1330     READ X,Y
1340     IF CHC = 1 OR CHC = 3 OR CHC = 5 OR CHC = 7 THEN LINE -(X+50, Y+20),3 : GOTO 1360
1350     LINE -(X*2, Y*2),3
1360     NEXT J
1370 GOTO 1270
1380 DATA 168,2,16,3,16,3,15,4,14,6,14,6,12,8,12,9,10,10,10,12,9,15,9,17,10
1390 DATA 19,11,25,11,27,12,27,13,30,13,30,12,28,12,28,10,26,10,26,9,28,8,30,8
1400 DATA 30,9,32,10,32,9,33,9,33,12,31,12,32,13,35,13,35,11,37,9,39,9,36,12
1410 DATA 39,12,39,10,40,9,43,9,46,12,46,14,43,17,40,15,40,14,42,14,43,13,42,12
1420 DATA 40,12,40,13,38,14,38,16,34,16,30,19,30,20,33,22,34,22,34,25,37,21
1430 DATA 36,19,39,17,40,17,41,18,41,19,43,18,44,22,46,23,46,24,45,24,45,25
1440 DATA 45,26,46,26,46,28,43,27,43,26,45,25,42,25,39,25,40,27,40,30,37,30
1450 DATA 32,35,32,37,28,39,29,43,28,44,27,43,26,40,24,40,24,41,21,41,18,44
1460 DATA 18,46,17,47,19,49,21,48,21,46,24,46,22,51,25,51,25,55,28,55,28,56
1470 DATA 29,56,32,53,35,55,36,54,42,58,44,58,45,60,45,62,47,62,48,64,51,64
1480 DATA 54,66,54,68,52,71,52,76,48,80,48,83,45,87,45,88,42,91,42,94,43,95
1490 DATA 43,99,45,100,42,100,43,99,41,100,38,96,35,88,35,83,34,76,30,74,30,73
1500 DATA 26,66,26,62,28,57,27,56,24,56,22,53,21,53,21,52,19,52,19,51,16,51
1510 DATA 12,49,13,47,10,40,11,46,10,46,8,42,8,38,7,37,7,32,11,27,12,27,12,26
1520 DATA 11,24,12,19,9,17,7,18,6,18,6,19,4,19,2,20,2,16
1530 DATA 5
1540 DATA 31,8,34,7,35,8,32,9,31,8
1550 DATA 4
1560 DATA 34,9,36,9,34,11,34,9
1570 DATA 5
1580 DATA 36,7,38,7,38,8,36,8,36,7
1590 DATA 40
1600 DATA 42,7,46,4,44,4,43,6,41,6,41,5,44,4,48,2,50,2,51,3,50,4,54,3,58,3,61,1
1610 DATA 64,1,65,3,67,3,67,4,65,8,64,8,62,10,63,10,63,11,59,12,58,14,57,14
1620 DATA 53,19,51,18,49,14,51,12,51,11,52,11,52,8,48,8,47,7,50,4,48,4,45,8
1630 DATA 44,7,42,7
1640 DATA 6
1650 DATA 62,13,66,13,67,14,64,16,62,14,62,13
1660 DATA 7
1670 DATA 25,46,26,45,28,45,31,47,29,48,29,47,25,46
1680 DATA 5
1690 DATA 32,47,34,48,32,49,31,48,32,47
1700 DATA 5
1710 DATA 78,5,80,5,81,6,79,7,78,5
1720 DATA 4
1730 DATA 81,4,82,4,82,5,81,4
1740 DATA 4
1750 DATA 81,6,82,6,82,7,81,6
1760 DATA 8
1770 DATA 94,10,94,8,97,6,98,6,98,7,95,9,95,10,94,10
1780 DATA 9
1790 DATA 96,70,98,69,98,68,99,67,100,70,98,76,96,77,95,75,96,70
1800 DATA 5
1810 DATA 140,20,143,23,143,25,142,25,140,20
1820 DATA 5
1830 DATA 143,26,145,26,146,27,144,29,143,26
1840 DATA 9
1850 DATA 145,29,147,30,147,33,143,36,142,35,144,34,142,34,145,32,145,29
1860 DATA 5
1870 DATA 139,40,140,40,140,43,139,42,139,40
1880 DATA 7
1890 DATA 140,46,141,45,142,48,143,50,142,50,139,48,140,46
1900 DATA 4
1910 DATA 140,51,140,52,139,53,140,51
1920 DATA 4
1930 DATA 142,50,143,52,142,52,142,50
1940 DATA 10
1950 DATA 144,52,145,53,144,56,143,55,143,54,142,54,142,53,142,52,143,52,144,52
1960 DATA 9
1970 DATA 138,54,140,54,140,60,138,62,135,62,134,60,134,57,136,57,138,54
1980 DATA 8
1990 DATA 141,58,144,58,144,59,142,59,143,64,141,64,140,62,141,58
2000 DATA 5
2010 DATA 145,58,146,58,146,59,145,59,145,58
2020 DATA 15
2030 DATA 147,59,149,59,150,60,152,60,156,62,158,64,160,64,158,66,160,68,157,68
2040 DATA 155,66,152,67,151,64,148,62,147,59
2050 DATA 4
2060 DATA 143,66,140,66,140,67,141,67
2070 DATA 2
2080 DATA 143,67,144,66
2090 DATA 13
2100 DATA 160,86,162,86,163,90,160,93,159,92,154,96,152,96,152,95,158,91
2110 DATA 159,92,159,90,161,89,160,86
2120 DATA 26
2130 DATA 133,85,134,83,134,76,136,74,138,74,143,70,145,70,148,68,150,68
2140 DATA 150,70,152,72,153,68,154,68,156,76,158,78,152,88,146,89,148,90
2150 DATA 148,91,146,92,146,89,144,84,139,84,139,85,134,85,133,84
2160 DATA 10
2170 DATA 126,55,127,55,133,61,132,65,136,66,137,65,136,64,131,64,126,57,126,55
2180 DATA 9
2190 DATA 68,20,70,19,71,20,71,22,72,23,72,24,68,25,69,22,68,20
2200 DATA 5
2210 DATA 68,22,68,24,66,24,67,22,68,22
2220 DATA 178
2230 DATA 65,36,60,44,60,52,66,57,74,57,74,60,77,64,77,68,76,70,76,73,81,83
2240 DATA 86,83,91,76,91,73,94,70,94,66,93,64,93,62,100,54,100,51,96,52
2250 DATA 92,47,90,40,94,46,96,50,100,49,102,48,105,44,103,42,108,42,110,45
2260 DATA 112,45,113,52,115,55,116,55,117,52,117,55,118,55,118,53,117,52
2270 DATA 118,48,122,44,127,51,127,53,130,58,132,58,132,57,128,52,128,50
2280 DATA 132,54,134,52,134,50,132,46,132,44,136,44,138,42,139,36,136,34
2290 DATA 136,32,134,32,134,30,137,30,139,34,140,34,141,33,139,30,139,28
2300 DATA 141,28,141,28,136,18,136,16,141,16,141,14,143,14,143,18,147,21
2310 DATA 148,20,145,15,148,12,147,10,150,10,149,8,146,8,144,7,138,7,138,8
2320 DATA 134,8,134,7,126,7,126,8,122,8,122,7,115,7,114,5,110,5,110,4,108,4
2330 DATA 106,2,104,4,105,4,105,3,106,3,106,5,108,5,108,7,106,7,102,9,104,12
2340 DATA 102,12,100,8,99,8,99,10,100,12,94,12,92,13,91,11,90,11,90,14,88,15
2350 DATA 88,14,89,13,84,10,82,10,74,17,74,20,76,19,79,21,80,20,80,17,82,14
2360 DATA 84,16,82,18,83,20,80,22,76,22,76,20,75,20,75,22,70,26,69,26,70,28
2370 DATA 70,29,66,29,65,33,67,34,71,33,71,31,76,29,79,33,79,34,80,34,80,31
2380 DATA 76,28,79,28,83,34,83,32,86,31,86,28,88,28,89,29,90,27,92,27,91,28
2390 DATA 93,30,88,30,85,33,86,34,90,34,90,38,86,38,83,36,80,38,76,36,76,34
2400 DATA 71,34,70,35,67,35,65,36
2410 DATA 5
2420  DATA 96,28,98,27,100,34,98,34,96,28
2430 DATA -34
2440 ON CHC GOTO 2590,2590,2480,2480,2450,2450,2480,2480
2450 ON CHC GOTO 2590,2590,2590,2590,2460,2460,2460,2460
2460 DEF SEG = 0 : SBR% = 260 : CALL SBR%(SBR%)
2470 GOTO 2590
2480 READ X,Y
2490 IF X < 0 OR Y < 0 THEN 2450
2500    IF CHC = 3 OR CHC = 7 THEN PAINT (X+50,Y+20),2,3 : GOTO 2520
2510    PAINT (X*2,Y*2),2,3
2520 GOTO 2480
2530 DATA 20,30
2540 DATA 110,30,98,72,56,10,150,80,154,64,138,58
2550 DATA 156,94,130,60,135,65,40,70,70,23,67,23
2560 DATA 64,14,47,4,28,46,79,5,145,27,146,32,142,23,141,47,144,54
2570 DATA 78,31,79,5,147,91,141,61,139,41,44,27,32,48,95,8
2580 DATA -23,-23,-23,-23
2590 Z$=INKEY$ : IF Z$="" THEN 2590
2600 SCREEN 0,0,0,0 : WIDTH 80 : CLS
2610 END
27,32,48,95,8
2580 DATA -23,-2