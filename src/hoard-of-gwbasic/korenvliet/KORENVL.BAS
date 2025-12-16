0 '0
11289 1: PRINT"                                                                       "
6 COLOR 15,1,1
10 H$=CHR$(12): DEFINT B-Z: DIM I$(33),O$(33),O(33),L$(37),D$(3,37),D(3,37): L=9: I=0: PRINT H$: LOCATE 12,28:COLOR 14: PRINT" K O R E N V L I E T ": PRINT: COLOR 15,1,1:PRINT
40 FOR X = 1 TO 33: READ I$(X),O$(X),O(X): NEXT: FOR  X = 1 TO 37: READ L$(X): NEXT: FOR Y = 1 TO 37: FOR X=1 TO 3: READ D$(X,Y),D(X,Y): NEXT : NEXT : FOR X = 1 TO 3: READ P$(X): NEXT
45 FOR X = 1 TO 8: READ VE(X): NEXT : Y = 0: FOR X = 1 TO 3: GOSUB 9000: N$(X) =STR$(Z): NEXT
50 FOR X = 1 TO 3
60 Z = INT(3*RND(5))+1:IF S(Z) = Z THEN 60 ELSE S$(Z) = RIGHT$ (N$(X),2): S(Z) = Z:NEXT :GOTO 670
140 PRINT CHR$(219): GOSUB 200:PRINT CHR$(29);:IF TS<32 THEN S = 32
145 PRINT CHR$(TS);: GOSUB 220: IF TS = 13 THEN RETURN ELSE 142
150 LL = 0: C$ = SPACE$(25)
151 PRINT CHR$(219);:GOSUB 200: PRINT CHR$(29);: IF TS > 31 THEN 154
152 IF TS = 8 THEN 156
153 IF TS = 13 THEN PRINT " ":C$ = LEFT$(C$,LL): RETURN ELSE  PRINT CHR$(7);: GOTO 151
154 IF LL < 22 THEN LL = LL+1 ELSE PRINT CHR$(29);
155 MID$(C$,LL,1) = CHR$(TS):PRINT CHR$(TS);:GOTO 151
156 IF LL = 0 THEN 150 ELSE PRINT " "STRING$(2,8);:MID$(C$,LL,1) = " ":LL = LL-1:GOTO 151
160 RETURN
200 REM TS = USR(0):rem IF TS = 3 THEN 65430 ELSE RETURN: TS=32: return
220 PRINT CHR$(219);:GOSUB 200: PRINT CHR$(29)" ": STRING$(2,29);:RETURN
670 COLOR 14:LOCATE 23,1: PRINT "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";: LOCATE 25,26:PRINT CHR$(7) "Wilt U instructies (j/n)?";
672 WL$=INKEY$: IF WL$="J" OR WL$="j" OR WL$="N" OR WL$="n" THEN GOTO 675 ELSE GOTO 672
675 COLOR 15
680 IF WL$ = "j" OR WL$ = "J" THEN COLOR 14:GOSUB 7500
690 IF WL$ = "n" OR WL$ = "N" THEN GOTO 1000
700 GOTO 1000
990 FOR X = 1 TO 3000: NEXT
1000 PRINT H$"Plaats    :";:COLOR 10:PRINT L$(L)".":COLOR 15:PRINT :PRINT "Uitgangen :";: FOR X = 1 TO 3: GOSUB 5000:PRINT " ";:NEXT :PRINT :PRINT : PRINT "U ziet    :";: COLOR 12
1070 IF O(13) <> 0 AND (L = 30 OR L = 31) THEN 1190
1080 FOR X = 1 TO 33: IF O(X) <> L THEN 1100
1085 IF POS(0) + LEN(O$(X)) > 38 THEN COLOR 12:PRINT: PRINT TAB(11);
1090 PRINT O$(X)". ";
1100 NEXT :PRINT :PRINT: GOSUB 5200
1190 COLOR 14:GOSUB 8900:COLOR 15:LOCATE 11,1 :PRINT SPC(50): LOCATE 11,1:PRINT "Wat nu     :";:COLOR 13: INPUT C$:COLOR 15:LOCATE 12,1:PRINT SPC(50):LOCATE 12,1
1195 IF S = 1 THEN 6000
1199 IF LEFT$(C$,3) = "pak" THEN C$ = " "+C$:MID$(C$,1,4) ="neem"
1200 IF LEFT$(C$,4) = "neem" THEN 2030
1210 IF LEFT$(C$,11) = "leg snorkel" THEN 3640
1220 IF LEFT$(C$,3) = "leg" THEN 2190
1230 IF RIGHT$(C$,10) = "inventaris" THEN 2350
1235 G = LEN(C$)-7:IF G > 0 AND MID$(C$,4,4) = "naar" THEN C$ = LEFT$(C$,3) + "in" +  RIGHT$(C$,G)
1240 IF LEFT$(C$,5) <> "ga in" THEN 1320
1260 IF RIGHT$(C$,6) = "afvoer" THEN 2395
1270 IF RIGHT$(C$,6) = "ballon" THEN 2540
1280 IF RIGHT$(C$,6) = "vijver" THEN 2600
1300 IF RIGHT$(C$,6) = "winkel" OR RIGHT$(C$,10) = "supermarkt" THEN 2680 ELSE 2750
1320 IF C$ = "ga door deur" THEN 2650
1340 IF LEFT$(C$,9) = "onderzoek" THEN 2840
1350 IF LEFT$(C$,6) = "bekijk" THEN 2850
1360 IF LEFT$(C$,6) = "ga jog" OR LEFT$(C$,7) = "ga trim" THEN 3000
1370 IF LEFT$(C$,4) = "ga o" AND L = 32 THEN 3950
1380 IF LEFT$(C$,4) = "ga u" THEN 3030
1390 IF LEFT$(C$,2) = "ga" THEN 3080
1410 IF C$ = "voer panter" OR C$ = "geef zalm" THEN 3150
1420 IF INSTR(C$,"panter") <> 0 THEN 3130
1430 IF RIGHT$(C$,4) <> "boom" AND RIGHT$(C$,5) <> "bomen" THEN 1450
1435 IF LEFT$(C$,3) = "hak" OR LEFT$(C$,4) = "snij" THEN  3190
1440 IF LEFT$(C$,4) = "klim" THEN 3800
1450 IF LEFT$(C$,4) = "duik" THEN 3210
1460 IF C$ = "STOP" OR C$ = "halt" THEN  65432
1470 IF LEFT$(C$,4) = "koop" AND L = 10 THEN 2060
1480 IF C$ = "verwijder deksel" OR C$ = "open afvoer" THEN 3250
1483 IF LEFT$(C$,4) <> "open" THEN  1510
1485 IF RIGHT$(C$,4) = "boek" OR RIGHT$(C$,4) = "klok" OR RIGHT$(C$,3) = "tas" THEN 2845
1490 IF RIGHT$(C$,4) = "deur" THEN 3295
1510 IF C$ = "maak kluis open" OR C$ = "open kluis" THEN 7000
1540 IF C$ = "blaas boot op" THEN 3350
1550 IF C$ = "blaas ballon op" OR C$ = "bouw ballon" THEN 3380
1570 IF C$ = "vlieg met ballon" OR C$ = "zeil met ballon" THEN 3460
1590 IF C$ = "lees testament" AND F = 1 THEN 7200
1600 IF C$ = "lees boek" THEN 2850
1605 IF C$ = "lees bord" THEN 3900
1620 IF LEFT$(C$,4) = "kijk" THEN 1000
1630 IF C$ = "help" THEN CLS: COLOR 14:GOSUB 7500:GOTO 1000
1640 IF C$ = "stop" THEN 65432
1650 IF C$ = "HELP" THEN CLS: COLOR 14:GOSUB 7500:GOTO 1000
1660 IF C$ = "STOP" THEN 65432
1990 DEF SEG: POKE 106,0: DEF SEG=0: POKE 1050, PEEK(1052): COLOR 14:PRINT CHR$ (7)"Ik begrijp U niet.":COLOR 15:GOTO 1190
2030 IF C$ = "neem zalm" AND L = 29 AND O(10) <> 0 THEN COLOR 14:PRINT "Die glipte uit Uw vingers.":COLOR 15:GOTO 1190
2035 IF C$ = "neem schilderij" AND L = 16 THEN  COLOR 14:PRINT "Te kostbaar.":COLOR 15:GOTO 1190
2040 IF L = 10 THEN COLOR 14:PRINT "pleeg geen winkeldiefstal!":COLOR 15:GOTO 1190
2045 IF C$ = "neem tafel" AND L = 37 THEN COLOR 14:PRINT "Die zit vastgespijkerd":COLOR 15:GOTO 1190
2055 IF I = 4 THEN COLOR 14:PRINT "U draagt teveel bij U.":COLOR 15:GOTO 1190
2060 IF RIGHT$(C$,4) = "bril" THEN 6150
2065 IF C$ = "neem snorkel" THEN 6100
2070 FOR X = 1 TO 19:G=LEN(C$)-5: IF G <1 THEN 2110
2090 IF RIGHT$(C$,G) <> RIGHT$(I$(X),G) THEN 2110
2095 IF O(X) = 0 THEN COLOR 14:PRINT "Dat heeft U al.": X = 19: COLOR 15:GOTO 990
2100 IF O(X) = L THEN O(X) = 0: I = I + 1
2105 X = 19: GOTO 1000
2110 NEXT
2120 IF C$ = "neem panter" AND O(30) = L THEN 6200
2130 IF RIGHT$(C$,4) = "klok" AND L = 14 THEN COLOR 14:PRINT "Te zwaar.":COLOR 15:GOTO 1190
2140 IF C$ = "neem kist" AND O(26) = L THEN COLOR 14:PRINT "Ik heb geen dorst.":COLOR 15:GOTO 1190
2150 IF C$ = "neem kluis" AND O(25) = L THEN COLOR 14:PRINT "De kluis zit aan de muur vast.":COLOR 15:GOTO 1190 ELSE 1990
2190 FOR X =1 TO 19: H = INSTR(5,C$," "): IF H <> 0 THEN G = H-5 ELSE G = LEN(C$)-4
2200 IF G > 0 THEN  IF MID$(C$,5,G) = RIGHT$(I$(X),G) AND O(X) = 0 THEN 2240
2220 NEXT :GOTO 1990
2240 IF X = 8 AND (L = 28 OR L = 29) THEN O(8) = 5:I = I-1: COLOR 14:PRINT "De boot drijft weg.....":X = 19: COLOR 15:GOTO 990
2270 I = I-1
2280 IF (L = 28 OR L = 29) THEN O(X) = L + 2:GOTO 1000
2300 O(X) = L:X = 19: GOTO 1000
2315 NEXT
2350 FOR X = 1 TO 19: IF O(X) <> 0 THEN 2370
2355 IF LEN(O$(X)) + POS(0) > 38 THEN PRINT
2360 PRINT O$(X)". ";
2370 NEXT :PRINT :GOTO 1190
2395 FOR X =  1 TO 8:IF VE(X) = L THEN 2415
2400 NEXT: GOTO 1990
2415 X = 8: IF O(8) =0 AND R = 1 THEN COLOR 14:PRINT P$(2):COLOR 15:GOTO 1190
2420 FOR X = 1 TO 4: IF O(X) = 0 THEN X = 4: COLOR 14:PRINT P$(2):COLOR 15: GOTO 1190
2430 NEXT
2450 IF(L = 13 AND C1 = 0) OR (L = 14 AND C2 = 0) OR (L = 17 AND C3 = 0) OR (L = 18 AND C4 = 0) THEN COLOR 14: PRINT P$(1):COLOR 15:GOTO 1190
2485 IF W = 0 THEN COLOR 14:PRINT "U bent te dik.":COLOR 15:GOTO 1190
2490 IF L = 13 AND C1 = 1 THEN  L = 21:GOTO 1000
2500 IF L = 14 AND C2 = 1 THEN  L = 24:GOTO 1000
2510 IF L = 17 AND C3 = 1 THEN  L = 26:GOTO 1000
2520 IF L = 18 AND C4 = 1 THEN  L = 27:GOTO 1000 ELSE 1990
2540 IF H = 0 THEN COLOR 14:PRINT "Nog niet klaar.":COLOR 15:GOTO 1190
2550 IF L= 8 THEN  L= 34:GOTO 1000
2560 IF L = 36 THEN  L= 35:GOTO 1000
2570 COLOR 14:PRINT "Ik kan het niet vinden.":GOTO 1190
2600 IF L <> 5 THEN 1990
2610 IF O(8) <> 0 THEN COLOR 14:PRINT "Ik moet ergens op kunnen drijven.":GOTO 1190
2630 IF R = 0 THEN COLOR 14:PRINT "Rubberboot is te slap.":GOTO 1190
2640 L = 28:GOTO 1000
2650 IF L = 16 AND K = 0 THEN COLOR 14:PRINT "De deur is op slot.":GOTO 1190
2655 IF L = 20 THEN L = 16:K = 1:GOTO 1000
2660 IF L = 16 THEN L = 20:GOTO 1000 ELSE 1990
2680 IF L <> 9 THEN 1990
2690 FOR X = 1 TO 19:IF O(X) = 0 THEN X = 19: COLOR 14:PRINT "U kunt de winkel niet binnen met alles wat U bij zich heeft.": GOTO 1190
2710 NEXT :L = 10:GOTO 1000
2750 IF RIGHT$(C$,8) <> "landhuis" AND RIGHT$(C$,10) <> "korenvliet" THEN 2770
2760 IF L = 9 THEN L = 12:GOTO 1000
2765 IF L = 1 THEN L = 17:GOTO 1000
2770 IF RIGHT$(C$,10) = "ziekenhuis" AND L = 9 THEN L = 11:GOTO 1000
2780 IF C$ = "ga in tunnel" AND L = 31 AND O(13) = 0 THEN L = 32:GOTO 1000
2790 IF C$ = "ga in kanaal" AND L = 4 THEN COLOR 14:PRINT "U gleed uit en viel.":S = 1:L = 11:COLOR 15:GOTO 990
2800 IF RIGHT$(C$,9) = "afgraving" AND L = 8 THEN COLOR 14:PRINT "Te steil.":GOTO 1190
2810 IF C$ = "ga in schuur" AND L = 36 THEN L = 37:GOTO 1000 ELSE 1990
2840 G = LEN(C$)-10:GOTO 2860
2845 G = LEN(C$)+2
2850 G = LEN(C$)-7
2860 IF G < 1 THEN 1990 ELSE Q$ = RIGHT$(C$,G):FOR X = 1 TO 33
2870 IF Q$ = RIGHT$(I$(X),G) AND(O(X) = L OR O(X) = 0) THEN X = 33: GOTO 2900
2880 NEXT: GOTO 1990
2900 IF Q$ = "fles" THEN COLOR 14:PRINT P$(3);N$(1):GOTO 1190
2910 IF Q$ = "beker" THEN COLOR 14:PRINT P$(3);N$(2):GOTO 1190
2920 IF Q$ = "tafel" THEN COLOR 14:PRINT "Er ligt een briefje met het nummer";N$(3):GOTO 1190
2930 IF Q$ = "kist" THEN COLOR 14:PRINT "Er ontbreekt een fles.":GOTO 1190
2940 IF Q$ = "boek" THEN 6550
2950 IF RIGHT$(Q$,4) = "klok" AND O(13) = 40 THEN COLOR 14:PRINT "Er zit een duikbril in.": GOTO 1190
2960 IF Q$ = "tas" AND O(19) = 40 THEN COLOR 14:PRINT "Er zit een snorkel in.":GOTO 1190
2970 IF Q$ = "schilderij" THEN COLOR 14:PRINT "Er zit een kluis achter!":E = 1:O(25) = L:GOTO 1190
2980 COLOR 14:PRINT "Niets bijzonders.":GOTO 1190
3000 IF O(11) <> 0 THEN COLOR 14:PRINT "Ik heb schoenen nodig.":GOTO 1190
3010 IF L > 9 THEN COLOR 14:PRINT "Ik kan hier niet joggen.":GOTO 1190
3015 W = 1:COLOR 14:PRINT "Pfff... Klaar!":GOTO 1190
3020 IF L = 28 THEN L = 5:GOTO 1000 ELSE 1990
3030 IF S = 1 THEN COLOR 14:PRINT "Ik voel me niet goed.":GOTO 1190
3040 IF(L = 21 AND C1 = 0) OR (L = 24 AND C2 = 0) OR (L = 26 AND C3 = 0) OR (L = 27 AND C4 = 0)THEN COLOR 14:PRINT P$(1):GOTO 1190
3080 IF LEFT$(C$,4)="ga o" AND L = 18 THEN 6300
3090 FOR X = 1 TO 3: IF MID$(C$,4,1) = D$(X,L) THEN L = D(X,L): X = 3: GOTO 1000
3110 NEXT: COLOR 14:PRINT "Richting niet duidelijk.": GOTO 1190
3130 IF V = 0 AND L = 18 THEN 6200 ELSE 1990
3150 IF V = 1 THEN 1990
3160 IF L <> 18 THEN 1990
3170 IF O(14) <> 0 OR L <> 18 THEN COLOR 14:PRINT "U hebt voedsel nodig.":GOTO 1190
3180 COLOR 14:PRINT "Panter ontsnapte met de zalm.":IF O(14) = 0 THEN I = I-1
3185 V = 1: O(14) = 40:O(30) = 40:GOTO 990
3190 IF L = 2 AND (O(12) = 0 OR O(12) = L) THEN O(4) = 2:GOTO 1000 ELSE 1990
3210 IF (L = 28 OR L = 29) AND O(8) AND O(19) = 0 THEN O(8) = 5: I=I-1: L=L+2: COLOR 14:PRINT "De boot drijft weg ...": COLOR 15:GOTO 990
3220 IF (L = 28 OR L = 29) AND O(19) = 0 THEN L = L+2:GOTO 1000
3230 IF L = 28 OR L = 29 THEN COLOR 14:PRINT "U hebt een snorkel nodig.":GOTO 1190 ELSE 1990
3250 IF L = 13 OR L = 21 THEN C1 = 1:GOTO 1000
3260 IF L = 14 OR L = 24 THEN C2 = 1:GOTO 1000
3270 IF L = 17 OR L = 26 THEN C3 = 1:GOTO 1000
3280 IF L = 18 OR L = 27 THEN C4 = 1:GOTO 1000 ELSE 1990
3295 IF L = 16 OR L = 20 THEN 3305 ELSE 1990
3305 IF L = 16 AND K = 0 THEN COLOR 14:PRINT "Gaat niet. De deur is aan de andere kant vergrendeld.":GOTO 1190
3310 COLOR 14:PRINT "OK.":GOTO 1190
3350 IF L <> 5 THEN COLOR 14:PRINT "Niet hier.":GOTO 1190
3360 IF R = 1 THEN COLOR 14:PRINT "Is al opgeblazen.":GOTO 1190
3370 COLOR 14:PRINT "OK.":R = 1:GOTO 1190
3380 IF L <> 8 THEN COLOR 14:PRINT "Niet hier.":GOTO 1190
3390 FOR X = 1 TO 6:IF O(X) = 0 OR O(X) = 8 THEN HB = HB+1
3400 NEXT :IF HB = 6 THEN 3420
3410 COLOR 14:PRINT "Niet klaar.":HB = 0:GOTO 1190
3420 FOR X = 1 TO 6: IF O(X) = 0 THEN I = I-1
3430 O(X) = 40:NEXT :H = 1:GOTO 1000
3460 IF H = 0 THEN COLOR 14:PRINT "Niet klaar.":GOTO 1190
3470 IF L = 80 OR L = 36 THEN COLOR 14:PRINT "U moet er eerst in.":GOTO 1190
3480 IF L = 35 THEN 3570 ELSE IF L <> 34 THEN 1990
3500 FOR Y = 5 TO 29 STEP 6:GOSUB 6400:NEXT :L = 35:GOTO 1000
3570 FOR Y = 29 TO 5 STEP-6:GOSUB 6400:NEXT :L = 34:GOTO 1000
3640 IF O(19) <> 0 THEN COLOR 14:PRINT "Heeft U niet.":GOTO 1190
3650 IF L > 27 AND L < 32 THEN COLOR 14:PRINT "Neem het snel terug!":GOTO 1190
3660 O(19) = L:I = I-1:GOTO 1000
3800 IF L <> 2 THEN 1990 ELSE COLOR 14:PRINT "U viel eraf.":S = 1:L = 11:COLOR 15:GOTO 990
3900 IF O(9) = 0 OR O(9) = L THEN COLOR 14:PRINT "Op het bord staat: Een goede plaats.":GOTO 1190
3910 COLOR 14:PRINT "Kunt het niet vinden.":GOTO 1190
3950 IF O(19) = 0 THEN 3080
3960 COLOR 14:PRINT "U heeft een snorkel nodig.":GOTO 1190
5000 XL$ = D$(X,L):IF XL$ = "-"THEN RETURN
5010 COLOR 13
5020 IF XL$ = "u" THEN PRINT "uit";
5030 IF XL$ = "n" THEN PRINT "noord";
5040 IF XL$ = "o" THEN PRINT "oost";
5050 IF XL$ = "z" THEN PRINT "zuid";
5060 IF XL$ = "w" THEN PRINT "west";
5070 IF XL$ = "h" THEN PRINT "(om)hoog";
5080 IF XL$ = "l" THEN PRINT "(om)laag";
5090 PRINT ".";: COLOR 15: RETURN
5200 IF O(13) = 0 AND L = 31 THEN COLOR 14: PRINT "Een tunnel onder water.":COLOR 15:RETURN
5230 IF (L = 13 AND C1 = 1) OR (L = 14 AND C2 = 1) OR (L = 17 AND C3 = 1) OR (L = 18 AND C4 = 1)THEN COLOR 14:PRINT "putdeksel.";
5240 IF L = 13 OR L = 14 OR L = 17 OR L = 18 THEN COLOR 14:PRINT "afvoer.":COLOR 15: RETURN
5270 IF H = 1 AND (L = 8 OR L = 36) THEN COLOR 14:PRINT "hetelucht ballon.":COLOR 15:RETURN
5280 Z = INT(10*RND(.5))+1: COLOR 14
5290 IF L = 6 AND Z = 1 THEN PRINT "Adriaan met twee staven dynamiet."
5300 IF L = 3 AND Z = 3 THEN PRINT "Zoete met een koppel bloedhonden."
5310 IF L = 7 AND Z = 5 THEN PRINT "Berend met een bulldozer."
5320 IF L = 33 AND Z < 5 THEN PRINT "Er vliegt een vleermuis langs."
5330 IF L = 27 AND Z < 3 THEN PRINT "Er zit spinrag in Uw haar."
5340 IF L = 25 AND Z < 3 THEN PRINT "Een rat strijkt langs Uw been."
5350 IF L = 4 AND Z = 7 THEN PRINT "Een pad springt in het kanaal."
5360 IF L = 28 AND O(14) = 0 AND Z < 5 THEN PRINT "Een hongerige meeuw cirkelt rond."
5370 IF L = 2 AND Z = 8 THEN PRINT "Een aapachtig figuur kijkt op U neer."
5390 COLOR 15:RETURN
6000 IF C$ = "gezondheid" OR C$ = "wordt beter" OR C$ = "beterschap" THEN S = 0:COLOR 14:PRINT "genezen.":GOTO 1190 ELSE 1200
6100 IF O(19) = 0 THEN COLOR 14:PRINT "U heeft het al.":GOTO 1190
6115 IF O(19) = 40 AND (O(7) = 0 OR O(7) = L) THEN O(19) = 0:I = I+1:GOTO 1000
6130 IF O(19) = L THEN O(19) = 0:I = I+1:GOTO 1000 ELSE 1990
6150 IF O(13) = 0 THEN COLOR 14:PRINT "Heeft U al.":GOTO 1190
6160 IF O(13) = 40 AND L = 14 THEN O(13) = 0:I = I+1:GOTO 1000
6170 IF O(13) = L THEN  O(13) = 0: I = I+1:GOTO 1000 ELSE 1990
6200 COLOR 14:PRINT "U had nog net genoeg kracht om weg te komen.":S = 1:L = 11:COLOR 15:GOTO 990
6300 IF V = 0 THEN COLOR 14:PRINT "Panter laat dat niet toe.":GOTO 1190 ELSE L = 19:GOTO 1000
6400 COLOR 14:Z = 3 + ABS(5*Y-85)/6: CLS: LOCATE Z,Y: PRINT "- - -"
6410 LOCATE Z + 1,Y - 1: PRINT "-     -"
6420 LOCATE Z + 2,Y - 1: PRINT "======="
6430 LOCATE Z + 3,Y - 1: PRINT "-     -"
6440 LOCATE Z + 4,Y: PRINT "-   -"
6450 COLOR 4:LOCATE Z + 5,Y + 1: PRINT ".-."
6460 LOCATE Z + 6,Y + 1: PRINT ". ."
6470 LOCATE Z + 7,Y + 1: PRINT "---"
6480 LOCATE Z + 8,Y + 1: PRINT "***"
6485 LOCATE Z + 9,Y + 1: PRINT "---"
6490 FOR X = 1 TO 1000:NEXT X:COLOR 15:RETURN
6500 FOR X = 0 TO 20: FOR Y = 0 TO 50:NEXT :NEXT :RETURN
6550 COLOR 14:PRINT H$"   Zo bouwt U een heteluchtballon:"
6570 COLOR 5:PRINT :PRINT :PRINT TAB(8)"1   ballon": PRINT TAB(8)"2   kachel":PRINT TAB(8)"3   brandstof":PRINT TAB(8)"4   gondel of schuit":PRINT TAB(8)"5   kabel of touw":PRINT TAB(8)"6   lucifers of aansteker"
6600 PRINT :PRINT :PRINT "   Bouw op een geschikte plaats!":GOSUB 10000:GOSUB 160:GOTO 1000
7000 IF E = 0 THEN COLOR 14:PRINT "U kunt het niet vinden.":GOTO 1190
7030 IF L <> 16 THEN COLOR 14:PRINT "Is hier niet.":GOTO 1190
7040 COLOR 2:PRINT "Combinatieslot.": PRINT "Type het eerste getal  - ";: INPUT A$: F$(1) =A$: COLOR 15:GOSUB 6500: IF F$(1) <> S$(1) THEN 7120
7070 COLOR 2:PRINT "Type tweede getal  - ";: INPUT A$: F$(2) = A$: COLOR 15:GOSUB 6500: IF F$(1) + F$(2) <> S$(1) + S$(2) THEN 7120
7100 COLOR 2:PRINT "Type het laatste getal  - ";: INPUT A$: F$(3) = A$:COLOR 15: GOSUB 6500: IF F$(1) +F$(2) +F$(3) = S$(1) +S$(2) +S$(3) THEN F = 1:COLOR 4:PRINT :PRINT "Klik........ Er zit een testament in.":GOTO 1190
7120 COLOR 4:PRINT "Fout.":GOTO 1190
7200 CLS
7205 COLOR 14:LOCATE 3,25: PRINT "***  LAATSTE WILSBESCHIKKING  ***"
7210 LOCATE 6,25: PRINT "* Ik, Wout van Duysz ter Ghasth *"
7215 LOCATE 7,25: PRINT "* in goede gezondheid en bij    *"
7220 LOCATE 8,25: PRINT "* mijn volle verstand, laat     *"
7225 LOCATE 9,25: PRINT "* al mijn bezittingen, met      *"
7230 LOCATE 10,25: PRINT "* inbegrip van Korenvliet,      *"
7235 LOCATE 11,25: PRINT "* na aan diegene die deze       *"
7240 LOCATE 12,25: PRINT "* kluis opent, wie dat ook      *"
7245 LOCATE 13,25: PRINT "* zijn moge, zelfs Olivier      *"
7250 LOCATE 17,30: PRINT "<<<gefeliciteerd>>>"
7255 COLOR 15:GOSUB 163: GOTO 65432
7500 CLS: PRINT H$: LOCATE 2,29: PRINT "Welkom in Rittenburg.": LOCATE 10,1: PRINT "U heeft onlangs vernomen dat Uw exentrieke oom Wout overleden is. Het gerucht"
7510 LOCATE 12,1: PRINT "gaat dat deze oude zonderling het landhuis Korenvliet heeft nagelaten aan": LOCATE 14,1: PRINT "degene die zijn testament weet te vinden."
7550 LOCATE 23,1: PRINT "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
7560 LOCATE 25,25: PRINT "Wil je verder? Druk op V.";
7570 WL$=INKEY$: IF WL$="V" OR WL$="v" THEN GOTO 7580 ELSE GOTO 7570
7580 CLS: LOCATE 2,1: PRINT "Om het spel te spelen moet U objecten in Uw omgeving onderzoeken en manipuleren":LOCATE 4,1: PRINT "door het gebruik van eenvoudige opdrachten, zoals:"
7590 LOCATE 8,5: PRINT "* ga zuid"; SPC(15); "* ga noord"; SPC(17); "* ga laag"
7595 LOCATE 10,5: PRINT "* ga oost"; SPC(15); "* ga west"; SPC(18); "* ga hoog"
7600 LOCATE 12,5: PRINT "* ga in landhuis"; SPC(8); "* ga uit landhuis"; SPC(10); "* ga naar winkel"
7610 LOCATE 14,5: PRINT "* neem mand"; SPC(13); "* leg mand weg"; SPC(13) ; "* bekijk mand"
7615 LOCATE 16,5: PRINT "* open deur"; SPC(13); "* ga door deur"; SPC(13); "* verwijder deksel"
7620 LOCATE 18,5: PRINT "* ga in vijver"; SPC(10); "* inventaris"
7650 LOCATE 23,1: PRINT "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
7660 LOCATE 25,15: PRINT "Wil je verder? Druk op V. Wil je terug? Druk op T.";
7670 WL$=INKEY$: IF WL$="T" OR WL$="t" THEN GOTO 7500
7680 IF WL$="V" OR WL$="v" THEN GOTO 7700 ELSE GOTO 7670
7700 CLS: LOCATE 4,23: PRINT " Richtingen mogen worden afgekort:"
7710 LOCATE 8,30: PRINT "* ga n  (ga noord)"
7720 LOCATE 10,30: PRINT "* ga z  (ga zuid)"
7730 LOCATE 12,30: PRINT "* ga o  (ga oost)"
7740 LOCATE 14,30: PRINT "* ga w  (ga west)"
7750 LOCATE 16,30: PRINT "* ga l  (ga omlaag)"
7760 LOCATE 18,30: PRINT "* ga h  (ga oomhoog)"
7770 LOCATE 23,1: PRINT "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
7780 LOCATE 25,15: PRINT "Wil je beginnen. Druk op B. Wil je terug? Druk op T.   ";
7790 WL$=INKEY$: IF WL$="T" OR WL$="t" THEN GOTO 7580
7800 IF WL$="B" OR WL$="b" THEN COLOR 15: GOTO 160
7810 GOTO 7790
8000 DATA ballon,neergestorte weerballon,3,kachel,kleine houtkachel,1,mand,grote rieten mand,12,houtblokken,houtblokken,40,koord,rol koord,17,lucifers,doosje lucifers,15,tas,grote tas,16,rubberboot,rubberboot,1,bord,bord,8
8100 DATA visnet,visnet,7,sportschoenen,sportschoenen,10,bijl,bijl,10,zwembril,zwembril,40,zalm,zalm,29,beker,kristallen beker,19,fles,lege champagnefles,33,boek,boek,14,schilderij,schilderij van Oom Wout,16,snorkel,snorkel,40,landhuis,Korenvliet,9
8110 DATA landhuis,Korenvliet,1,schuur,oude verlaten schuur,36,tafel,houten tafel,37,klok,Friese staartklok,14,kluis,kluis,40,kist,kist Chablis,18,bomen,bomen,2,deur,deur,20,deur,deur,16,panter,een geimporteerde panter,18,winkel,supermarkt,9
8120 DATA trap,trap,19,ziekenhuis,ziekenhuis,9,op het binnenplein,in een bos,in een weiland,een glibberige kanaalkant,de oever van een vijver,op een braakliggend terrein,op een rotspaadje
8125 DATA de rand van een afgraving,op de hoofdstraat,in de supermarkt
8130 DATA in het ziekenhuis,in de foyer,in de huiskamer,in de studeerkamer,in een tuinkamer,op de overloop,in het atrium,westvleugel van wijnkelder,oostvleugel van wijnkelder,boven aan een trap,een uitlaat van een riool
8140 DATA een bocht in het riool,vertakking in het riool,een uitlaat van het riool,een bocht in het riool,een uitlaat in het riool,een uitlaat in het riool,op de vijver,in de Zuidbaai,onder het wateroppervlak
8150 DATA onder het wateroppervlak,een ondergrondse stroom,in een grot,in een heteluchtballon,in een heteluchtballon,op een plateau,in een schuur
8160 DATA w,2,z,4,-,0,o,1,z,3,n,9,n,2,o,4,-,0,w,3,o,5,n,1,w,4,-,0,-,0,z,9,o,7,-,0,w,6,o,8,-,0,w,7,-,0,-,0,z,2,n,6,-,0,u,9,-,0,-,0,u,9,-,0,-,0,u,9,z,13,-,0,n,12,o,14,z,17,w,13,o,15,z,16,w,14,-,0,-,0,n,14,w,17,-,0,u,1,n,13,o,16,o,19,-,0,-,0,w
8170 DATA 18,h,20,-,0,l,19,-,0,-,0,u,13,z,22,-,0,n,21,o,23,-,0,w,22,n,24,z,25,u,14,z,23,-,0,n,23,w,26,-,0,u,17,l,27,o,25,u,18,h,26,-,0,u,5,z,29,-,0,n,28,-,0,-,0,u,28,z,31,-,0,h,29,n,30,-,0,o,31,w,33,-,0,o,32,-,0,-,0,u,8,-,0,-,0,u,36,-,0,-,0
8180 DATA -,0,-,0,-,0,u,36,-,0,-,0,uitlaat is afgedekt,er past iets niet,binnenin is een briefje met nummer,13,14,17,18,21,24,26,27
8844 LIST
8900 LOCATE 23,1: PRINT "-------------------------------------------------------------------------------";
8905 LOCATE 25,5: PRINT "Wil je instructies ? Tik in help.  Wil je stoppen ? Tik in stop.";
8910 RETURN
9000 ALF=TIMER
9010 ALF1=INT(ALF)
9020 ALF2=ALF-ALF1
9030 Z=INT(ALF2*100)
9040 IF Z < 10 THEN Z = Z + 11
9050 B=Z:FOR B=1 TO B*11:NEXT B
9060 RETURN
10000 FOR X=1 TO 10000: NEXT X: COLOR 15: RETURN
65432 PRINT H$: DEF SEG: POKE 106,0: COLOR 7,0,0: LOAD "menub.bas",R
