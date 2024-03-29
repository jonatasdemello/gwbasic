10  REM ==================>> STARTREK    IBM/PC  Version 1.1    14 Aug 82
100 CLS
105 RANDOMIZE (VAL(MID$(TIME$,7,2)))
110 KEY OFF
115 LOCATE 10,20 : COLOR 0,7
120 PRINT "  Do you want sound effects  [y/n] ?  " : COLOR 7,0
125 A$=INPUT$(1)
130 IF (A$="y") OR (A$="Y") THEN NOISE=1 ELSE NOISE=0
140 INPUT ;"  How big a galaxy do you want (1 to 8)" ; SZ
160 IF SZ < 1 THEN 140
165 IF SZ > 8 THEN 140
170 SSW=0                  ' subroutine call switch
180 DIM Q$(5),D$(6)
190 READ Q$(1),Q$(2),Q$(3),Q$(4),Q$(5),D$(1),D$(2),D$(3),D$(4),D$(5),D$(6)
200 REM ===============
210 GOSUB 6670
220 REM === gosub 5660
230 DIM G(8,8),Q(8,8),D(6),K(9,3),N(3),C$(20)
240 REM ========================================
250 DATA ".","E","K","B","*","Warp Engines","S.R. Sensors","L.R. Sensors"
260 DATA "Phaser Control","Photon Tubes","Damage Control"
270 REM =======================================================================
280 T0 = INT(RND*20+20)*100
290 T = T0
300 T9 = 5 * SZ
310 E0 = 3000                     ' Initial energy level
320 E=3000
330 P0 = 10
340 P = 10
350 S9 = 200
360 DEF FND(D)=SQR((K(I,1)-S1)^2+(K(I,2)-S2)^2)
370 Q1 = INT(RND*SZ+1)
380 Q2 = INT(RND*SZ+1)
390 REM ==  mat d(0)
400 S1 = INT(RND*8+1)
405 S2 = INT(RND*8+1)
410 FOR I = 1 TO 9
412   K(I,3) = 0
415 NEXT I
420 FOR I = 1 TO 5
422   D(I) = 0
425 NEXT I
428 REM =========================   Set up Galaxy  ============================
430 LOCATE 10,20: COLOR 16,7
440 PRINT"  Enterprise being prepared for battle  "
450 COLOR 7,0
460 B9 = 0
470 K9 = 0
480 FOR I = 1 TO SZ
490    FOR J = 1 TO SZ
500      R = RND*64
510      K3 = 0
520   IF R < 13.28 THEN K3 = 1
530   IF R <  7.28 THEN K3 = 2
540   IF R <  4.28 THEN K3 = 3
550   IF R <  3.2  THEN K3 = 4
560   IF R <  2!   THEN K3 = 5
565   IF R <  1!   THEN K3 = 6
570   IF R <  .4   THEN K3 = 7
575   IF R <  .2   THEN K3 = 8
580   IF R < .001  THEN K3 = 9
790      K9 = K9 + K3
800      B3 = 0
810      IF RND > .96 GOTO 830
820      GOTO 840
830      B3=1
840      B9 = B9 + B3
850      S3=INT(RND*8+1)
860      G(I,J) = K3*100+B3*10+S3
870    NEXT J
880 NEXT I
890 REM ==============================================================
905 IF B9>0 GOTO 930
910    I = RND*SZ+.5
915    J = I
920    G(I,J) = G(I,J)+10
925    B9=1
930 IF K9>5 GOTO 960
935    I = RND*SZ+.5
940    J = RND*SZ+.5
945    G(I,J) = G(I,J)+400
950    K9=K9+4
960 K0=K9
970 REM ==============================================================
975 GOTO 5450
980 REM ==============================================================
985 REM ======================>>  Set up Quadrant
990 CLS
1000 K3=0
1010 B3=0 
1020 S3=0 
1030 IF Q1<1 THEN 1120
1040   IF Q1>SZ THEN 1120
1050 IF Q2<1 THEN 1120
1060 IF Q2>SZ THEN 1120
1070 X=G(Q1,Q2)/100
1080 K3=INT(X)
1090 B3=INT((X-K3)*10)
1100 S3=G(Q1,Q2)-INT(G(Q1,Q2)*.1)*10
1110 REM  mat k(0)
1120 FOR I = 1 TO 8
1130   FOR J = 1 TO 8
1140     Q(I,J)=0
1150   NEXT J
1160 NEXT I
1170 Q(S1,S2)=1
1180 FOR I = 1 TO K3
1190    GOSUB 5400                   ' Subroutine call to random number gen
1200    Q(R1,R2)=2
1210    K(I,1)=R1
1220   K(I,2)=R2
1230   K(I,3)=S9
1240 NEXT I
1250 FOR I = 1 TO B3
1260    GOSUB 5400                  ' Subroutine call to random number gen
1270    Q(R1,R2)=3
1280 NEXT I
1290 FOR I = 1 TO S3
1300    GOSUB 5400                  ' Subroutine call to random number gen
1310    Q(R1,R2)=4
1320 NEXT I
1330 A=-1
1340 REM ==========================>> Short range sensor scan
1350 S4=S1-1
1360 S5=S1+1
1370 S6=S2-1
1380 S7=S2+1
1390 IF S4<1 THEN S4 = 1
1420 IF S5>8 THEN S5 = 8 
1450 IF S6<1 THEN S6 = 1
1480 IF S7>8 THEN S7 = 8
1510 FOR I = S4 TO S5
1520    FOR J = S6 TO S7
1530      IF Q(I,J)<>3 THEN 1580
1540      C$="DOCKED"
1550      E=3000
1560      P = 10
1570      GOTO 1670
1580    NEXT J
1590 NEXT I
1595 C$ = "GREEN"
1597 IF E<E0*.1 THEN C$ = "YELLOW"
1600 IF K3>0 THEN C$ = "RED"
1670 IF A<0 THEN 1690
1680 GOTO 1700
1685 LOCATE 16,1
1690 GOSUB 4950
1700 REM
1710 LOCATE 1,1
1720 IF E<=0 THEN 5140
1730 IF D(2)=>0 THEN 1780
1740 PRINT
1750 PRINT "*** Short Range Sensors are out ***"
1760 PRINT
1770 GOTO 2400
1780 PRINT "*****  Short  Range  Sensor  Scan  *****           "
1790 PRINT "-------------------------------------------"
1800 FOR I = 1 TO 8
1810    FOR J = 1 TO 8
1820      IF "K"=Q$(Q(I,J)+1) THEN COLOR 23,0
1830       PRINT Q$(Q(I,J)+1);" ";
1840      COLOR 7,0
1850    NEXT J
1860    PRINT "   ";
1870    IF I = 1 THEN PRINT "Stardate          ";T
1880    IF I = 2 THEN 2230
1890    IF I = 3 THEN PRINT "Quadrant          ";Q1;Q2
1900    IF I = 4 THEN PRINT "Sector            ";S1;S2
1910    IF I = 5 THEN PRINT "Energy            ";E
1920    IF I = 6 THEN PRINT "Photon Torpedoes  ";P;STRING$(5,32)
1930    IF I = 7 THEN PRINT "Klingons left     ";K9;STRING$(5,32)
1940    IF I = 8 THEN PRINT STRING$(25,32)
1950 REM ===========================>>  status
1970 NEXT I
1980 PRINT "-------------------------------------------"
1990 PRINT STRING$(45,32)
2000 PRINT STRING$(45,32)
2010 PRINT STRING$(45,32)
2020 PRINT STRING$(45,32)
2030 GOSUB 6930
2040 IF SSW=1 THEN RETURN
2050 LOCATE 1,50 : PRINT "*******  Commands  **********"
2060 LOCATE 2,50 : PRINT "  0 = Set Course"
2070 LOCATE 3,50 : PRINT "  1 = Short Range Sensor Scan"
2080 LOCATE 4,50 : PRINT "  2 = Long Range Sensor Scan"
2090 LOCATE 5,50 : PRINT "  3 = Fire Phasers"
2100 LOCATE 6,50 : PRINT "  4 = fire Photon Torpedoes"
2110 LOCATE 7,50 : PRINT "  5 = Damage Control"
2120 LOCATE 8,50 : PRINT "***** Course Settings *******"
2130 LOCATE 9,50 : PRINT "               3      "
2140 LOCATE 10,50: PRINT "           4   |   2  "
2150 LOCATE 11,50: PRINT "             \ | /    "
2160 LOCATE 12,50: PRINT "          5--- * ---1 "
2170 LOCATE 13,50: PRINT "             / | \    "
2180 LOCATE 14,50: PRINT "           6   |   8  "
2190 LOCATE 15,50: PRINT "               7      "
2200 IF SSW=1 THEN RETURN ELSE GOTO 2400
2230 PRINT "Condition         ";
2240 IF "RED"=C$ THEN COLOR 23,0
2250 PRINT " "+C$
2260 COLOR 7,0
2270 GOTO 1970
2390 SSW=1 : GOSUB 1340 : SSW=0
2400 LOCATE 15,1:PRINT "Command: ";
2410 INPUT A
2420 IF A+1 = 1 THEN GOTO 2570
2430 IF A+1 = 2 THEN GOTO 1340
2440 IF A+1 = 3 THEN GOTO 3490
2450 IF A+1 = 4 THEN GOTO 3830
2460 IF A+1 = 5 THEN GOTO 4160
2470 IF A+1 = 6 THEN GOTO 4760
2480 PRINT
2490 PRINT "    0 = Set Course"
2500 PRINT "    1 = Short Range Sensor Scan"
2510 PRINT "    2 = Long Range Sensor Scan"
2520 PRINT "    3 = Fire Phasers"
2530 PRINT "    4 = Fire Photon Torpedoes"
2540 PRINT "    5 = Damage Control Report"
2550 PRINT
2560 GOTO 2390
2570 REM ===============>>  Activate Warp Drive
2580 GOSUB 6930
2590 PRINT "Course ?  (1 - 8.9999): ";
2600 INPUT C1
2610 IF C1 = 0 THEN 2390
2620 IF C1 < 1 THEN 2590
2630 IF C1 => 9 THEN 2590
2640 PRINT "Warp Factor ?  (0-12): ";
2650 INPUT W1
2660 GOSUB 6820
2670 IF W1<0 THEN 2590
2680 IF W1>12 THEN 2590
2690 IF W1=<.2 THEN 2730
2700 IF D(1)=>0 THEN 2730
2710 PRINT "Warp engines are damaged, maximum speed allowed is warp .2"
2720 GOTO 2590
2730 IF K3<=0 THEN 2760
2740 GOSUB 4950
2750 IF E<=0 THEN 5170
2760 FOR I = 1 TO 6
2770   D(I) = D(I)+1
2780   IF D(I)>0 THEN 2800
2790   GOTO 2810
2800   D(I)=0
2810 NEXT I
2820 IF RND>.25 THEN 3050
2830 R1=INT(RND*6+1)
2840 IF RND>.5 THEN 2920
2850 D(R1) = D(R1)-(RND*5+1)
2860 PRINT "*** SPACE STORM ***";
2870 S=(R1-1)*12+1
2880 PRINT D$((S+11)/12)" damaged ***"
2900 S=0
2910 GOTO 3050
2920 FOR I = R1 TO 6
2930    IF D(I) < 0 THEN 2990
2940 NEXT I
2950 FOR I = 1 TO R1-1
2960    IF D(I) < 0 THEN 2990
2970 NEXT I
2980 GOTO 3040
2990 R1 = I
3000 D(I) = D(I)+RND*5+1
3010 GOTO 3030
3020 D(I) = 0
3030 S = (R1-1)*12+1
3040 S = 0
3050 N = INT(W1*8)
3060 E = E-N-N+5
3070 T = T + 1
3080 Q(S1,S2) = 0
3090 X = S1
3100 Y = S2
3110 IF T > T0+T9 THEN 5140
3120 GOSUB 4730
3130 FOR I = 1 TO N
3140    S1 = S1 + X1
3150    S2 = S2 + X2
3160    IF S1 < .5 THEN 3320
3170    IF S2 < .5 THEN 3320
3180    IF S1 => 8.5 THEN 3320
3190    IF S2 => 8.5 THEN 3320
3200    S1 = INT(S1+.5)
3210    S2 = INT(S2+.5)
3220    IF Q(S1,S2) = 0 THEN 3270
3230    PRINT "ENTERPRISE blocked by object at sector",S1,"-",S2
3240    S1=S1-X1
3250    S2=S2-X2
3260    GOTO 3280
3270 NEXT I
3280 Q(S1,S2) = 1
3290 S1 = INT(S1+.5)
3300 S2 = INT(S2+.5)
3310 GOTO 1340
3320 Q1 = INT(Q1+W1*X1+(X-.5)/8)
3330 IF Q1 > SZ THEN Q1 = SZ
3360 IF Q1 < 1 THEN Q1 = 1      
3390 Q2 = INT(Q2+W1*X2+(Y-.5)/8)
3400 IF Q2 > SZ THEN Q2 = SZ
3430 IF Q1 < 1 THEN Q2 = 1
3460 S1 = INT(RND*8+1)
3470 S2 = INT(RND*8+1)
3480 GOTO 980
3490 REM ======================>>  Long range sensor scan
3500 LOCATE 1,1
3510 IF D(3)=>0 THEN 3540
3520 PRINT "Long range sensors are inoperable"
3530 GOTO 2390
3540 PRINT "** Long Range Sensor Scan of 8 adjacent quadrants  "
3550 A$=CHR$(186)+STRING$(13,32)+CHR$(186)+STRING$(13,32)+CHR$(186)+STRING$(13,32)+CHR$(186)+STRING$(8,32)
3560 B$=CHR$(204)+STRING$(13,205)+CHR$(206)+STRING$(13,205)+CHR$(206)+STRING$(13,205)+CHR$(185)+STRING$(8,32)
3570 LOCATE 2,1:PRINT CHR$(201)+STRING$(13,205)+CHR$(203)+STRING$(13,205)+CHR$(203)+STRING$(13,205)+CHR$(187)
3580 LOCATE 3,1:PRINT A$:LOCATE 4,1 : PRINT A$ : LOCATE 5,1 : PRINT A$
3590 LOCATE 6,1:PRINT B$
3600 LOCATE 7,1:PRINT A$:LOCATE 8,1 : PRINT A$ : LOCATE 9,1 : PRINT A$
3610 LOCATE 10,1:PRINT B$
3620 LOCATE 11,1:PRINT A$:LOCATE 12,1:PRINT A$ : LOCATE 13,1: PRINT A$
3630 LOCATE 14,1:PRINT CHR$(200)+STRING$(13,205)+CHR$(202)+STRING$(13,205)+CHR$(202)+STRING$(13,205)+CHR$(188)
3640 KK=4
3650 FOR I = Q1-1 TO Q1 + 1
3660    N(1) = 0
3670    N(2) = N(1)
3680    N(3) = N(2)
3690    FOR J = Q2-1 TO Q2+1
3700       IF I<1 THEN 3750
3710       IF I > SZ THEN 3750
3720       IF J < 1 THEN 3750
3730       IF J > SZ THEN 3750
3740       N(J-Q2+2) = G(I,J)
3750    NEXT J
3760    LOCATE KK,8 : PRINT N(1)
3770    LOCATE KK,21 : PRINT N(2)
3780    LOCATE KK,33 : PRINT N(3)
3790    IF KK=8 THEN LOCATE 9,16:COLOR 0,7:PRINT " ENTERPRISE  ":COLOR 7,0
3800    KK=KK+4
3810 NEXT I
3820 GOTO 2400
3830 REM =============================>>  Phaser Control
3840 GOSUB 6930
3850 IF D(4) =>0 GOTO 3880
3860 PRINT "Phaser Control is disabled"
3870 GOTO 2390
3880 PRINT "Phasers locked on target.  Energy available = ";E
3890 PRINT "Number of units to fire";
3900 INPUT X
3910 IF X <= 0 THEN 2390
3920 IF E-X<0 THEN 3880
3930 E=E-X
3940 IF K3 = 0 THEN 4130
3950 GOSUB 6930
3960 FOR I = 1 TO 9
3970    IF K(I,3)<=0 THEN 4120
3980    H = X/FND(0)*(2+RND(0))
3990    K(I,3) = K(I,3)-H
4000    IF NOISE=0 THEN 4050
4010    FOR QQQ = 3000 TO 2500 STEP -10
4020      SOUND QQQ,.5
4030    NEXT QQQ
4040    SOUND 75,5
4050    COLOR 0,7
4060    PRINT " Phaser hit Klingon at ";K(I,1);"-";K(I,2);
4070    PRINT "(";K(I,3);" left)"
4080    COLOR 7,0
4090    IF K(I,3) > 0 THEN 4120
4100    GOSUB 4890
4110    IF K9 <= 0 THEN 5270
4120 NEXT I
4130 GOSUB 4950
4140 IF E <= 0 THEN 5170
4150 GOTO 2390
4160 REM ===========================>>  Photon Torpedoes
4170 GOSUB 6930
4180 IF D(5) => 0 THEN 4210
4190 PRINT "Photon Tubes are NOT OPERATIONAL"
4200 GOTO 2390
4210 IF P > 0 THEN 4240
4220 PRINT "All Photon Torpedoes expended"
4230 GOTO 2390
4240 PRINT "Torpedo course (1-8.9999)";
4250 INPUT C1
4260 IF C1 = 0 THEN 2390
4270 IF C1 < 1 THEN 4240
4280 IF C1 => 9 THEN 4240
4290 GOSUB 4730
4300 X = S1
4310 Y = S2
4320 P = P-1
4330 PRINT "Torpedo Track:";
4340 X = X+X1
4350 Y = Y + X2
4360 IF X <.5 THEN 4690
4370 IF Y < .5 THEN 4690
4380 IF X => 8.5 THEN 4690
4390 IF Y => 8.5 THEN 4690
4400 X = INT(X+.5)
4410 IF NOISE=0 THEN 4430
4420 SOUND (X*Y*100),5
4430 Y = INT(Y+.5)
4440 PRINT X;"-";Y;",";
4450 IF Q(X,Y)<>0 THEN 4470
4460 GOTO 4340
4470 IF Q(X,Y)<> 2 THEN 4590
4480 PRINT " *** Klingon destroyed ***"
4490 K3 = K3 - 1
4500 K9 = K9 - 1
4510 IF K9 <= 0 GOTO 5270
4520 FOR I = 1 TO 9
4530    IF INT(X+.5) = K(I,1) THEN 4550
4540    GOTO 4560
4550    IF INT(Y+.5)=K(I,2) THEN 4570
4560  NEXT I
4570 K(I,3) = 0
4580 GOTO 4660
4590 IF Q(X,Y)<>4 THEN 4630
4600 PRINT "Star destroyed"
4610 S3 = S3-1
4620 GOTO 4660
4630 PRINT
4640 PRINT "*** Star Base destroyed... Congratulations dingbat !!!"
4650 B3=B3-1
4660 Q(X,Y)=0
4670 G(Q1,Q2)=K3*100+B3*10+S3
4680 GOTO 4700
4690 PRINT "Torpedo missed"
4700 GOSUB 4950
4710 IF E<=0 THEN 5170
4720 GOTO 2390
4730 X2=COS((C1-1)*.785398)
4740 X1=-SIN((C1-1)*.785398)
4750 RETURN
4760 REM ==========================>>  Damage Control report
4770 GOSUB 6930
4780 IF D(6) => 0 THEN 4810
4790 PRINT "Damage report is not available"
4800 GOTO 2390
4810 PRINT
4820 PRINT "DEVICE            STATE OF REPAIR"
4830 FOR I = 1 TO 6
4840    PRINT D$(I),D(I)
4850 NEXT I
4870 GOTO 2390
4880 REM ===========================>>
4890 PRINT "Klingon at sector ";K(I,2);"-";K(I,2);" *** DESTROYED ***"
4900 K3=K3-1
4910 K9=K9-1
4920 Q(K(I,1),K(I,2))=0
4930 G(Q1,Q2)=K3*100+B3*10+S3
4940 RETURN
4950 REM ==========================>>  Klingon attack
4955 LOCATE 16,1
4960 IF C$<>"DOCKED" THEN 4990
4970 PRINT "Star Base shields protect the Enterprise"
4980 RETURN
4990 FOR I = 1 TO 9
5000    IF K(I,3)<=0 THEN 5110
5010    H = (K(I,3)/FND(0))*(2+RND(1))
5020    E=E-H
5030 IF NOISE=0 THEN 5080
5040    FOR QQQ = 300 TO 250 STEP -10
5050       SOUND QQQ,1:SOUND QQQ+5,1:SOUND QQQ-5,1
5060    NEXT QQQ
5070    SOUND 50,20
5080    PRINT H;" unit hit Enterprise ";
5090 REM PRINT K(I,1);"-";K(I,2);
5100    PRINT "(";E;" left)"
5110 NEXT I
5120 GOSUB 6720                      ' Sound effect
5130 RETURN
5140 REM ==========================>>  Lose game
5150 GOSUB 6680
5160 PRINT "It is Stardate ";T
5170 REM goto 4250
5180 REM gosub 5630
5190 PRINT "The ENTERPRISE has been destroyed"
5200 PRINT "The Federation will be conquered."
5210 PRINT "  There are still ";K9;" Klingon battle cruisers."
5220 PRINT "     Y O U    A R E    D E A D   !!!"
5260 GOTO 5360
5270 REM ==========================>>  Win game
5280 GOSUB 6680
5290 PRINT "It is Stardate ";T
5300 PRINT "  The last Klingon battle cruiser in the galaxy has been destroyed."
5310 PRINT "  The federation has been saved."
5320 PRINT " "
5330 PRINT "  You have been promoted to admiral."
5340 PRINT K0;" Klingons in ";T-T0+1;" years"
5350 PRINT " Your rating = ";INT(K0/(T-T0+1)*1000)
5360 PRINT
5370 PRINT "Do you want to play again?  (Y/N)" : COLOR 7,0
5380 A$=INPUT$(1)
5385 IF (A$="y") OR (A$="Y") THEN 250
5390 STOP
5400 REM =======================>> Random Number generator
5410 R1=INT(RND*8+1)
5420 R2=INT(RND*8+1)
5430 IF Q(R1,R2)<>0 THEN 5410
5440 RETURN
5450 REM =================>> Opening instructions
5460 CLS : LOCATE 5,1
5470 PRINT "Orders:                                  Stardate: ";T
5480 GOSUB 6720
5484 PRINT "These are the voyages of the starship Enterprise - "
5486 PRINT "It's mission: to explore strange new worlds, to    "
5488 PRINT "boldly go where no one has ever gone before.       "
5490 PRINT
5498 PRINT
5500 PRINT "As commander of the Starship ENTERPRISE,"
5510 PRINT "your mission is to rid the galaxy of the deadly Klingon menace"
5520 PRINT "To do this, you must destroy the Klingon invasion force of ";K9;
5530 PRINT " battle"
5540 PRINT "cruisers.  You have ";T9;" solar years to complete your mission"
5550 PRINT "(i.e., until stardate ";T0+T9;")."
5560 GOSUB 6600
5570 REM =================>> Continuing instructions
5580 PRINT "   You have at least one (1) supporting STARBASE."
5590 PRINT "When the Enterprise docks at one (is positioned next to one) it"
5600 PRINT "is resupplied with energy and photon torpedoes."
5610 PRINT "The Enterprise is currently in quadrant ";Q1;"-";Q2
5620 PRINT "                               sector   ";S1;"-";S2
5630 PRINT " "
5640 PRINT "Do you need further instructions ?   [y or n]
5650 A$=INPUT$(1)
5660 IF (A$="n") OR (A$="N") THEN 980
5670 GOSUB 6670                  ' clear screen
5680 REM ----------->>>  Chain in the instructions
5690 CHAIN MERGE "b:startrek.how",5700,ALL
5700 GOSUB 50000
5710 CHAIN MERGE "b:startrek.dum",5720,ALL,DELETE 50000-61600
5720 GOTO 980
6590 GOTO 980
6600 REM =================>> Subroutine to wait for player to hit any key
6610 LOCATE 1,15
6620 COLOR 0,7
6630 PRINT "        Hit any key to continue       "
6640 COLOR 7,0
6650 A$=INKEY$: IF A$="" THEN 6650
6660 X6 = INT(RND*100)+1
6670 REM =================>> Subroutine to clear screen
6680 CLS
6690 LOCATE 5,10
6700 GOSUB 6720
6710 RETURN
6720 REM =================>>  Routine to simulate sound of t.v. computer
6730 IF NOISE=0 THEN 6800
6740 FOR I = 1 TO 50
6750    J=RND(I)*10000
6760    IF J<37 THEN 6790
6770    PLAY "MB"
6780    SOUND J,.5
6790 NEXT I
6800 RETURN
6810 END
6820 REM =================>>  Sound of warp drive engaging
6830 IF NOISE=0 THEN 6920
6840 PLAY "mb"
6850 FOR I = 37 TO 100
6860      SOUND I,1
6870 NEXT I
6880 PLAY "mb"
6890 FOR I = 5000 TO 4000 STEP -20
6900      SOUND I,.2
6910 NEXT I
6920 RETURN
6930 REM ---------->>>  Subroutine to clear the message area
6940 FOR I=16 TO 23
6950  LOCATE I,1 : PRINT STRING$(79,32)
6960 NEXT I
6970 LOCATE 16,1
6980 RETURN
50000 RETURN
