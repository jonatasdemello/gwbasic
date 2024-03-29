90 WIDTH "scrn:",80
95 SCREEN 0,1,0,0
100 TITLE$ = "MENU of Programs in Genealogy"
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
760 PRINT "Have Program Diskette in place, then press any key to continue.";
770 K$ = INKEY$ : IF K$ = "" THEN 770
780 CLS
1000 REM Menu of the available Genealogy Programs.
1010 REM By:  Melvin O. Duke.  Last Updated:  02 December 1983.
1020 REM Draw the Menu itself.
1030 REM Draw the Outer Double Box.
1040 R1 = 1 : C1 = 1 : R2 = 23 : C2 = 79 : GOSUB 400
1050 REM Draw the Heading Separator.
1060 R1 = 3 : C1 = 1 : R2 = 3 : C2 = 79 : GOSUB 2690
1070 REM Draw the Vertical Separators.
1080 R1 = 1 : C1 = 6 : R2 = 23 : C2 = 6 : GOSUB 2830
1090 R1 = 1 : C1 =17 : R2 = 23 : C2 =17 : GOSUB 2830
1100 REM Attach the intersections
1110 LOCATE 3, 6 : PRINT CHR$(197);
1120 LOCATE 3,17 : PRINT CHR$(197);
1130 REM Print the content of the menu.
1140 COLOR 0,7
1150 LOCATE 2,3 : PRINT "No";
1160 LOCATE 2,8 : PRINT "Name"
1170 LOCATE 2,19 : PRINT "Function of the Program"
1180 COLOR 7,0
1190 COLOR 0,7 : LOCATE  4,3 : PRINT " 1"; : COLOR 7,0
1200 LOCATE  4,  8 : PRINT "CREATPER";
1210 LOCATE  4, 19 : PRINT "Creates a Persons File.  (Re-running destroys old file.)";
1220 COLOR 0,7 : LOCATE  5,3 : PRINT " 2"; : COLOR 7,0
1230 LOCATE  5,  8 : PRINT "CREATMAR";
1240 LOCATE  5, 19 : PRINT "Creates a Marriages File.  (Re-running destroys old file.)";
1250 COLOR 0,7 : LOCATE  6,3 : PRINT " 3"; : COLOR 7,0
1260 LOCATE  6,  8 : PRINT "CREATORD";
1270 LOCATE  6, 19 : PRINT "Creates an Ordinances File.  (Re-running destroys old file.)";
1280 COLOR 0,7 : LOCATE  7,3 : PRINT " 4"; : COLOR 7,0
1290 LOCATE  7,  8 : PRINT "UPDATPER";
1300 LOCATE  7, 19 : PRINT "Updates Information in the Persons File."
1310 COLOR 0,7 : LOCATE  8,3 : PRINT " 5"; : COLOR 7,0
1320 LOCATE  8,  8 : PRINT "UPDATMAR";
1330 LOCATE  8, 19 : PRINT "Updates Information in the Marriages File."
1340 COLOR 0,7 : LOCATE  9,3 : PRINT " 6"; : COLOR 7,0
1350 LOCATE  9,  8 : PRINT "UPDATORD";
1360 LOCATE  9, 19 : PRINT "Updates Information in the Ordinances File."
1370 COLOR 0,7 : LOCATE 10,3 : PRINT " 7"; : COLOR 7,0
1380 LOCATE 10,  8 : PRINT "INDEXPC ";
1390 LOCATE 10, 19 : PRINT "Creates a Parent/Child Index.  (For 13, 16 and 18.)";
1400 COLOR 0,7 : LOCATE 11,3 : PRINT " 8"; : COLOR 7,0
1410 LOCATE 11,  8 : PRINT "INDEXMAR";
1420 LOCATE 11, 19 : PRINT "Creates a Marriages Index.  (For 15, 16, 17 and 18.)";
1430 COLOR 0,7 : LOCATE 12,3 : PRINT " 9"; : COLOR 7,0
1440 LOCATE 12,  8 : PRINT "PRINTPER";
1450 LOCATE 12, 19 : PRINT "Prints Information about Persons.";
1460 COLOR 0,7 : LOCATE 13,3 : PRINT "10"; : COLOR 7,0
1470 LOCATE 13,  8 : PRINT "PRINTMAR";
1480 LOCATE 13, 19 : PRINT "Prints Information about Marriages."
1490 COLOR 0,7 : LOCATE 14,3 : PRINT "11"; : COLOR 7,0
1500 LOCATE 14,  8 : PRINT "LISTPER ";
1510 LOCATE 14, 19 : PRINT "Prints a List of the Persons in the Persons File."
1520 COLOR 0,7 : LOCATE 15,3 : PRINT "12"; : COLOR 7,0
1530 LOCATE 15,  8 : PRINT "LISTMAR ";
1540 LOCATE 15, 19 : PRINT "Prints a List of the Marriages in the Marriages File."
1550 COLOR 0,7 : LOCATE 16,3 : PRINT "13"; : COLOR 7,0
1560 LOCATE 16,  8 : PRINT "LISTPCI ";
1570 LOCATE 16, 19 : PRINT "Prints a List of the Parent/Child Index.";
1580 COLOR 0,7 : LOCATE 17,3 : PRINT "14"; : COLOR 7,0
1590 LOCATE 17,  8 : PRINT "ALPHAPER";
1600 LOCATE 17, 19 : PRINT "Prints an Alphabetical List of Persons."
1610 COLOR 0,7 : LOCATE 18,3 : PRINT "15"; : COLOR 7,0
1620 LOCATE 18,  8 : PRINT "ALPHAMAR";
1630 LOCATE 18, 19 : PRINT "Prints an Alphabetical List of Marriages."
1640 COLOR 0,7 : LOCATE 19,3 : PRINT "16"; : COLOR 7,0
1650 LOCATE 19,  8 : PRINT "DISPLAY ";
1660 LOCATE 19, 19 : PRINT "Displays Genealogical Information on the Screen."
1670 COLOR 0,7 : LOCATE 20,3 : PRINT "17"; : COLOR 7,0
1680 LOCATE 20,  8 : PRINT "PEDIGREE";
1690 LOCATE 20, 19 : PRINT "Prints Pedigree Charts (Family Trees)."
1700 COLOR 0,7 : LOCATE 21,3 : PRINT "18"; : COLOR 7,0
1710 LOCATE 21,  8 : PRINT "FAMILY  ";
1720 LOCATE 21, 19 : PRINT "Prints Family Group Sheets."
1722 COLOR 0,7 : LOCATE 22,3 : PRINT "19"; : COLOR 7,0
1724 LOCATE 22,  8 : PRINT "MENU";
1726 LOCATE 22, 19 : PRINT "Menu of Programs in Genealogy ON DISPLAY. (This program.)"
1730 REM Now obtain User Response
1740 LOCATE 24,1 : INPUT "Enter a Program Number (0 to quit), and press RETURN."; REPLY
1750 IF REPLY = 0 THEN 2900
1760 IF REPLY < 0 OR REPLY > 19 THEN 780
1790 IF REPLY =  1 THEN RUN "a:creatper"
1800 IF REPLY =  2 THEN RUN "a:creatmar"
1810 IF REPLY =  3 THEN RUN "a:creatord"
1820 IF REPLY =  4 THEN RUN "a:updatper"
1830 IF REPLY =  5 THEN RUN "a:updatmar"
1840 IF REPLY =  6 THEN RUN "a:updatord"
1850 IF REPLY =  7 THEN RUN "a:indexpc"
1860 IF REPLY =  8 THEN RUN "a:indexmar"
1870 IF REPLY =  9 THEN RUN "a:printper"
1880 IF REPLY = 10 THEN RUN "a:printmar"
1890 IF REPLY = 11 THEN RUN "a:listper"
1900 IF REPLY = 12 THEN RUN "a:listmar"
1910 IF REPLY = 13 THEN RUN "a:listpci"
1920 IF REPLY = 14 THEN RUN "a:alphaper"
1930 IF REPLY = 15 THEN RUN "a:alphamar"
1940 IF REPLY = 16 THEN RUN "a:display"
1950 IF REPLY = 17 THEN RUN "a:pedigree"
1960 IF REPLY = 18 THEN RUN "a:family"
1970 IF REPLY = 19 THEN RUN "a:menu"
2590 STOP
2600 REM Shouldn't get to here, but if you do, quit.
2610 GOTO 2900
2620 REM Subroutine to draw a double horizontal line.  Attach to double.
2630 FOR J = C1 + 1 TO C2 - 1
2640  LOCATE R1,J : PRINT CHR$(205);
2650 NEXT J
2660 LOCATE R1,C1 : PRINT CHR$(204);
2670 LOCATE R1,C2 : PRINT CHR$(185);
2680 RETURN
2690 REM Subroutine to draw a single horizontal line.  Attach to double.
2700 FOR J = C1 + 1 TO C2 - 1
2710  LOCATE R1,J : PRINT CHR$(196);
2720 NEXT J
2730 LOCATE R1,C1 : PRINT CHR$(199);
2740 LOCATE R1,C2 : PRINT CHR$(182);
2750 RETURN
2760 REM Subroutine to draw a double vertical line.  Attach to double.
2770 FOR I = R1 + 1 TO R2 - 1
2780  LOCATE I,C1 : PRINT CHR$(186);
2790 NEXT I
2800 LOCATE R1,C1 : PRINT CHR$(203);
2810 LOCATE R2,C1 : PRINT CHR$(202);
2820 RETURN
2830 REM Subroutine to draw a single vertical line.  Attach to double.
2840 FOR I = R1 + 1 TO R2 - 1
2850  LOCATE I,C1 : PRINT CHR$(179);
2860 NEXT I
2870 LOCATE R1,C1 : PRINT CHR$(209);
2880 LOCATE R2,C1 : PRINT CHR$(207);
2890 RETURN
2900 CLS : LOCATE 21,1
2910 PRINT "End of Program"
2920 END
