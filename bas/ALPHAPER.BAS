90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "Alphabetic Person Name Listing"
105 TITLE$ = TITLE$ + " ON DISPLAY"
110 VERSION$ = "Version 2.0"
115 COPY1$ = "Copyright (c) 1983, 1984, by:"
120 COPY2$ = "Melvin O. Duke"
125 PRICE$ = "$35"
130 ADDR1$ = "Melvin O. Duke"
135 ADDR2$ = "P. O. Box 20836"
140 ADDR3$ = "San Jose, CA  95160"
145 REM Dimension Statements go here
150 DIM IDX$(500), WHERE(500)
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
1000 REM Alphabetic Person Name Listing.
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 OPEN "a:persfile" AS #1 LEN = 256
1030 FIELD 1, 5 AS F1$, 20 AS F2$, 30 AS F3$, 2 AS F4$, 5 AS F5$, 5 AS F6$, 5 AS F7$, 11 AS F8$, 18 AS F9$, 16 AS F10$, 16 AS F11$, 11 AS F12$, 18 AS F13$, 16 AS F14$, 16 AS F15$, 11 AS F16$, 18 AS F17$, 16 AS F18$, 16 AS F19$
1040 CLS
1050 REM Read all records, and print the actual ones
1060 N.ACT = 1
1070 FOR I = 1 TO 500
1080 GET #1, I
1090 LOCATE 23,1 : PRINT "Processing Record:";I,"Freespace:";FRE(0)
1100 REM Extract Information from the File
1110  WHERE(N.ACT) = CVS(F1$)
1120  IF WHERE(N.ACT) < 1 THEN 1410
1130  T2$ = F2$  'Surname
1140  REM Right-trim t2$
1150  FOR J = 1 TO LEN(F2$)-1
1160   IF RIGHT$(T2$,1)=" "THEN T2$=LEFT$(T2$,LEN(T2$)-1) ELSE J=LEN(F2$)-1
1170  NEXT J
1180  T3$ = F3$  'Given Names
1190  REM Right-trim t3$
1200  FOR J = 1 TO LEN(F3$)-1
1210   IF RIGHT$(T3$,1)=" "THEN T3$=LEFT$(T3$,LEN(T3$)-1) ELSE J=LEN(F3$)-1
1220  NEXT J
1230  T8$ = F8$  'Birthdate
1240  REM convert to yyyymmdd
1250  TEMP$ = RIGHT$(T8$,4)
1260  IF MID$(T8$,4,3)="Jan" THEN TEMP$=TEMP$+"01"
1270  IF MID$(T8$,4,3)="Feb" THEN TEMP$=TEMP$+"02"
1280  IF MID$(T8$,4,3)="Mar" THEN TEMP$=TEMP$+"03"
1290  IF MID$(T8$,4,3)="Apr" THEN TEMP$=TEMP$+"04"
1300  IF MID$(T8$,4,3)="May" THEN TEMP$=TEMP$+"05"
1310  IF MID$(T8$,4,3)="Jun" THEN TEMP$=TEMP$+"06"
1320  IF MID$(T8$,4,3)="Jul" THEN TEMP$=TEMP$+"07"
1330  IF MID$(T8$,4,3)="Aug" THEN TEMP$=TEMP$+"08"
1340  IF MID$(T8$,4,3)="Sep" THEN TEMP$=TEMP$+"09"
1350  IF MID$(T8$,4,3)="Oct" THEN TEMP$=TEMP$+"10"
1360  IF MID$(T8$,4,3)="Nov" THEN TEMP$=TEMP$+"11"
1370  IF MID$(T8$,4,3)="Dec" THEN TEMP$=TEMP$+"12"
1380  TEMP$=TEMP$+LEFT$(T8$,2)  'add day
1390  IDX$(N.ACT) = T2$+" "+T3$+TEMP$
1400  N.ACT = N.ACT + 1
1410 NEXT I
1420 N.ACT = N.ACT - 1
1430 LOCATE 23,1 : PRINT SPACE$(79)
1440 REM Sort the index into ascending sequence
1450 CLS
1460 FOR I = 1 TO 6
1470  B(I) = B(I-1)*4+1
1480  IF B(I) <= N.ACT/2 THEN K1 = I
1490 NEXT I
1500 B(K1) = INT(N.ACT/5) +1
1510 B(1) = 1
1520 LOCATE 21,1 : PRINT "Total Records:";N.ACT;
1530 FOR I = K1 TO 1 STEP -1
1540  LOCATE 23,1 : PRINT "Sorting Group:";I
1550  K1 = B(I)
1560  FOR J = K1 TO N.ACT
1570   LOCATE 23,20 : PRINT "J:";J;
1580   K2$ = IDX$(J) : K3 = WHERE(J)
1590   FOR K = J-K1 TO 0 STEP -K1
1600    LOCATE 23,30 : PRINT "K:";K,"Freespace:";FRE(0)
1610    IF K2$ >= IDX$(K) THEN 1640
1620    IDX$(K+K1) = IDX$(K) : WHERE(K+K1) = WHERE(K)
1630   NEXT K
1640   IDX$(K+K1) = K2$ : WHERE(K+K1) = K3
1650  NEXT J
1660 NEXT I
1670 LOCATE 23,1 : PRINT SPACE$(79)
1680 LOCATE 23,1 : PRINT "Printing the Alphabetical List"
1690 GOSUB 1710
1700 GOTO 1760
1710 LPRINT "     Alphabetic Listing of the Persons File   ";DATE$;"  ";TIME$
1720 LPRINT
1730 LPRINT "  REC    SURNAME             GIVEN-NAMES";TAB(60);"BIRTHDATE"
1740 LPRINT "  ---    -------             -----------";TAB(60);"---------"
1750 RETURN
1760 REM Read all records, and print the actual ones
1770 K = 0
1780 CLS
1790 LOCATE 21,1 : PRINT "There are";N.ACT;"records."
1800 FOR I = 1 TO N.ACT
1810  GET #1, ABS(WHERE(I))
1820  LOCATE 23,1 : PRINT "Printing Record:"; I, "Freespace:";FRE(0)
1830  REM Print the information in Alphabetical Order.
1840  T1 = CVS(F1$)
1850  IF T1 < 1 THEN 1930
1860  K = K + 1
1870  T2$ = F2$
1880  T3$ = F3$
1890  T8$ = F8$
1900  IF K MOD 55 = 0 THEN LPRINT CHR$(12);: GOSUB 1710
1910  LPRINT USING "#####";T1,
1920  LPRINT TAB(10); T2$; T3$; TAB(60); T8$
1930 NEXT I
1940 CLOSE #1
1950 CLS : LOCATE 21,1
1960 PRINT "End of Program"
1970 LPRINT CHR$(12);
1980 RUN "a:menu"
