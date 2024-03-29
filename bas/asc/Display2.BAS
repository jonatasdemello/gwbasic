90 WIDTH "scrn:", 80
95 SCREEN 0,1,0,0
100 TITLE$ = "Display Program"
105 TITLE$ = TITLE$ + " ON DISPLAY"
110 VERSION$ = "Version 2.0"
115 COPY1$ = "Copyright (c) 1983, 1984, by:"
120 COPY2$ = "Melvin O. Duke"
125 PRICE$ = "$35"
130 ADDR1$ = "Melvin O. Duke"
135 ADDR2$ = "P. O. Box 20836"
140 ADDR3$ = "San Jose, CA  95160"
145 REM Dimension Statements go here
150 DIM PA.ID(1000), CH.ID(1000), PERS.NO(400), M.NO(400)
160 DIM PERS(15), CH(55)
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
850 GOTO 2450
1000 REM Display (showgene) Program.
1010 REM By:  Melvin O. Duke.  Last Updated:  18 February 1984.
1020 REM Draw the form on the display
1030 R1= 1 : C1= 1 : R2=21 : C2=79: GOSUB 400 'Double box
1040 R1= 3 : C1= 1 : R2= 3 : C2=79: GOSUB 2170 'Horizontal Double
1050 LOCATE 2,3 : PRINT "Pedigree Chart for:"
1060 LOCATE 4,68 : COLOR 1 : PRINT "Birthdate:" : COLOR 7
1070 LOCATE 12, 3 : I = 1 : GOSUB 1470
1080 LOCATE  8,11 : PRINT CHR$(218)+CHR$(196);
1090 LOCATE  9,11 : PRINT CHR$(179);
1100 LOCATE 10,11 : PRINT CHR$(179);
1110 LOCATE 11,11 : PRINT CHR$(179);
1120 LOCATE  8,13 : I = 2 : GOSUB 1510
1130 LOCATE 16,11 : PRINT CHR$(192)+CHR$(196);
1140 LOCATE 13,11 : PRINT CHR$(179);
1150 LOCATE 14,11 : PRINT CHR$(179);
1160 LOCATE 15,11 : PRINT CHR$(179);
1170 LOCATE 16,13 : I = 3 : GOSUB 1510
1180 LOCATE  6,21 : PRINT CHR$(218)+CHR$(196);
1190 LOCATE  7,21 : PRINT CHR$(179);
1200 LOCATE  6,23 : I = 4 : GOSUB 1540
1210 LOCATE 10,21 : PRINT CHR$(192)+CHR$(196);
1220 LOCATE  9,21 : PRINT CHR$(179);
1230 LOCATE 10,23 : I = 5 : GOSUB 1540
1240 LOCATE 14,21 : PRINT CHR$(218)+CHR$(196);
1250 LOCATE 15,21 : PRINT CHR$(179);
1260 LOCATE 14,23 : I = 6 : GOSUB 1540
1270 LOCATE 18,21 : PRINT CHR$(192)+CHR$(196);
1280 LOCATE 17,21 : PRINT CHR$(179);
1290 LOCATE 18,23 : I = 7 : GOSUB 1540
1300 LOCATE  5,31 : PRINT CHR$(218)+CHR$(196);
1310 LOCATE  5,33 : I = 8 : GOSUB 1570
1320 LOCATE  7,31 : PRINT CHR$(192)+CHR$(196);
1330 LOCATE  7,33 : I = 9 : GOSUB 1570
1340 LOCATE  9,31 : PRINT CHR$(218)+CHR$(196);
1350 LOCATE  9,33 : I = 10 : GOSUB 1570
1360 LOCATE 11,31 : PRINT CHR$(192)+CHR$(196);
1370 LOCATE 11,33 : I = 11 : GOSUB 1570
1380 LOCATE 13,31 : PRINT CHR$(218)+CHR$(196);
1390 LOCATE 13,33 : I = 12 : GOSUB 1570
1400 LOCATE 15,31 : PRINT CHR$(192)+CHR$(196);
1410 LOCATE 15,33 : I = 13 : GOSUB 1570
1420 LOCATE 17,31 : PRINT CHR$(218)+CHR$(196);
1430 LOCATE 17,33 : I = 14 : GOSUB 1570
1440 LOCATE 19,31 : PRINT CHR$(192)+CHR$(196);
1450 LOCATE 19,33 : I = 15 : GOSUB 1570
1460 RETURN
1470 REM Routine to print the lines
1480 COLOR 0,7 : PRINT RIGHT$(STR$(I),2);
1490 COLOR 1,0 : PRINT STRING$(62,95); : COLOR 7
1500 RETURN
1510 COLOR 0,7 : PRINT RIGHT$(STR$(I),2);
1520 COLOR 1,0 : PRINT STRING$(52,95); : COLOR 7
1530 RETURN
1540 COLOR 0,7 : PRINT RIGHT$(STR$(I),2);
1550 COLOR 1,0 : PRINT STRING$(42,95); : COLOR 7
1560 RETURN
1570 COLOR 0,7 : PRINT RIGHT$(STR$(I),2);
1580 COLOR 1,0 : PRINT STRING$(32,95); : COLOR 7
1590 RETURN
1600 REM Draw the Personal Information Chart
1610 CLS
1620 R1 = 1 : C1 = 1 : R2 = 21 : C2 = 79 : GOSUB 400  'Double box
1630 R1 = 3 : C1 = 1 : R2 = 3 : C2 = 79 : GOSUB 2170  'Horizontal double
1640 LOCATE 2,3 : PRINT "Personal Information for:"
1650 R1 = 3 : C1 = 40 : R2 = 21 : C2 = 40 : GOSUB 2310  'Vertical Double
1660 LOCATE 4,3 : PRINT "Person:";
1665 LOCATE 5,3 : PRINT "Record-no.:";
1670 LOCATE 6,3 : PRINT "Surname:";
1680 LOCATE 7,3 : PRINT "Given-names:";
1690 LOCATE 8,3 : PRINT "Sex:";
1700 R1 = 9 : C1 = 1 : R2 =11 : C2 = 40 : GOSUB 2170  'Horizontal Double
1710 LOCATE 10,3 : PRINT "Person's Father:";
1715 LOCATE 11,3 : PRINT "Record-no.:";
1720 LOCATE 12,3 : PRINT "Surname:";
1730 LOCATE 13,3 : PRINT "Given-names:";
1740 LOCATE 14,3 : PRINT "Birth-date:";
1750 R1 = 15 : C1 = 1 : R2 = 15 : C2 = 40 : GOSUB 2240  'Horizontal Single
1760 LOCATE 16,3 : PRINT "Person's Mother:";
1765 LOCATE 17,3 : PRINT "Record-no.:";
1770 LOCATE 18,3 : PRINT "Surname:";
1780 LOCATE 19,3 : PRINT "Given-names:";
1790 LOCATE 20,3 : PRINT "Birth-date:";
1800 LOCATE 4,42 : PRINT "Person's Vital Statistics:";
1810 LOCATE 6,42 : PRINT "Birth-date:";
1820 LOCATE 7,42 : PRINT "Birth-city:";
1830 LOCATE 8,42 : PRINT "Birth-county:";
1840 LOCATE 9,42 : PRINT "Birth-state:";
1850 LOCATE 11,42 : PRINT "Death-date:";
1860 LOCATE 12,42 : PRINT "Death-city:";
1870 LOCATE 13,42 : PRINT "Death-county:";
1880 LOCATE 14,42 : PRINT "Death-state:";
1890 LOCATE 16,42 : PRINT "Burial-date:";
1900 LOCATE 17,42 : PRINT "Burial-city:";
1910 LOCATE 18,42 : PRINT "Burial-county:";
1920 LOCATE 19,42 : PRINT "Burial-state:";
1930 RETURN
1940 REM draw a Family Group Sheet
1950 CLS
1960 R1 = 1 : C1 = 1 : R2 = 21 : C2 = 79 : GOSUB 400  'Double box
1970 R1 = 3 : C1 = 1 : R2 = 3 : C2 = 79 : GOSUB 2170  'Double Horizontal
1980 LOCATE 2,3 : PRINT "Family Group Record";
1985 LOCATE 2,64 : PRINT "Marriage:";
1990 LOCATE 4,3 : COLOR 1 : PRINT "Father"; : COLOR 7 : PRINT ":";
2000 LOCATE 4,56 : PRINT "Birthdate:";
2010 LOCATE 5,3 : COLOR 1 : PRINT "Mother"; : COLOR 7 : PRINT ":";
2020 LOCATE 5,56 : PRINT "Birthdate:";
2030 R1 = 6 : C1 = 1 : R2 = 6 : C2 = 79 : GOSUB 2240  'Single Horizontal
2040 LOCATE 7,3 : PRINT "Marriage Date:";
2050 LOCATE 7,35 : PRINT "Location:";
2060 R1 = 8 : C1 = 1 : R2 = 8 : C2 = 79 : GOSUB 2170  'Double Horizontal
2070 R1 = 8 : C1 = 4 : R2 = 21 : C2 = 4 : GOSUB 2380  'Single Vertical
2080 R1 = 8 : C1 = 6 : R2 = 21 : C2 = 6 : GOSUB 2380  'Single Vertical
2090 R1 = 8 : C1 = 40 : R2 = 21 : C2 = 40 : GOSUB 2380  'Single Vertical
2100 LOCATE 9,2 : COLOR 1 : PRINT "NO"; : COLOR 7
2110 LOCATE 9,5 : COLOR 1 : PRINT "S"; : COLOR 7
2120 LOCATE 9,7 : COLOR 1 : PRINT "Children:"; : COLOR 7
2130 LOCATE 9,41 : COLOR 1 : PRINT "Birthdate:"; : COLOR 7
2140 R1 = 8 : C1 = 52 : R2 = 21 : C2 = 52 : GOSUB 2380  'Single Vertical
2150 LOCATE 9,53 : COLOR 1 : PRINT "Birth Location:"; : COLOR 7
2160 RETURN
2170 REM Subroutine to draw a double horizontal line.  Attach to double.
2180 FOR J = C1 + 1 TO C2 - 1
2190  LOCATE R1,J : PRINT CHR$(205);
2200 NEXT J
2210 LOCATE R1,C1 : PRINT CHR$(204);
2220 LOCATE R1,C2 : PRINT CHR$(185);
2230 RETURN
2240 REM Subroutine to draw a single horizontal line.  Attach to double.
2250 FOR J = C1 + 1 TO C2 - 1
2260  LOCATE R1,J : PRINT CHR$(196);
2270 NEXT J
2280 LOCATE R1,C1 : PRINT CHR$(199);
2290 LOCATE R1,C2 : PRINT CHR$(182);
2300 RETURN
2310 REM Subroutine to draw a double vertical line.  Attach to double.
2320 FOR I = R1 + 1 TO R2 - 1
2330  LOCATE I,C1 : PRINT CHR$(186);
2340 NEXT I
2350 LOCATE R1,C1 : PRINT CHR$(203);
2360 LOCATE R2,C1 : PRINT CHR$(202);
2370 RETURN
2380 REM Subroutine to draw a single vertical line.  Attach to double.
2390 FOR I = R1 + 1 TO R2 - 1
2400  LOCATE I,C1 : PRINT CHR$(179);
2410 NEXT I
2420 LOCATE R1,C1 : PRINT CHR$(209);
2430 LOCATE R2,C1 : PRINT CHR$(207);
2440 RETURN
2450 REM Program begins here
2460 REM By:  Melvin O. Duke.
2470 REM Read the Parent/Child Index
2480 OPEN "a:pcindex" FOR INPUT AS #1
2490 LOCATE 4,1 : PRINT "Open the Parent/Child Index";
2500 INPUT #1, PC.COUNT
2510 FOR I = 1 TO PC.COUNT
2520 LOCATE 5,1 : PRINT "Reading Index Record #:";I;
2530  INPUT #1, PA.ID(I), CH.ID(I)
2540 NEXT I
2550 CLOSE #1
2560 REM Read the Marriage Index
2570 LOCATE 7,1 : PRINT "Open the Marriage Index";
2580 OPEN "a:mindex" FOR INPUT AS #2
2590 INPUT #2, M.COUNT
2600 FOR I = 1 TO M.COUNT
2610 LOCATE 8,1 : PRINT "Reading Marriage Index Record #:";I:
2620  INPUT #2,PERS.NO(I), M.NO(I)
2630 NEXT I
2640 CLOSE #2
2650 REM Open the Persons File
2660 LOCATE 10,1 : PRINT "Open the Persons File"
2670 OPEN "a:persfile" AS #1 LEN = 256
2680 FIELD 1, 5 AS F1$, 20 AS F2$, 30 AS F3$, 2 AS F4$, 5 AS F5$, 5 AS F6$, 5 AS F7$, 11 AS F8$, 18 AS F9$, 16 AS F10$, 16 AS F11$, 11 AS F12$, 18 AS F13$, 16 AS F14$, 16 AS F15$, 11 AS F16$, 18 AS F17$, 16 AS F18$, 16 AS F19$
2690 REM open the Marriages File
2700 LOCATE 12,1 : PRINT "Open the Marriage File"
2710 OPEN "a:marrfile" AS #2 LEN = 128
2720 FIELD 2, 5 AS M1$, 5 AS M2$, 5 AS M3$, 5 AS M4$, 11 AS M5$, 18 AS M6$, 16 AS M7$, 16 AS M8$, 45 AS M9$
2730 REM Open the Ordinance File
2740 LOCATE 14,1 : PRINT "Open the Ordinances File";
2750 OPEN "a:ordfile" AS #3 LEN = 256
2760 FIELD 3,5ASO1$,11ASO2$,11ASO3$,11ASO4$,5ASO5$,5ASO6$,11ASO7$,11ASO8$,11ASO9$,11ASO10$,11ASO11$,5ASO12$,11ASO13$,11ASO14$,11ASO15$,11ASO16$,11ASO17$,11ASO18$,11ASO19$,11ASO20$,11ASO21$,11ASO22$,11ASO23$,26ASO24$
2770 REM Obtain a Person Record from the User
2780 LOCATE 20,1 : PRINT SPACE$(79);
2790 LOCATE 20,1 : INPUT "Enter the Record-number of a Person (0 to quit)";PERS(1)
2800 IF PERS(1) < 0 OR PERS(1) > 500 THEN CLS: GOTO 2770
2805 IF PERS(1) = 0 THEN 7390
2810 REM Obtain the information about a person
2820 GET #1, PERS(1)
2830 GOSUB 3300  'Extract Personal Information
2840 GOSUB 1600
2850 LOCATE 2,30 : PRINT T3$ + " " + T2$;
2854 LOCATE 2,66 : PRINT "Person:";T1
2855 LOCATE 5,16 : PRINT T1
2860 LOCATE 6,16 : PRINT T2$;
2870 LOCATE 7,16 : PRINT T3$;
2880 LOCATE 8,16 : PRINT T4$;
2890 LOCATE 6,57 : PRINT T8$;
2900 LOCATE 7,57 : PRINT T9$;
2910 LOCATE 8,57 : PRINT T10$;
2920 LOCATE 9,57 : PRINT T11$;
2930 LOCATE 11,57 : PRINT T12$;
2940 LOCATE 12,57 : PRINT T13$;
2950 LOCATE 13,57 : PRINT T14$;
2960 LOCATE 14,57 : PRINT T15$;
2970 LOCATE 16,57 : PRINT T16$;
2980 LOCATE 17,57 : PRINT T17$;
2990 LOCATE 18,57 : PRINT T18$;
3000 LOCATE 19,57 : PRINT T19$;
3010 PERS(2) = T6
3020 PERS(3) = T7
3030 REM Check if Father is known
3040 IF PERS(2) = 0 THEN GOSUB 3590 : GOTO 3065
3050 GET #1, PERS(2)
3060 GOSUB 3300  'Extract
3065 LOCATE 11,16 : PRINT T1;
3070 LOCATE 12,16 : PRINT T2$;
3080 LOCATE 13,16 : PRINT T3$;
3090 LOCATE 14,16 : PRINT T8$;
3100 REM Check if Mother is known
3110 IF PERS(3) = 0 THEN GOSUB 3590 : GOTO 3135
3120 GET #1, PERS(3)
3130 GOSUB 3300  'Extract
3135 LOCATE 17,16 : PRINT T1;
3140 LOCATE 18,16 : PRINT T2$;
3150 LOCATE 19,16 : PRINT T3$;
3160 LOCATE 20,16 : PRINT T8$;
3170 LOCATE 23,1 : PRINT SPACE$(79);
3180 LOCATE 24,1 : PRINT SPACE$(79);
3190 LOCATE 24,1 : PRINT "(Possible Actions:  ps, pc, fg, ";
3191 PRINT "o, ";
3192 PRINT "p1...pn, m1...mn, q)";
3200 LOCATE 23,1 : INPUT "Next Action"; REPLY$
3210 IF REPLY$ = "ps" THEN GOSUB 6080 : GOTO 3170
3220 IF REPLY$ = "sp" THEN GOSUB 6080 : GOTO 3170
3230 IF REPLY$ = "pc" THEN 3800  'Pedigree Chart
3240 IF REPLY$ = "fg" THEN 5070  'Family Group
3250 IF REPLY$ = "o" THEN 6220  'Ordinances
3260 IF LEFT$(REPLY$,1) = "p" THEN PERS(1) = VAL(RIGHT$(REPLY$,LEN(REPLY$)-1)) : CLS : GOTO 2800
3270 IF LEFT$(REPLY$,1) = "m" THEN 7260
3280 IF LEFT$(REPLY$,1) = "q" THEN 7390
3290 LOCATE 22,1 : PRINT "Error in Previous Reply ";REPLY$; : GOTO 3170
3300 REM Routine to Extract Personal Information
3310 T1 = CVS(F1$)
3320 T2$ = F2$
3330 FOR J = 1 TO LEN(F2$) -1
3340  IF RIGHT$(T2$,1)=" " THEN T2$ = LEFT$(T2$,LEN(T2$)-1) ELSE J = LEN(F2$)-1
3350 NEXT J
3360 T3$ = F3$
3370 FOR J = 1 TO LEN(F3$) -1
3380  IF RIGHT$(T3$,1)=" " THEN T3$ = LEFT$(T3$,LEN(T3$)-1) ELSE J = LEN(F3$)-1
3390 NEXT J
3400 T4$ = F4$
3410 IF LEFT$(T4$,1) = "M" THEN T4$ = "Male"
3420 IF LEFT$(T4$,1) = "F" THEN T4$ = "Female"
3430 T5 = CVS(F5$)
3440 T6 = CVS(F6$)
3450 T7 = CVS(F7$)
3460 T8$ = F8$
3470 T9$ = F9$
3480 T10$ = F10$
3490 T11$ = F11$
3500 T12$ = F12$
3510 T13$ = F13$
3520 T14$ = F14$
3530 T15$ = F15$
3540 T16$ = F16$
3550 T17$ = F17$
3560 T18$ = F18$
3570 T19$ = F19$
3580 RETURN
3590 REM Blank out a Record
3600 T1 = 0
3610 T2$ = ""
3620 T3$ = ""
3630 T4$ = ""
3640 T5 = 0
3650 T6 = 0
3660 T7 = 0
3670 T8$ = ""
3680 T9$ = ""
3690 T10$ = ""
3700 T11$ = ""
3710 T12$ = ""
3720 T13$ = ""
3730 T14$ = ""
3740 T15$ = ""
3750 T16$ = ""
3760 T17$ = ""
3770 T18$ = ""
3780 T19$ = ""
3790 RETURN
3800 REM Routine to Produce a Pedigree Chart
3810 CLS
3820 GOSUB 1000 'Draw the Chart
3830 GET #1, PERS(1)
3840 GOSUB 3300  'Extract the Person
3850 LOCATE 2,23 : PRINT T3$ + " " + T2$;
3855 LOCATE 2,66 : PRINT "Person:"; PERS(1);
3859 THIS.PERS = PERS(1) : GOSUB 7460
3860 LOCATE 12,6 : COLOR 1 : PRINT VALUE$; : COLOR 7
3870 LOCATE 12,68 : PRINT T8$;
3880 PERS(2) = T6
3890 PERS(3) = T7
3900 REM Get 11
3910 IF PERS(2) = 0 THEN GOSUB 3590 : GOTO 3960
3920 GET #1, PERS(2)
3930 GOSUB 3300  'Extract
3939 THIS.PERS = PERS(2) : GOSUB 7460
3940 LOCATE 8,16 : COLOR 1 : PRINT VALUE$; : COLOR 7
3950 LOCATE 8,68 : PRINT T8$;
3960 PERS(4) = T6
3970 PERS(5) = T7
3980 REM Get 10
3990 IF PERS(3) = 0 THEN GOSUB 3590 : GOTO 4040
4000 GET #1, PERS(3)
4010 GOSUB 3300  'Extract
4019 THIS.PERS = PERS(3): GOSUB 7460
4020 LOCATE 16,16 : COLOR 1 : PRINT VALUE$; : COLOR 7
4030 LOCATE 16,68 : PRINT T8$;
4040 PERS(6) = T6
4050 PERS(7) = T7
4060 REM Get 111
4070 IF PERS(4) = 0 THEN GOSUB 3590 : GOTO 4120
4080 GET #1, PERS(4)
4090 GOSUB 3300  'Extract
4099 THIS.PERS = PERS(4): GOSUB 7460
4100 LOCATE 6,26 : COLOR 1 : PRINT VALUE$; : COLOR 7
4110 LOCATE 6,68 : PRINT T8$;
4120 PERS(8) = T6
4130 PERS(9) = T7
4140 REM Get 110
4150 IF PERS(5) = 0 THEN GOSUB 3590 : GOTO 4200
4160 GET #1, PERS(5)
4170 GOSUB 3300  'Extract
4179 THIS.PERS = PERS(5): GOSUB 7460
4180 LOCATE 10,26 : COLOR 1 : PRINT VALUE$; : COLOR 7
4190 LOCATE 10,68 : PRINT T8$;
4200 PERS(10) = T6
4210 PERS(11) = T7
4220 REM Get 101
4230 IF PERS(6) = 0 THEN GOSUB 3590 : GOTO 4280
4240 GET #1, PERS(6)
4250 GOSUB 3300  'Extract
4259 THIS.PERS = PERS(6): GOSUB 7460
4260 LOCATE 14,26 : COLOR 1 : PRINT VALUE$; : COLOR 7
4270 LOCATE 14,68 : PRINT T8$;
4280 PERS(12) = T6
4290 PERS(13) = T7
4300 REM Get 100
4310 IF PERS(7) = 0 THEN GOSUB 3590 : GOTO 4360
4320 GET #1, PERS(7)
4330 GOSUB 3300  'Extract
4339 THIS.PERS = PERS(7): GOSUB 7460
4340 LOCATE 18,26 : COLOR 1 : PRINT VALUE$; : COLOR 7
4350 LOCATE 18,68 : PRINT T8$;
4360 PERS(14) = T6
4370 PERS(15) = T7
4380 REM Get 1111
4390 IF PERS(8) = 0 THEN GOSUB 3590 : GOTO 4440
4400 GET #1, PERS(8)
4410 GOSUB 3300  'Extract
4419 THIS.PERS = PERS(8): GOSUB 7460
4420 LOCATE  5,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4430 LOCATE  5,68 : PRINT T8$;
4440 REM
4450 REM Get 1110
4460 IF PERS(9) = 0 THEN GOSUB 3590 : GOTO 4510
4470 GET #1, PERS(9)
4480 GOSUB 3300  'Extract
4489 THIS.PERS = PERS(9): GOSUB 7460
4490 LOCATE  7,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4500 LOCATE  7,68 : PRINT T8$;
4510 REM
4520 REM Get 1101
4530 IF PERS(10) = 0 THEN GOSUB 3590 : GOTO 4580
4540 GET #1, PERS(10)
4550 GOSUB 3300  'Extract
4559 THIS.PERS = PERS(10): GOSUB 7460
4560 LOCATE  9,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4570 LOCATE  9,68 : PRINT T8$;
4580 REM
4590 REM Get 1100
4600 IF PERS(11) = 0 THEN GOSUB 3590 : GOTO 4650
4610 GET #1, PERS(11)
4620 GOSUB 3300  'Extract
4629 THIS.PERS = PERS(11): GOSUB 7460
4630 LOCATE 11,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4640 LOCATE 11,68 : PRINT T8$;
4650 REM
4660 REM Get 1011
4670 IF PERS(12) = 0 THEN GOSUB 3590 : GOTO 4720
4680 GET #1, PERS(12)
4690 GOSUB 3300  'Extract
4699 THIS.PERS = PERS(12): GOSUB 7460
4700 LOCATE 13,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4710 LOCATE 13,68 : PRINT T8$;
4720 REM
4730 REM Get 1010
4740 IF PERS(13) = 0 THEN GOSUB 3590 : GOTO 4790
4750 GET #1, PERS(13)
4760 GOSUB 3300  'Extract
4769 THIS.PERS = PERS(13): GOSUB 7460
4770 LOCATE 15,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4780 LOCATE 15,68 : PRINT T8$;
4790 REM
4800 REM Get 1001
4810 IF PERS(14) = 0 THEN GOSUB 3590 : GOTO 4860
4820 GET #1, PERS(14)
4830 GOSUB 3300  'Extract
4839 THIS.PERS = PERS(14): GOSUB 7460
4840 LOCATE 17,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4850 LOCATE 17,68 : PRINT T8$;
4860 REM
4870 REM Get 1000
4880 IF PERS(15) = 0 THEN GOSUB 3590 : GOTO 4930
4890 GET #1, PERS(15)
4900 GOSUB 3300  'Extract
4909 THIS.PERS = PERS(15): GOSUB 7460
4910 LOCATE 19,36 : COLOR 1 : PRINT VALUE$; : COLOR 7
4920 LOCATE 19,68 : PRINT T8$;
4930 REM
4940 LOCATE 23,1 : PRINT SPACE$(79);
4950 LOCATE 24,1 : PRINT SPACE$(79);
4960 LOCATE 24,1 : PRINT "(Possible Actions:  ps, pc, fg, l1...ln, p1...pn, m1...mn, q)";
4970 LOCATE 23,1 : INPUT "Next Action"; REPLY$
4980 IF REPLY$ = "ps" THEN GOSUB 6080 : GOTO 4940
4990 IF REPLY$ = "sp" THEN GOSUB 6080 : GOTO 4940
5000 IF REPLY$ = "pc" THEN 3800
5010 IF REPLY$ = "fg" THEN 5070
5020 IF LEFT$(REPLY$,1) = "l" THEN PERS(1) = PERS(VAL(RIGHT$(REPLY$,LEN(REPLY$)-1))) : GOTO 2810
5030 IF LEFT$(REPLY$,1) = "p" THEN PERS(1) = VAL(RIGHT$(REPLY$,LEN(REPLY$)-1)) : GOTO 2800
5040 IF LEFT$(REPLY$,1) = "m" THEN 7260
5050 IF LEFT$(REPLY$,1) = "q" THEN 7390
5060 LOCATE 22,1 : PRINT "Error in Previous Reply ";REPLY$; : GOTO 4940
5070 REM Routine to Produce a Family Group Record
5080 CLS
5090 GOSUB 1940  'Draw the form
5100 REM search the marriage index for the Person's Marriage
5110 FOUND = 0
5120 FOR L = 1 TO M.COUNT
5130  IF PERS(1) > PERS.NO(L) THEN 5190
5140  IF PERS(1) < PERS.NO(L) THEN L = M.COUNT : GOTO 5190
5150  REM found a Marriage
5160  FOUND = 1
5170  GET #2, M.NO(L)
5180  L = M.COUNT
5190 NEXT L
5200 IF FOUND = 1 THEN 5260
5210 REM No marriage found
5220 LOCATE 22,1 : PRINT "No Marriage Found";
5230 LOCATE 23,1 : PRINT "Press any key to continue";
5240 A$ = INKEY$ : IF A$ = "" THEN 5240
5250 CLS : GOTO 2810
5260 REM extract Information from the Marriage Record
5270 TT1 = CVS(M1$)
5275 IF TT1 < 1 THEN 5210
5280 TT2 = CVS(M2$)
5290 TT3 = CVS(M3$)
5300 TT4 = CVS(M4$)
5310 TT5$ = M5$
5320 TT6$ = M6$
5330 TT7$ = M7$
5340 TT8$ = M8$
5350 TT9$ = M9$
5360 REM print the Marriage Information
5365 LOCATE 2,73 : PRINT TT1
5370 LOCATE 7,18 : PRINT TT5$
5380 LOCATE 7,45 : PRINT TT6$
5390 REM get the Husband's Record
5400 GET #1, TT2
5410 GOSUB 3300  'Extract
5419 THIS.PERS = TT2 : GOSUB 7460
5420 LOCATE 4,11 : PRINT VALUE$;
5430 LOCATE 4,67 : PRINT T8$;
5440 REM get the Wife's Record
5450 GET #1, TT3
5460 GOSUB 3300  'Extract
5469 THIS.PERS = TT3 : GOSUB 7460
5470 LOCATE 5,11 : PRINT VALUE$;
5480 LOCATE 5,67 : PRINT T8$;
5490 REM now find the children
5500 CHILD.COUNT = 0
5510 FOR IC = 1 TO 55
5520  CH(IC) = 0
5530 NEXT IC
5540 REM search the parent/child index
5550 FOR LL = 1 TO PC.COUNT
5560  IF TT2 > PA.ID(LL) THEN 5890
5570  IF TT2 < PA.ID(LL) THEN LL = PC.COUNT : GOTO 5890
5580  REM found a child
5590  GET #1, CH.ID(LL)
5600  GOSUB 3300  'Extract
5610  REM verify that Mother is the same
5620  IF TT3 <> T7 THEN 5890
5630  REM Found a valid child
5640  CHILD.COUNT = CHILD.COUNT + 1
5650  SHOW.COUNT = CHILD.COUNT
5660  IF CHILD.COUNT = 1 THEN 5820
5670  IF CHILD.COUNT > 11 THEN SHOW.COUNT = CHILD.COUNT - 11
5680  IF CHILD.COUNT > 22 THEN SHOW.COUNT = CHILD.COUNT - 22
5690  IF CHILD.COUNT > 33 THEN SHOW.COUNT = CHILD.COUNT - 33
5700  IF CHILD.COUNT > 44 THEN SHOW.COUNT = CHILD.COUNT - 44
5710  IF (CHILD.COUNT-1) MOD 11 = 0 THEN 5720 ELSE 5820
5720  LOCATE 23,1 : PRINT SPACE$(79);
5730  LOCATE 23,1 : PRINT "Press any key to continue"
5740  A$ = INKEY$ : IF A$ = "" THEN 5740
5750  REM blank the previous children
5760  FOR ROW = 9 TO 20
5770   LOCATE ROW,2 : PRINT SPACE$(77);
5780  NEXT ROW
5790  REM restore the rest of the display
5800  GOSUB 2070
5810  LOCATE 23,1 : PRINT SPACE$(79)
5820  CH(CHILD.COUNT) = CH.ID(LL)
5830  LOCATE 9+SHOW.COUNT,2 : COLOR 0,7
5840  PRINT RIGHT$(STR$(CHILD.COUNT),2); : COLOR 7,0
5850  LOCATE 9+SHOW.COUNT,5 : PRINT LEFT$(F4$,1);  'Sex
5860  LOCATE 9+SHOW.COUNT,7 : PRINT T2$+", "+T3$;
5870  LOCATE 9+SHOW.COUNT,41 : PRINT T8$;
5880  LOCATE 9+SHOW.COUNT,53 : PRINT T9$;
5890 NEXT LL
5900 LOCATE 23,1 : PRINT SPACE$(79);
5910 LOCATE 24,1 : PRINT SPACE$(79);
5920 LOCATE 24,1 : PRINT "(Possible Actions: ps, f, m, p1...pn, c1...cn, m1...mn, q)";
5930 LOCATE 23,1 : INPUT "Next Action";REPLY$
5940 IF REPLY$ = "ps" THEN GOSUB 6080 : GOTO 5900
5950 IF REPLY$ = "sp" THEN GOSUB 6080 : GOTO 5900
5960 IF REPLY$ = "pc" THEN LOCATE 22,1 : PRINT "Error in Previous Reply ";REPLY$; : GOTO 5900
5970 IF REPLY$ = "f" THEN PERS(1) = TT2 : GOTO 2810
5980 IF REPLY$ = "m" THEN PERS(1) = TT3 : GOTO 2810
5990 IF LEFT$(REPLY$,1) = "p" THEN PERS(1) = VAL(RIGHT$(REPLY$,LEN(REPLY$)-1)) : GOTO 2800
6000 IF LEFT$(REPLY$,1) = "c" THEN 6010 ELSE 6050
6010 CHLD = VAL(RIGHT$(REPLY$,LEN(REPLY$)-1))
6020 IF CHLD < 1 OR CHLD > CHILD.COUNT THEN 6070
6030 PERS(1) = CH(CHLD)
6040 GOTO 2810  'for personal
6050 IF LEFT$(REPLY$,1) = "m" THEN 7260 'marriage
6060 IF LEFT$(REPLY$,1) = "q" THEN 7390
6070 LOCATE 22,1 : PRINT "Error in Previous Reply ";REPLY$; : GOTO 5900
6080 REM Routine to Print the Screen
6090 REM Accessed by users 'ps' reply
6100 FOR ROW = 1 TO 20
6110  THIS$ = SPACE$(79)
6120  FOR COL = 1 TO 79
6130   X = SCREEN(ROW,COL)
6140   IF X > 125 THEN X = 32
6150   IF X < 32 THEN X = 32
6160   MID$(THIS$,COL,1) = CHR$(X)
6170  NEXT COL
6180  LPRINT THIS$
6190 NEXT ROW
6200 LPRINT CHR$(12);
6210 RETURN
6220 REM Routine to Display the Ordinances
6230 GET #1, PERS(1) : GOSUB 3300
6240 GET #3, PERS(1)
6250 SEX$ = LEFT$(T4$,1)
6260 REM Extract the Ordinance Information
6270 U1 = CVS(O1$)
6280 U2$ = O2$
6290 U3$ = O3$
6300 U4$ = O4$
6310 U5  = CVS(O5$)
6320 U6  = CVS(O6$)
6330 U7$ = O7$
6340 U8$ = O8$
6350 U9$ = O9$
6360 U10$ = O10$
6370 U11$ = O11$
6380 U12  = CVS(O12$)
6390 U13$ = O13$
6400 U14$ = O14$
6410 U15$ = O15$
6420 U16$ = O16$
6430 U17$ = O17$
6440 U18$ = O18$
6450 U19$ = O19$
6460 U20$ = O20$
6470 U21$ = O21$
6480 U22$ = O22$
6490 U23$ = O23$
6500 U24$ = O24$
6510 CLS
6520 R1 = 1 : C1 = 1 : R2 = 21 : C2 = 79 : GOSUB 400  'Double Box
6530 R1 = 3 : C1 = 1 : R2 = 3 : C2 = 79 : GOSUB 2170  'Horizontal Double
6540 R1 = 19 : C1 = 1 : R2 = 19 : C2 = 79 : GOSUB 2170  'Horizontal Double
6550 LOCATE 2,3 : PRINT "Ordinance Information for:";
6560 LOCATE 4,7 : COLOR 1 : PRINT "Personal Record"; : COLOR 7
6570 LOCATE 5,3 : PRINT "Christening:";
6580 LOCATE 6,3 : PRINT "Blessing:";
6590 LOCATE 7,3 : PRINT "Sealed to Parents:";
6600 LOCATE 8,5 : PRINT "Father's Id:";
6610 LOCATE 9,6 : PRINT "Name:";
6620 LOCATE 10,5 : PRINT "Mother's Id:";
6630 LOCATE 11,6 : PRINT "Name:";
6640 LOCATE 12,3 : PRINT "Baptism:";
6650 LOCATE 13,3 : PRINT "Confirmation:";
6660 LOCATE 14,3 : PRINT "Patriarchical Blessing:";
6670 LOCATE 15,3 : PRINT "Endowment:";
6674 REM Test for male.  Skip if male.
6675 IF SEX$ = "M" THEN 6710
6680 LOCATE 16,3 : PRINT "Sealed to Husband:";
6690 LOCATE 17,5 : PRINT "Husband's Id.:";
6700 LOCATE 18,6 : PRINT "Name:";
6710 REM Test for Male.  Skip if not
6720 IF SEX$ <> "M" THEN 6860
6730 R1 = 3 : R2 = 19 : C1 = 40 : C2 = 40 : GOSUB 2310  "Vertical Double
6740 LOCATE 4,46 : COLOR 1 : PRINT "Priesthood Record"; : COLOR 7
6750 LOCATE 5,42 : PRINT "Aaronic Priesthood:";
6760 LOCATE 6,44 : PRINT "Deacon:";
6770 LOCATE 7,44 : PRINT "Teacher:";
6780 LOCATE 8,44 : PRINT "Priest:";
6790 LOCATE 10,42 : PRINT "Melchizedek Priesthood:";
6800 LOCATE 11,44 : PRINT "Elder:";
6810 LOCATE 12,44 : PRINT "Seventy:";
6820 LOCATE 13,44 : PRINT "High Priest:";
6830 LOCATE 15,42 : PRINT "Bishop:";
6840 LOCATE 16,42 : PRINT "Patriarch:";
6850 LOCATE 17,42 : PRINT "Apostle:";
6860 LOCATE 20,3  : PRINT "Occupation:";
6870 REM Print the Information Currently Present
6880 LOCATE 2,30 : PRINT T3$ + " " + T2$;
6890 LOCATE 2,66 : PRINT "Person:";T1;
6900 LOCATE 5,28 : PRINT U2$;
6910 LOCATE 6,28 : PRINT U3$;
6920 LOCATE 7,28 : PRINT U4$;
6940 LOCATE 8,18 : PRINT U5;
6950 IF U5 = 0 THEN 6980
6960 GET #1, U5 : GOSUB 3300  'Extract Father Information
6970 LOCATE 9,12 : PRINT T3$ + " " + T2$;
6980 LOCATE 10,18 : PRINT U6;
6990 IF U6 = 0 THEN 7020
7000 GET #1, U6 : GOSUB 3300  'Extract Mother Information
7010 LOCATE 11,12 : PRINT T3$ + " " + T2$;
7020 LOCATE 12,28 : PRINT U7$;
7030 LOCATE 13,28 : PRINT U8$;
7040 LOCATE 14,28 : PRINT U9$;
7050 LOCATE 15,28 : PRINT U10$;
7054 REM Test for male.  Skip if male.
7055 IF SEX$ = "M" THEN 7110
7060 LOCATE 16,28 : PRINT U11$;
7070 LOCATE 17,19 : PRINT U12;
7080 IF U12 = 0 THEN 7110
7090 GET #1, U12 : GOSUB 3300  'Extract Spouse Information
7100 LOCATE 18,12 : PRINT T3$ + " " + T2$;
7110 REM Test for Male.  Bypass if not.
7120 IF SEX$ <> "M" THEN 7240
7130 LOCATE 5,67 : PRINT U13$;
7140 LOCATE 6,67 : PRINT U14$;
7150 LOCATE 7,67 : PRINT U15$;
7160 LOCATE 8,67 : PRINT U16$;
7170 LOCATE 10,67 : PRINT U17$;
7180 LOCATE 11,67 : PRINT U18$;
7190 LOCATE 12,67 : PRINT U19$;
7200 LOCATE 13,67 : PRINT U20$;
7210 LOCATE 14,67 : PRINT U21$;
7220 LOCATE 15,67 : PRINT U22$;
7230 LOCATE 16,67 : PRINT U23$;
7240 LOCATE 20,15 : PRINT U24$;
7250 GOTO 3170  'For User Action
7260 REM Marriage was requested by Number
7270 MARRIAGE = VAL(RIGHT$(REPLY$,LEN(REPLY$)-1))
7280 CLS
7290 IF MARRIAGE > 0 AND MARRIAGE <= 200 THEN 7360
7300 LOCATE 22,1 : PRINT SPACE$(79);
7310 LOCATE 22,1 : PRINT "Invalid Marriage Number";
7320 LOCATE 23,1 : PRINT SPACE$(79);
7330 LOCATE 23,1 : PRINT "Press any key to continue."
7340 A$ = INKEY$ : IF A$ = "" THEN 7340
7350 GOTO 2810
7360 GOSUB 1940  'Print the form
7370 GET #2, MARRIAGE
7380 GOTO 5260
7390 REM Wrapup
7400 CLOSE #1
7410 CLOSE #2
7420 CLOSE #3
7430 CLS : LOCATE 21,1
7440 PRINT "End of Program"
7450 RUN "a:menu"
7460 REM Routine to Convert a number to a string.  This.pers is input
7470 REM value$ is output, with record number and persons name.
7480 VALUE$ = STR$(THIS.PERS)
7490 WIDE = LEN(VALUE$)
7500 VALUE$ = RIGHT$(VALUE$,WIDE-1)
7510 VALUE$ = "("+VALUE$+") "+T2$+", "+T3$
7520 RETURN
