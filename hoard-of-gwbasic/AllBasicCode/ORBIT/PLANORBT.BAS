1000 REM *** THIS PROGRAM WAS CREATED BY STEVEN L OLIVERAS
1010 REM ***
1020 REM *** THIS PROGRAM REQUIRES AN EGA GRAPHICS CARD
1030 REM ***
1040 REM *** THIS PROGRAM REQUIRES A BASIC LANGUAGE INTERPETER
1050 REM ***
1060 REM *** THIS PROGAM WAS WRITEN WITH THE GWBASIC INTERPETER
1070 REM ***
1080 REM *** PRESS RETURN IF YOU HAVE AN EGA CARD
1090 REM ***
1100 REM *** THIS PROGRAM WAS WRITEN JANUARY 1992
1110 REM ******************************************************************
1120 REM NEXT DATA RADIUS FROM SUN
1130 DATA 58,108,149,228
1140 REM NEXT DATA NUMBER OF DAYS FOR COMPLETE ROTATION
1150 DATA 88,225,365,687
1160 REM NEXT DATA REPRESENTS COLOR OF PLANET
1170 DATA 7,14,9,4
1180 DIM RAD(4),ROT(4),CLR(4)
1190 DIM MER(2,88)
1200 DIM VEN(2,225)
1210 DIM EAR(2,365)
1220 DIM MAR(2,687)
1230 KEY OFF
1240 FOR K=1 TO 4 : READ RAD(K) : NEXT K
1250 FOR K=1 TO 4 : READ ROT(K) : NEXT K
1260 FOR K=1 TO 4 : READ CLR(K) : NEXT K
1270 SCREEN 9
1280 CLS
1290 DIM MERO(50)
1300 DIM VENO(50)
1310 DIM EARO(50)
1320 DIM MARO(50)
1330 FOR K=1 TO 4
1340 CIRCLE(5,200+K*10),4,CLR(K)
1350 PAINT (5,200+K*10),CLR(K),CLR(K)
1360 NEXT K
1370 GET (2,207)-(8,213),MERO
1380 GET (2,217)-(8,223),VENO
1390 GET (2,227)-(8,233),EARO
1400 GET (2,237)-(8,243),MARO
1410 PUT (50,50),VENO,PSET
1420 INC=5
1430 CLS
1440 GOSUB 1860
1450 GOSUB 1790
1460 MER=1:VEN=1:EAR=1:MAR=1
1470 REM COME HERE TO COMPLETE LOOP
1480 PUT (MER(1,MER)-3,MER(2,MER)-3),MERO,XOR
1490 PUT (VEN(1,VEN)-3,VEN(2,VEN)-3),VENO,XOR
1500 PUT (EAR(1,EAR)-3,EAR(2,EAR)-3),EARO,XOR
1510 PUT (MAR(1,MAR)-3,MAR(2,MAR)-3),MARO,XOR
1520 GOSUB 1670
1530 FOR K=1 TO 5 : NEXT K
1540 PUT (MER(1,MER)-3,MER(2,MER)-3),MERO,XOR
1550 PUT (VEN(1,VEN)-3,VEN(2,VEN)-3),VENO,XOR
1560 PUT (EAR(1,EAR)-3,EAR(2,EAR)-3),EARO,XOR
1570 PUT (MAR(1,MAR)-3,MAR(2,MAR)-3),MARO,XOR
1580 MER=MER+INC
1590 VEN=VEN+INC
1600 EAR=EAR+INC
1610 MAR=MAR+INC
1620 IF MER > ROT(1) THEN MER = MER - ROT(1)
1630 IF VEN > ROT(2) THEN VEN = VEN - ROT(2)
1640 IF EAR > ROT(3) THEN EAR = EAR - ROT(3)
1650 IF MAR > ROT(4) THEN MAR = MAR - ROT(4)
1660 GOTO 1470
1670 REM COME HERE TO CHANGE SPEED
1680 REM GET INPUT TO CHANGE SPEED
1690 LOCATE 19,1
1700 A$=INKEY$
1710 IF A$="F" OR A$="f" THEN INC=INC+1
1720 IF A$="S" OR A$="s" THEN INC=INC-1
1730 IF A$="Q" OR A$="q" THEN GOTO 2010
1740 LOCATE 19,1
1750 IF INC>87 THEN PRINT "GOING AS FAST AS PROGRAM ALLOWS":INC=87
1760 IF INC<1  THEN PRINT "MOVEMENT IS AT A STANDSTILL":INC=0
1770 IF INC>0 AND INC<87 THEN PRINT "                               "
1780 RETURN
1790 REM TO PLACE TEXT
1800 REM PLACE TEXT
1810 LOCATE 16,1
1820 PRINT "Q=STOP PROGRAM=QUIT"
1830 PRINT "F=FASTER"
1840 PRINT "S=SLOWER"
1850 RETURN
1860 OPEN "A:PLAN4.DAT" FOR INPUT AS #1
1870 FOR L=1 TO 4
1880 K1=ROT(L)
1890 FOR K=1 TO K1
1900 INPUT #1,P1
1910 INPUT #1,P2
1920 PSET (P1,P2),7
1930 IF L=1 THEN MER(1,K)=P1:MER(2,K)=P2
1940 IF L=2 THEN VEN(1,K)=P1:VEN(2,K)=P2
1950 IF L=3 THEN EAR(1,K)=P1:EAR(2,K)=P2
1960 IF L=4 THEN MAR(1,K)=P1:MAR(2,K)=P2
1970 NEXT K
1980 NEXT L
1990 CLOSE #1
2000 RETURN
2010 CLEAR
2020 STOP
