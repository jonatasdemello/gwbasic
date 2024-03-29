90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "Alphabetic List of Marriages"
105 TITLE$ = TITLE$ + " ON DISPLAY"
110 VERSION$ = "Version 2.0"
115 COPY1$ = "Copyright (c) 1983, 1984, by:"
120 COPY2$ = "Melvin O. Duke"
125 PRICE$ = "$35"
130 ADDR1$ = "Melvin O. Duke"
135 ADDR2$ = "P. O. Box 20836"
140 ADDR3$ = "San Jose, CA  95160"
145 REM Dimension Statements go here
150 DIM PERS.ID(400), MARR.ID(400), IDX$(400)
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
1000 REM Alphabetic List of Marriages.
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 OPEN "a:persfile" AS #1 LEN = 256
1030 FIELD 1, 5 AS F1$, 20 AS F2$, 30 AS F3$, 2 AS F4$, 5 AS F5$, 5 AS F6$, 5 AS F7$, 11 AS F8$, 18 AS F9$, 16 AS F10$, 16 AS F11$, 11 AS F12$, 18 AS F13$, 16 AS F14$, 16 AS F15$, 11 AS F16$, 18 AS F17$, 16 AS F18$, 16 AS F19$
1040 REM Read the Marriage Index and then the Person File
1050 CLS
1060 OPEN "a:mindex" FOR INPUT AS #2
1070 INPUT #2, C
1080 LOCATE 19,1 : PRINT "There are:";C;"Marriage Index Records"
1090 FOR I = 1 TO C
1100  INPUT #2, PERS.ID(I), MARR.ID(I)
1110  LOCATE 23,1 : PRINT "Processing Marriage Index Record:";I,"Freespace";FRE(0)
1120  REM get the personal information
1130  GET #1, PERS.ID(I)
1140  REM Extract information from the file for use
1150  T2$ = F2$
1160  FOR J = 1 TO LEN(F2$) -1
1170   IF RIGHT$(T2$,1)=" " THEN T2$=LEFT$(T2$,LEN(T2$)-1) ELSE J=LEN(F2$)-1
1180  NEXT J
1190  T3$ = F3$
1200  FOR J = 1 TO LEN(F3$) -1
1210   IF RIGHT$(T3$,1)=" " THEN T3$=LEFT$(T3$,LEN(T3$)-1) ELSE J=LEN(F3$)-1
1220  NEXT J
1230  IDX$(I) = T2$+T3$
1240 NEXT I
1250 LOCATE 23,1 : PRINT SPACE$(79)
1260 REM Sort the index into ascending sequence
1270 REM
1280 FOR I = 1 TO 6
1290  B(I) = B(I-1)*4+1
1300  IF B(I) <= C/2 THEN K1 = I
1310 NEXT I
1320 B(K1) = INT(C/5)+1
1330 B(1) = 1
1340 FOR I = K1 TO 1 STEP -1
1350 LOCATE 23,1 : PRINT "Sorting Group:";I
1360  K1 = B(I)
1370  FOR J = K1 TO C
1380   LOCATE 23,20 : PRINT "J:";J;
1390   K2$ = IDX$(J) : TEMP1 = PERS.ID(J) : TEMP2 = MARR.ID(J)
1400   FOR K = J-K1 TO 0 STEP -K1
1410    LOCATE 23,30 : PRINT "K:";K, "Freespace:";FRE(0)
1420    IF K2$ > IDX$(K) THEN 1450
1430    IDX$(K+K1)=IDX$(K): PERS.ID(K+K1)=PERS.ID(K): MARR.ID(K+K1)=MARR.ID(K)
1440   NEXT K
1450   IDX$(K+K1)=K2$: PERS.ID(K+K1)=TEMP1: MARR.ID(K+K1)=TEMP2
1460  NEXT J
1470 NEXT I
1480 LOCATE 21,1 : PRINT "Printing the Alphabetical List"
1490 GOSUB 1510
1500 GOTO 1560
1510 LPRINT "   Alphabetic Listing of the Marriages File   ";DATE$;"   ";TIME$
1520 LPRINT
1530 LPRINT "  REC         SURNAME             GIVEN-NAMES"
1540 LPRINT "  ---         ---------------     ---------------------------"
1550 RETURN
1560 REM Read all records, and print the actual ones
1570 K = 0
1580 LOCATE 23,1 : PRINT SPACE$(79)
1590 FOR I = 1 TO C
1600  GET #1, ABS(PERS.ID(I))
1610  LOCATE 23,1 : PRINT "Printing Record:"; I, "Freespace:";FRE(0)
1620  REM Print the information in Alphabetical Order.
1630  T1 = CVS(F1$)
1640  IF T1 < 1 THEN 1710
1650  K = K + 1
1660  T2$ = F2$
1670  T3$ = F3$
1680  LPRINT USING "#####";MARR.ID(I);
1690  LPRINT TAB(15); T2$; T3$
1700  IF K MOD 55 = 0 THEN LPRINT CHR$(12);: GOSUB 1510
1710 NEXT I
1720 CLOSE #1
1730 CLOSE #2
1740 CLS : LOCATE 21,1
1750 PRINT "End of Program
1760 LPRINT CHR$(12);
1770 RUN "a:menu"
