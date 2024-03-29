90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "List the Marriages File Program"
105 TITLE$ = TITLE$ + " ON DISPLAY"
110 VERSION$ = "Version 2.0"
115 COPY1$ = "Copyright (c) 1983, 1984, by:"
120 COPY2$ = "Melvin O. Duke"
125 PRICE$ = "$35"
130 ADDR1$ = "Melvin O. Duke"
135 ADDR2$ = "P. O. Box 20836"
140 ADDR3$ = "San Jose, CA  95160"
145 REM Dimension Statements go here
170 REM Produce the first screen
175 KEY OFF : CLS
180 REM Draw the outer double box
185 R1 = 1 : C1 = 1 : R2 = 24 : C2 = 79 : GOSUB 400
190 REM Find the title location
195 TITLE.POS = 40 - INT(LEN(TITLE$)/2)
200 REM Draw the title box
205 R1=3:C1=TITLE.POS-2:R2=6:C2=TITLE.POS+LEN(TITLE$)+1:GOSUB 600
210 REM Print the title
215 LOCATE 4,TITLE.POS : PRINT TITLE$
220 LOCATE 5,40-INT(LEN(VERSION$)/2) :  PRINT VERSION$;
225 REM Draw the Contribution box
230 R1 = 8 : C1 = 19 : R2 = 17 : C2 = 62 : GOSUB 400
235 REM Request the Contribution
240 LOCATE 9,23 : PRINT "If you are using these programs, and"
245 LOCATE 10,21 : PRINT "finding them of value, your contribution"
250 LOCATE 11,23 : PRINT "("+PRICE$+" suggested) will be anticipated."
255 REM Draw the Mailing Label
260 R1 = 12 : C1 = 28 : R2 = 16 : C2 = 52 : GOSUB 600
265 REM Print the Name and Address
270 LOCATE 13,40-INT(LEN(ADDR1$)/2) :  PRINT ADDR1$;
275 LOCATE 14,40-INT(LEN(ADDR2$)/2) :  PRINT ADDR2$;
280 LOCATE 15,40-INT(LEN(ADDR3$)/2) :  PRINT ADDR3$;
285 REM Draw the Copyright box
290 R1 = 19 : C1 = 24 : R2 = 22 : C2 = 56 : GOSUB 400
295 REM Print the Copyright
300 LOCATE 20,40-INT(LEN(COPY1$)/2) :  PRINT COPY1$;
305 LOCATE 21,40-INT(LEN(COPY2$)/2) :  PRINT COPY2$;
310 GOTO 740
400 REM subroutine to print a double box
410 FOR I = R1 + 1 TO R2 - 1
420  LOCATE I, C1 : PRINT CHR$(186);
430  LOCATE I, C2 : PRINT CHR$(186);
440 NEXT I
450 FOR J = C1 + 1 TO C2 - 1
460  LOCATE R1, J : PRINT CHR$(205);
470  LOCATE R2, J : PRINT CHR$(205);
480 NEXT J
490  LOCATE R1, C1 : PRINT CHR$(201);
500  LOCATE R1, C2 : PRINT CHR$(187);
510  LOCATE R2, C1 : PRINT CHR$(200);
520  LOCATE R2, C2 : PRINT CHR$(188);
530 RETURN
600 REM subroutine to print a single box
610 FOR I = R1 + 1 TO R2 - 1
620  LOCATE I, C1 : PRINT CHR$(179);
630  LOCATE I, C2 : PRINT CHR$(179);
640 NEXT I
650 FOR J = C1 + 1 TO C2 - 1
660  LOCATE R1, J : PRINT CHR$(196);
670  LOCATE R2, J : PRINT CHR$(196);
680 NEXT J
690  LOCATE R1, C1 : PRINT CHR$(218);
700  LOCATE R1, C2 : PRINT CHR$(191);
710  LOCATE R2, C1 : PRINT CHR$(192);
720  LOCATE R2, C2 : PRINT CHR$(217);
730 RETURN
740 REM ask user to press a key to continue
750 LOCATE 25,1
760 PRINT "Have Data Diskette(s) in Place, then Press any key to continue.";
770 K$ = INKEY$ : IF K$ = "" THEN 770
780 CLS
840 CLS
1000 REM List the Marriages File Program.
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 REM Open the Persons File
1030 OPEN "a:persfile" AS #1 LEN = 256
1040 FIELD 1, 5 AS F1$, 20 AS F2$, 30 AS F3$, 2 AS F4$, 5 AS F5$, 5 AS F6$, 5 AS F7$, 11 AS F8$, 18 AS F9$, 16 AS F10$, 16 AS F11$, 11 AS F12$, 18 AS F13$, 16 AS F14$, 16 AS F15$, 11 AS F16$, 18 AS F17$, 16 AS F18$, 16 AS F19$
1050 REM open the Marriages File
1060 OPEN "a:marrfile" AS #2 LEN = 128
1070 FIELD 2, 5 AS M1$, 5 AS M2$, 5 AS M3$, 5 AS M4$, 11 AS M5$, 18 AS M6$, 16 AS M7$, 16 AS M8$, 45 AS M9$
1080 REM Read the Marriage Records
1090 CLS : LOCATE 21,1
1100 PRINT "Listing the Records in the Marriages File"
1110 REC.COUNT = 0
1120 GOSUB 1140
1130 GOTO 1210
1140 LPRINT "  List of the Records in the Marriages File  ";DATE$;"  ";TIME$
1150 LPRINT
1160 LPRINT " REC   No.  FATHER";
1170 LPRINT TAB(42);" No.  MOTHER"
1180 LPRINT " ---   ---  ------";
1190 LPRINT TAB(42);" ---  ------"
1200 RETURN
1210 FOR I = 1 TO 200
1220  GET #2,I
1230  REM verify if valid record
1240  TT1 = CVS(M1$)
1250  IF TT1 < 1 THEN 1430
1260  REC.COUNT = REC.COUNT + 1
1270  LOCATE 23,1 : PRINT "Listing Record:"; TT1
1280  LPRINT USING "####"; TT1;
1290  REM husband
1300  TT2 = CVS(M2$)
1310  IF TT2 = 0 THEN GOSUB 1740 ELSE GET #1, TT2 : GOSUB 1450
1320  REM print the father
1330  LPRINT TAB(7);
1340  LPRINT USING "####"; TT2;
1350  LPRINT "  " + T2$ + ", " + T3$;
1360  REM wife
1370  TT3 = CVS(M3$)
1380  IF TT3 = 0 THEN GOSUB 1740 ELSE GET #1, TT3 : GOSUB 1450
1390  LPRINT TAB(42);
1400  LPRINT USING "####"; TT3;
1410  LPRINT "  " + T2$ + ", " + T3$
1420  IF REC.COUNT MOD 55 = 0 THEN LPRINT CHR$(12);: GOSUB 1140
1430 NEXT I
1440 GOTO 1950
1450 REM Routine to Extract Personal Information
1460 T1 = CVS(F1$)
1470 T2$ = F2$
1480 FOR J = 1 TO LEN(F2$) -1
1490  IF RIGHT$(T2$,1)=" " THEN T2$ = LEFT$(T2$,LEN(T2$)-1) ELSE J = LEN(F2$)-1
1500 T3$ = F3$
1510 NEXT J
1520 FOR J = 1 TO LEN(F3$) -1
1530  IF RIGHT$(T3$,1)=" " THEN T3$ = LEFT$(T3$,LEN(T3$)-1) ELSE J = LEN(F3$)-1
1540 NEXT J
1550 T4$ = F4$
1560 IF T4$ = "M" THEN T4$ = "Male"
1570 IF T4$ = "F" THEN T4$ = "Female"
1580 T5 = CVS(F5$)
1590 T6 = CVS(F6$)
1600 T7 = CVS(F7$)
1610 T8$ = F8$
1620 T9$ = F9$
1630 T10$ = F10$
1640 T11$ = F11$
1650 T12$ = F12$
1660 T13$ = F13$
1670 T14$ = F14$
1680 T15$ = F15$
1690 T16$ = F16$
1700 T17$ = F17$
1710 T18$ = F18$
1720 T19$ = F19$
1730 RETURN
1740 REM Blank out a Record
1750 T1 = 0
1760 T2$ = ""
1770 T3$ = ""
1780 T4$ = ""
1790 T5 = 0
1800 T6 = 0
1810 T7 = 0
1820 T8$ = ""
1830 T9$ = ""
1840 T10$ = ""
1850 T11$ = ""
1860 T12$ = ""
1870 T13$ = ""
1880 T14$ = ""
1890 T15$ = ""
1900 T16$ = ""
1910 T17$ = ""
1920 T18$ = ""
1930 T19$ = ""
1940 RETURN
1950 LPRINT CHR$(12);
1960 CLOSE #1
1970 CLOSE #2
1980 CLS : LOCATE 21,1
1990 PRINT "End of Program"
2000 RUN "a:menu"
