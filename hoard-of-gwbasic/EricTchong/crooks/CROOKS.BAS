10   ' crooks.bas - Freeware 2005
20 GOTO 280 ' begin
30 SAVE"crooks.bas",A:LIST-280
40 GOTO 1450 ' print block
50 GOTO 1520 ' get key input
60 GOTO 1570 ' select 1 person
70 GOTO 1650 ' select 2 persons
80 GOTO 1820 ' convert
90 GOTO 1860 ' boat goes up
100 GOTO 1950 ' boat goes down
110 GOTO 2060 ' delay
120 GOTO 2080 ' bad select
130 GOTO 2150 ' bravo
140 GOTO 2220 ' rethink your move
150 GOTO 2290 ' boat down
160 GOTO 2300 ' boat up
170 GOTO 2320 ' TC rows up
180 GOTO 2330 ' T  rows down
190 GOTO 2340 ' MM rows up
200 GOTO 2350 ' MC rows down
210 GOTO 2360 ' TM rows up
220 GOTO 2380 ' blank persons
230 GOTO 2530 ' print persons
240 GOTO 2680 ' TC2 up
250 GOTO 2780 ' T  down
260 GOTO 2850 ' TC3 up
270 ' begin
280 B=2:KEY OFF
290 DIM A$(10),Z$(22):DEFSTR Q,Z:Q=MKI$(0):TT=8
300 U$=CHR$(223):FOR S=1 TO 8:UP$=UP$+U$:NEXT
310 D$=CHR$(220):FOR S=1 TO 8:DN$=DN$+D$:NEXT
320 T$=CHR$(221)+"Trusty"+CHR$(222)
330 C$=CHR$(221)+"Crook "+CHR$(222)
340 M$=CHR$(221)+"Mounty"+CHR$(222)
350 A$(1)=DN$+T$+UP$ ' trusty
360 A$(2)=DN$+C$+UP$ ' crook23
370 A$(3)=DN$+M$+UP$ ' mounty123
380 A$(4)="*--/\--*"+"| BOAT |"+"*--\/--*" ' boat
390 A$(5)="*--/\--*"+"|Trusty|"+"*Crook-*" ' TC rows up
400 A$(6)="*--/\--*"+"|Trusty|"+"*--\/--*" ' T  rows down
410 A$(7)="*--/\--*"+"|Mounty|"+"*Mounty*" ' MM rows up
420 A$(8)="*Crook-*"+"|Mounty|"+"*--\/--*" ' MC rows down
430 A$(9)="*--/\--*"+"|Trusty|"+"*Mounty*" ' TM rows up
440 A$(10)=STRING$(30,219)   ' paint block
450 CLS:COLOR 15,1:CLS:COLOR 15,1 ' twice to make background blue
460 Z(1)="This is a remake of the river crossing puzzle MOUNTIES/CROOKS"
470 Z(2)="by Jerry Fielden, programmed in GW-BASIC by Eric Tchong."
480 Z(4)="Three mounties captured 3 crooks by over powering them"
490 Z(5)="with fist since both groups had ran out of bullets."
500 Z(6)="The mounties did have leg irons to put them in"
510 Z(7)="and the chain was short so they couldn't run."
520 Z(8)="Each mounty had a key. No handcuffs were available."
530 Z(10)="They came to a river where a 2 man boat was at the shore."
540 Z(11)="One crook, named Trusty, who is not as fierce as the"
550 Z(12)="other two, is allowed to row the boat."
560 Z(13)="If more crooks than mounties are found on any side of the river,"
570 Z(14)="the crooks can overpower the mounties for the key so they can escape."
580 Z(16)="The mounties will allow Trusty and a crook to go first,"
590 Z(17)="so to be sure that the 2 man boat is OK."
600 Z(19)="The computer will help you solve the puzzle by trial and error."
610 Z(20)="<<<Esc is the panic button>>>"
620 Z(22)="Press any key to start this game..."
630 FOR I=1 TO 22
640  X=(80-LEN(Z(I)))/2:PRINT TAB(X) Z(I);
650 NEXT:GOSUB 50:COLOR 14,B ' init to green background
660 ' here we go
670 CLS:COLOR 14,B
680 LOCATE 1,1 :PRINT STRING$(80,219);:LOCATE 25,1:PRINT STRING$(80,219);
690 COLOR 1,B                ' blue river
700 FOR P=9 TO 17:LOCATE P,1:PRINT STRING$(80,219);:NEXT
710 LOCATE 19,54:PRINT "<1> = Trusty"
720 LOCATE 20,54:PRINT "<2> = Crook"
730 LOCATE 21,54:PRINT "<3> = Mounty"
740 V=18:F=2 :U=1:C=4 :GOSUB 40 ' t
750      F=14:U=2:C=4 :GOSUB 40 ' c2
760      F=26:U=2:C=4 :GOSUB 40 ' c3
770 V=21:F=2 :U=3:C=15:GOSUB 40 ' m1
780      F=14:U=3:C=15:GOSUB 40 ' m2
790      F=26:U=3:C=15:GOSUB 40 ' m3
800 GOSUB 150 ' boat down
810 ' 1st move 1-2
820 GOSUB 240 ' TC2 up
830 ' 2nd move 1 T
840 GOSUB 250 ' T down
850 ' 3rd move 1-2
860 GOSUB 260 ' TC3 up
870 ' 4th move 1
880 GOSUB 250 ' T down
890 ' 5th move 3-3 M2M3 up
900 GOSUB 70:IF F<>3 OR T<>3 THEN GOSUB 140:GOTO 900
910 GOSUB 150 ' boat down
920 P= 2:GOSUB 220 ' blank m2
930 P= 3:GOSUB 220 ' blank m3
940 GOSUB 190 ' MM rows up
950 GOSUB 160 ' boat up
960 P= 8:GOSUB 230 ' print m2
970 P= 9:GOSUB 230 ' print m3
980 ' 6th move 2-3 C3M3 down
990 GOSUB 70:IF F<>2 OR T<>3 THEN GOSUB 140:GOTO 990
1000 P=12:GOSUB 220 ' blank c3
1010 P= 9:GOSUB 220 ' blank m3
1020 GOSUB 200 ' MC rows down
1030 GOSUB 150 ' boat down
1040 P= 6:GOSUB 230 ' print c3
1050 P= 3:GOSUB 230 ' print m3
1060 ' 7th move 1-3 TM3 up
1070 GOSUB 70:IF F<>1 OR T<>3 THEN GOSUB 140:GOTO 1070
1080 GOSUB 150 ' boat down
1090 P= 4:GOSUB 220 ' blank t
1100 P= 3:GOSUB 220 ' blank m3
1110 GOSUB 210 ' TM rows up
1120 GOSUB 160 ' boat up
1130 P=10:GOSUB 230 ' print t
1140 P= 9:GOSUB 230 ' print m3
1150 ' 8th move 2-3 C2M3 down
1160 GOSUB 70:IF F<>2 OR T<>3 THEN GOSUB 140:GOTO 1160
1170 P=11:GOSUB 220 ' blank c2
1180 P= 9:GOSUB 220 ' blank m3
1190 GOSUB 200 ' MC rows down
1200 GOSUB 150 ' boat down
1210 P= 5:GOSUB 230 ' print c2
1220 P= 3:GOSUB 230 ' print m3
1230 ' 9th move 3-3 M1M3 up
1240 GOSUB 70:IF F<>3 OR T<>3 THEN GOSUB 140:GOTO 1240
1250 GOSUB 150 ' boat down
1260 P= 1:GOSUB 220 ' blank m1
1270 P= 3:GOSUB 220 ' blank m3
1280 GOSUB 190 ' MM rows up
1290 GOSUB 160 ' boat up
1300 P= 7:GOSUB 230 ' print m1
1310 P= 9:GOSUB 230 ' print m3
1320 ' 10th move 1
1330 GOSUB 250 ' T down
1340 ' 11th move 1-2
1350 GOSUB 240 ' TC2 up
1360 ' 12th move 1
1370 GOSUB 250 ' T down
1380 ' 13th move 1-2
1390 GOSUB 260 ' TC3 up
1400 SOUND 2000,2:COLOR 15,1:GOSUB 130:COLOR 15,1
1410 LOCATE 12,2:PRINT "Well done... To solve again press <y/Y> ?"
1420 GOSUB 50:IF ASC(Q)=89 OR ASC(Q)=121 THEN CLS:COLOR 15,B:GOTO 670
1430 GOTO 2950
1440 ' Print block
1450 COLOR C,B
1460 FOR P=1 TO 3
1470  LOCATE V+P-1,F
1480  PRINT MID$(A$(U),(P-1)*8+1,8)
1490 NEXT
1500 RETURN
1510 ' Get key input
1520 LSET Q=MKI$(0)
1530 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND
1540 R=VAL(Q):F=ASC(Q):IF F=27 THEN 2950
1550 RETURN
1560 ' Select 1 person
1570 COLOR 15,B
1580 LOCATE 3,54:PRINT "Select 1 person "
1590 LOCATE 4,54:PRINT "Choose 1,2, or 3 ?"
1600 GOSUB 50:LOCATE 5,54:PRINT Q
1610 IF R<1 OR R>3 THEN GOSUB 120:GOTO 1600
1620 F=ASC(Q):GOSUB 80
1630 RETURN
1640 ' Select 2 persons
1650 COLOR 15,B
1660 LOCATE 3,54:PRINT "Select 2 persons"
1670 LOCATE 4,54:PRINT "Choose 1,2, or 3 ?"
1680 GOSUB 50:LOCATE 5,54:PRINT Q
1690 IF R<1 OR R>3 THEN GOSUB 120:GOTO 1680
1700 GOSUB 80:K=F
1710 GOSUB 50:T=ASC(Q):LOCATE 5,57:PRINT Q
1720 IF R<1 OR R>3 THEN GOSUB 120:GOTO 1710
1730 F=T:GOSUB 80:U=F:F=K:T=U
1740 IF F>T THEN SWAP F,T
1750 IF F=1 AND T=2 THEN 1800 ' 1 2
1760 IF F=3 AND T=3 THEN 1800 ' 3 3
1770 IF F=1 AND T=3 THEN 1800 ' 1 3
1780 IF F=2 AND T=3 THEN 1800 ' 2 3
1790 LOCATE 5,54:PRINT "    ":GOSUB 140:GOTO 1680
1800 RETURN
1810 ' convert
1820 IF F=49 THEN F=1:RETURN
1830 IF F=50 THEN F=2:RETURN
1840 IF F=51 THEN F=3:RETURN
1850 ' boat goes up
1860 U=10:C=2:GOSUB 40
1870 FOR X=1 TO 4
1880  C=15:U=EC:GOSUB 40:GOSUB 110
1890  IF X=1 THEN C=2 ELSE C=1
1900  U=10:GOSUB 40:GOSUB 110
1910  V=V-3
1920 NEXT
1930 GOTO 2020
1940 ' boat goes down
1950 U=10:C=1:GOSUB 40
1960 FOR X=1 TO 4
1970  C=15:U=EC:GOSUB 40:GOSUB 110
1980  IF X=1 THEN C=2 ELSE C=1
1990  U=10:GOSUB 40:GOSUB 110
2000  V=V+3
2010 NEXT
2020 C=15:U=EC:GOSUB 40:GOSUB 110
2030 LOCATE 5,54:PRINT "    "
2040 RETURN
2050 ' delay
2060 TQ=TIMER+.0625:WHILE TIMER<TQ:WEND:RETURN
2070 ' bad select
2080 BEEP
2090 FOR D=1 TO TT
2100  LOCATE 6,54:PRINT "Bad select":SOUND .49,.2
2110  LOCATE 6,54:PRINT "          ":SOUND .49,.2
2120 NEXT
2130 GOTO 2270
2140 ' you solved it
2150 BEEP:COLOR 15,2
2160 FOR D=1 TO TT
2170  LOCATE 6,54:PRINT "Bravo! You solved it!!!":SOUND .49,.2
2180  LOCATE 6,54:PRINT "                       ":SOUND .49,.2
2190 NEXT
2200 GOTO 2270
2210 ' rethink your move
2220 BEEP
2230 FOR D=1 TO TT
2240  LOCATE 23,54:PRINT "RETHINK YOUR MOVE!!!":SOUND .49,.2
2250  LOCATE 23,54:PRINT "                    ":SOUND .49,.2
2260 NEXT
2270 LOCATE 5,54:PRINT "    ":RETURN
2280 ' boat up / down
2290 V=18:F=40:U=4:C=15:GOSUB 40:RETURN ' down
2300 V=6 :F=40:U=4:C=15:GOSUB 40:RETURN ' up
2310 ' rows up / down
2320 V=18:F=40:EC=5:GOSUB 90:RETURN ' TC rows up
2330 V=6:F=40:EC=6:GOSUB 100:RETURN ' T  rows down
2340 V=18:F=40:EC=7:GOSUB 90:RETURN ' MM rows up
2350 V=6:F=40:EC=8:GOSUB 100:RETURN ' MC rows down
2360 V=18:F=40:EC=9:GOSUB 90:RETURN ' TM rows up
2370 ' blank persons
2380 ON P GOTO 2390,2400,2410,2420,2430,2440,2450,2460,2470,2480,2490,2500
2390 V=21:F=2 :GOTO 2510  ' m1
2400 V=21:F=14:GOTO 2510  ' m2
2410 V=21:F=26:GOTO 2510  ' m3
2420 V=18:F=2 :GOTO 2510  ' t
2430 V=18:F=14:GOTO 2510  ' c2
2440 V=18:F=26:GOTO 2510  ' c3
2450 V= 6:F=2 :GOTO 2510  ' m1
2460 V= 6:F=14:GOTO 2510  ' m2
2470 V= 6:F=26:GOTO 2510  ' m3
2480 V= 3:F=2 :GOTO 2510  ' trusty
2490 V= 3:F=14:GOTO 2510  ' c2
2500 V= 3:F=26:GOTO 2510  ' c3
2510 U=10:C=2:GOSUB 40:RETURN
2520 ' print persons
2530 ON P GOTO 2540,2550,2560,2570,2580,2590,2600,2610,2620,2630,2640,2650
2540 V=21:F=2 :U=3:C=15:GOTO 2660  ' m1
2550 V=21:F=14:U=3:C=15:GOTO 2660  ' m2
2560 V=21:F=26:U=3:C=15:GOTO 2660  ' m3
2570 V=18:F=2 :U=1:C= 4:GOTO 2660  ' t
2580 V=18:F=14:U=2:C= 4:GOTO 2660  ' c2
2590 V=18:F=26:U=2:C= 4:GOTO 2660  ' c3
2600 V= 6:F=2 :U=3:C=15:GOTO 2660  ' m1
2610 V= 6:F=14:U=3:C=15:GOTO 2660  ' m2
2620 V= 6:F=26:U=3:C=15:GOTO 2660  ' m3
2630 V= 3:F=2 :U=1:C= 4:GOTO 2660  ' t
2640 V= 3:F=14:U=2:C= 4:GOTO 2660  ' c2
2650 V= 3:F=26:U=2:C= 4:GOTO 2660  ' c3
2660 GOSUB 40:GOSUB 110:RETURN
2670 ' TC2 up
2680 GOSUB 70:IF F<>1 OR T<>2 THEN GOSUB 140:GOTO 2680
2690 GOSUB 150 ' boat down
2700 P= 4:GOSUB 220 ' blank t
2710 P= 5:GOSUB 220 ' blank c2
2720 GOSUB 170 ' TC rows up
2730 GOSUB 160 ' boat up
2740 P=10:GOSUB 230 ' print t
2750 P=11:GOSUB 230 ' print c2
2760 RETURN
2770 ' T down
2780 GOSUB 60:IF F<>1 THEN GOSUB 140:GOTO 2780
2790 P=10:GOSUB 220 ' blank t
2800 GOSUB 180 ' T  rows down
2810 GOSUB 150 ' boat down
2820 P=4 :GOSUB 230 ' print t
2830 RETURN
2840 ' TC3 up
2850 GOSUB 70:IF F<>1 OR T<>2 THEN GOSUB 140:GOTO 2850
2860 GOSUB 150 ' boat down
2870 P= 4:GOSUB 220 ' blank t
2880 P= 6:GOSUB 220 ' blank c3
2890 GOSUB 170 ' TC rows up
2900 GOSUB 160 ' boat up
2910 P=10:GOSUB 230 ' print t
2920 P=12:GOSUB 230 ' print c3
2930 RETURN
2940 ' Exit
2950 COLOR 7,0:CLS:END
