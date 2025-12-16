10 CLS
20 COLOR 15
30 PRINT"MakeUtility fÅr LAUF II DAT"
40 PRINT
50 PRINT"Dieses Programm erstellt Datendateien fÅr LAUF II DAT (*.L2D)"
60 PRINT
70 A=1
80 PRINT"Geben Sie erst den Text und dann"
90 PRINT"die Farbnummer ein"
100 PRINT
110 PRINT"z.B:"
120 PRINT"Test [ENTER] 15 [ENTER]"
130 PRINT"  |           |"
140 PRINT"  |            --- Farbe 15 (Hellwei·)"
150 PRINT"   --------------- Text: ";CHR$(34);"Test";CHR$(34)
160 PRINT
170 A$=INKEY$:IF A$="" THEN 170
180 CLS
190 INPUT"Anzahl an SÑtzen :",NUM
200 DIM TXT$(NUM+2)
210 DIM COLR(NUM+2)
220 CLS
230 PRINT"STOP      - Fertig!"
240 PRINT"REVERSE   - 1.Datensatz zurÅck"
250 PRINT"LAST TOO  - letzten Datensatz in jetzigen kopieren"
260 PRINT"COLORS    - Zeigt alle Farben an"
270 PRINT"[ENTER]   - Aktuelle Daten erhalten"
280 PRINT
290 PRINT"Alter Datensatz:"
300 PRINT CHR$(34);TXT$(A);CHR$(34)
310 PRINT:PRINT"Alte Farbe:"
320 PRINT USING"##";COLR(A)
330 PRINT
340 TXTSAVE$=TXT$(A)
350 COLSAVE=COLR(A)
360 PRINT"Satz "A" :";:INPUT "",TXT$(A)
370 IF TXT$(A)="STOP" OR TXT$(A)="stop" THEN GOTO 720
380 IF TXT$(A)="REVERSE" OR TXT$(A)="reverse" THEN GOTO 470
390 IF TXT$(A)="LAST TOO" OR TXT$(A)="last too" THEN GOTO 500
400 IF TXT$(A)="COLORS" OR TXT$(A)="colors" THEN GOTO 1010
410 IF TXT$(A)="" THEN TXT$(A)=TXTSAVE$
420 PRINT"Farbe "A":";:INPUT "",COLR(A)
430 IF COLR(A)=0 THEN COLR(A)=COLSAVE
440 PRINT
450 A=A+1
460 GOTO 220
470 REM REVERSE
480 A=A-1
490 GOTO 220
500 REM LAST TOO
510 CLS
520 PRINT"Wollen Sie wirklich den Datensatz Nr. "A" mit dem Datensatz Nr. "A-1
530 PRINT"Åberschreiben [J/N] ???"
540 PRINT
550 PRINT"Datenvergleich:"
560 PRINT"Jetziger Datensatz:"
570 PRINT"Nß "A
580 PRINT CHR$(34);TXT$(A);CHR$(34)
590 PRINT
600 PRINT"Vorlagensatz:"
610 PRINT"Nß "A-1
620 PRINT CHR$(34);TXT$(A-1);CHR$(34)
630 PRINT
640 A$=INKEY$:IF A$="" THEN 640
650 IF A$="j" OR A$="J" THEN GOTO 680
660 IF A$="n" OR A$="N" THEN GOTO 220
670 GOTO 640
680 REM öBERWRITEN
690 PRINT"Datensatz wird kopiert..."
700 TXT$(A)=TXT$(A-1):COLR(A)=COLR(A-1)
710 A=A+1:GOTO 220
720 REM SPEICHERN
730 CLS
740 PRINT"Wollen Sie schon speichern?"
750 A$=INKEY$:IF A$="" THEN 750
760 PRINT
770 INPUT"Wie soll die Datei hei·en [max. 8 Bstbn.]    ";DAT$
780 IF LEN(DAT$)>8 THEN GOTO 960
790 PRINT"[ENTER] fÅr L2D"
800 INPUT"Wie soll die Extension lauten [max. 3 Stln.] ";EXT$
810 IF EXT$="" THEN EXT$="L2D"
820 IF LEN(EXT$)>3 THEN GOTO 960
830 DATEI$=DAT$+"."+EXT$
840 OPEN "O",#1,DATEI$
850 ENDCHAR=A
860 WRITE#1,ENDCHAR
870 FOR X=1 TO ENDCHAR
880 WRITE#1,TXT$(X),COLR(X)
890 NEXT X
900 PRINT"Fertig!"
910 CLS
920 FILES DATEI$
930 PRINT
940 PRINT
950 END
960 REM FEHLER!
970 CLS:PRINT"Es ist ein Fehler bei der Eingabe der Dateinamen aufgetreten!"
980 PRINT"Geben Sie sie bitte nocheinmal ein."
990 A$=INKEY$:IF A$="" THEN 990
1000 GOTO 720
1010 REM Anzeige der Farben
1020 CLS
1030 COLOR 15:PRINT"Normale Farben:"
1040 COLOR 15:PRINT"00 - Schwarz       ";:COLOR 1:PRINT"01 - Dunkelblau    ";:COLOR 2:PRINT"02 - DunkelgrÅn    ";:COLOR 3:PRINT"03 - Dunkelcyan"
1050 COLOR 4:PRINT"04 - Dunkelrot     ";:COLOR 5:PRINT"05 - Dunkelviolett ";:COLOR 6:PRINT"06 - Braun         ";:COLOR 7:PRINT"07 - Hellgrau"
1060 COLOR 8:PRINT"08 - Grau          ";:COLOR 9:PRINT"09 - Blau          ";:COLOR 10:PRINT"10 - HellgrÅn      ";:COLOR 11:PRINT"11 - Hellblau"
1070 COLOR 12:PRINT"12 - Hellrot       ";:COLOR 13:PRINT"13 - Hellviolett   ";:COLOR 14:PRINT"14 - Gelb          ";:COLOR 15:PRINT"15 - Wei·"
1080 PRINT
1090 PRINT"Blinkende Farben:"
1100 COLOR 31:PRINT"16 - Schwarz       ";:COLOR 17:PRINT"17 - Dunkelblau    ";:COLOR 18:PRINT"18 - DunkelgrÅn    ";:COLOR 19:PRINT"19 - Dunkelcyan"
1110 COLOR 20:PRINT"20 - Dunkelrot     ";:COLOR 21:PRINT"21 - Dunkelviolett ";:COLOR 22:PRINT"22 - Braun         ";:COLOR 23:PRINT"23 - Hellgrau"
1120 COLOR 24:PRINT"24 - Grau          ";:COLOR 25:PRINT"25 - Blau          ";:COLOR 26:PRINT"26 - HellgrÅn      ";:COLOR 27:PRINT"27 - Hellblau"
1130 COLOR 28:PRINT"28 - Hellrot       ";:COLOR 29:PRINT"29 - Hellviolett   ";:COLOR 30:PRINT"30 - Gelb          ";:COLOR 31:PRINT"31 - Wei·"
1140 COLOR 15
1150 A$=INKEY$:IF A$="" THEN 1150
1160 GOTO 220
