10 KEY OFF:CLS
20 PRINT"같같같같같같같같같같같같같같같같같같같�"
30 PRINT"겠컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커�"
40 PRINT"개                                   낡"
50 PRINT"개            6011-A.BAS             낡"
60 PRINT"개              LIBCAT               낡"
70 PRINT"개                                   낡"
80 PRINT"개                                   낡"
90 PRINT"개 BROUGHT TO YOU BY THE MEMBERS OF  낡"
100 PRINT"개      複複� 複複� 複複� 複複�      낡"
110 PRINT"개        �   �   � �     �   �      낡"
120 PRINT"개        �   白複� �     �   �      낡"
130 PRINT"개        �   �     �     �   �      낡"
140 PRINT"개      複白� �     白複� 白複�      낡"
150 PRINT"개                                   낡"
160 PRINT"개      International PC Owners      낡"
170 PRINT"개                                   낡"
180 PRINT"개P.O. Box 10426, Pittsburgh PA 15234낡"
190 PRINT"개                                   낡"
200 PRINT"걋컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸�"
210 PRINT"같같같같같같같같같같같같같같같같같같같�"
220 PRINT
230 PRINT "       PRESS ANY KEY TO CONTINUE
240 A$=INKEY$: IF A$="" THEN 240
250 CLS
1000 REM  ********  LIBCAT   **********
1010 KEY OFF
1020 REM  A PROGRAM TO CATALOG BOOKS
1030 OPEN "B:CATALOG" AS 1 LEN=62
1040 FIELD 1,2 AS F$,20 AS A$,20 AS T$,20 AS S$
1050 CLS
1060 PRINT "               **********      LIBCAT    **************"
1070 PRINT
1080 PRINT "       THIS PROGRAM LETS YOU CREATE A CATALOG OF YOUR LIBRARY."
1090 PRINT "       YOU ADD BOOKS, OR DELETE BOOKS. EACH BOOK IS INPUT WITH"
1100 PRINT "       AUTHOR, TITLE AND SUBJECT. YOU CAN SEARCH FOR A BOOK OR"
1110 PRINT "       TYPES OF BOOKS AND GET LISTINGS IF DESIRED."
1120 PRINT
1130 PRINT
1140 PRINT "                 ACTIONS:    1 ADD A BOOK"
1150 PRINT "                             2 DELETE A BOOK"
1160 PRINT "                             3 SEARCH FOR A BOOK(S)/LISTINGS"
1170 PRINT "                             4 BEGIN A NEW LIBRARY"
1180 PRINT "                             5 EXIT PROGRAM(ACTIONS FINISHED)"
1190 PRINT
1210 INPUT "          ENTER YOUR CHOICE";CHOICE
1220 WHILE CHOICE<1 OR CHOICE>5
1230 INPUT "          ENTER YOUR CHOICE";CHOICE
1240 WEND
1250 ON CHOICE GOSUB 1270,2180,1520,2480,2730
1260 GOTO 1030
1270 REM   ******** NEW BOOK SUBROUTINE **********
1280 CLS
1290 PRINT "                     ********  ADD A BOOK  *********"
1300 PRINT
1310 PRINT
1320 PRINT
1330 PRINT
1340 I=0:LOOP=1
1350 GET 1,1
1360 S=CVI(F$)
1370 WHILE LOOP = 1
1380 I=I+1
1390 GET 1,I
1400 IF A$=SPACE$(20) OR S=I THEN LOOP=0
1410 WEND
1420 IF S=1 THEN PRINT "                 LIBRARY IS FULL":RESET:RETURN
1430 INPUT "                              AUTHOR";AU$:LSET A$=AU$
1440 INPUT "                               TITLE";TI$:LSET T$=TI$
1450 INPUT "                             SUBJECT";SU$:LSET S$=SU$
1460 PUT 1,I
1470 PRINT
1480 INPUT "                 ADD ANOTHER BOOK(Y/N)";ANS$
1490 IF ANS$ = "Y"        THEN GOTO 1270
1500 IF ANS$ = "y"        THEN GOTO 1270
1510 RESET:RETURN
1520 REM   ******** SEARCHES SUBROUTINE *********
1530 CLS
1540 PRINT "                   **********  SEARCH FOR A BOOK(S) ********"
1550 PRINT
1560 PRINT "               INPUT AUTHOR OR TITLE OR SUBJECT YOU ARE SEARCHING FOR."
1570 PRINT "               IF NO INPUT IS GIVEN(BLANK ENTERED) THEN ALL BOOKS"
1580 PRINT "               MATCHING OTHER REQUIREMENTS WILL BE FOUND. IF YOU INPUT"
1590 PRINT "               THREE BLANKS ALL BOOKS WILL BE LISTED."
1600 PRINT
1610 INPUT "                               AUTHOR";AU$
1620 INPUT "                                TITLE";TI$
1630 INPUT "                              SUBJECT";SU$
1640 PRINT ""
1650 INPUT "                   LISTING ON PAPER(Y/N)";P$:IF P$="Y" THEN P=1 ELSE P=0
1660 PRINT
1670 IF P=1 THEN INPUT "TURN ON PRINTER,SET TO TOP OF FORM. HIT ENTER TO CONTINUE";DDD$: LPRINT TAB(7) "AUTHOR" TAB(32) "TITLE" TAB(55) "SUBJECT"
1680 IF P=0 THEN  PRINT TAB(7) "AUTHOR" TAB(32) "TITLE" TAB(55) "SUBJECT"
1690 IF AU$="" AND TI$="" AND SU$= ""  THEN MENU =1
1700 IF AU$<>"" AND TI$="" AND SU$= ""  THEN MENU =2
1710 IF AU$<>"" AND TI$<>"" AND SU$= ""  THEN MENU =3
1720 IF AU$= "" AND TI$<>"" AND SU$<>""  THEN MENU =4
1730 IF AU$= "" AND TI$= "" AND SU$<>""  THEN MENU =5
1740 IF AU$= "" AND TI$<>"" AND SU$= ""  THEN MENU =6
1750 Z$=SPACE$(20):LSET Z$=AU$
1760 Y$=SPACE$(20):LSET Y$=TI$
1770 X$=SPACE$(20):LSET X$=SU$
1780 ON MENU GOSUB 1820,1880,1940 ,2000 ,2060 ,2120
1790 PRINT :PRINT "                PRESS ANY KEY TO CONTINUE"
1800 B$=INKEY$:IF B$="" THEN 1800
1810 GOTO 1030
1820 REM   MENU=1 SUBROUTINE
1830 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
1840 IF A$<>B$ THEN B=1 ELSE B=0
1850 IF P=1 AND B=1  THEN LPRINT A$;"     ";T$;"     ";S$
1860    IF P=0 AND B=1 THEN  PRINT A$;"     ";T$;"     ";S$
1870 WEND:CLOSE:RETURN
1880     REM   MENU=2 SUBROUTINE
1890 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
1900 IF A$<>B$ THEN B=1 ELSE B=0
1910 IF P=1 AND B=1 AND A$=Z$ THEN LPRINT A$;"     ";T$;"     ";S$
1920 IF P=0 AND B=1 AND A$=Z$ THEN  PRINT A$;"     ";T$;"     ";S$
1930 WEND:CLOSE:RETURN
1940 REM   MENU=3 SUBROUTINE
1950 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
1960 IF A$<>S$ THEN B=1
1970 IF P=1 AND B=1 AND A$=Z$ AND T$=Y$  THEN LPRINT A$;"     ";T$;"     ";S$
1980 IF P=0 AND B=1 AND A$=Z$ AND T$=Y$ THEN  PRINT A$;"     ";T$;"     ";S$
1990 WEND:CLOSE:RETURN
2000 REM   MENU=4 SUBROUTINE
2010 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
2020 IF A$<>B$ THEN B=1 ELSE B=0
2030 IF P=1 AND B=1 AND S$=X$ AND T$=Y$  THEN LPRINT A$;"     ";T$;"     ";S$
2040 IF P=0 AND B=1 AND S$=X$ AND T$=Y$ THEN  PRINT A$;"     ";T$;"     ";S$
2050 WEND:CLOSE:RETURN
2060 REM   MENU=5 SUBROUTINE
2070 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
2080 IF A$<>B$ THEN B=1 ELSE B=0
2090 IF P=1 AND B=1 AND S$=X$   THEN LPRINT A$;"     ";T$;"     ";S$
2100 IF P=0 AND B=1 AND S$=X$  THEN  PRINT A$;"     ";T$;"     ";S$
2110 WEND:CLOSE:RETURN
2120 REM   MENU=6 SUBROUTINE
2130 I=0:GET 1,1:B$=SPACE$(20):S=CVI(F$):WHILE S <> I:I=I+1:GET 1,I
2140 IF A$<>B$ THEN B=1 ELSE B=0
2150 IF P=1 AND B=1 AND T$=Y$   THEN LPRINT A$;"     ";T$;"     ";S$
2160 IF P=0 AND B=1 AND T$=Y$  THEN  PRINT A$;"     ";T$;"     ";S$
2170 WEND:CLOSE:RETURN
2180 REM   ******** DELETE BOOK SUBROUTINE ***********
2190 CLS
2200 PRINT "               ******** DELETE A BOOK *********"
2210 PRINT
2220 PRINT
2230 INPUT "          ARE YOU SURE (Y/N)";B$
2240 WHILE B$="Y"
2250 PRINT
2260 INPUT "                      AUTHOR";AU$:LSET A$=AU$
2270 INPUT "                       TITLE";TI$:LSET T$=TI$
2280 I=0:II=0:SP$=SPACE$(20)
2290 Y$=SPACE$(20):LSET Y$=TI$
2300 Z$=SPACE$(20):LSET Z$=AU$
2310 I=0:II=0
2320 GET 1,1
2330 S=CVI(F$)
2340 WHILE S<>I
2350 I=I+1
2360 GET 1,I
2370 IF A$=Z$ AND T$=Y$ THEN PRINT "DELETE:  ";A$;"    ";T$;"     ";S$
2380 IF A$=Z$ AND T$=Y$ THEN II=I:I=S
2390 IF II<>0 THEN LSET A$=SP$:LSET T$=SP$:LSET S$=SP$
2400 WEND
2410 PUT 1,II
2420 B$="N"
2430 WEND
2440 RESET
2450 PRINT :PRINT "       PRESS ANY KEY TO CONTINUE"
2460 B$=INKEY$:IF B$="" THEN 2460
2470 RETURN
2480 REM   ******** NEW LIBRARY SUBROUTINE **********
2490 CLS
2500 PRINT "           *********  START A NEW LIBRARY *********"
2510 PRINT
2520 PRINT
2530 INPUT "       ARE YOU SURE YOU WANT TO START A NEW LIBRARY(Y/N)";B$
2540 WHILE B$="Y"
2550 PRINT "                **************  NOTICE !!!!  ************"
2560 PRINT:PRINT "WHEN A NEW LIBRARY IS STARTED, THE OLD LIBRARY(IF ANY) ON DISKETTE WILL"
2570 PRINT "BE DESTROYED (GONE FOREVER)  AS THE NEW LIBRARY FILE IS SET UP.":PRINT
2580 INPUT "DO YOU HAVE OLD LIBRARY(IF ANY) BACKED UP ON ANOTHER DISKETTE(Y/N)";Q$
2590 IF Q$="Y" THEN GOTO 2620
2600 IF Q$="N" THEN PRINT:PRINT "IF YOU WISH TO SAVE OLD LIBRARY THEN EXIT NOW AND SAVE FILE ON ANOTHER DISKETTE":PRINT :INPUT "DO YOU WISH TO EXIT(Y/N)";QQ$
2610 IF QQ$="N" GOTO 2620 ELSE STOP
2620 PRINT:INPUT "LIBRARY SIZE, NUMBER OF BOOKS (UP TO 2500 ON 160K DISKETTE;5000 ON 320K)"; SIZE
2630 LSET F$=MKI$(SIZE)
2640 PUT 1,1
2650 LSET A$=SPACE$(20)
2660 FOR I=2 TO SIZE
2670 PUT 1,I
2680 NEXT I
2690 B$="N"
2700 WEND
2710 CLOSE
2720 RETURN
2730 REM   ******** :STOP SUBROUTINE *********
2740 PRINT:PRINT "                     ******* EXIT PROGRAM ********"
2750 PRINT
2760 CLOSE
2770 PRINT "         FILES CLOSED. IF YOU HAVE ENTERED MANY NEW BOOKS INTO CATALOG THEN"
2780 PRINT "         YOU WILL PROBABLY WISH TO MAKE BACKUP COPY OF THE FILES."
2790 END
D MANY NEW BOOKS INTO CATALO