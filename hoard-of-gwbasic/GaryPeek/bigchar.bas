100 REM **********************************************************************
110 REM FILE NAME  - BIGCHAR.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 3/30/87
190 REM
200 REM DESCRIPTION - ROUTINES TO DISPLAY VERY LARGE CHARACTERS ON SCREEN
210 REM
220 REM PLEASE NOTE - PERMISSION IS GRANTED TO COPY THIS PROGRAM ONLY IF
230 REM               COPIED IN ITS ENTIRETY INCLUDING THIS HEADING.
240 REM
250 REM **********************************************************************
300 PRINT:PRINT "INITIALIZING - PLEASE WAIT ..."
310 DIM FONT(96,8):FOR A=0 TO 95:FOR B=0 TO 7:READ F:FONT(A,B)=F:NEXT B:NEXT A
320 DIM BIG$(4)
330 PRINT "ENTER FIRST STRING ---> ";:LINE INPUT A$
340 PRINT "ENTER SECOND STRING -->  ";:LINE INPUT B$
350 PRINT "ENTER THIRD STRING -->  ";:LINE INPUT C$
360 PRINT "ENTER FOURTH STRING -->  ";:LINE INPUT D$
370 CLS
380 BIG$=A$:ROW=1:COL=1:GOSUB 500
390 BIG$=B$:ROW=6:COL=1:GOSUB 500
400 BIG$=C$:ROW=11:COL=1:GOSUB 500
410 BIG$=D$:ROW=16:COL=1:GOSUB 500
420 END
430 REM -----------------------------------------------------------------
500 FOR BIGROW=1 TO 4:BIG$(BIGROW)="":NEXT
510 FOR CHARPOS=1 TO LEN(BIG$)
520    CHAR$=MID$(BIG$,CHARPOS,1):CV=ASC(CHAR$):CHARNUM=CV-32
530    FOR BIGROW=0 TO 6 STEP 2
540       MASK=128
550       F=FONT(CHARNUM,BIGROW)
560       IF (F AND MASK)=MASK THEN UPPER=-1 ELSE UPPER=0
570       F=FONT(CHARNUM,BIGROW+1)
580       IF (F AND MASK)=MASK THEN LOWER=-1 ELSE LOWER=0
590       IF UPPER AND LOWER THEN PIX=219:GOTO 630
600       IF UPPER AND NOT LOWER THEN PIX=223:GOTO 630
610       IF NOT UPPER AND LOWER THEN PIX=220:GOTO 630
620       IF NOT UPPER AND NOT LOWER THEN PIX=32
630       BA=(BIGROW/2)+1:BIG$(BA)=BIG$(BA)+CHR$(PIX)
640       MASK=MASK/2:IF MASK<> .5 THEN 550
650    NEXT BIGROW
660 NEXT CHARPOS
670 FOR BIGROW=1 TO 4:LOCATE ROW,COL*8:PRINT BIG$(BIGROW);:ROW=ROW+1:NEXT
680 RETURN
690 REM ----------------------------------------
1000 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&H0
1010 DATA &H30,&H78,&H78,&H30,&H30,&H00,&H30,&H0
1020 DATA &H6C,&H6C,&H6C,&H00,&H00,&H00,&H00,&H0
1030 DATA &H6C,&H6C,&HFE,&H6C,&HFE,&H6C,&H6C,&H0
1040 DATA &H30,&H7C,&HC0,&H78,&H0C,&HF8,&H30,&H0
1050 DATA &H00,&HC6,&HCC,&H18,&H30,&H66,&HC6,&H0
1060 DATA &H38,&H6C,&H38,&H76,&HDC,&HCC,&H76,&H0
1070 DATA &H60,&H60,&HC0,&H00,&H00,&H00,&H00,&H0
1080 DATA &H18,&H30,&H60,&H60,&H60,&H30,&H18,&H0
1090 DATA &H60,&H30,&H18,&H18,&H18,&H30,&H60,&H0
1100 DATA &H00,&H66,&H3C,&HFF,&H3C,&H66,&H00,&H0
1110 DATA &H00,&H30,&H30,&HFC,&H30,&H30,&H00,&H0
1120 DATA &H00,&H00,&H00,&H00,&H00,&H30,&H30,&H60
1130 DATA &H00,&H00,&H00,&HFC,&H00,&H00,&H00,&H0
1140 DATA &H00,&H00,&H00,&H00,&H00,&H30,&H30,&H0
1150 DATA &H06,&H0C,&H18,&H30,&H60,&HC0,&H80,&H0
1160 DATA &H7C,&HC6,&HCE,&HDE,&HF6,&HE6,&H7C,&H0
1170 DATA &H30,&H70,&H30,&H30,&H30,&H30,&HFC,&H0
1180 DATA &H78,&HCC,&H0C,&H38,&H60,&HCC,&HFC,&H0
1190 DATA &H78,&HCC,&H0C,&H38,&H0C,&HCC,&H78,&H0
1200 DATA &H1C,&H3C,&H6C,&HCC,&HFE,&H0C,&H1E,&H0
1210 DATA &HFC,&HC0,&HF8,&H0C,&H0C,&HCC,&H78,&H0
1220 DATA &H38,&H60,&HC0,&HF8,&HCC,&HCC,&H78,&H0
1230 DATA &HFC,&HCC,&H0C,&H18,&H30,&H30,&H30,&H0
1240 DATA &H78,&HCC,&HCC,&H78,&HCC,&HCC,&H78,&H0
1250 DATA &H78,&HCC,&HCC,&H7C,&H0C,&H18,&H70,&H0
1260 DATA &H00,&H30,&H30,&H00,&H00,&H30,&H30,&H0
1270 DATA &H00,&H30,&H30,&H00,&H00,&H30,&H30,&H60
1280 DATA &H18,&H30,&H60,&HC0,&H60,&H30,&H18,&H0
1290 DATA &H00,&H00,&HFC,&H00,&H00,&HFC,&H00,&H0
1300 DATA &H60,&H30,&H18,&H0C,&H18,&H30,&H60,&H0
1310 DATA &H78,&HCC,&H0C,&H18,&H30,&H00,&H30,&H0
1320 DATA &H7C,&HC6,&HDE,&HDE,&HDE,&HC0,&H78,&H0
1330 DATA &H30,&H78,&HCC,&HCC,&HFC,&HCC,&HCC,&H0
1340 DATA &HFC,&H66,&H66,&H7C,&H66,&H66,&HFC,&H0
1350 DATA &H3C,&H66,&HC0,&HC0,&HC0,&H66,&H3C,&H0
1360 DATA &HF8,&H6C,&H66,&H66,&H66,&H6C,&HF8,&H0
1370 DATA &HFE,&H62,&H68,&H78,&H68,&H62,&HFE,&H0
1380 DATA &HFE,&H62,&H68,&H78,&H68,&H60,&HF0,&H0
1390 DATA &H3C,&H66,&HC0,&HC0,&HCE,&H66,&H3E,&H0
1400 DATA &HCC,&HCC,&HCC,&HFC,&HCC,&HCC,&HCC,&H0
1410 DATA &H78,&H30,&H30,&H30,&H30,&H30,&H78,&H0
1420 DATA &H1E,&H0C,&H0C,&H0C,&HCC,&HCC,&H78,&H0
1430 DATA &HE6,&H66,&H6C,&H78,&H6C,&H66,&HE6,&H0
1440 DATA &HF0,&H60,&H60,&H60,&H62,&H66,&HFE,&H0
1450 DATA &HC6,&HEE,&HFE,&HFE,&HD6,&HC6,&HC6,&H0
1460 DATA &HC6,&HE6,&HF6,&HDE,&HCE,&HC6,&HC6,&H0
1470 DATA &H38,&H6C,&HC6,&HC6,&HC6,&H6C,&H38,&H0
1480 DATA &HFC,&H66,&H66,&H7C,&H60,&H60,&HF0,&H0
1490 DATA &H78,&HCC,&HCC,&HCC,&HDC,&H78,&H1C,&H0
1500 DATA &HFC,&H66,&H66,&H7C,&H6C,&H66,&HE6,&H0
1510 DATA &H78,&HCC,&HE0,&H70,&H1C,&HCC,&H78,&H0
1520 DATA &HFC,&HB4,&H30,&H30,&H30,&H30,&H78,&H0
1530 DATA &HCC,&HCC,&HCC,&HCC,&HCC,&HCC,&HFC,&H0
1540 DATA &HCC,&HCC,&HCC,&HCC,&HCC,&H78,&H48,&H0
1550 DATA &HC6,&HC6,&HC6,&HD6,&HFE,&HEE,&HC6,&H0
1560 DATA &HC6,&HC6,&H6C,&H38,&H38,&H6C,&HC6,&H0
1570 DATA &HCC,&HCC,&HCC,&H78,&H30,&H30,&H78,&H0
1580 DATA &HFE,&HC6,&H8C,&H18,&H32,&H66,&HFE,&H0
1590 DATA &H78,&H60,&H60,&H60,&H60,&H60,&H78,&H0
1600 DATA &HC0,&H60,&H30,&H18,&H0C,&H06,&H02,&H0
1610 DATA &H78,&H18,&H18,&H18,&H18,&H18,&H78,&H0
1620 DATA &H10,&H38,&H6C,&HC6,&H00,&H00,&H00,&H0
1630 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&HFF
1640 DATA &H30,&H30,&H18,&H00,&H00,&H00,&H00,&H0
1650 DATA &H00,&H00,&H78,&H0C,&H7C,&HCC,&H76,&H0
1660 DATA &HE0,&H60,&H60,&H7C,&H66,&H66,&HDC,&H0
1670 DATA &H00,&H00,&H78,&HCC,&HC0,&HCC,&H78,&H0
1680 DATA &H1C,&H0C,&H0C,&H7C,&HCC,&HCC,&H76,&H0
1690 DATA &H00,&H00,&H78,&HCC,&HFC,&HC0,&H78,&H0
1700 DATA &H38,&H6C,&H60,&HF0,&H60,&H60,&HF0,&H0
1710 DATA &H00,&H00,&H76,&HCC,&HCC,&H7C,&HC,&HF8
1720 DATA &HE0,&H60,&H6C,&H76,&H66,&H66,&HE6,&H0
1730 DATA &H30,&H00,&H70,&H30,&H30,&H30,&H78,&H0
1740 DATA &H0C,&H00,&H0C,&H0C,&H0C,&HCC,&HCC,&H78
1750 DATA &HE0,&H60,&H66,&H6C,&H78,&H6C,&HE6,&H0
1760 DATA &H70,&H30,&H30,&H30,&H30,&H30,&H78,&H0
1770 DATA &H00,&H00,&HCC,&HFE,&HFE,&HD6,&HC6,&H0
1780 DATA &H00,&H00,&HF8,&HCC,&HCC,&HCC,&HCC,&H0
1790 DATA &H00,&H00,&H78,&HCC,&HCC,&HCC,&H78,&H0
1800 DATA &H00,&H00,&HDC,&H66,&H66,&H7C,&H60,&HF0
1810 DATA &H00,&H00,&H76,&HCC,&HCC,&H7C,&H0C,&H1E
1820 DATA &H00,&H00,&HDC,&H76,&H66,&H60,&HF0,&H0
1830 DATA &H00,&H00,&H7C,&HC0,&H78,&H0C,&HF8,&H0
1840 DATA &H10,&H30,&H7C,&H30,&H30,&H34,&H18,&H0
1850 DATA &H00,&H00,&HCC,&HCC,&HCC,&HCC,&H76,&H0
1860 DATA &H00,&H00,&HCC,&HCC,&HCC,&H78,&H30,&H0
1870 DATA &H00,&H00,&HC6,&HD6,&HFE,&HFE,&H6C,&H0
1880 DATA &H00,&H00,&HC6,&H6C,&H38,&H6C,&HC6,&H0
1890 DATA &H00,&H00,&HCC,&HCC,&HCC,&H7C,&H0C,&HF8
1900 DATA &H00,&H00,&HFC,&H98,&H30,&H64,&HFC,&H0
1910 DATA &H1C,&H30,&H30,&HE0,&H30,&H30,&H1C,&H0
1920 DATA &H18,&H18,&H18,&H00,&H18,&H18,&H18,&H0
1930 DATA &HE0,&H30,&H30,&H1C,&H30,&H30,&HE0,&H0
1940 DATA &H76,&HDC,&H00,&H00,&H00,&H00,&H00,&H0
1950 DATA &H00,&H10,&H38,&H6C,&HC6,&HC6,&HFE,&H0
