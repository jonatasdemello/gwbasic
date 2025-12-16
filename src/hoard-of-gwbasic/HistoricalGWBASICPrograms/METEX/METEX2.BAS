10 KEY OFF
20 CLS
30 OPEN "O",#1,"metex.dat"
40 OPEN "COM1:1200,N,7,2,RS,CD,DS,CD"AS #2
50 A$="D"
60 PRINT #2,A$;
70 IN$=INPUT$ (14, #2)
80 WERT$=LEFT$(IN$,9)+" "+MID$(IN$,10,4)
90 LOCATE 1,1
100 L=0
110 COLOR 15
120 PRINT WERT$
130 SAV$=DATE$+"/"+TIME$+"  "+WERT$
140 PRINT#1,SAV$
150 IF MID$(IN$,3,1)="-" THEN LOCATE 3,1:COLOR 9:PRINT"- NEGATIV"
160 IF MID$(IN$,3,1)=" " THEN LOCATE 3,1:COLOR 12:PRINT"+ POSITIV"
170 LOCATE 4,1
180 COLOR 10
190 IF MID$(IN$,10,4)=" V  " THEN PRINT"Spannung        Volt":GOTO 360
200 IF MID$(IN$,10,4)="mV  " AND LEFT$(IN$,2)="  " THEN PRINT"DIODENTEST MilliVolt":GOTO 360
210 IF MID$(IN$,10,4)="mV  " THEN PRINT"Spannung   MilliVolt":GOTO 360
220 IF MID$(IN$,10,4)=" Ohm" THEN PRINT"Widerstand       Ohm":GOTO 360
230 IF MID$(IN$,10,4)="MOhm" THEN PRINT"Widerstand    MegOhm":GOTO 360
240 IF MID$(IN$,10,4)="kOhm" THEN PRINT"Widerstand   KiloOhm":GOTO 360
250 IF MID$(IN$,10,4)="mA  " THEN PRINT"Strom    MilliAmpere":GOTO 360
260 IF MID$(IN$,10,4)=" A  " THEN PRINT"Strom         Ampere":GOTO 360
270 IF MID$(IN$,4,5)="READY" THEN PRINT"LOGIKTEST           ":L=1:GOTO 360
280 IF MID$(IN$,6,2)="Lo" THEN PRINT"LOGIKTEST           ":L=2:GOTO 360
290 IF MID$(IN$,6,2)="Hi" THEN PRINT"LOGIKTEST           ":L=3:GOTO 360
300 IF MID$(IN$,4,5)="FLOAT" THEN PRINT"LOGIKTEST           ":L=4:GOTO 360
310 IF MID$(IN$,10,4)="    " THEN PRINT"Transistortest   hFE":GOTO 360
320 IF MID$(IN$,10,4)="kHz " THEN PRINT"Frequenz  üKiloHertz":GOTO 360
330 IF MID$(IN$,10,4)="uF  " THEN PRINT"KapazitÑt    Ê Farad":GOTO 360
340 IF MID$(IN$,10,4)="nF  " THEN PRINT"KapazitÑt  NanoFarad":GOTO 360
350 IF MID$(IN$,10,4)="pF  " THEN PRINT"KapazitÑt  PicoFarad"
360 COLOR 14
370 IF TYP$="D" THEN GOTO 390
380 IF LEFT$(IN$,2)="DC" THEN GOSUB 550
390 IF TYP$="A" THEN GOTO 530
400 IF LEFT$(IN$,2)="AC" THEN GOSUB 630
410 IF TYP$="0" THEN GOTO 430
420 IF LEFT$(IN$,2)="  " THEN GOSUB 1210
430 IF LO=0 THEN GOTO 450
440 IF L=0 THEN GOSUB 810:TYP$="D"
450 IF LO=1 THEN GOTO 470
460 IF L=1 THEN GOSUB 710
470 IF LO=2 THEN GOTO 490
480 IF L=2 THEN GOSUB 900
490 IF LO=3 THEN SOUND 3000,10:GOTO 510
500 IF L=3 THEN GOSUB 1000
510 IF LO=4 THEN GOTO 530
520 IF L=4 THEN GOSUB 1110
530 REM
540 GOTO 50
550 LOCATE 7,1
560 TYP$="D"
570 PRINT"‹‹‹‹‹‹  ‹‹‹‹‹"
580 PRINT" €   €  €    "
590 PRINT" €   €  €    "
600 PRINT" €   €  €    "
610 PRINT"ﬂﬂﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂ"
620 RETURN
630 LOCATE 7,1
640 TYP$="A"
650 PRINT"  ‹‹    ‹‹‹‹‹"
660 PRINT" €  €   €    "
670 PRINT"€‹‹‹‹€  €    "
680 PRINT"€    €  €    "
690 PRINT"ﬂ    ﬂ  ﬂﬂﬂﬂﬂ"
700 RETURN
710 REM LOGIKTEST
720 LOCATE 7,1
730 COLOR 10
740 LO=1
750 PRINT"‹‹‹‹‹ ‹‹‹‹‹   ‹‹   ‹‹‹‹‹‹ ‹    ‹"
760 PRINT"€   € €      €  €   €   €  €  €"
770 PRINT"€‹‹‹€ €‹‹‹  €‹‹‹‹€  €   €   €€"
780 PRINT"€  €  €     €    €  €   €   €€"
790 PRINT"ﬂ   ﬂ ﬂﬂﬂﬂﬂ ﬂ    ﬂ ﬂﬂﬂﬂﬂﬂ   ﬂﬂ"
800 RETURN
810 REM DELETE
820 LOCATE 7,1
830 LO=0
840 PRINT"                                "
850 PRINT"                                "
860 PRINT"                                "
870 PRINT"                                "
880 PRINT"                                "
890 RETURN
900 REM LOGIKTEST LO
910 LOCATE 7,1
920 COLOR 10
930 LO=2
940 PRINT"‹     ‹‹‹‹‹ ‹           ‹       "
950 PRINT"€     €   €  €         €        "
960 PRINT"€     €   €   €   €   €         "
970 PRINT"€     €   €    € € € €          "
980 PRINT"ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ     ﬂ   ﬂ           "
990 RETURN
1000 REM LOGIKTEST HI
1010 SOUND 3000,10
1020 LOCATE 7,1
1030 COLOR 12
1040 LO=3
1050 PRINT"‹   ‹ ‹ ‹‹‹‹‹ ‹   ‹             "
1060 PRINT"€   € € €     €   €             "
1070 PRINT"€‹‹‹€ € €  ‹‹ €‹‹‹€             "
1080 PRINT"€   € € €   € €   €             "
1090 PRINT"ﬂ   ﬂ ﬂ ﬂﬂﬂﬂﬂ ﬂ   ﬂ             "
1100 RETURN
1110 REM LOGIKTEST FLOAT
1120 LOCATE 7,1
1130 COLOR 11
1140 LO=4
1150 PRINT"‹‹‹‹‹ ‹     ‹‹‹‹‹   ‹‹   ‹‹‹‹‹ "
1160 PRINT"€     €     €   €  €  €    €   "
1170 PRINT"€‹‹‹  €     €   € €‹‹‹‹€   €   "
1180 PRINT"€     €     €   € €    €   €   "
1190 PRINT"ﬂ     ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ ﬂ    ﬂ   ﬂ   "
1200 RETURN
1210 REM DELETE ALL
1220 LOCATE 7,1
1230 TYP$="0"
1240 PRINT"                                "
1250 PRINT"                                "
1260 PRINT"                                "
1270 PRINT"                                "
1280 PRINT"                                "
1290 RETURN
