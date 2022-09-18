10 KEY OFF
20 CLS
30 OPEN "COM1:1200,N,7,2,RS,CD,DS,CD"AS #2
40 A$="D"
50 PRINT #2,A$;
60 INPU$=INPUT$(14,#2)
65 IF INKEY$="" THEN 70 ELSE CLS:END
70 WERT$=LEFT$(INPU$,9)+" "+RIGHT$(INPU$,5)
80 LOCATE 1,1
90 L=0
100 COLOR 15
110 PRINT WERT$
120 IF MID$(INPU$,3,1)="-" THEN LOCATE 3,1:COLOR 9:PRINT"- NEGATIV"
130 IF MID$(INPU$,3,1)=" " THEN LOCATE 3,1:COLOR 12:PRINT"+ POSITIV"
140 LOCATE 4,1
150 COLOR 10
160 IF MID$(INPU$,10,4)=" V  " THEN PRINT"Spannung        Volt":GOTO 330
170 IF MID$(INPU$,10,4)="mV  " AND LEFT$(INPU$,2)="  " THEN PRINT"DIODENTEST MilliVolt":GOTO 330
180 IF MID$(INPU$,10,4)="mV  " THEN PRINT"Spannung   MilliVolt":GOTO 330
190 IF MID$(INPU$,10,4)=" Ohm" THEN PRINT"Widerstand       Ohm":GOTO 330
200 IF MID$(INPU$,10,4)="MOhm" THEN PRINT"Widerstand    MegOhm":GOTO 330
210 IF MID$(INPU$,10,4)="kOhm" THEN PRINT"Widerstand   KiloOhm":GOTO 330
220 IF MID$(INPU$,10,4)="mA  " THEN PRINT"Strom    MilliAmpere":GOTO 330
230 IF MID$(INPU$,10,4)=" A  " THEN PRINT"Strom         Ampere":GOTO 330
240 IF MID$(INPU$,4,5)="READY" THEN PRINT"LOGIKTEST           ":L=1:GOTO 330
250 IF MID$(INPU$,6,2)="Lo" THEN PRINT"LOGIKTEST           ":L=2:GOTO 330
260 IF MID$(INPU$,6,2)="Hi" THEN PRINT"LOGIKTEST           ":L=3:GOTO 330
270 IF MID$(INPU$,4,5)="FLOAT" THEN PRINT"LOGIKTEST           ":L=4:GOTO 330
280 IF MID$(INPU$,10,4)="    " THEN PRINT"Transistortest   hFE":GOTO 330
290 IF MID$(INPU$,10,4)="kHz " THEN PRINT"Frequenz  üKiloHertz":GOTO 330
300 IF MID$(INPU$,10,4)="uF  " THEN PRINT"KapazitÑt    Ê Farad":GOTO 330
310 IF MID$(INPU$,10,4)="nF  " THEN PRINT"KapazitÑt  NanoFarad":GOTO 330
320 IF MID$(INPU$,10,4)="pF  " THEN PRINT"KapazitÑt  PicoFarad"
330 COLOR 14
340 IF TYP$="D" THEN GOTO 360
350 IF LEFT$(INPU$,2)="DC" THEN GOSUB 520
360 IF TYP$="A" THEN GOTO 500
370 IF LEFT$(INPU$,2)="AC" THEN GOSUB 600
380 IF TYP$="0" THEN GOTO 400
390 IF LEFT$(INPU$,2)="  " THEN GOSUB 1180
400 IF LO=0 THEN GOTO 420
410 IF L=0 THEN GOSUB 780:TYP$="D"
420 IF LO=1 THEN GOTO 440
430 IF L=1 THEN GOSUB 680
440 IF LO=2 THEN GOTO 460
450 IF L=2 THEN GOSUB 870
460 IF LO=3 THEN SOUND 3000,10:GOTO 480
470 IF L=3 THEN GOSUB 970
480 IF LO=4 THEN GOTO 500
490 IF L=4 THEN GOSUB 1080
500 CLOSE #2
510 GOTO 30
520 LOCATE 7,1
530 TYP$="D"
540 PRINT"‹‹‹‹‹‹  ‹‹‹‹‹"
550 PRINT" €   €  €    "
560 PRINT" €   €  €    "
570 PRINT" €   €  €    "
580 PRINT"ﬂﬂﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂ"
590 RETURN
600 LOCATE 7,1
610 TYP$="A"
620 PRINT"  ‹‹    ‹‹‹‹‹"
630 PRINT" €  €   €    "
640 PRINT"€‹‹‹‹€  €    "
650 PRINT"€    €  €    "
660 PRINT"ﬂ    ﬂ  ﬂﬂﬂﬂﬂ"
670 RETURN
680 REM LOGIKTEST
690 LOCATE 7,1
700 COLOR 10
710 LO=1
720 PRINT"‹‹‹‹‹ ‹‹‹‹‹   ‹‹   ‹‹‹‹‹‹ ‹    ‹"
730 PRINT"€   € €      €  €   €   €  €  €"
740 PRINT"€‹‹‹€ €‹‹‹  €‹‹‹‹€  €   €   €€"
750 PRINT"€  €  €     €    €  €   €   €€"
760 PRINT"ﬂ   ﬂ ﬂﬂﬂﬂﬂ ﬂ    ﬂ ﬂﬂﬂﬂﬂﬂ   ﬂﬂ"
770 RETURN
780 REM DELETE
790 LOCATE 7,1
800 LO=0
810 PRINT"                                "
820 PRINT"                                "
830 PRINT"                                "
840 PRINT"                                "
850 PRINT"                                "
860 RETURN
870 REM LOGIKTEST LO
880 LOCATE 7,1
890 COLOR 10
900 LO=2
910 PRINT"‹     ‹‹‹‹‹ ‹           ‹       "
920 PRINT"€     €   €  €         €        "
930 PRINT"€     €   €   €   €   €         "
940 PRINT"€     €   €    € € € €          "
950 PRINT"ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ     ﬂ   ﬂ           "
960 RETURN
970 REM LOGIKTEST HI
980 SOUND 3000,10
990 LOCATE 7,1
1000 COLOR 12
1010 LO=3
1020 PRINT"‹   ‹ ‹ ‹‹‹‹‹ ‹   ‹             "
1030 PRINT"€   € € €     €   €             "
1040 PRINT"€‹‹‹€ € €  ‹‹ €‹‹‹€             "
1050 PRINT"€   € € €   € €   €             "
1060 PRINT"ﬂ   ﬂ ﬂ ﬂﬂﬂﬂﬂ ﬂ   ﬂ             "
1070 RETURN
1080 REM LOGIKTEST FLOAT
1090 LOCATE 7,1
1100 COLOR 11
1110 LO=4
1120 PRINT"‹‹‹‹‹ ‹     ‹‹‹‹‹   ‹‹   ‹‹‹‹‹ "
1130 PRINT"€     €     €   €  €  €    €   "
1140 PRINT"€‹‹‹  €     €   € €‹‹‹‹€   €   "
1150 PRINT"€     €     €   € €    €   €   "
1160 PRINT"ﬂ     ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ ﬂ    ﬂ   ﬂ   "
1170 RETURN
1180 REM DELETE ALL
1190 LOCATE 7,1
1200 TYP$="0"
1210 PRINT"                                "
1220 PRINT"                                "
1230 PRINT"                                "
1240 PRINT"                                "
1250 PRINT"                                "
1260 RETURN
