90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "Persons File Creation Program"
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
800 REM Give the User one more chance to protect himself.
810 LOCATE 10,1
820 PRINT "This program creates a Persons-file by writing new, empty records."
830 PRINT "It will destroy any data which exists with the same record-numbers."
840 PRINT
850 PRINT "If this is REALLY what you want to do,"
860 PRINT "type  y  to continue, and press the return key."
870 PRINT "Otherwise, type anything else, and press the return key."
880 PRINT
890 INPUT "Enter your desired action.",REPLY$
900 IF REPLY$ <> "y" THEN 1360
1000 REM Persons File Creation Program
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 OPEN "a:persfile" AS #1 LEN = 256
1030 FIELD 1,5ASF1$,20ASF2$,30ASF3$,2ASF4$,5ASF5$,5ASF6$,5ASF7$,11ASF8$,18ASF9$,16ASF10$,16ASF11$,11ASF12$,18ASF13$,16ASF14$,16ASF15$,11ASF16$,18ASF17$,16ASF18$,16ASF19$
1040 CLS
1050 FOR I = 1 TO 500
1060  TEMP = -I
1070  TEMP$ = MKS$(TEMP)
1080  LSET F1$ = TEMP$
1090  TEMP$ = " "
1100  TEMP = 0
1110  LSET F2$ = TEMP$
1120  LSET F3$ = TEMP$
1130  LSET F4$ = TEMP$
1140  LSET F5$ = MKS$(TEMP)
1150  LSET F6$ = MKS$(TEMP)
1160  LSET F7$ = MKS$(TEMP)
1170  REM all the rest are string
1180  LSET F8$ = TEMP$
1190  LSET F9$ = TEMP$
1200  LSET F10$ = TEMP$
1210  LSET F11$ = TEMP$
1220  LSET F12$ = TEMP$
1230  LSET F13$ = TEMP$
1240  LSET F14$ = TEMP$
1250  LSET F15$ = TEMP$
1260  LSET F16$ = TEMP$
1270  LSET F17$ = TEMP$
1280  LSET F18$ = TEMP$
1290  LSET F19$ = TEMP$
1300  LOCATE 23,1 : PRINT "Writing Record Number:";I
1310  PUT #1,I
1320 NEXT I
1330 CLOSE #1
1340 CLS : LOCATE 21,1
1350 PRINT "End of Program"
1360 RUN "a:menu"
