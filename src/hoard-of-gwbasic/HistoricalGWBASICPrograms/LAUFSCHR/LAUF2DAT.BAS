10 REM ๐๐๐ L ๐ A ๐ U ๐ F ๐ S ๐ C ๐ H ๐ R ๐ I ๐ F ๐ T ๐๐๐
20 REM                                  von Markus Birth
30 REM
40 SAVE"LAUF2DAT.BAK"
50 SCREEN 0,0,0
60 WIDTH 80
70 KEY OFF
80 CLS
90 COLOR 14:PRINT"ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออัอออออออออออออป"
100 COLOR 14:PRINT"บ ๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ L A U F S C H R I F T ๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ณ von RoboCop บ"
110 COLOR 14:PRINT"ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฯอออออออออออออผ"
120 PRINT
130 COLOR 15
140 PRINT"Als Zeile k”nnen Sie bis zu 2 Zeilen Text eingeben!"
150 PRINT"Nach jeder Anzeige einer Zeile wird eine leere Zeile ausgegeben."
160 PRINT"Sie k”nnen alle Zeichen auแer: ";CHR$(44);CHR$(59);" und ";CHR$(34);" eingeben."
170 PRINT"Wenn Sie ein nichtprintbares Zeichen eingeben, erscheint :"
180 PRINT CHR$(34);"Neue Eingabe?";CHR$(34);" und Sie drfen den Text nochmal eingeben."
190 LOCATE 23,1
200 PRINT"                                 *** Taste ***"
210 A$=INKEY$:IF A$="" THEN GOTO 210
220 CLS
230 COLOR 15
240 INPUT"Dateiname [ENTER fr LAUFTEXT.L2D]:",D$
250 IF D$="" THEN D$="LAUFTEXT.L2D"
260 OPEN "I",#1,D$
270 INPUT#1,A
280 DIM Z$(A+2):DIM C(A+2):DIM ZC$(A+2)
290 FOR X=1 TO A
300 IF EOF(1) THEN 330
310 INPUT#1,Z$(X),C(X)
320 NEXT X
330 CLOSE 1
340 INPUT"Pause         :",P
350 PRINT
360 PRINT"[1-80]"
370 INPUT"Zeilenlnge   :",ZL
380 PRINT
390 PRINT"[J/N]"
400 INPUT"Wiederholen   :",W$
410 PRINT
420 PRINT"[J/N]"
430 INPUT"Gr”แenautom.  :",GA$
440 IF GA$="j" OR GA$="J" AND ZL<41 THEN WIDTH 40
450 CLS
460 B=1
470 ZC$(B)=SPACE$(ZL-1) + Z$(B) + " "
480 B=B+1
490 IF B>A THEN GOTO 510
500 GOTO 470
510 REM Hauptroutine
520 X=1
530 B=1
540 CLS
550 IF B>A THEN 650
560 COLOR C(B)
570 TX$=ZC$(B)
580 T$=MID$(TX$,X,ZL)
590 LOCATE 1,1
600 PRINT T$;
610 X=X+1
620 IF X>LEN(TX$) THEN B=B+1:X=1:GOTO 550
630 FOR M=0 TO P:NEXT M
640 GOTO 570
650 IF W$="j" OR W$="J" THEN X=1:B=1:GOTO 550
660 COLOR 15
670 END
