10  ' visisort.bas - March 29, 2004
20 GOTO 220 ' begin
30 SAVE"visisort.bas":LIST-220
40 GOTO 680  ' sample generation
50 GOTO 860  ' press to start
60 GOTO 2130 ' pointer
70 GOTO 2200 ' switchem
80 GOTO 2680 ' print @ to locate converter
90 GOTO 2710 ' init function keys
100 GOTO 2780 ' F3 slowmotion
110 GOTO 2790 ' F4 normal
120 GOTO 2800 ' F5 superfast
130 GOTO 2810 ' F8 turbo
140 GOTO 2830 ' F9 slower
150 GOTO 2850 ' F10 faster
160 GOTO 2880 ' delay
170 GOTO 2900 ' calculate seconds
180 GOTO 2950 ' seconds to hours, minutes, seconds
190 GOTO 2990 ' binary switchem
200 GOTO 3460 ' get key
210 ' begin
220 CLS:KEY OFF:Z=25:SH=15:RANDOMIZE TIMER:DEFSTR Q:Q=MKI$(0)
230 DIM A$(Z),S$(Z),SL(Z),SR(Z):GOSUB 90:PT$=CHR$(27)
240 PRINT "VISISORT by Eric F. Tchong - ARUBA":PRINT
250 PRINT "Use Screen <1> <2> ?":PRINT:PRINT "Which choice <?>"
260 GOSUB 200:F=VAL(Q)
270 ' initialize screen
280 IF F<1 OR F>2 OR F<>INT(F) THEN CLS:GOTO 250
290 IF F=1 THEN SCREEN 1:SWS=1:W=40
300 IF F=2 THEN SCREEN 2:SWS=1:W=80
310 ' main program
320 CLS:PRINT "* V I S I S O R T *":PRINT
330 PRINT " 1) Slow Sort"
340 PRINT " 2) Bubble Sort"
350 PRINT " 3) Shaker Sort"
360 PRINT " 4) Delayed Replacement Sort"
370 PRINT " 5) Insertion Sort"
380 PRINT " 6) Binary Sort"
390 PRINT " 7) Shell Sort"
400 PRINT " 8) Quick Sort"
410 PRINT " 9) Return screen set menu"
420 PRINT "10) Exit program"
430 PRINT:INPUT "Which choice ";CH
440 IF CH<1 OR CH>10 OR CH<>INT(CH) THEN 320
450 IF CH=9 THEN CLS:GOTO 250 ELSE IF CH=10 THEN 2090
460 CLS:GOSUB 40:NE=0:NC=0
470 ' print data
480 FOR K=1 TO NS:A$(K)=S$(K):Z=W*K:GOSUB 80:PRINT A$(K);:NEXT
490 ' user's info
500 LOCATE  3,15:PRINT "Items ="NS
510 LOCATE  4,15:PRINT "Comparisons ="NC
520 LOCATE  5,15:PRINT "Exchanges ="NE
530 LOCATE  7,15:PRINT "Finish ="
540 LOCATE  8,15:PRINT "Start  ="
550 LOCATE  9,15:PRINT "Speed  =";SH
560 LOCATE 11,15:PRINT "Slowmotion F3"
570 LOCATE 12,15:PRINT "Normal     F4"
580 LOCATE 13,15:PRINT "Superfast  F5"
590 LOCATE 15,15:PRINT "Slower     F9"
600 LOCATE 16,15:PRINT "Faster     F10"
610 LOCATE 17,15:PRINT "Turbo      F8"
620 ON CH GOSUB 910,1080,1190,1360,1480,1580,1740,1890
630 LOCATE 21,15:PRINT "Resort original list (y/n)"
640 GOSUB 200:RF$=Q
650 IF ASC(RF$)<>121 AND ASC(RF$)<>89 AND ASC(RF$)<>110 AND ASC(RF$)<>78 THEN RF$="y":GOTO 320
660 GOTO 320
670 ' sample generation
680 IF RF$="Y" OR RF$="y" THEN 830
690 INPUT "How many items <Max=25>";NS$:NS=VAL (NS$)
700 IF NS=0 THEN NS=25:GOTO 720
710 IF NS<2 OR NS>25 OR NS<>INT(NS) THEN 690
720 PRINT "(U)ser    or (C)omputer"
730 GOSUB 200:R1$=Q
740 IF ASC(R1$)=85 OR ASC(R1$)=117 THEN 820
750 PRINT "(N)umbers or (L)etters "
760 GOSUB 200:R$=Q
770 ' computer generates random letters or numbers
780 FOR K=1 TO NS
790  IF ASC(R$)=76 OR ASC(R$)=108 THEN S$(K)=CHR$(INT(RND(1)*26+65)) ELSE S$(K)=CHR$(INT(RND(1)*10+48))
800 NEXT:GOTO 830
810 ' user's input
820 FOR K=1 TO NS:PRINT "Item #"K"=";:INPUT S$(K):S$(K)=LEFT$(S$(K),1):NEXT
830 RF$="N":CLS
840 RETURN
850 ' wait for any key
860 LOCATE 22,15:PRINT "Press any key ...":GOSUB 200
870 LOCATE 22,15:PRINT "                 "
880 ' print start time
890 LOCATE 8,24:B1$=TIME$:PRINT B1$:RETURN
900 ' slow sort
910 LOCATE 1,15:PRINT "SLOW SORT"
920 GOSUB 50                               ' press to start
930 FOR I=1 TO NS-1
940  FOR J=I+1 TO NS
950   X=I:Y=J:GOSUB 60                     ' pointer
960   IF A$(I)>A$(J) THEN GOSUB 70         ' switchem
970  NEXT
980 NEXT                                   ' done
990 ' job done                              ' done
1000 GOSUB 170                               ' calculate seconds
1010 LOCATE 19,15
1020 PRINT "Done in";DN;"seconds"
1030 LOCATE 21,15
1040 PRINT MIN;"min ";SEC;"sec"
1050 GOSUB 200
1060 RETURN
1070 ' bubble sort
1080 LOCATE 1,15:PRINT "BUBBLE SORT"
1090 GOSUB 50                                ' press to start
1100 R=1
1110 TEST=0
1120 FOR I=1 TO NS-R
1130  X=I:Y=I+1:GOSUB 60                     ' pointer
1140  J=Y
1150  IF A$(I)>A$(J) THEN TEST=1:GOSUB 70    ' switchem
1160 NEXT:R=R+1:IF TEST=1 THEN 1110
1170 GOTO 1000
1180 ' shaker sort
1190 LOCATE 1,15:PRINT "SHAKER SORT"
1200 GOSUB 50                               ' press to start
1210 TOP=2:BOTTOM=NS
1220 FOR PTR=BOTTOM TO TOP STEP -1          ' bubble from bottom to top
1230  PTR2=PTR:X=PTR-1:Y=PTR:GOSUB 60       ' pointer
1240  I=PTR2-1:J=Y                                      
1250  IF A$(I)>A$(J) THEN S=PTR:GOSUB 70    ' switchem
1260 NEXT
1270 TOP=S+1                                ' do not compare items
1280 FOR PTR=TOP TO BOTTOM                  ' bubble from top to bottom
1290  PTR2=PTR:X=PTR-1:Y=PTR:GOSUB 60       ' pointer
1300  I=PTR2-1:J=Y
1310  IF A$(I)>A$(J) THEN S=PTR:GOSUB 70    ' switchem
1320 NEXT
1330 BOTTOM=S-1
1340 IF TOP>BOTTOM THEN 1000 ELSE 1220       ' done or loop back
1350 ' delayed replacement sort
1360 LOCATE 1,15:PRINT "DELAYED REPLACEMENT SORT"
1370 GOSUB 50                               ' press to start
1380 J=0:R=0:I=0
1390 I=I+1:IF I=NS THEN 1000                 ' done
1400 J=I:R=J+1
1410 X=J:Y=R:GOSUB 60                       ' pointer
1420 IF A$(R)>=A$(J) THEN 1430 ELSE J=R
1430 R=R+1:IF R<=NS THEN 1410
1440 IF I=J THEN 1390
1450 GOSUB 70                               ' switchem
1460 GOTO 1390
1470 ' insertion sort
1480 LOCATE 1,15:PRINT "INSERTION SORT"
1490 GOSUB 50                               ' press to start
1500 FOR PTR=2 TO NS
1510  PTR2=PTR
1520  X=PTR2-1:Y=PTR2:GOSUB 60              ' pointer
1530  IF A$(X)<=A$(Y) THEN 1560
1540  I=PTR2-1:J=PTR2:GOSUB 70              ' switchem
1550  PTR2=PTR2-1:GOTO 1520
1560 NEXT:GOTO 1000                          ' done
1570 ' binary sort
1580 LOCATE 1,15:PRINT "BINARY SORT"
1590 GOSUB 50                               ' press to start
1600 FOR PTR=2 TO NS
1610  X1=1:X2=PTR
1620  X3=X1+INT((X2-X1)/2)
1630  X=PTR:Y=X3:GOSUB 60                   ' pointer
1640  IF A$(PTR)<A$(X3) THEN 1670
1650  IF A$(PTR)>A$(X3) THEN 1690
1660  X2=X3
1670  IF X2=X3 THEN 1710
1680  X2=X3:GOTO 1620
1690  IF X1=X3 THEN 1710
1700  X1=X3:GOTO 1620
1710  GOSUB 190                             ' binary switchem
1720 NEXT:GOTO 1000                          ' done
1730 ' shell sort
1740 LOCATE 1,15:PRINT "SHELL SORT"
1750 GOSUB 50                               ' press to start
1760 GAP=NS
1770 GAP=INT(GAP/2)
1780 LOCATE 19,15:PRINT "Gap =";GAP
1790 IF GAP=0 THEN 1000                      ' done
1800 P=NS-GAP:H=1
1810 I=H
1820 J=I+GAP:X=I:Y=J:GOSUB 60               ' pointer
1830 IF A$(I)<=A$(J) THEN 1860
1840 GOSUB 70                               ' switchem
1850 I=I-GAP:IF I>=1 THEN 1820
1860 H=H+1:IF H>P THEN 1770
1870 GOTO 1810
1880 ' quick sort
1890 LOCATE 1,15:PRINT "QUICK SORT"
1900 GOSUB 50                               ' press to start
1910 S=1:SL(1)=0:SR(1)=NS
1920 LEFT=SL(S):RIGHT=SR(S):S=S-1
1930 LP=LEFT:RP=RIGHT:MV$=A$((LP+RP)/2)
1940 IF A$(LP)<MV$ THEN LP=LP+1:GOTO 1940
1950 IF MV$<A$(RP) THEN RP=RP-1:GOTO 1950
1960 X=LP:Y=RP:GOSUB 60                     ' pointer
1970 IF LP<=RP THEN 1980 ELSE 2020
1980 I=LP:J=RP
1990 IF A$(I)=A$(J) THEN 2010
2000 GOSUB 70                               ' switchem
2010 LP=LP+1:RP=RP-1
2020 IF LP>RP THEN 2030 ELSE 1940
2030 IF LP<RIGHT THEN S=S+1:SL(S)=LP:SR(S)=RIGHT
2040 RIGHT=RP
2050 IF LEFT>=RIGHT THEN 2060 ELSE 1930
2060 IF S=0 THEN 1000                        ' done
2070 GOTO 1920
2080 ' reset screen and exit visisort
2090 IF F=1 THEN SCREEN 2:SCREEN 0
2100 IF F=2 THEN SCREEN 0
2110 KEY 5,"visisort.bas":KEY 6,CHR$(34)+",a":KEY ON:CLS:END
2120 ' pointer
2130 NC=NC+1:LOCATE 4,28:PRINT NC:IF FK=8 THEN RETURN
2140 Z=W*X+2:GOSUB 80:PRINT PT$;
2150 Z=W*Y+2:GOSUB 80:PRINT PT$;
2160 IF FK=5 THEN 2170 ELSE DELAY=1/SH:GOSUB 160
2170 Z=W*X+2:GOSUB 80:PRINT " ";
2180 Z=W*Y+2:GOSUB 80:PRINT " ";:RETURN
2190 ' move two items to the right          (1-2)
2200 IF FK=8 THEN 2520
2210 FOR K=0 TO 4
2220  Z=W*I+K:GOSUB 80:PRINT " ";
2230  Z=Z+1  :GOSUB 80:PRINT A$(I);
2240  IF FK=5 THEN 2250 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
2250  Z=W*J+K:GOSUB 80:PRINT " ";
2260  Z=Z+1  :GOSUB 80:PRINT A$(J);
2270 NEXT
2280 IF FK=5 THEN 2300 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
2290 ' move item one place to the right     (3)
2300 Z=W*J+K:GOSUB 80:PRINT " ";
2310 Z=Z+1  :GOSUB 80:PRINT A$(J);:DF=J-I
2320 ' switch two items                     (4-5)
2330 FOR K=1 TO DF
2340  Z=W*(I+K-1)+5:GOSUB 80:PRINT " ";
2350  Z=W*(I+K)+5  :GOSUB 80:PRINT A$(I);
2360  IF FK=5 THEN 2380
2370  IF FK=3 THEN DELAY=1/SH:GOSUB 160 ELSE DELAY=1/99:GOSUB 160
2380  Z=W*(J-K+1)+6:GOSUB 80:PRINT " ";
2390  Z=W*(J-K)+6  :GOSUB 80:PRINT A$(J);
2400 NEXT
2410 ' move two items to the left           (6-7)
2420 FOR K=6 TO 1 STEP -1
2430  Z=W*J+K  :GOSUB 80:PRINT " ";
2440  Z=Z-1    :GOSUB 80:PRINT A$(I);
2450  IF FK=5 THEN 2460 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
2460  Z=W*I+K  :GOSUB 80:PRINT " ";
2470  Z=Z-1    :GOSUB 80:PRINT A$(J);
2480 NEXT
2490 NE=NE+1:LOCATE 5,26:PRINT NE
2500 TEMP$=A$(I):A$(I)=A$(J):A$(J)=TEMP$:RETURN   ' swap
2510 ' turbo
2520 Z=W*I:GOSUB 80:PRINT " ";
2530       GOSUB 80:PRINT A$(J);
2540 Z=W*J:GOSUB 80:PRINT " ";
2550       GOSUB 80:PRINT A$(I);:GOTO 2490
2560 ' demo switch of 9 and 0 in 99990
2570 '     �����������7�����������Ŀ
2580 '     ���������1���������Ŀ   �
2590 ' 9   64  65  66  67  68  69  70  
2600 ' 9  128                  �   �
2610 ' 9  192                  4   5
2620 ' 9  256                  �   �
2630 ' 0  320 321 322 323 324 325 326
2640 '     ���������2���������Ĵ   �
2650 '     �����������6����������3��
2660 REM   
2670 ' convert print@ to locate subroutine - p43ec
2680 D=INT(Z/W)+1:E=(D-1)*W:E=(Z-E)+1: IF D-1=0 THEN D=1:LOCATE D,E:RETURN
2690 LOCATE D-1,E:RETURN                ' d-1=first line
2700 ' initialize function keys
2710 ON KEY (3)  GOSUB 100:KEY (3)  ON ' slowmotion F3
2720 ON KEY (4)  GOSUB 110:KEY (4)  ON ' normal     F4
2730 ON KEY (5)  GOSUB 120:KEY (5)  ON ' superfast  F5
2740 ON KEY (8)  GOSUB 130:KEY (8)  ON ' turbo      F8
2750 ON KEY (9)  GOSUB 140:KEY (9)  ON ' slower     F9
2760 ON KEY (10) GOSUB 150:KEY (10) ON ' faster     F10
2770 RETURN
2780 FK=3:RETURN
2790 FK=4:RETURN
2800 FK=5:RETURN
2810 FK=8:RETURN
2820 ' select pointer speed
2830 SH=SH-1:IF SH=0  THEN SH=1   ' decrease
2840 LOCATE 9,15:PRINT "Speed  =";SH:RETURN
2850 SH=SH+1:IF SH=31 THEN SH=30  ' increase
2860 GOTO 2840
2870 ' variable time delay
2880 START=TIMER:WHILE TIMER<START+DELAY:WEND:RETURN
2890 ' calculate seconds past
2900 LOCATE 7,24:B2$=TIME$:PRINT B2$
2910 B$=B1$:GOSUB 180:H1$=H$:M1$=M$:S1$=S$
2920 B$=B2$:GOSUB 180:H2$=H$:M2$=M$:S2$=S$
2930 H1=VAL(H1$):M1=VAL(M1$):S1=VAL(S1$):H2=VAL(H2$):M2=VAL(M2$):S2=VAL(S2$)
2940 NW=(H2*3600)+(M2*60)+S2:BG=(H1*3600)+(M1*60)+S1:DN=NW-BG:GOTO 2960
2950 H$=MID$(B$,1,2):M$=MID$(B$,4,2):S$=MID$(B$,7,2):RETURN
2960 MIN=INT(DN/60):SEC=DN MOD 60:RETURN
2970 ' binary sort screen output subroutine
2980 ' move one item to the right
2990 J=PTR:I=X2:IF FK=8 THEN 3360           
3000 DF=0:FOR PTR2=PTR TO X2+1 STEP -1:DF=DF+1:NEXT
3010 IF DF=0 THEN RETURN
3020 FOR K=0 TO 4
3030  IF FK=5 THEN 3040 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
3040  Z=W*J+K:GOSUB 80:PRINT " ";
3050  Z=Z+1  :GOSUB 80:PRINT A$(J);
3060 NEXT
3070 IF FK=5 THEN 3090 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
3080 ' move item up
3090 FOR K=1 TO DF:IF FK=5 THEN 3110        
3100  IF FK=3 THEN DELAY=1/SH:GOSUB 160 ELSE DELAY=1/99:GOSUB 160
3110  Z=W*(J-K+1)+5:GOSUB 80:PRINT " ";
3120  Z=W*(J-K)+5  :GOSUB 80:PRINT A$(J);
3130 NEXT
3140 ' move item to the left
3150 FOR K=5 TO 2 STEP -1                   
3160  IF FK=5 THEN 3170 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160 ELSE DELAY=1/99:GOSUB 160
3170  Z=W*I+K:GOSUB 80:PRINT " ";
3180  Z=Z-1  :GOSUB 80:PRINT A$(J);
3190 NEXT
3200 TEMP$=A$(J):IF FK=5 THEN 3220 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
3210 ' move items down
3220 H$=A$(PTR)                             
3230 FOR PTR2=PTR TO X2+1 STEP -1
3240  A$(PTR2)=A$(PTR2-1)
3250  Z=W*(PTR2-1):GOSUB 80:PRINT " ";
3260  Z=W*PTR2    :GOSUB 80:PRINT A$(PTR2);
3270 NEXT
3280 A$(X2)=H$
3290 IF FK=5 THEN 3310 ELSE IF FK=3 THEN DELAY=1/SH:GOSUB 160
3300 ' move item into the list
3310 Z=W*I+1:GOSUB 80:PRINT " ";
3320 Z=Z-1  :GOSUB 80:PRINT TEMP$;         
3330 NE=NE+1:LOCATE 5,26:PRINT NE
3340 RETURN
3350 ' turbo binary sort
3360 H$=A$(PTR)
3370 FOR PTR2=PTR TO X2+1 STEP -1
3380  A$(PTR2)=A$(PTR2-1)
3390 NEXT
3400 A$(X2)=H$
3410 LOCATE 1,1
3420 FOR K=1 TO NS
3430  Z=W*K:GOSUB 80:PRINT A$(K);
3440 NEXT:GOTO 3330
3450 ' get key
3460 LSET Q=MKI$(0)
3470 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
3480 ' idea from a TRS-80 listing in 80-U.S. Journal - pages 50-53
3490 ' March, 1982 - VISISORT
3500 ' An on-screen demonstration of sorts
3510 ' by Jeffrey C. Ruble - Port Angeles, WA
