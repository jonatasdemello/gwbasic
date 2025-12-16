10 CLS
20 KEY OFF
30 BEEP:BEEP
40 INPUT "Passwort: ",A$
50 IF A$="Quick" THEN GOTO 330
60 CLS
70 COLOR 15,0,0
80 INPUT"Unter welchem Namen soll Die Sicherungs-Kopie von Break gespeichert werden      Name ????????.???, Eingabetaste fÅr WINDOWS.KOP --> ",A$
90 IF A$="" THEN SAVE"Windows.KOP":GOTO 110
100 SAVE A$
110 REM
120 PRINT"Bitte drÅcken sie eine Taste !!!"
130 A$=INKEY$:IF A$="" THEN 130
140 BEEP
150 COLOR 15,0,0
160 CLS
170 BEEP
180 INPUT"Color     Schriftfarbe        [00-31] : ",A
190 BEEP
200 INPUT"Color Hintergrundfarbe        [00-15] : ",B
210 BEEP
220 INPUT"Color        Randfarbe        [00-15] : ",C
230 IF A<0 OR A>31 THEN BEEP:PRINT"Syntax error in Color Schriftfarbe":GOTO 180
240 IF B<0 OR B>15 THEN BEEP:PRINT"Syntax error in Color Hintergrundfarbe":GOTO 200
250 IF C<0 OR C>15 THEN BEEP:PRINT"Syntax error in Color Randfarbe":GOTO 220
260 IF A=0 THEN BEEP:A=15
270 IF B=0 THEN BEEP:B=0
280 IF C=0 THEN BEEP:C=0
290 COLOR A,B,C
300 CLS
310 REM Screen 0,0,0
320 REM Break von M.Birth
330 CLS
340 PRINT"1 = Basic Eingabe  2 = System  3 = Joysticktest  4 = Break  5 = Datei laden"
350 PRINT"6 = Files          7 = Datum E 8 = Sortieren     9 = Datum  0 = Uhrzeit"
360 PRINT"· = Farbe          # = Datei lîschen             ^ = Datei umbenennen"
370 PRINT"Q = Uhr stellen    W = Datum stellen             E = Screen R=ChDir"
380 PRINT"T = Drucken        Z = Sirenen                   U = Welt Zeit"
390 PRINT"I = Passwortliste  O = DOShell"
400 A$=INKEY$:IF A$="1" OR A$="!" THEN BEEP:GOTO 630
410 IF A$="2" THEN BEEP:GOTO 720
420 IF A$="3" THEN BEEP:GOTO 810
430 IF A$="4" OR A$="$" THEN BEEP:GOTO 960
440 IF A$="6" OR A$="&" THEN BEEP :GOTO 1570
450 IF A$="5" OR A$="%" THEN BEEP:GOTO 1260
460 IF A$="7" OR A$="/" THEN BEEP:GOTO 1670
470 IF A$="8" OR A$="(" THEN BEEP:GOTO 2060
480 IF A$="9" OR A$=")" THEN BEEP:GOTO 2470
490 IF A$="0" OR A$="=" THEN BEEP:GOTO 2590
500 IF A$="·" OR A$="?" THEN BEEP:GOTO 140
510 IF A$="#" OR A$="'" THEN BEEP:GOTO 2800
520 IF A$="¯" OR A$="^" THEN BEEP:GOTO 3060
530 IF A$="q" OR A$="Q" THEN BEEP:GOTO 3340
540 IF A$="w" OR A$="W" THEN BEEP:GOTO 3510
550 IF A$="e" OR A$="E" THEN BEEP:GOTO 3640
560 IF A$="r" OR A$="R" THEN BEEP:GOTO 3820
570  IF A$="t" OR A$="T" THEN BEEP:GOTO 3960
580 IF A$="z" OR A$="Z" THEN BEEP:GOTO 4170
590 IF A$="u" OR A$="U" THEN BEEP:GOTO 4200
600 IF A$="i" OR A$="I" THEN BEEP:GOTO 4400
610 IF A$="o" OR A$="O" THEN BEEP:GOTO 5290
620 GOTO 400
630 CLS:INPUT"Passwort : ",K$
640 IF K$="GW-Basic" OR K$="GW-BASIC" OR K$="GW-basic" THEN GOTO 660
650 GOTO 4060
660 PRINT"Sie haben den Befehl BASIC EINGABE gewÑhlt ."
670 PRINT"Es werden alle enthaltenen DATEN gelîscht !!!"
680 PRINT:PRINT:PRINT"Sind Sie sicher (j/n) ???"
690 B$=INKEY$:IF B$="j" OR B$="J" THEN BEEP:GOTO 1100
700 IF B$="n" OR B$="N" THEN BEEP:GOTO 330
710 GOTO 690
720 CLS:INPUT"Passwort : ",K$
730 IF K$="SYS" OR K$="sys" OR K$="Sys" THEN GOTO 750
740 GOTO 4060
750 CLS:PRINT"Sie haben den Befehl SYSTEM gewÑhlt ."
760 PRINT"Es werden alle DATEN gelîscht und es wird in den Einschaltmodus zurÅckgekehrt !"
770 PRINT:PRINT:PRINT"Sind Sie sicher (j/n) ???"
780 C$=INKEY$:IF C$="j" OR C$="J" THEN BEEP:GOTO 1180
790 IF C$="n" OR C$="N" THEN BEEP:GOTO 330
800 GOTO 780
810 CLS
820 INPUT"Passwort : ",K$
830 IF K$="Stick" OR K$="stick" OR K$="STICK" THEN GOTO 850
840 GOTO 4060
850 PRINT"Der Joysticktest dauert an bis Sie die [Space Bar]-Taste drÅcken !!!"
860 PRINT:PRINT:PRINT"Sind Sie sicher das Sie den Joysticktest gewÑhlt haben (j/n) ???"
870 D$=INKEY$:IF D$="j" OR D$="J" THEN BEEP:GOTO 900
880 IF D$="n" OR D$="N" THEN BEEP:GOTO 330
890 GOTO 870
900 PRINT"Ganz sicher (j/n) ???"
910 E$=INKEY$:IF E$="j" OR E$="J" THEN BEEP:GOTO 940
920 IF E$="n" OR E$="N" THEN BEEP:GOTO 330
930 GOTO 910
940 PRINT"Bitte F2 und anschlie·end [ENTER] drÅcken !!!"
950 LOAD"WINNER.WIN"
960 CLS
970 INPUT"Passwort : ",K$
980 IF K$="END" OR K$="end" OR K$="End" THEN GOTO 1000
990 GOTO 4060
1000 CLS:PRINT"Sie haben den Befehl BREAK gewÑhlt !!!"
1010 PRINT"BREAK lîscht nicht alle DATEN sondern steigt nur aus dem laufendem Programm aus"
1020 PRINT:PRINT:PRINT"Sind Sie sicher das Sie BREAK gewÑhlt haben (j/n) ???"
1030 F$=INKEY$:IF F$="J" OR F$="j" THEN BEEP:GOTO 1060
1040 IF F$="n" OR F$="N" THEN BEEP:GOTO 330
1050 GOTO 1030
1060 PRINT"Sind Sie wirklich sicher (j/n) ???"
1070 G$=INKEY$:IF G$="j" OR G$="J" THEN BEEP:CLS:END
1080 IF G$="n" OR G$="N" THEN BEEP:GOTO 330
1090 GOTO 1070
1100 PRINT"Sind Sie wirklich sicher (j/n) ???"
1110 H$=INKEY$:IF H$="j" OR H$="J" THEN BEEP:GOTO 1140
1120 IF H$="n" OR H$="N" THEN BEEP:GOTO 330
1130 GOTO 1110
1140 PRINT"Letzte Chance (j/n) !!!"
1150 I$=INKEY$:IF I$="j" OR I$="J" THEN BEEP:CLS:NEW
1160 IF I$="n" OR I$="N" THEN BEEP:GOTO 330
1170 GOTO 1150
1180 PRINT"Ganz sicher (j/n) ???"
1190 J$=INKEY$:IF J$="J" OR J$="j" THEN BEEP:GOTO 1220
1200 IF J$="n" OR J$="N" THEN BEEP:GOTO 330
1210 GOTO 1190
1220 PRINT"Letzte Chance (j/n) !!!"
1230 K$=INKEY$:IF K$="j" OR K$="J" THEN BEEP:CLS:SYSTEM
1240 IF K$="n" OR K$="N" THEN BEEP:GOTO 330
1250 GOTO 1230
1260 CLS
1270 INPUT"Passwort : ",K$
1280 IF K$="Load" OR K$="load" OR K$="LOAD" THEN GOTO 1300
1290 GOTO 4060
1300 CLS
1310 FILES
1320 X$=INKEY$:IF X$="" THEN 1320
1330 CLS
1340 CLS:PRINT"Sie haben Programm laden gewÑhlt ! Der Befehl Programm laden lîscht alle "
1350 PRINT"vorhandenen Daten , und ladet ein anderes programm !!!"
1360 PRINT"Bitte geben Sie den Dateinamen ein und drÅcken Sie die (ENTER)-Taste !!!"
1370 INPUT"Dateiname :";Y$
1380 IF Y$="" THEN BEEP:GOTO 1260
1390 IF Y$="MENö" OR Y$="menÅ" OR Y$="MenÅ" THEN BEEP:GOTO 330
1400 CLS
1410 PRINT"Sind Sie sicher das Sie ";Y$;" laden wollen ???"
1420 X$=INKEY$:IF X$="j" OR X$="J" THEN BEEP:GOTO 1450
1430 IF X$="n" OR X$="N" THEN BEEP:GOTO 1260
1440 GOTO 1420
1450 PRINT"Sind Sie wirklich sicher das Sie ";Y$;" laden wollen (j/n) ???"
1460 X$=INKEY$:IF X$="j" OR X$="J" THEN BEEP:GOTO 1490
1470 IF X$="n" OR X$="N" THEN BEEP:GOTO 1260
1480 GOTO 1460
1490 CLS
1500 BEEP:BEEP
1510 PRINT"Ok ";Y$;" wird geladen !!!"
1520 BEEP
1530 PRINT:PRINT:PRINT"*** Wait' please i'm reckon !!! ***"
1540 FOR Z=0 TO 9000:NEXT Z
1550 LOAD Y$
1560 END
1570 CLS
1580 INPUT"Passwort : ",K$
1590 IF K$="File" OR K$="FILE" OR K$="file" THEN GOTO 1610
1600 GOTO 4060
1610 CLS:FILES
1620 PRINT:PRINT:PRINT
1630 BEEP:BEEP
1640 PRINT"                ********** Bitte [Space Bar] drÅcken **********"
1650 V$=INKEY$:IF V$=" " THEN BEEP:GOTO 330
1660 GOTO 1650
1670 CLS
1680 INPUT"Passwort : ",K$
1690 IF K$="Datum" OR K$="DATUM" OR K$="datum" THEN 1710
1700 GOTO 4060
1710 CLS:PRINT"Sie haben Datum gewÑhlt !!!"
1720 PRINT"Bitte geben Sie jetzt Day,Month and Year ein !!!"
1730 REM * einlesen
1740 INPUT"Day   [1.....31] :",D
1750 BEEP:BEEP:BEEP
1760 INPUT"Month [1.....12] :",D1
1770 BEEP:BEEP
1780 LET D=D+100*D1
1790 INPUT"Year  [1991....] :",D1
1800 BEEP
1810 PRINT
1820 IF D1<100 THEN LET D1=D1+1900
1830 LET B=D+D1*10000
1840 BEEP
1850 PRINT"Interne Darstellung : ";B
1860 REM * ausdrucken
1870 LET D1=D-INT(D/100)*100
1880 BEEP
1890 PRINT USING "## . ";D1;
1900 LET D1=INT((D-INT(D/10000)*10000)/100)
1910 FOR I=1 TO D1
1920 READ M$
1930 NEXT I
1940 BEEP
1950 PRINT M$;"";
1960 PRINT USING " ####";INT(B/10000)
1970 DATA "Januar","Februar","MÑrz","April","Mai","Juni"
1980 DATA "Juli","August","September","Oktober","November","Dezember"
1990 PRINT:PRINT:PRINT
2000 PRINT"               ********** Bitte [Space Bar] drÅcken **********"
2010 V$=INKEY$:IF V$=" " THEN GOTO 2030
2020 GOTO 2010
2030 BEEP:BEEP:BEEP
2040 RESTORE
2050 GOTO 330
2060 CLS
2070 INPUT"Passwort : ",K$
2080 IF K$="Sort" OR K$="sort" OR K$="SORT" THEN GOTO 2100
2090 GOTO 4060
2100 CLS:PRINT"Sie haben SORTIEREN gewÑhlt !!!"
2110 PRINT"Geben Sie jetzt ein wieviel Buchstaben oder Zahlen Sie sortieren wollen !!!"
2120 REM * daten einlesen
2130 BEEP
2140 INPUT"Anzahl der Zeilen : ",N
2150 BEEP
2160 PRINT:PRINT
2170 DIM A$(N)
2180 FOR I=1 TO N
2190 PRINT "a$ ( ";I;
2200 BEEP
2210 INPUT " ) : ",A$(I)
2220 PRINT:PRINT
2230 NEXT I
2240 REM *sortieren
2250 REM "keine vertauschung" signalisieren
2260 LET S%=0
2270 REM ein sortierdurchlauf
2280 FOR I=1 TO N-1
2290 REM wenn nîtig vertauschen und flag setzen
2300 IF A$(I)>A$(I+1) THEN SWAP A$(I),A$(I+1):LET S%=1
2310 NEXT I
2320 IF S%<>0 THEN GOTO 2260
2330 REM fertig sortiert,da keine vertauschung mehr
2340 REM * Ergebnis ausgeben
2350 CLS
2360 BEEP
2370 PRINT"Sortierte Ausgabe :"
2380 FOR I=1 TO N
2390 PRINT A$(I)
2400 NEXT I
2410 PRINT"                     ********** Bitte [Space Bar] drÅcken **********"
2420 V$=INKEY$:IF V$=" " THEN GOTO 2440
2430 GOTO 2420
2440 BEEP:BEEP:BEEP
2450 FOR Z=1 TO 9999:NEXT Z
2460 GOTO 330
2470 CLS
2480 PRINT:PRINT:PRINT
2490 M$=DATE$
2500 PRINT"                          M. D. Year"
2510 PRINT"                          ";M$
2520 PRINT:PRINT:PRINT
2530 BEEP:PRINT"                  ********** Bitte [Space Bar] drÅcken **********"
2540 V$=INKEY$:IF V$=" " THEN GOTO 2560
2550 GOTO 2540
2560 BEEP:BEEP:BEEP
2570 FOR Z=1 TO 9999:NEXT Z
2580 GOTO 330
2590 CLS
2600 PRINT"Es ist jetzt ";TIME$;" Uhr !!!"
2610 INPUT"Weckzeit [..:..:..] : ",T$
2620 CLS
2630 LOCATE 12,30
2640 N$=TIME$
2650 PRINT N$
2660 IF N$=T$ THEN GOTO 2770
2670 V$=INKEY$:IF V$=" " THEN GOTO 2740
2680 SEC=VAL(MID$(TIME$,7,2))
2690 IF SEC=SSEC THEN 2630 ELSE SSEC=SEC
2700 IF SEC=0 THEN SOUND 2000,8:GOTO 2630
2710 IF SEC=30 THEN SOUND 400,4:GOTO 2630
2720 IF SEC< 0 THEN GOTO 2630
2730 SOUND 1000,2:GOTO 2630
2740 BEEP:BEEP:BEEP
2750 FOR Z=1 TO 9999:NEXT Z
2760 GOTO 330
2770 BEEP:BEEP:BEEP:BEEP
2780 L$=INKEY$:IF L$=" " THEN GOTO 2630
2790 GOTO 2770
2800 CLS
2810 INPUT"Passwort : ",A$
2820 IF A$="killing" OR A$="Killing" OR A$="KILLING" THEN 2840
2830 GOTO 4060
2840 CLS
2850 FILES
2860 X$=INKEY$:IF X$="" THEN 2860
2870 CLS
2880 PRINT"Datei lîschen hei·t das ein Programm oder eine Datei gelîscht wird !!!"
2890 PRINT :INPUT"Dateiname : ",C$
2900 IF C$="menÅ" OR C$="MENö" OR C$="MenÅ" THEN GOTO 330
2910 CLS
2920 PRINT"Sind Sie sicher das Sie die Datei ";C$;" lîschen wollen [j/n] ???"
2930 Z$=INKEY$:IF Z$="j" OR Z$="J" THEN 2960
2940 IF Z$="n" OR Z$="N" THEN 2840
2950 GOTO 2930
2960 PRINT:PRINT"Sind Sie wirklich sicher das Sie ";C$;" lîschen wollen [j/n] ???"
2970 Y$=INKEY$:IF Y$="j" OR Y$="J" THEN 3000
2980 IF Y$="n" OR Y$="N" THEN 2840
2990 GOTO 2970
3000 CLS
3010 PRINT "   *********** Ok ";C$;" wird gelîscht **********"
3020 PRINT
3030 PRINT "   ********** Wai't please i'm reckon **********"
3040 KILL C$
3050 GOTO 2840
3060 CLS
3070 INPUT"Passwort : ",A$
3080 IF A$="Re-Name" OR A$="re-name" THEN 3100
3090 GOTO 4060
3100 CLS
3110 FILES
3120 X$=INKEY$:IF X$="" THEN 3120
3130 CLS
3140 PRINT "Datei umbenennen heisst das ein Programm oder eine Datei umbenannt"
3150 PRINT "werden kann !!!"
3160 PRINT :INPUT"Dateiname : ",C$
3170 IF C$="menÅ" OR C$="MENö" OR C$="MenÅ" THEN GOTO 330
3180 PRINT:INPUT"Neuer Dateiname : ",D$
3190 IF D$="menÅ" OR D$="MenÅ" OR D$="MENö" THEN 330
3200 CLS
3210 PRINT "Sind Sie sicher das Sie ";C$;" in ";D$;" umbenennen wollen [j/n] ???"
3220 Y$=INKEY$:IF Y$="j" OR Y$="J" THEN 3250
3230 IF Y$="n" OR Y$="N" THEN 3100
3240 GOTO 3220
3250 PRINT :PRINT "Sind Sie wirklich sicher das Sie ";C$;" in ";D$;" umbennen wollen [j/n]"
3260 X$=INKEY$:IF X$="j" OR X$="J" THEN 3290
3270 IF X$="n" OR X$="N" THEN 3100
3280 GOTO 3260
3290 CLS
3300 PRINT "***** Ok ";C$;" wird in ";D$;" umbenannt *****"
3310 PRINT:PRINT"********** Wai't please i'm reckon **********"
3320 NAME C$ AS D$
3330 GOTO 3100
3340 BEEP
3350 CLS
3360 INPUT"Passwort : ",A$
3370 IF A$="Time$" OR A$="time$" OR A$="TIME$" THEN 3390
3380 GOTO 4060
3390 CLS
3400 PRINT"Sie haben Uhr stellen gewÑhlt !!!"
3410 PRINT
3420 PRINT
3430 PRINT"GegenwÑrtige Uhrzeit    :";TIME$
3440 PRINT
3450 INPUT"Neue Uhrzeit [HH:MM:SS] : ",A$
3460 IF A$="" THEN 3480
3470 TIME$=A$
3480 PRINT"Ok"
3490 FOR Z=0 TO 1000:NEXT Z
3500 GOTO 320
3510 CLS
3520 INPUT"Passwort : ",A$
3530 IF A$="Date$" OR A$="date$" OR A$="DATE$" THEN 3550
3540 GOSUB 4060
3550 CLS
3560 PRINT"Sie haben Datum einstellen gewÑhlt !!!"
3570 PRINT:PRINT:PRINT"GegenwÑrtiges Datum      : ";DATE$
3580 PRINT:PRINT:INPUT"Neues Datum [MM-DD-YYYY] : ",A$
3590 IF A$="" THEN 3610
3600 DATE$=A$
3610 PRINT"Ok"
3620 FOR Z=0 TO 1000:NEXT Z
3630 GOTO 320
3640 CLS
3650 INPUT"Passwort : ",A$
3660 IF A$="screen" OR A$="SCREEN" OR A$="Screen" THEN 3680
3670 GOTO 4060
3680 PRINT"Sie haben SCREEN gewÑhlt !!!"
3690 PRINT"Bitte wÑhlen sie einen Screen aus !?"
3700 PRINT"Screen 0: Textformat 40x25 oder 80x25 Rahmen : 8x8 oder 8x14 mit EGA 16 Colors"
3710 PRINT"Screen 1: 320x200 Bildelemente Textformat 80x25 Rahmen 8x8 16 Colors"
3720 PRINT"Screen 2: 640x200  ~       ~    ~     ~   40x25  ~  ~   ~  16  ~  ~"
3730 PRINT"Screen 7: 320x200  ~       ~    ~     ~   40x25  ~  ~   ~  16  ~  ~"
3740 PRINT"Screen 8: 640x200  ~       ~    ~     ~   80x25  ~  ~   ~  16  ~  ~"
3750 PRINT"Screen 9: 640x350 Bildelemente Textformat 80x25  ~  ~ 8x14 16 Colors"
3760 PRINT"Screen 10:640x350  ~       ~    ~     ~   80x25  ~  ~   ~  09 Pseudo-Colors"
3770 PRINT
3780 INPUT"Screen ",A
3790 IF A<0 OR A>10 THEN 3640
3800 SCREEN A
3810 GOTO 320
3820 CLS
3830 INPUT"Passwort:",A$
3840 IF A$="dir" OR A$="DIR" OR A$="Dir" THEN 3860
3850 GOTO 4060
3860 CLS
3870 PRINT"Sie haben ChDir gewÑhlt.Geben Sie das Laufwerk und das Unterverzeichnis an !!!"
3880 PRINT
3890 INPUT"CHDIR";A$
3900 CHDIR A$
3910 CLS
3920 PRINT"*** Wait please i'm reckon ***"
3930 FOR Z=0 TO 5000:NEXT Z
3940 PRINT"Ok. Der Pfad ist ";A$;" !!!"
3950 GOTO 320
3960 CLS
3970 INPUT"Passwort : ",A$
3980 IF A$="Drucker-Memory" OR A$="drucker-memory" THEN 4000
3990 GOTO 4060
4000 PRINT"Wollen Sie wirklich die Datei BREAK.NEW schlie·en und die Datei DRUCKERM.WIN    îffnen ???"
4010 A$=INKEY$:IF A$="y" OR A$="Y" THEN 4040
4020 IF A$="n" OR A$="N" THEN
4030 GOTO 4010
4040 PRINT"Bitte drÅcken Sie die F2-Taste falls sie noch den Befehl RUN+ENTER enthÑlt !!!"
4050 LOAD"DRUCKERM.WIN":END
4060 REM Markus Birth
4070 A=350
4080 A=A+10
4090 COLOR ,15,7
4100 CLS
4110 FOR Z=0 TO 250:NEXT
4120 COLOR ,0,0
4130 CLS
4140 SOUND A,1
4150 IF A=750 THEN 4070
4160 GOTO 4080
4170 CLS
4180 PRINT"Bitte drÅcken Sie die F2 Taste !!!"
4190 LOAD "sirene.win"
4200 CLS
4210 PRINT "Sie haben das Laden von ";CHR$(34);"WORLDTIM.WIN";CHR$(34);" gewÑhlt !"
4220 PRINT"Stimmt da· ???"
4230 A$=INKEY$:IF A$="" THEN 4230
4240 IF A$="n" OR A$="N" THEN GOTO 330
4250 IF A$="j" OR A$="J" THEN GOTO 4270
4260 GOTO 4230
4270 PRINT"Wirklich ??? Bedenken Sie: Alle Daten werden aus dem Speicher gelîscht !!!"
4280 A$=INKEY$:IF A$="" THEN 4280
4290 IF A$="n" OR A$="N" THEN GOTO 330
4300 IF A$="j" OR A$="J" THEN GOTO 4320
4310 GOTO 4280
4320 PRINT"Letzte Chance !!!"
4330 A$=INKEY$:IF A$="" THEN 4330
4340 IF A$="n" OR A$="N" THEN GOTO 330
4350 IF A$="j" OR A$="J" THEN GOTO 4370
4360 GOTO 4330
4370 CLS
4380 PRINT"Bitte drÅcken Sie die F2-Taste !!!"
4390 LOAD"worldtim.win":RUN
4400 CLS:INPUT"PASSWORT: ",A$
4410 IF A$="RoboCop" THEN GOTO 4430
4420 GOTO 4060
4430 CLS:PRINT"                    *** PASSWORT-LISTE ausgeben ***"
4440 PRINT:PRINT"1 - Ausgabe auf Drucker: HP LaserJet Series II"
4450 PRINT"2 - Ausgabe auf Bildschirm: MORSE VGAplus"
4460 PRINT:INPUT"Wahl [1/2]: ",A$
4470 IF A$="1" THEN GOTO 4500
4480 IF A$="2" THEN GOTO 4910
4490 PRINT"FALSCHEINGABE!!!":GOTO 4460
4500 CLS:PRINT"Ausgabe auf dem Drucker"
4510 PRINT:PRINT"Schalten Sie den Drucker ein und lassen Sie ihn hochfahren!"
4520 PRINT"*** Taste wenn fertig ***"
4530 A$=INKEY$:IF A$="" THEN 4530
4540 CLS:PRINT"*** Ausdruck auf Drucker lÑuft ***"
4550 LPRINT
4560 LPRINT"                    *** Passwortliste von WINDOWS.BAS ***"
4570 LPRINT:LPRINT"Programm: GWBASIC.EXE             Datei: WINDOWS.BAS"
4580 LPRINT"ö-Rate  : 8-Bit                   Pass.: Alle"
4590 LPRINT
4600 LPRINT"…ÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª"
4610 LPRINT"∫Taste≥Funktion                   ≥Passwort                                   ∫"
4620 LPRINT"ÃÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
4630 LPRINT"∫    1≥ Basic eingabe             ≥ GW-Basic / GW-BASIC / GW-basic            ∫"
4640 LPRINT"|    2| System                    | Sys      / SYS      / sys                 |"
4650 LPRINT"|    3| Joystick-Test             | Stick    / STICK    / stick               |"
4660 LPRINT"|    4| Break                     | End      / END      / end                 |"
4670 LPRINT"|    5| Datei laden               | Load     / LOAD     / load                |"
4680 LPRINT"|    6| Files                     | File     / FILE     / file                |"
4690 LPRINT"|    7| Datum                     | Datum    / DATUM    / datum               |"
4700 LPRINT"|    8| Sortieren                 | Sort     / SORT     / sort                |"
4710 LPRINT"|    9| Datum                     | ** Kein PASSWORT erforderlich **          |"
4720 LPRINT"|    0| Uhrzeit                   | ** Kein PASSWORT erforderlich **          |"
4730 LPRINT"|    ·| Farbe                     | ** Kein PASSWORT erforderlich **          |"
4740 LPRINT"|    #| Datei lîschen             | Killing  / KILLING  / killing             |"
4750 LPRINT"|    ^| Datei umbenennen          | Re-Name  / RE-NAME  / re-name             |"
4760 LPRINT"|    Q| Uhr stellen               | Time$    / TIME$    / time$               |"
4770 LPRINT"|    W| Datum stellen             | Date$    / DATE$    / date$               |"
4780 LPRINT"|    E| Screen                    | Screen   / SCREEN   / screen              |"
4790 LPRINT"|    R| ChDir [Change Directory]  | Dir      / DIR      / dir                 |"
4800 LPRINT"|    T| Drucken                   | Drucker-Memory / drucker-memory           |"
4810 LPRINT"|    Z| Sirenen                   | ** Kein PASSWORT erforderlich **          |"
4820 LPRINT"|    U| WeltZeit                  | ** Kein PASSWORT erforderlich **          |"
4830 LPRINT"|    I| Passwortliste             | RoboCop                                   |"
4840 LPRINT"|    O| DOS-Shell                 | Quit     / QUIT     / quit                |"
4850 LPRINT"|-----|---------------------------|-------------------------------------------|"
4860 LPRINT:LPRINT
4870 LPRINT"** Ende der Liste **"
4880 PRINT"** Ausdruck fertig **"
4890 PRINT
4900 GOTO 330
4910 CLS:PRINT"Ausgabe auf dem Bildschirm"
4920 PRINT:PRINT"** Wenn bereit Taste drÅcken **"
4930 A$=INKEY$:IF A$="" THEN 4930
4940 CLS:PRINT"                     *** Passwortliste von WINDOWS.BAS ***"
4950 PRINT
4960 PRINT"|-----|---------------------------|-------------------------------------------|"
4970 PRINT"|Taste|Funktion                   |Passwort                                   |"
4980 PRINT"|-----|---------------------------|-------------------------------------------|"
4990 PRINT"|    1| Basic eingabe             | GW-Basic / GW-BASIC / GW-basic            |"
5000 PRINT"|    2| System                    | Sys      / SYS      / sys                 |"
5010 PRINT"|    3| Joystick-Test             | Stick    / STICK    / stick               |"
5020 PRINT"|    4| Break                     | End      / END      / end                 |"
5030 PRINT"|    5| Datei laden               | Load     / LOAD     / load                |"
5040 PRINT"|    6| Files                     | File     / FILE     / file                |"
5050 PRINT"|    7| Datum                     | Datum    / DATUM    / datum               |"
5060 PRINT"|    8| Sortieren                 | Sort     / SORT     / sort                |"
5070 PRINT"|    9| Datum                     | ** Kein PASSWORT erforderlich **          |"
5080 PRINT"|    0| Uhrzeit                   | ** Kein PASSWORT erforderlich **          |"
5090 PRINT"|    ·| Farbe                     | ** Kein PASSWORT erforderlich **          |"
5100 PRINT"|    #| Datei lîschen             | Killing  / KILLING  / killing             |"
5110 PRINT"|    ^| Datei umbenennen          | Re-Name  / RE-NAME  / re-name             |"
5120 PRINT:PRINT" ** Taste fÅr weiter **"
5130 A$=INKEY$:IF A$="" THEN 5130
5140 LOCATE 19,1
5150 PRINT"|    Q| Uhr stellen               | Time$    / TIME$    / time$               |"
5160 PRINT"|    W| Datum stellen             | Date$    / DATE$    / date$               |"
5170 PRINT"|    E| Screen                    | Screen   / SCREEN   / screen              |"
5180 PRINT"|    R| ChDir [Change Directory]  | Dir      / DIR      / dir                 |"
5190 PRINT"|    T| Drucken                   | Drucker-Memory / drucker-memory           |"
5200 PRINT"|    Z| Sirenen                   | ** Kein PASSWORT erforderlich **          |"
5210 PRINT"|    U| WeltZeit                  | ** Kein PASSWORT erforderlich **          |"
5220 PRINT"|    I| Passwortliste             | RoboCop                                   |"
5230 PRINT"|    O| DOS-Shell                 | Quit     / QUIT     / quit                |"
5240 PRINT"|-----|---------------------------|-------------------------------------------|"
5250 PRINT:PRINT"** Ende der Liste **"
5260 PRINT" *** Wenn fertig beliebige Taste drÅcken ***"
5270 A$=INKEY$:IF A$="" THEN 5270
5280 GOTO 330
5290 REM DOShell
5300 CLS
5310 PRINT"Dieses Programm geht in die DOS-Ebene und kehrt bei der Eingabe von"
5320 PRINT"EXIT"
5330 PRINT"wieder in GW-BASIC zurÅck."
5340 PRINT
5350 INPUT"Passwort: ",PASS$
5360 IF PASS$="QUIT" OR PASS$="quit" OR PASS$="Quit" THEN GOTO 5380
5370 GOTO 4060
5380 REM Weiter im Programm
5390 INPUT"Programm, das aufgerufen werden soll (ENTER fÅr COMMAND): ",P$
5400 IF P$="" THEN P$="COMMAND.COM"
5410 SHELL P$
5420 PRINT"Mit Taste zurÅck zu WINDOWS.BAS ..."
5430 A$=INKEY$:IF A$="" THEN 5430
5440 CLS:GOTO 330
