90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "List the Persons File Program"
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
1000 REM List the Persons File.
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 OPEN "a:persfile" AS #1 LEN = 256
1030 FIELD 1, 5 AS F1$, 20 AS F2$, 30 AS F3$, 2 AS F4$, 5 AS F5$, 5 AS F6$, 5 AS F7$, 11 AS F8$, 18 AS F9$, 16 AS F10$, 16 AS F11$, 11 AS F12$, 18 AS F13$, 16 AS F14$, 16 AS F15$, 11 AS F16$, 18 AS F17$, 16 AS F18$, 16 AS F19$
1040 REM Read all records, and print the actual ones
1050 K = 0
1060 CLS : LOCATE 21,1
1070 PRINT "Printing a List of Records in the Persons File"
1080 GOSUB 1100
1090 GOTO 1150
1100 LPRINT "       List of the Records in the Persons File  ";DATE$;"  ";TIME$
1110 LPRINT
1120 LPRINT "     REC GIVEN NAMES-SURNAME";TAB(50);"BIRTHDATE    FATHER  MOTHER
1130 LPRINT "     --- -------------------";TAB(50);"-----------  ------  ------
1140 RETURN
1150 FOR I = 1 TO 500
1160 GET #1, I
1170 LOCATE 23,1 : PRINT "Printing Record:";I
1180 REM Extract information from the file for use
1190 T1 = CVS(F1$)
1200 IF T1 < 1 THEN 1520
1210 K = K + 1
1220 T2$ = F2$
1230 FOR J = 1 TO LEN(F2$)-1
1240  IF RIGHT$(T2$,1)=" "THEN T2$ = LEFT$(T2$,LEN(T2$)-1) ELSE J = LEN(F2$)-1
1250 NEXT J
1260 T3$ = F3$
1270 FOR J = 1 TO LEN(F3$)-1
1280  IF RIGHT$(T3$,1)=" "THEN T3$ = LEFT$(T3$,LEN(T3$)-1) ELSE J = LEN(F3$)-1
1290 NEXT J
1300 T4$ = F4$
1310 IF LEFT$(T4$,1) = "M" THEN T4$ = "Male"
1320 IF LEFT$(T4$,1) = "F" THEN T4$ = "Female"
1330 T5 = CVS(F5$)
1340 T6 = CVS(F6$)
1350 T7 = CVS(F7$)
1360 T8$ = F8$
1370 T9$ = F9$
1380 T10$ = F10$
1390 T11$ = F11$
1400 T12$ = F12$
1410 T13$ = F13$
1420 T14$ = F14$
1430 T15$ = F15$
1440 T16$ = F16$
1450 T17$ = F17$
1460 T18$ = F18$
1470 T19$ = F19$
1480 LPRINT USING "########";T1;
1490 LPRINT " "; T3$; " "; T2$, TAB(50); T8$;
1500 LPRINT USING "######  ######";T6, T7
1510 IF K MOD 55 = 0 THEN LPRINT CHR$(12);: GOSUB 1100
1520 NEXT I
1530 CLOSE #1
1540 LPRINT CHR$(12);
1550 CLS : LOCATE 21,1
1560 PRINT "End of Program"
1570 RUN "a:menu"
