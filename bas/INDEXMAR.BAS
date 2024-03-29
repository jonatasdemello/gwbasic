90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "Marriage Index Program"
105 TITLE$ = TITLE$ + " ON DISPLAY"
110 VERSION$ = "Version 2.0"
115 COPY1$ = "Copyright (c) 1983, 1984, by:"
120 COPY2$ = "Melvin O. Duke"
125 PRICE$ = "$35"
130 ADDR1$ = "Melvin O. Duke"
135 ADDR2$ = "P. O. Box 20836"
140 ADDR3$ = "San Jose, CA  95160"
145 REM Dimension Statements go here
150 DIM REC.NO(400), PERS.ID(400), M.DATE(400)
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
1000 REM Marriage Index Program
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 OPEN "a:marrfile" AS #2 LEN = 128
1030 FIELD 2, 5 AS M1$, 5 AS M2$, 5 AS M3$, 5 AS M4$, 11 AS M5$, 18 AS M6$, 16 AS M7$, 16 AS M8$, 45 AS M9$
1040 REM Read all records, and create the index.
1050 CLS
1060 C = 0
1070 FOR I = 1 TO 200
1080  GET #2, I
1090  LOCATE 15,1 : PRINT "Processing Marriage Record:"; I;
1100  REM Extract information from the file
1110  T1 = CVS(M1$)  'Marriage-id
1120  IF T1 < 0 THEN 1450
1130  T2 = CVS(M2$)  'Husband-id
1140  T3 = CVS(M3$)  'Wife-id
1150  T5$ = M5$  'Marriage-date as dd mmm yyyy
1160  IF T5$ = "           " THEN MD = 0 : GOTO 1330
1170  REM convert Birthdate
1180  MD = VAL(RIGHT$(T5$,4))*10000!
1190  MO$ = MID$(T5$,4,3)
1200  IF MO$ = "Jan" THEN MD = MD +  100 : GOTO 1320
1210  IF MO$ = "Feb" THEN MD = MD +  200 : GOTO 1320
1220  IF MO$ = "Mar" THEN MD = MD +  300 : GOTO 1320
1230  IF MO$ = "Apr" THEN MD = MD +  400 : GOTO 1320
1240  IF MO$ = "May" THEN MD = MD +  500 : GOTO 1320
1250  IF MO$ = "Jun" THEN MD = MD +  600 : GOTO 1320
1260  IF MO$ = "Jul" THEN MD = MD +  700 : GOTO 1320
1270  IF MO$ = "Aug" THEN MD = MD +  800 : GOTO 1320
1280  IF MO$ = "Sep" THEN MD = MD +  900 : GOTO 1320
1290  IF MO$ = "Oct" THEN MD = MD + 1000 : GOTO 1320
1300  IF MO$ = "Nov" THEN MD = MD + 1100 : GOTO 1320
1310  IF MO$ = "Dec" THEN MD = MD + 1200 : GOTO 1320
1320  MD = MD + VAL(LEFT$(T5$,2))
1330  REM create the husband's index record
1340  IF T2 = 0 THEN 1390  'skip if zero
1350  C = C + 1
1360  REC.NO(C) = T1
1370  PERS.ID(C) = T2
1380  M.DATE(C) = MD
1390  REM create the wife's index record
1400  IF T3 = 0 THEN 1450  'skip if zero
1410  C = C + 1
1420  REC.NO(C) = T1
1430  PERS.ID(C) = T3
1440  M.DATE(C) = MD
1450 NEXT I
1460 CLOSE #2
1470 LOCATE 18,1 : PRINT "There are:"; C; "Index Records";
1700 REM Sort by Person-id
1710 FOR I = 1 TO 6
1720  B(I) = B(I-1)*4+1
1730  IF B(I) <= C/2 THEN K1 = I
1740 NEXT I
1750 B(K1) = INT(C/5)+1
1760 B(1) = 1
1770 LOCATE 22,1 : PRINT SPACE$(79)
1780 LOCATE 22,1 : PRINT "Processing Persons"
1790 FOR I = K1 TO 1 STEP -1
1800  LOCATE 23,1 : PRINT "For Group I:";I;
1810  K1 = B(I)
1820  FOR J = K1 TO C
1830   LOCATE 23,20 : PRINT "J:";J;
1840   MTEMP1 = M.DATE(J) : TEMP2 = REC.NO(J) : TEMP3 = PERS.ID(J)
1850   FOR K = J-K1 TO 0 STEP -K1
1860    LOCATE 23,30 : PRINT "K:";K, "Freespace:";FRE(0)
1870    IF TEMP3 > PERS.ID(K) THEN 1910
1880    IF TEMP3 = PERS.ID(K) AND MTEMP1 > M.DATE(K) THEN 1910
1890    M.DATE(K+K1)=M.DATE(K):REC.NO(K+K1)=REC.NO(K):PERS.ID(K+K1)=PERS.ID(K)
1900   NEXT K
1910   M.DATE(K+K1)=MTEMP1 : REC.NO(K+K1)=TEMP2 : PERS.ID(K+K1)=TEMP3
1920  NEXT J
1930 NEXT I
1940 REM Write the Marriage Index
1945 CLS : LOCATE 21,1
1946 PRINT "Writing the Marriages Index"
1950 OPEN "a:mindex" FOR OUTPUT AS #3
1960 WRITE #3,C
1970 FOR I = 1 TO C
1980  WRITE #3, PERS.ID(I)
1990  WRITE #3, REC.NO(I)
2000 NEXT I
2010 CLOSE #3
2020 CLS : LOCATE 21,1
2030 PRINT "End of Program"
2040 RUN "a:menu"
