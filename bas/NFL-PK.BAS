10 KEY OFF:CLS
20 SCREEN 0
30 WIDTH 40
40 PRINT"같같같같같같같같같같같같같같같같같같같�"
50 PRINT"겠컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커�"
60 PRINT"개                                   낡"
70 PRINT"개            6013-A.BAS             낡"
80 PRINT"개             NFL-PIKS              낡"
90 PRINT"개                                   낡"
100 PRINT"개                                   낡"
110 PRINT"개 BROUGHT TO YOU BY THE MEMBERS OF  낡"
120 PRINT"개      複複� 複複� 複複� 複複�      낡"
130 PRINT"개        �   �   � �     �   �      낡"
140 PRINT"개        �   白複� �     �   �      낡"
150 PRINT"개        �   �     �     �   �      낡"
160 PRINT"개      複白� �     白複� 白複�      낡"
170 PRINT"개                                   낡"
180 PRINT"개      International PC Owners      낡"
190 PRINT"개                                   낡"
200 PRINT"개P.O. Box 10426, Pittsburgh PA 15234낡"
210 PRINT"개                                   낡"
220 PRINT"걋컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸�"
230 PRINT"같같같같같같같같같같같같같같같같같같같�"
240 PRINT
250 PRINT "       PRESS ANY KEY TO CONTINUE
260 A$=INKEY$: IF A$="" THEN 260
270 WIDTH 80
280 CLS
1000 KEY OFF
1010 CLS
1020 ' FOOTBALL PICKS BY DAVID BRONSON.
1030 ' MODIFIED FOR IBM-PC BY CHUCK HARRINGTON 2/28/83
1040 '
1050 '
1060 'SEE POPLUAR COMPUTING FOR JANUARY, 1982 P. 74.
1070 '
1080 PRINT
1090 PRINT "THIS PROGRAM WILL LET YOU PICK THE POINT SPREAD"
1100 PRINT "OF ANY GIVEN FOOTBALL GAME BETWEEN THE 29 TEAMS OF"
1110 PRINT "THE NFL.  TO PERFORM RELIABLY, THE PROGRAM"
1120 PRINT "NEEDS THE RESULTS OF AT LEAST THE FIRST FOUR WEEKS"
1130 PRINT "GAMES. THE MORE RESULTS YOU GIVE THE PROGRAM, THE BETTER"
1140 PRINT "IT'S PREDICTIONS WILL BE."
1150 PRINT:PRINT: INPUT "PRESS <ENTER> TO CONTINUE"; R$
1160 CLS
1170 PRINT "SELECT AN OPTION BY PRESSING THE APPROPRIATE KEY..."
1180 PRINT:PRINT:PRINT
1190 PRINT "<S>ET UP THE SYSTEM."
1200 PRINT TAB(10) "DO THIS ONLY ONCE PER SEASON AT FIRST USE."
1210 PRINT
1220 PRINT "<U>PDATE THE TEAM FILE - DO THIS AFTER EACH WEEKS' RESULTS ARE IN."
1230 PRINT
1240 PRINT "<P>REDICT RESULTS OF A GAME."
1250 PRINT
1260 PRINT "<R>EPORT THE CURRENT STATISTICS."
1270 PRINT
1280 PRINT "<Q>UIT."
1290 A$=INKEY$: IF A$="" THEN 1290
1300 IF A$ = "S" THEN 1380
1310 IF A$ = "U" THEN 1660
1320 IF A$ = "P" THEN 2070
1330 IF A$ = "R" THEN 2450
1340 IF A$ = "Q" THEN END
1350 GOTO 1290
1360 FOR I = 1 TO 1000: NEXT I
1370 RETURN
1380 CLS: PRINT "SET UP SYSTEM: DO NOT PROCEED IF YOU HAVE ALREADY"
1390 PRINT "DONE THIS ONCE THIS SEASON, BECAUSE YOUR PREVIOUS"
1400 PRINT "RESULTS WILL BE ERASED."
1410 PRINT:PRINT "DO YOU REALLY WANT TO SET UP THE SYSTEM?";
1420 INPUT " (Y OR N)";R$
1430 IF R$= "Y" OR R$ = "y" THEN 1440 ELSE 1160
1440 PRINT
1450 PRINT "SETTING UP SYSTEM...STANDBY"
1460 GOSUB 2650
1470 FOR T = 1 TO 28
1480 READ TM$
1490 DM$=MKI$(0)
1500 LSET T$=TM$: LSET O$=DM$: LSET D$=DM$: LSET PS$=DM$
1510 LSET PG$=DM$: LSET G$=DM$: LSET W$=DM$
1520 PUT #1,T
1530 NEXT T
1540 CLOSE #1
1550 PRINT
1560 PRINT "SET-UP COMPLETE."
1570 INPUT "PRESS <ENTER> TO CONTINUE";R$
1580 GOTO 1160
1590 DATA ATLANTA,GREEN BAY,NEW YOUR (GIANTS),CHICAGO
1600 DATA LOS ANGELES,PHILADELPHIA,DALLAS,MINNESOTA
1610 DATA SAN FRANSISCO,DETROIT,NEW ORLEANS, ST LOUIS
1620 DATA TAMPA BAY,WASHINGTON,BALTIMORE,DENVER
1630 DATA NEW ENGLAND,BUFFALO,HOUSTON,NEW YORK (JETS)
1640 DATA CINCINNATI,KANSAS CITY,OAKLAND,CLEVELAND
1650 DATA MIAMI,PITTSBURGH,SAN DIEGO,SEATTLE
1660 CLS:PRINT "UPDATE STATISTICS OPTION"
1670 PRINT
1680 INPUT "HOW MANY WEEKS HAVE BEEN PLAYED IN THE REGULAR SEASON";G
1690 IF G<1 THEN 1160
1700 GOSUB 2650:  'OPEN STATS FILE.
1710 GOSUB 2000: 'DISPLAY LIST OF TEAMS.
1720 PRINT
1730 INPUT "TYPE THE NUMBER OF THE TEAM TO BE UPDATED (0 TO QUIT)...";R
1740 IF R < 1 OR R> 28 THEN CLOSE #1: GOTO 1160
1750 CLS
1760 GET #1,R
1770 PRINT "TEAM:";TAB(30); T$
1780 PRINT STRING$(50,"-")
1790 PRINT "OFFENSIVE YARDS:";TAB(30);CVI(O$)
1800 PRINT
1810 INPUT "NEW INFO"; O1
1820 PRINT
1830 PRINT "DEFENSIVE YARDS:";TAB(30); CVI(D$)
1840 PRINT
1850 INPUT "NEW INFO";D1
1860 PRINT
1870 PRINT "POINTS SCORED:";TAB(30);CVI(PS$)
1880 PRINT
1890 INPUT "NEW INFO:";P1
1900 PRINT
1910 PRINT "POINTS GIVEN UP:";TAB(30);CVI(PG$)
1920 PRINT
1930 INPUT "NEW INFO";P2
1940 PRINT
1950 W=CVI(W$): IF P1>P2 THEN W=W+1
1960 LSET O$=MKI$(O1): LSET D$=MKI$(D1): LSET PS$=MKI$(P1)
1970 LSET PG$=MKI$(P2): LSET G$=MKI$(G): LSET W$=MKI$(W)
1980 PUT #1,R
1990 GOTO 1710
2000 CLS: RESTORE
2010 FOR I=1 TO 27 STEP 2
2020 READ T1$,T2$
2030 PRINT I;"-";T1$;TAB(32);I+1;"-";T2$
2040 IF I=13 THEN PRINT STRING$(50,"-")
2050 NEXT I
2060 RETURN
2070 CLS:PRINT "PREDICT RESULTS OPTION"
2080 GOSUB 2650: 'OPEN STATS FILE
2090 GOSUB 2000: 'DISPLAY LIST OF TEAMS
2100 PRINT
2110 INPUT "ENTER HOME TEAM'S NUMBER (0 TO QUIT)";HT%
2120 PRINT
2130 IF HT%<1 OR HT%>28 THEN CLOSE #1: GOTO 1160
2140 INPUT "ENTER VISITOR TEAM'S NUMBER (0 TO QUIT)";VT%
2150 IF VT%<1 OR VT%>28 THEN CLOSE #1: GOTO 1160
2160 GET #1,HT%
2170 HT$=T$: HO=CVI(O$): HD=CVI(D$): HPS=CVI(PS$): HG=CVI(PG$): G=CVI(G$)
2180 CLS
2190 GET #1,VT%
2200 VT$=T$: VD=CVI(D$): VO=CVI(O$): VPS=CVI(PS$): VG=CVI(PG$)
2210 PRINT VT$; "AT ";HT$; "..."
2220 IF G=0 THEN PRINT:PRINT "NOT ENOUGH INFO.":CLOSE #1: GOTO 1150
2230 TH=HO + VD: TV=VO+HD
2240 EHG=TH/(G*2):EVG=TV/(G*2)
2250 THP=EHG*7/100: TVP=EVG*7/100
2260 AHP=HPS+VG: AVP=VPS+HG
2270 HHP=AHP/(G*2): VX=AVP/(G*2)
2280 VF=(TVP+VX)/2: HF=(THP+HHP)/2
2290 VVC=(VO/100): VR=(VD/100)
2300 VX=VVC*7: VW=VR*7
2310 HX=(HO/100)*7: HR=(HD/100)*7
2320 VTC=VPS-VX: VQ=VG-VW
2330 HW=HPS-HX: HA=HG-HR
2340 HC=HW/G: VC=VTC/G
2350 HQ=HA/G: VQ=VQ/G
2360 HS=HF+HC-VQ: VS=VF+VC-HQ
2370 SP=VS-HS
2380 IF ABS(SP)<1 THEN 2440
2390 IF SP <-1 THEN WN$=HT$ ELSE WN$=VT$
2400 PRINT WN$; "BY";INT(ABS(SP)+.5); "POINTS."
2410 PRINT: PRINT
2420 INPUT "PRESS <ENTER> TO CONTINUE";R$
2430 CLS: GOTO 2090
2440 PRINT VT$;"AT ";HT$;"IS TOO CLOSE TO CALL.": GOTO 2100
2450 CLS: PRINT "REPORTS OPTION"
2460 GOSUB 2650: 'OPEN STATS FILE
2470 FOR P=1 TO 4
2480 GOSUB 2580: ' PRINT HEADINGS
2490 FOR T=1 TO 7: 'SEVEN TEAMS PER PAGE
2500 GET #1,(P-1)*7 + T
2510 PRINT T$;TAB(22);CVI(G$);TAB(29);CVI(W$);
2520 PRINT TAB(35);CVI(O$);TAB(43);CVI(D$);
2530 PRINT TAB(51);CVI(PS$);TAB(57);CVI(PG$)
2540 PRINT
2550 NEXT T: INPUT "PRESS <ENTER> TO CONTINUE";R$
2560 NEXT P
2570 CLOSE #1: GOTO 1160
2580 CLS: PRINT "TEAM";TAB(22);"GAMES";TAB(29);"WINS";
2590 PRINT TAB(35); "YDS";TAB(43);"YDS";
2600 PRINT TAB(51); "PTS";TAB(43); "PTS"
2610 PRINT TAB(35); "GAINED";TAB(43); "GIVEN";
2620 PRINT TAB(51);"WON"; TAB(57);"LOST"
2630 PRINT STRING$(64,"-")
2640 RETURN
2650 OPEN "R",1,"STATS"
2660 FIELD 1,20 AS T$,2 AS O$,2 AS D$,2 AS PS$,2 AS PG$,2 AS G$, 2 AS W$,96 AS ZZ$
2670 RETURN
URN
2650 OPEN