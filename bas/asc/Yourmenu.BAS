5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '***************************************************************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�                  BASIC DISK MENU PROGRAM (BLANK)                        �
20 '�                                                                         �
22 '�    This is the basic Blueberry.bas Menu program without any data state- �
24 '� ments or program names inserted. You may insert the program names at    �
26 '� the appropriate places in the the DATA and RUN routines. To keep all    �
28 '� the blank numbers from coming up, you may REM at the appropriate place  �
30 '� in lines 250 to 395.  If you do not mind the full 64 numbers coming up  �
32 '� on the MENU, you can make a single loop statement at line 250 and de-   �
34 '� lete lines 260 through 395. The multi-statement method provides some    �
35 '� flexibility when adding single programs.  For non-basic program MENU    �
36 '� entries, you can make an appropriate statement at lines 2700 and those  �
37 '� following. Direct the program to one of these lines with a RUN state-   �
38 '� ment at the appropriate line between 2000 and 2690. (See BLUEMENU.BAS.) �
39 '�     This program may be used, in whole or in part, without license or   �
40 '� attribution.                                                            �
42 '�               (c) G I N A C O -- 1983                      Ver 5.2/320  �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 CLS:SCREEN 0,0,0: WIDTH 80: COLOR 7,0: KEY OFF: CLEAR
120 DIM AA$(100),N(100)
200 KEY OFF: LOCATE 25,25: PRINT"PLEASE STAND BY -- READING DATA";:GOSUB 1000:LOCATE 25,1:PRINT SPC(77);
210 CLS:LOCATE 2,1:PRINT CHR$(201);STRING$(78,205);CHR$(187);
220 FOR I = 3 TO 23:LOCATE I,1:PRINT CHR$(186);:LOCATE I,80:PRINT CHR$(186);:NEXT
230 LOCATE 24,1:PRINT CHR$(200);STRING$(78,205);CHR$(188);
240 LOCATE 3,20:PRINT "Put  Y O U R M E N U  Name In This Space";
250 I=5:LOCATE I,4:PRINT AA$(1);CHR$(16);N(1):LOCATE I,23:PRINT AA$(2);CHR$(16);N(2):LOCATE I,42:PRINT AA$(3);CHR$(16);N(3):LOCATE I,61:PRINT AA$(4);CHR$(16);N(4)
260 I=6:LOCATE I,4:PRINT AA$(5);CHR$(16);N(5):LOCATE I,23:PRINT AA$(6);CHR$(16);N(6):LOCATE I,42:PRINT AA$(7);CHR$(16);N(7):LOCATE I,61:PRINT AA$(8);CHR$(16);N(8)
270 I=7:LOCATE I,4:PRINT AA$(9);CHR$(16);N(9):LOCATE I,23:PRINT AA$(10);CHR$(16);N(10):LOCATE I,42:PRINT AA$(11);CHR$(16);N(11):LOCATE I,61:PRINT AA$(12);CHR$(16);N(12)
280 I=8:LOCATE I,4:PRINT AA$(13);CHR$(16);N(13):LOCATE I,23:PRINT AA$(14);CHR$(16);N(14):LOCATE I,42:PRINT AA$(15);CHR$(16);N(15):LOCATE I,61:PRINT AA$(16);CHR$(16);N(16)
290 I=9:LOCATE I,4:PRINT AA$(17);CHR$(16);N(17):LOCATE I,23:PRINT AA$(18);CHR$(16);N(18):LOCATE I,42:PRINT AA$(19);CHR$(16);N(19):LOCATE I,61:PRINT AA$(20);CHR$(16);N(20)
300 I=10:LOCATE I,4:PRINT AA$(21);CHR$(16);N(21):LOCATE I,23:PRINT AA$(22);CHR$(16);N(22):LOCATE I,42:PRINT AA$(23);CHR$(16);N(23):LOCATE I,61:PRINT AA$(24);CHR$(16);N(24)
310 I=11:LOCATE I,4:PRINT AA$(25);CHR$(16);N(25):LOCATE I,23:PRINT AA$(16);CHR$(16);N(26):LOCATE I,42:PRINT AA$(27);CHR$(16);N(27):LOCATE I,61:PRINT AA$(28);CHR$(16);N(28)
320 I=12:LOCATE I,4:PRINT AA$(29);CHR$(16);N(29):LOCATE I,23:PRINT AA$(30);CHR$(16);N(30):LOCATE I,42:PRINT AA$(31);CHR$(16);N(31):LOCATE I,61:PRINT AA$(32);CHR$(16);N(32)
330 I=13:LOCATE I,4:PRINT AA$(33);CHR$(16);N(33):LOCATE I,23:PRINT AA$(34);CHR$(16);N(34):LOCATE I,42:PRINT AA$(35);CHR$(16);N(35):LOCATE I,61:PRINT AA$(36);CHR$(16);N(36)
340 I=14:LOCATE I,4:PRINT AA$(37);CHR$(16);N(37):LOCATE I,23:PRINT AA$(38);CHR$(16);N(38):LOCATE I,42:PRINT AA$(39);CHR$(16);N(39):LOCATE I,61:PRINT AA$(40);CHR$(16);N(40)
350 I=15:LOCATE I,4:PRINT AA$(41);CHR$(16);N(41):LOCATE I,23:PRINT AA$(42);CHR$(16);N(42):LOCATE I,42:PRINT AA$(43);CHR$(16);N(43):LOCATE I,61:PRINT AA$(44);CHR$(16);N(44)
360 I=16:LOCATE I,4:PRINT AA$(45);CHR$(16);N(45):LOCATE I,23:PRINT AA$(46);CHR$(16);N(46):LOCATE I,42:PRINT AA$(47);CHR$(16);N(47):LOCATE I,61:PRINT AA$(48);CHR$(16);N(48)
370 I=17:LOCATE I,4:PRINT AA$(49);CHR$(16);N(49):LOCATE I,23:PRINT AA$(50);CHR$(16);N(50):LOCATE I,42:PRINT AA$(51);CHR$(16);N(51):LOCATE I,61:PRINT AA$(52);CHR$(16);N(52)
380 I=18:LOCATE I,4:PRINT AA$(53);CHR$(16);N(53):LOCATE I,23:PRINT AA$(54);CHR$(16);N(54):LOCATE I,42:PRINT AA$(55);CHR$(16);N(55): LOCATE I,61:PRINT AA$(56);CHR$(16);N(56)
390 I=19:LOCATE I,4:PRINT AA$(57);CHR$(16);N(57):LOCATE I,23:PRINT AA$(58);CHR$(16);N(58):LOCATE I,42:PRINT AA$(59);CHR$(16);N(59):LOCATE I,61:PRINT AA$(60);CHR$(16);N(60);
395 I=20:LOCATE I,4:PRINT AA$(61);CHR$(16);N(61):LOCATE I,23:PRINT AA$(62);CHR$(16);N(62):LOCATE I,42:PRINT AA$(63);CHR$(16);N(63):LOCATE I,61:PRINT AA$(64);CHR$(16);N(64);
400 LOCATE 21,5:PRINT SPC(50);:LOCATE 22,5:PRINT SPC(50);:LOCATE 22,31:PRINT"SELECT A PROGRAM ";:LINE INPUT;PROGRAM$
410 N = VAL(PROGRAM$)
415 IF (N < 1 OR N > 64 ) THEN 400
420 IF N<45 THEN 430
425 IF N>46 THEN GOTO 440
430 ON N GOTO 2000,2010,2020,2030,2040,2050,2060,2070,2080,2090,2100,2110,2120,2130,2140,2150,2160,2170,2180,2190,2200,2210,2220,2230,2240,2250,2260,2270,2280,2290,2300,2310,2320,2330,2340,2350,2360,2370,2380,2390,2400,2410,2420,2430,2440
440 ON N-45 GOTO 2450,2460,2470,2480,2490,2500,2510,2520,2530,2540,2560,2570,2580,2590,2600,2610,2620,2630,2640
450 ON ERROR GOTO 15000
1000 REM *****************  DATA INPUT FOR MENU *****************************
1010 P = 64
1020 FOR J=1 TO P
1030 READ AA$(J),N(J)
1040 DATA "--------.---",1:     REM LN  2000
1050 DATA "--------.---",2:     REM     2010
1060 DATA "--------.---",3:     REM     2020
1070 DATA "--------.---",4:     REM     2030
1080 DATA "--------.---",5:     REM     2040
1090 DATA "--------.---",6:     REM LN  2050
1100 DATA "--------.---",7:     REM     2060
1110 DATA "--------.---",8:     REM     2070
1120 DATA "--------.---",9:     REM     2080
1130 DATA "--------.---",10:    REM     2090
1140 DATA "--------.---",11:    REM LN  2100
1150 DATA "--------.---",12:    REM     2110
1160 DATA "--------.---",13:    REM     2120
1170 DATA "--------.---",14:    REM     2130
1180 DATA "--------.---",15:    REM     2140
1190 DATA "--------.---",16:    REM LN  2150
1200 DATA "--------.---",17:    REM     2160
1210 DATA "--------.---",18:    REM     2170
1220 DATA "--------.---",19:    REM     2180
1230 DATA "--------.---",20:    REM     2190
1240 DATA "--------.---",21:    REM LN  2200
1250 DATA "--------.---",22:    REM     2210
1260 DATA "--------.---",23:    REM     2220
1270 DATA "--------.---",24:    REM     2230
1280 DATA "--------.---",25:    REM     2240
1290 DATA "--------.---",26:    REM LN  2250
1300 DATA "--------.---",27:    REM     2260
1310 DATA "--------.---",28:    REM     2270
1320 DATA "--------.---",29:    REM     2280
1330 DATA "--------.---",30:    REM     2290
1340 DATA "--------.---",31:    REM     2300
1350 DATA "--------.---",32:    REM     2310
1360 DATA "--------.---",33:    REM     2320
1370 DATA "--------.---",34:    REM     2330
1380 DATA "--------.---",35:    REM     2340
1390 DATA "--------.---",36:    REM LN  2350
1400 DATA "--------.---",37:    REM     2360
1410 DATA "--------.---",38:    REM     2370
1420 DATA "--------.---",39:    REM     2380
1430 DATA "--------.---",40:    REM     2390
1440 DATA "--------.---",41:    REM LN  2400
1450 DATA "--------.---",42:    REM     2410
1460 DATA "--------.---",43:    REM     2420
1470 DATA "--------.---",44:    REM     2430
1480 DATA "--------.---",45:    REM     2440
1490 DATA "--------.---",46:    REM LN  2450
1500 DATA "--------.---",47:    REM     2460
1510 DATA "--------.---",48:    REM     2470
1520 DATA "--------.---",49:    REM     2480
1530 DATA "--------.---",50:    REM     2490
1540 DATA "--------.---",51:    REM LN  2500
1550 DATA "--------.---",52:    REM     2510
1560 DATA "--------.---",53:    REM     2520
1570 DATA "--------.---",54:    REM     2530
1580 DATA "--------.---",55:    REM     2540
1590 DATA "--------.---",56:    REM LN  2550
1600 DATA "--------.---",57:    REM     2560
1610 DATA "--------.---",58:    REM     2570
1620 DATA "--------.---",59:    REM     2580
1630 DATA "--------.---",60:    REM     2590
1640 DATA "--------.---",61:    REM LN  2600
1650 DATA "--------.---",62:    REM     2610
1660 DATA "--------.---",63:    REM     2620
1670 DATA "--------.---",64:    REM     2630
1700 NEXT J
1710 RETURN
1900 '****************** PROGRAM SELECTION RUN STATEMENTS *********************
2000 RUN"--------.---"
2010 RUN"--------.---"
2020 RUN"--------.---"
2030 RUN"--------.---"
2040 RUN"--------.---"
2050 RUN"--------.---"
2060 RUN"--------.---"
2070 RUN"--------.---"
2080 RUN"--------.---"
2090 RUN"--------.---"
2100 RUN"--------.---"
2110 RUN"--------.---"
2120 RUN"--------.---"
2130 RUN"--------.---"
2140 RUN"--------.---"
2150 RUN"--------.---"
2160 RUN"--------.---"
2170 RUN"--------.---"
2180 RUN"--------.---"
2190 RUN"--------.---"
2200 RUN"--------.---"
2210 RUN"--------.---"
2220 RUN"--------.---"
2230 RUN"--------.---"
2240 RUN"--------.---"
2250 RUN"--------.---"
2260 RUN"--------.---"
2270 RUN"--------.---"
2280 RUN"--------.---"
2290 RUN"--------.---"
2300 RUN"--------.---"
2310 RUN"--------.---"
2320 RUN"--------.---"
2330 RUN"--------.---"
2340 RUN"--------.---"
2350 RUN"--------.---"
2360 RUN"--------.---"
2370 RUN"--------.---"
2380 RUN"--------.---"
2390 RUN"--------.---"
2400 RUN"--------.---"
2410 RUN"--------.---"
2420 RUN"--------.---"
2430 RUN"--------.---"
2440 RUN"--------.---"
2450 RUN"--------.---"
2460 RUN"--------.---"
2470 RUN"--------.---"
2480 RUN"--------.---"
2490 RUN"--------.---"
2500 RUN"--------.---"
2510 RUN"--------.---"
2520 RUN"--------.---"
2530 RUN"--------.---"
2540 RUN"--------.---"
2550 RUN"--------.---"
2560 RUN"--------.---"
2570 RUN"--------.---"
2580 RUN"--------.---"
2590 RUN"--------.---"
2600 RUN"--------.---"
2610 RUN"--------.---"
2620 RUN"--------.---"
2630 RUN"--------.---"
2640 RUN"--------.---"
2690 END
2700 REM **************** CUT OFF FOR NON-BASIC SELECTION *******************
2710 LOCATE 25,10:PRINT SPC(65);:LOCATE 25,10:PRINT"NOT A BASIC PROGRAM -- DATA FILE TO BE LOADED BY XXXXXXXX.XXX.";:FOR I = 1 TO 3000:NEXT:GOTO 2560
2720 LOCATE 25,10:PRINT SPC(65);:LOCATE 25,10:PRINT"NOT A BASIC PROGRAM -- DATA FILE TO BE LOADED BY XXXXXXX2.BAS.";:FOR I = 1 TO 3000:NEXT:GOTO 2560
2730 LOCATE 25,10:PRINT SPC(65);:LOCATE 25,10:PRINT"NOT A BASIC PROGRAM -- LOAD FROM DOS WITH 'TYPE' COMMAND.";:FOR I = 1 TO 3000:NEXT:GOTO 2560
2740 LOCATE 25,10:PRINT SPC(65);:GOTO 400
2750 END
15000 ON ERROR GOTO 0
64900 END
65000 '************************* SAVE ROUTINE ********************************
65100 SAVE"B:YOURMENU.BAS"
