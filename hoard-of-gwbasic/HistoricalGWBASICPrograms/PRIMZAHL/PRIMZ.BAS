10 CLS
20 COLOR 15
30 INPUT "Geben Sie den Anfangswert fr die Primzahlen an:", ANF
40 IF ANF = 0 THEN ANF = 1
50 INPUT "Geben Sie den Maximalwert fr die Primzahlen an:", MAX
60 CLS
70 DIM V(MAX - ANF)
80 B = 12
90 C = 0
100 L = 1
110 G = 9
120 H = 1
130 A = ANF
140 U = ANF
150 FOR Z = 1 TO A
160 Y = A / Z
170 LOCATE 1, 1: PRINT USING "Aktuelles Ergebnis: #####.######"; Y
180 LOCATE 2, 1: PRINT USING "Momentaner Teiler : #####"; Z
190 LOCATE 3, 1: PRINT USING "              schon #####x geteilt"; X
200 LOCATE 4, 1: PRINT USING "Aktuelle Zeile    : #####"; B - 11
210 LOCATE 5, 1: PRINT USING "Primzahlen insges.: #####"; C
220 PER = ((A - ANF) * 100) / (MAX - ANF): IF ANF = 1 THEN PER = (A * 100) / MAX
230 LOCATE 6, 1: PRINT USING "Aktuelle Zahl     : ##### von ##### das sind ###.##%"; A; MAX; PER
240 LOCATE 7, 1: PRINT USING "               Noch ##### Werte"; MAX - A
250 LOCATE 11, 1: PRINT SPACE$(80)
260 IF Y = INT(Y) THEN GOSUB 660
270 NEXT Z
280 LOCATE 9, 1: PRINT SPACE$(80)
290 LOCATE 10, 1: PRINT SPACE$(80)
300 G = 9
310 H = 1
320 IF X = 2 OR A = 1 THEN GOSUB 380
330 X = 0
340 A = A + 1
350 IF A > MAX THEN LOCATE 23, 1: GOTO 470
360 IF W = 1 THEN GOSUB 440: W = 0
370 GOTO 150
380 REM Unterroutine
390 LOCATE 3, 60: SOUND 2000, .5
400 COLOR 12, 0, 0: PRINT "Primzahl gefunden...": COLOR 14, 0, 0: C = C + 1: X = 0
410 LOCATE B, L: PRINT USING"#####";A: L = L + 6: IF L > 75 THEN L = 1: B = B + 1: IF B > 23 THEN B = 12: L = 1
420 V(U) = A: U = U + 1: W = 1
430 RETURN
440 REM Unterroutine
450 COLOR 15, 0, 0: LOCATE 3, 60: PRINT SPACE$(20)
460 RETURN
470 REM Endroutine
480 PRINT "Wenn fertig Taste drcken..."
490 A$ = INKEY$: IF A$ = "" THEN 490
500 CLS
510 COLOR 14, 0, 0
520 A = 1
530 B = 1
540 C = 1
550 L = 1
560 FOR Z = ANF TO MAX
570 IF V(Z) = 0 THEN GOTO 610
580 LOCATE B, C: PRINT V(Z)
590 C = C + 5: IF L > 75 THEN B = B + 1: C = 1: IF B > 23 THEN B = 1
600 NEXT Z
610 COLOR 10
620 LOCATE 23, 1: PRINT "Wenn bereit Taste drcken..."
630 A$ = INKEY$: IF A$ = "" THEN 630
640 CLS : COLOR 15, 0, 0
650 END
660 REM Teiler in Q
670 X = X + 1
680 LOCATE G, H: COLOR 10: PRINT USING "#####";Z: H = H + 6: IF H > 75 THEN G = G + 1: H = 1
690 IF G > 10 THEN G = 9
700 COLOR 15
710 RETURN
