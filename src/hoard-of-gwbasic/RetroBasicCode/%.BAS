10  N$=CHR$(219)
20 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
30 REM :::::::::::::::::::::::::::: % % % % % % % ::::::::::::::::::::::::::::::
40 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
50 CLS:CLEAR,,,32768!:SCREEN 6:PALETTE 1,2:PALETTE 2,4:PALETTE 3,5
60 LOCATE 5,5:PRINT " Ce programme consiste … calculer le pousentage "
70 INPUT "Donnez le titre au BILAN ",A$
80 INPUT "Donnez le trois  parties ` titre 1,titre 2,titre 3 '",B$,C$,D$
90 PRINT "valeur pour : ";B$;:INPUT ;B
100 PRINT :PRINT "valeur pour : ";C$;:INPUT ;C
110 PRINT :PRINT "valeur pour : ";D$;:INPUT ;D
120 A1=B+C+D
130 B1=B*100/A1
140 C1=C*100/A1
150 D1=D*100/A1
160 REM A1 = Somme de B+C+D
170 REM B1 = % de b
180 REM C1 = % de C
190 REM D1 = % de D
200 CLS
210 XX=0:XX1=120
220 B2=XX1-B1
230 C2=XX1-C1
240 D2=XX1-D1
250 GOTO 300
260 INPUT "epace entre les traits du graphique ",XX2
270 IF XX2>10 THEN PRINT CHR$(7):PRINT "<10 s.v.p ":GOTO 260
280 IF XX2<1 THEN PRINT CHR$(7):PRINT ">1 s.v.p ":GOTO 260
290 IF XX2 MOD 2=1 THEN XX2=XX2-1
300 CLS
310 LINE (1,70)-(400,70),1:LINE(1,20)-(400,20),2:LINE (1,120)-(400,120),3
320 LOCATE 3,54:COLOR 2:PRINT "100 %":LOCATE 9,54:COLOR 1:PRINT " 50 % ":LOCATE  15,54:COLOR 3:PRINT "  0 %"
330 IF B2<1 OR C2 <1 OR D2<1 THEN PRINT :PRINT "erreur !!! pas possible ":GOTO 90
340 COLOR 1
350 LINE (106,XX1)-(156,B2),1,BF
360 LINE (206,XX1)-(256,C2),2,BF
370 IF D2<1 THEN LINE (306,XX1)-(356,D2),0 :GOTO 390
380 LINE (306,XX1)-(356,D2),3,BF
390 REM
400 H=INT(LEN(A$)):HH=80-H:HHH=HH/2
410  LOCATE 19,HHH:PRINT A$
420 LOCATE 17,13:COLOR 1:PRINT B1;"%":COLOR 2:LOCATE 17,26:PRINT C1;"%":COLOR 3:LOCATE 17,38:PRINT D1;"%"
430 N$=CHR$(219)
440 LOCATE 22,1:COLOR 1:PRINT N$;" ";B$;SPC(2);:COLOR 2:PRINT N$;" ";C$;SPC(2);:COLOR 3:PRINT N$;" ";D$
450 COLOR 2:PRINT "appuyer sur une touche pour sortire ou R Pour recommancer"
460 REM
470 AMP$=INKEY$:IF AMP$="" THEN  470
480 IF AMP$="r" OR AMP$="R" THEN RUN
490 LOAD"MENU",R
500 RUN
