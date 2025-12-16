10 KEY OFF
20 CLS
30 COLOR 12:PRINT"FunkgerÑt              ";:COLOR 14:PRINT"HF 12/5"
40 COLOR 12:PRINT"Hersteller             ";:COLOR 14:PRINT"dnt"
50 COLOR 12:PRINT"Wellenbereiche         ";:COLOR 14:PRINT"FM 26.965 - 27.405 MHz"
60 PRINT"                       ";:COLOR 14:PRINT"AM   ---- -   ---- kHz"
70 PRINT
80 COLOR 15:PRINT
90 PRINT"Geben Sie die korrekte Serien-Nummer (Ser.Nß.) ein :"
100 PRINT"--------"
110 A=A+1
120 B=B+1
130 IF A=9 THEN 170
140 A$(B)=INKEY$:IF A$(B)="" GOTO 140
150 LOCATE 8,A:PRINT A$(B)
160 GOTO 110
170 PRINT:PRINT
180 FOR Z=1 TO 8
190 ZAHL$=ZAHL$+A$(Z)
200 NEXT Z
210 IF ZAHL$="11903603" THEN GOTO 280
220 IF ZAHL$="12920854" THEN GOTO 510
250 PRINT:PRINT"DatenFile nicht gefunden. Falscher Code eingegeben."
260 A$=INKEY$:IF A$="" THEN 260
270 A=0:B=0:A$="":GOTO 20
280 REM ********** 11903603  ---  RoboCop **********
290 CLS
300 COLOR 12:PRINT"BÅrgerlicher Name        ";:COLOR 10:PRINT"Birth, Markus"
310 COLOR 12:PRINT"Stra·e                   ";:COLOR 10:PRINT"Musterstrasse 1"
320 COLOR 12:PRINT"Postleitzahl / Wohnort   ";:COLOR 10:PRINT"12345 Musterstadt"
330 COLOR 12:PRINT"Telefon-Nummer           ";:COLOR 10:PRINT"(0123) 4567"
340 COLOR 12:PRINT:COLOR 15
350 PRINT"CodeName :":PRINT
360 PRINT"€€€€€         €             €€€€€"
370 PRINT"€   €         €             €             €€€€€"
380 PRINT"€€€€€  €€€€€  €€€€€  €€€€€  €      €€€€€  €   €"
390 PRINT"€  €   €   €  €   €  €   €  €      €   €  €€€€€"
400 PRINT"€   €  €€€€€  €€€€€  €€€€€  €€€€€  €€€€€  €"
410 PRINT:PRINT
420 COLOR 14:PRINT"KommunikationskanÑle :  1.  FM 33"
430 PRINT"                        2.  AM 05"
440 PRINT"                        3.  FM 19"
450 PRINT
460 COLOR 9:PRINT"Kommunikationszeiten :  1.  07:03 (wenn mîglich)"
470 PRINT"                        2.  15:00"
480 PRINT"                        3.  20:15"
490 A$=INKEY$:IF A$="" THEN 490
500 CLS:COLOR 15:END
510 REM ********** 12920854  ---   Tiger  **********
520 CLS
530 COLOR 12:PRINT"BÅrgerlicher Name        ";:COLOR 10:PRINT"Mustermann, Maik"
540 COLOR 12:PRINT"Stra·e                   ";:COLOR 10:PRINT"Musterhausener Weg 2"
550 COLOR 12:PRINT"Postleitzahl / Wohnort   ";:COLOR 10:PRINT"12345 Musterstadt"
560 COLOR 12:PRINT"Telefon-Nummer           ";:COLOR 10:PRINT"(012345) 67890"
570 COLOR 12:PRINT:COLOR 15
580 PRINT"CodeName :":PRINT
590 PRINT"€€€€€     €€€€€  €€€€€  €€€€€"
600 PRINT"  €       €      €      €   €"
610 PRINT"  €    €  €  €€  €€€€   €€€€€"
620 PRINT"  €    €  €   €  €      €  €"
630 PRINT"  €    €  €€€€€  €€€€€  €   €"
640 PRINT:PRINT
650 COLOR 14:PRINT"KommunikationskanÑle :  1.  FM 33"
660 PRINT"                        2.  AM 05"
670 PRINT"                        3.  FM 19"
680 PRINT
690 COLOR 9:PRINT"Kommunikationszeiten :  1.  07:03 (wenn mîglich)"
700 PRINT"                        2.  15:00"
710 PRINT"                        3.  20:15"
720 A$=INKEY$:IF A$="" THEN 720
730 CLS:COLOR 15:END
