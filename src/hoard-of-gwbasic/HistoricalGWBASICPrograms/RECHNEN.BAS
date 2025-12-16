10 CLS
20 PRINT"               *************** Reckonmashine ***************"
30 PRINT:PRINT"Welche Rechenart wird gewnscht ???"
40 PRINT:PRINT"+=addition . -=subtraktion . *=multiplikation . /=division . ^=Potenzion"
50 PRINT:PRINT:PRINT"E=Ende"
60 A$=INKEY$:IF A$="+" OR A$="*" THEN GOTO 130
70 IF A$="-" OR A$="_" THEN GOTO 310
80 IF A$="+" OR A$="*" THEN GOTO 500
90 IF A$="7" OR A$="/" THEN GOTO 700
100 IF A$="^" OR A$="ø" THEN GOTO 900
110 IF A$="E" OR A$="e" THEN 1500
120 GOTO 60
130 CLS:PRINT"                          ********** Addition **********"
140 PRINT:PRINT"...+...=..."
150 PRINT"Bitte geben sie jetzt die erste Zahl ein !!! >>>  ???+...=..."
160 PRINT:INPUT"1. Zahl : ",B
170 PRINT:PRINT B ;" + ... = ..."
180 PRINT"Bitte geben sie jetzt die zweite Zahl ein !!! >>>  ";B ;" + ??? = ..."
190 PRINT:INPUT"2. Zahl : ",C
200 PRINT:PRINT  B;" + ";C ;" = ???"
210 D =B +C
220 PRINT"Hmmm"
225 CLS
230 FOR Z=1 TO 10000:NEXT Z
240 LOCATE 1,1
250 PRINT B ;" + ";C ;" = ";D
260 FOR Z=1 TO 10000:NEXT Z
270 LOCATE 1,1
280 PRINT B ;" + ";C ;" =                                                      "
290 Y$=INKEY$:IF Y$=" " THEN GOTO 10
300 GOTO 230
310 CLS
320 PRINT"                           ********** Subtraktion **********"
330 PRINT:PRINT"...-...=..."
340 PRINT"Bitte geben sie jetzt die erste Zahl ein !!! >>>  ???-...=..."
350 PRINT:INPUT"1. Zahl : ",B
360 PRINT B;" - ... = ..."
370 PRINT"Bitte geben sie jetzt die zweite Zahl ein !!! >>> ";B;" - ??? = ..."
380 PRINT:INPUT"2. Zahl : ",C
390 PRINT:PRINT B;" - ";C;" = ???"
400 D=B-C
410 PRINT"Hmmm"
415 CLS
420 FOR Z=1 TO 10000:NEXT Z
430 LOCATE 1,1
440 PRINT B;" - ";C;" = ";D
450 FOR Z=1 TO 10000:NEXT Z
460 LOCATE 1,1
470 PRINT B;" - ";C;" =                                                        "
480 Y$=INKEY$:IF Y$=" " THEN GOTO 10
490 GOTO 420
500 CLS
510 PRINT"                       ********** Multiplikation **********"
520 PRINT:PRINT"...x...=..."
530 PRINT"Bitte geben sie jetzt die erste Zahl ein !!! >>> ???x...=..."
540 PRINT:INPUT"1. Zahl : ",B
550 PRINT B" x ... = ..."
560 PRINT"Bitte geben sie jetzt die zweite Zahl ein !!! >>> ";B;" x ??? = ..."
570 PRINT:INPUT"2. Zahl : ",C
580 PRINT B;" x ";C;" = ???"
590 D=B*C
600 PRINT"Hmmm"
610 CLS
620 FOR Z=1 TO 10000:NEXT Z
630 LOCATE 1,1
640 PRINT B;" x ";C;" = ";D
650 FOR Z=1 TO 10000:NEXT Z
660 LOCATE 1,1
670 PRINT B;" x ";C;" =                                                        "
680 Y$=INKEY$:IF Y$=" " THEN GOTO 10
690 GOTO 620
700 CLS
710 PRINT"                           ********** Division **********"
720 PRINT:PRINT"...:...=..."
730 PRINT"Bitte geben sie jetzt die erste Zahl ein !!! >>> ???:...=..."
740 PRINT:INPUT"1. Zahl : ",B
750 PRINT B;" : ... = ..."
760 PRINT"Bitte geben sie jetzt die zweite Zahl ein !!! >>> ";B;" : ??? = ..."
770 PRINT:INPUT"2. Zahl : ",C
780 PRINT B;" : ";C;" = ???"
790 D=B/C
800 PRINT"Hmmm"
810 CLS
820 FOR Z=1 TO 10000:NEXT Z
830 LOCATE 1,1
840 PRINT B;" : ";C;" = ";D
850 FOR Z=1 TO 10000:NEXT Z
860 LOCATE 1,1
870 PRINT B;" : ";C;" =                                                        "
880 Y$=INKEY$:IF Y$=" " THEN GOTO 10
890 GOTO 820
900 CLS
910 PRINT"                           *********** Potenzion **********"
920 PRINT:PRINT"...^...=..."
930 PRINT"Bitte geben sie jetzt die erste Zahl ein !!! >>> ???^...=..."
940 PRINT:INPUT"1. Zahl : ",B
950 PRINT B;" ^ ... = ..."
960 PRINT"Bitte geben sie jetzt die zweite Zahl ein !!! >>> ";B;"^???=..."
970 PRINT:INPUT"2. Zahl : ",C
980 PRINT B;" ^ ";C;" = ???"
990 D=B^C
1000 PRINT"Hmmm"
1010 CLS
1020 FOR Z=1 TO 10000:NEXT Z
1030 LOCATE 1,1
1040 PRINT B;" ^ ";C;" = ";D
1050 FOR Z=1 TO 10000:NEXT Z
1060 LOCATE 1,1
1070 PRINT B;" ^ ";C;" =                                                       "
1080 Y$=INKEY$:IF Y$=" " THEN GOTO 10
1090 GOTO 1020
1500 CLS
1510 PRINT"Durch ENDE werden alle vorhandenen Daten gel”scht und es wird das Microsoft-    Programm BREAK.NEW geladen !!!"
1520 INPUT"Sind Sie sicher (Yes/No) ???";A$
1530 IF A$="yes" OR A$="Yes" THEN 1560
1540 IF A$="no" OR A$="No" THEN RUN
1550 GOTO 1520
1560 PRINT"Ok.Selber schuld !!!"
1570 PRINT"Bitte geben Sie >>>run<<< ein oder drcken Sie die Funktions-Taste II"
1580 PRINT"(Falls Sie noch den Befehl >>>RUN+Enter<<< enth„lt !!!)
1590 PRINT"BREAK in 1590"
1600 LOAD"BREAK.NEW"
