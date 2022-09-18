10 CLS
20 PATH$="C:\>"
30 MEG=245
40 PRINT PATH$;
50 INPUT "",A$
60 IF A$="qwertzuiopÅ+ASDFGHJKLôéyxcvbnm,.-" THEN END
70 IF A$="qwertzuiop" THEN PRO=100:GOTO 190
80 PRINT
90 PRINT"WARNUNG !  Alle Daten auf der Festplatte"
100 PRINT"in Laufwerk C: werden gelîscht!"
110 PRINT"Formatieren durchfÅhren (J/N)? ";
120 INPUT "",A$
130 LOCATE 5,32:PRINT"j"
140 PRINT
150 PRINT USING"Formatiere ### MB";MEG
160 PRINT USING"### Prozent des DatentrÑgers formatiert";PRO
170 SHELL"ECHO FORMATIERE!!!>C:\FORMAT.DAT"
180 A=A+1:IF A>=(MEG/20) THEN PRO=PRO+1:A=0
190 IF PRO=100 THEN SUCC=1:PRO =0:LOCATE 8,1:GOTO 160
200 IF SUCC=1 THEN 220
210 LOCATE 8,1:GOTO 160
220 LOCATE 8,1:PRINT"Formatieren beendet                           "
230 SHELL"DEL FORMAT.DAT"
240 BTE$=STR$(1024*1024*MEG/1000)
250 BTEI$=LEFT$(BTE$,4)+"."+MID$(BTE$,5,3)
260 BTE$=STR$(1024*1024*MEG*10000000#)
270 BTEI$=BTEI$+"."+MID$(BTE$,8,3)
280 ZEVERF$=STR$(1024*1024*MEG/512)
290 ZEVERF$=LEFT$(ZEVERF$,4)+"."+RIGHT$(ZEVERF$,3)
300 GOSUB 630
310 PRINT
320 INPUT"DatentrÑgerbezeichnung (11 Zeichen, EINGABETASTE fÅr keine)? ",LBL$
330 IF LEN(LBL$)>12 THEN LOCATE 10,1:GOTO 320
340 PRINT
350 PRINT USING"  \          \ Byte Speicher auf dem DatentrÑger insgesamt";BTEI$
360 PRINT USING"  \          \ Byte auf dem DatentrÑger verfÅgbar";BTEI$
370 PRINT
380 PRINT"           512 Byte in jeder Zuordnungseinheit."
390 PRINT USING"      \      \ Zuordnungseinheiten auf dem DatentrÑger verfÅgbar.";ZEVERF$
400 PRINT
410 PRINT USING"DatentrÑgernummer: \       \";DNUM$
420 PRINT
430 PRINT PATH$;
440 INPUT "",COMM$
450 IF COMM$="d:" OR COMM$="D:" THEN PATH$="D:\>":MEG=120:GOTO 40
460 IF COMM$="dir" OR COMM$="DIR" THEN GOTO 510
470 IF LEFT$(COMM$,3)="cd " OR LEFT$(COMM$,3)="CD " THEN GOTO 580
480 IF COMM$="cd" OR COMM$="CD" THEN GOTO 600
490 IF COMM$="cls" OR COMM$="CLS" THEN CLS:GOTO 430
500 PRINT"Befehl oder Dateiname nicht gefunden":GOTO 420
510 IF LBL$<>"" THEN DR$=" ist "+LBL$ ELSE DR$=" hat keine DatentrÑgerbezeichnung"
520 PRINT" DatentrÑger in Laufwerk ";LEFT$(PATH$,1);DR$
530 PRINT" DatentrÑger-Seriennummer ist ";DNUM$
540 PRINT" Verzeichnis von ";LEFT$(PATH$,3)
550 PRINT
560 PRINT"Datei nicht gefunden"
570 GOTO 420
580 PRINT"UngÅltiges Verzeichnis"
590 GOTO 420
600 PRINT LEFT$(PATH$,3)
610 GOTO 420
620 END
630 A=INT(RND*16)+1
640 IF A=1 THEN B$="0"
650 IF A=2 THEN B$="1"
660 IF A=3 THEN B$="2"
670 IF A=4 THEN B$="3"
680 IF A=5 THEN B$="4"
690 IF A=6 THEN B$="5"
700 IF A=7 THEN B$="6"
710 IF A=8 THEN B$="7"
720 IF A=9 THEN B$="8"
730 IF A=10 THEN B$="9"
740 IF A=11 THEN B$="A"
750 IF A=12 THEN B$="B"
760 IF A=13 THEN B$="C"
770 IF A=14 THEN B$="D"
780 IF A=15 THEN B$="E"
790 IF A=16 THEN B$="F"
800 IF A<1 OR A>16 THEN B$="9"
810 DNUM$=DNUM$+B$
820 IF LEN(DNUM$)=4 THEN DNUM$=DNUM$+"-"
830 IF LEN(DNUM$)>=9 THEN RETURN
840 GOTO 630
