10 COLOR 15,0,0
20 CLS
30 PRINT"ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
40 PRINT"บ ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ//////////////////////////ฺฤฤฤฤฟ//บ"
50 PRINT"บ ณ<   M A T R I X   1 2 S T N  >ณ//ฺฤฤฤฤฟ/ฺฤฤฤฤฟ/ฺฤฤฤฤฟ////ณMODEณ//บ"
60 PRINT"บ ณAM                            ณ//ณ OFFณ/ณ ^  ณ/ณ v  ณ////ณ ON ณ//บ"
70 PRINT"บ ณPM  8.8.8.8.8.8.8.8.8.8.8.8.  ณ//ภฤฤฤฤู/ภฤฤฤฤู/ภฤฤฤฤู////ภฤฤฤฤู//บ"
80 PRINT"บ ณ TEL MEMO CAL oฤฟ SHIFT LOCK  ณ//////////////////////////////////บ"
90 PRINT"บ ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู//////////////////////////////////บ"
100 PRINT"วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ"
110 PRINT"บ๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗บ"
120 PRINT
130 PRINT"M - Mode/ON"
140 PRINT"F - OFF"
150 PRINT"^ - HOCH"
160 PRINT"v - RUNTER"
170 A$=INKEY$:IF A$="" THEN 170
180 IF A$="m" THEN 230
190 IF A$="f" THEN CLS:END
200 IF A$="^" THEN
210 IF A$="v" THEN
220 GOTO 170
230 INPUT"Tageskennung (z.B. SAT,SUN,MON,WED): ",D$:REM Tageskennung
240 A$=RIGHT$(DATE$,2):REM Jahr
250 B$=MID$(DATE$,4,2):REM Tag
260 C$=LEFT$(DATE$,2):REM Monat
270 PRINT"Datum: ";B$;".";C$;".";A$;"      ";D$
280 E$=LEFT$(TIME$,2):REM Stunde
290 F$=MID$(TIME$,4,2):REM Minuten
300 G$=RIGHT$(TIME$,2):REM Sekunden
310 PRINT"Zeit : ";E$;":";F$;".";G$
320 PRINT"Zeit : ";E$;"h ";F$;"min ";G$;"sec"
330 PRINT:PRINT"Ist das richtig ??"
340 PRINT"(J)a (Z)eit falsch (D)atum falsch (T)ageskennung falsch (A)lles falsch"
350 H$=INKEY$:IF H$="" THEN 350
360 IF H$="j" THEN GOTO 560
370 IF H$="z" THEN GOTO 480
380 IF H$="d" THEN GOTO 520
390 IF H$="t" THEN GOTO 230
400 IF H$="a" THEN GOTO 420
410 PRINT"Falsche Taste!":GOTO 350
420 REM Alles falsch (A)
430 INPUT"Zeit    [hh:mm:ss]: ",Z$
440 TIME$=Z$
450 INPUT"Datum [MM-DD-YYYY]: ",Z$
460 DATE$=Z$
470 GOTO 230
480 REM Zeit falsch (Z)
490 INPUT"Uhrzeit [hh:mm:ss]: ",Z$
500 TIME$=Z$
510 GOTO 240
520 REM Datum falsch (D)
530 INPUT"Datum [MM-DD-YYYY]: ",Z$
540 DATE$=Z$
550 GOTO 230
560 REM Alles richtig !!! (J)
570 LOCATE 1,1
580 PRINT"ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
590 H$=LEFT$(A$,1)
600 I$=RIGHT$(A$,1)
610 J$=LEFT$(B$,1)
620 K$=RIGHT$(B$,1)
630 L$=LEFT$(C$,1)
640 M$=RIGHT$(C$,1)
650 N$=LEFT$(D$,1)
660 O$=MID$(D$,2,1)
670 P$=RIGHT$(D$,1)
680 PRINT"บ ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ//////////////////////////ฺฤฤฤฤฟ//บ"
690 PRINT"บ ณ";:COLOR 8:PRINT"<";:COLOR 15:PRINT"   ";H$;" ";I$;"    ";L$;" ";M$;"/";J$;" ";K$;"    ";N$;" ";O$;" ";P$;" ";:COLOR 8:PRINT" >";:COLOR 15:PRINT"ณ//ฺฤฤฤฤฟ/ฺฤฤฤฤฟ/ฺฤฤฤฤฟ////ณMODEณ//บ"
700 IF VAL(E$)>11 THEN GOTO 730
710 PRINT"บ ณAM                            ณ//ณ OFFณ/ณ ^  ณ/ณ v  ณ////ณ ON ณ//บ"
720 GOTO 810
730 PRINT"บ ณ";:COLOR 8:PRINT"AM";:COLOR 15:PRINT"                            ณ//ณ OFFณ/ณ ^  ณ/ณ v  ณ////ณ ON ณ//บ"
740 Q$=LEFT$(E$,1)
750 R$=MID$(E$,2,1)
760 S$=LEFT$(F$,1)
770 T$=RIGHT$(F$,1)
780 U$=LEFT$(G$,1)
790 V$=RIGHT$(G$,1)
800 IF VAL(E$)<12 THEN GOTO 830
810 PRINT"บ ณPM      ";Q$;" ";R$;" - ";S$;" ";T$;"   ";U$;" ";V$;"       ณ//ภฤฤฤฤู/ภฤฤฤฤู/ภฤฤฤฤู////ภฤฤฤฤู//บ"
820 GOTO 840
830 PRINT"บ ณ";:COLOR 8:PRINT"PM";:COLOR 15:PRINT"      ";Q$;" ";R$;" - ";S$;" ";T$;"   ";U$;" ";V$;"       ณ//ภฤฤฤฤู/ภฤฤฤฤู/ภฤฤฤฤู////ภฤฤฤฤู//บ"
840 PRINT"บ ณ";:COLOR 8:PRINT" TEL MEMO CAL oฤฟ SHIFT LOCK";:COLOR 15:PRINT"  ณ//////////////////////////////////บ"
850 PRINT"บ ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู//////////////////////////////////บ"
860 PRINT"วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ"
870 PRINT"บ๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗๗บ"
880 PRINT
890 IF A=2 THEN GOTO 910
900 A=2:CLS:GOTO 580
910 REM
