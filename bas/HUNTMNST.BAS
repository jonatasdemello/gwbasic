1 OPEN "KENSETUP.DAT" FOR INPUT AS #1: INPUT #1, PAT$: INPUT #1, PAT$: CLOSE #1
10 RANDOMIZE TIMER: SCREEN 12: CLS
20 DIM A(9, 7), B(3, 2), Q$(125)
25 GOSUB 4000
30 LOCATE 2, 30: PRINT "HUNT THE MONSTER"
40 LOCATE 10, 30: PRINT "1 - EASY MAZE"
50 LOCATE 12, 30: PRINT "2 - HARD MAZE"
60 LOCATE 14, 30: PRINT "3 - PRO MAZE"
70 PLAY "L20MB<<<AB>CDECL10EL20E-CL10E-L20ECL10E<L20AB>CDECEAGECEL10G>>"
80 Z$ = INKEY$: IF Z$ = "" OR VAL(Z$) < 1 OR VAL(Z$) > 3 THEN 80
90 OPT1 = VAL(Z$)
100 LOCATE 9, 30: PRINT "1 - NORMAL"
110 LOCATE 10, 30: PRINT "                    "
120 LOCATE 11, 30: PRINT "2 - BLINDFOLD"
130 LOCATE 12, 30: PRINT "                    "
140 LOCATE 13, 30: PRINT "3 - EXPRESS"
150 LOCATE 14, 30: PRINT "                    "
160 LOCATE 15, 30: PRINT "4 - BLINDFOLD & EXPRESS"
170 Z$ = INKEY$: IF Z$ = "" OR VAL(Z$) < 1 OR VAL(Z$) > 4 THEN 170
180 OPT2 = VAL(Z$)
190 CLS
200 FOR Z = 1 TO 8
210 FOR ZZ = 1 TO 6
220 A(Z, ZZ) = 0
230 NEXT ZZ
240 NEXT Z
250 FOR ZZZ = 1 TO 3
260 Z = INT(8 * RND) + 1
270 ZZ = INT(6 * RND) + 1
280 IF A(Z, ZZ) <> 0 THEN 260
290 IF ZZZ = 1 THEN A(Z, ZZ) = 1
300 IF ZZZ > 1 THEN A(Z, ZZ) = 2
310 B(ZZZ, 1) = Z: B(ZZZ, 2) = ZZ
320 NEXT ZZZ
330 IF OPT1 = 1 THEN CURV = INT(6 * RND) + 10
340 IF OPT1 = 2 THEN CURV = INT(12 * RND) + 16
350 IF OPT1 = 3 THEN CURV = INT(6 * RND) + 28
360 FOR ZZZ = 1 TO CURV
370 Z = INT(8 * RND) + 1
380 ZZ = INT(6 * RND) + 1
390 IF A(Z, ZZ) <> 0 THEN 370
400 A(Z, ZZ) = INT(2 * RND) + 3
410 NEXT ZZZ
420 FOR ZZZ = 1 TO 3
430 XX = B(ZZZ, 1): YY = B(ZZZ, 2): X = B(ZZZ, 1) + 1: Y = B(ZZZ, 2): IF X > 8 THEN X = 1: XX = 0
440 GOSUB 3000
450 XX = B(ZZZ, 1): YY = B(ZZZ, 2): X = B(ZZZ, 1) - 1: Y = B(ZZZ, 2): IF X < 1 THEN X = 8: XX = 9
460 GOSUB 3000
470 XX = B(ZZZ, 1): YY = B(ZZZ, 2): X = B(ZZZ, 1): Y = B(ZZZ, 2) + 1: IF Y > 6 THEN Y = 1: YY = 0
480 GOSUB 3000
490 XX = B(ZZZ, 1): YY = B(ZZZ, 2): X = B(ZZZ, 1): Y = B(ZZZ, 2) - 1: IF Y < 1 THEN Y = 6: YY = 7
500 GOSUB 3000
510 NEXT ZZZ
520 ZZZ = 4
530 FOR Z = 1 TO 8
540 FOR ZZ = 1 TO 6
550 IF A(Z, ZZ) = 6 OR A(Z, ZZ) = 7 OR A(Z, ZZ) = 9 THEN
560 XX = Z: YY = ZZ: X = Z + 1: Y = ZZ: IF X > 8 THEN X = 1: XX = 0
570 GOSUB 3000
580 XX = Z: YY = ZZ: X = Z - 1: Y = ZZ: IF X < 1 THEN X = 8: XX = 9
590 GOSUB 3000
600 XX = Z: YY = ZZ: X = Z: Y = ZZ + 1: IF Y > 6 THEN Y = 1: YY = 0
610 GOSUB 3000
620 XX = Z: YY = ZZ: X = Z: Y = ZZ - 1: IF Y < 1 THEN Y = 6: YY = 7
630 GOSUB 3000
640 END IF
650 NEXT ZZ
660 NEXT Z
665 REGT = 0
670 FOR Z = 1 TO 8
680 FOR ZZ = 1 TO 6
690 IF A(Z, ZZ) > 10 THEN A(Z, ZZ) = A(Z, ZZ) - 10
695 IF A(Z, ZZ) = 0 THEN REGT = 1
700 NEXT ZZ
710 NEXT Z
715 IF REGT = 0 THEN 190
720 C = INT(8 * RND) + 1: D = INT(6 * RND) + 1: IF A(C, D) <> 0 THEN 720
722 LINE (98, 99)-(502, 403), 15, B
725 PLAY "MB<<L16>CL8<GL16GL8EL16EL8C>>"
726 CX = 0: DX = 0
730 GOTO 1000

800 IF A(Z, ZZ) <> 1 AND A(Z, ZZ) <> 8 THEN PSET (Z * 50 + 50, ZZ * 50 + 50)
810 IF A(Z, ZZ) = 0 OR A(Z, ZZ) = 6 THEN DRAW "C0D1BR20C15D10G10L10BD10C15R10F10D10BR10C15U10E10R10BU10C15L10H10U10"
820 IF A(Z, ZZ) = 1 OR A(Z, ZZ) = 8 THEN
821 OPEN PAT$ + "MONST.DAT" FOR INPUT AS #1
825 X = Z * 50 + 49: Y = ZZ * 50 + 50: XX = 2: YY = 2
830 INPUT #1, X1
831 IF X1 = 4 THEN CLOSE #1: GOTO 849
834 IF X1 = 0 THEN INPUT #1, X2, X3, X4, X5, X6: LINE (X + X2 * XX, Y + X3 * YY)-(X + X4 * XX, Y + X5 * YY), X6
835 IF X1 = 1 THEN INPUT #1, X2, X3, X4: LINE -(X + X2 * XX, Y + X3 * YY), X4
837 IF X1 = 2 THEN INPUT #1, X2, X3, X4, X5: CIRCLE (X + X2 * XX, Y + X3 * YY), (ABS(XX) + ABS(YY)) / 2 * .5, X5
839 IF X1 = 3 THEN INPUT #1, X2, X3, X4, X5: PAINT (X + X2 * XX, Y + X3 * YY), X4, X5
845 GOTO 830
849 END IF
850 IF A(Z, ZZ) = 2 OR A(Z, ZZ) = 9 THEN DRAW "C0D1BR20C12D10G10L10BD10C12R10F10D10BR10C12U10E10R10BU10C12L10H10U10BL5BD10C10D5BD19D5BU16BL10L5BR25R5": CIRCLE (Z * 50 + 75, ZZ * 50 + 75), 12, 10: CIRCLE (Z * 50 + 75, ZZ * 50 + 75), 13, 10
860 IF A(Z, ZZ) = 3 AND (CC = C + 1 OR DD = D - 1 OR MAP = 1) THEN DRAW "C0D1BR30C15D10F10R10BD10C15L15H15U15"
865 IF A(Z, ZZ) = 3 AND (CC = C - 1 OR DD = D + 1 OR MAP = 1) THEN PSET (Z * 50 + 50, ZZ * 50 + 50): DRAW "C0D1BD20C15R15F15D15BL10C15U10H10L10"
870 IF A(Z, ZZ) = 4 AND (CC = C - 1 OR DD = D - 1 OR MAP = 1) THEN DRAW "C0D1BR20C15D10G10L10BD10C15R15E15U15"
875 IF A(Z, ZZ) = 4 AND (CC = C + 1 OR DD = D + 1 OR MAP = 1) THEN PSET (Z * 50 + 50, ZZ * 50 + 50): DRAW "C0D1BF20BR30C15L15G15D15BR10C15U10E10R10"
880 IF A(Z, ZZ) = 5 THEN DRAW "C0D1BR20C10D10G10L10BD10C10R10F10D10BR10C10U10E10R10BU10C10L10H10U10"
890 IF A(Z, ZZ) = 7 THEN DRAW "C0D1BR20C10D10G10L10BD10C10R10F10D10BR10C10U10E10R10BU10C10L10H10U10"
900 IF A(Z, ZZ) = 6 OR A(Z, ZZ) = 7 OR A(Z, ZZ) = 9 THEN CIRCLE (Z * 50 + 75, ZZ * 50 + 75), 5, 12: PAINT (Z * 50 + 75, ZZ * 50 + 75), 12, 12
930 RETURN

1000 Z = C: ZZ = D: GOSUB 800
1005 CIRCLE (C * 50 + 75 + CX, D * 50 + 75 + DX), 3, 14: PAINT (C * 50 + 75 + CX, D * 50 + 75 + DX), 14, 14
1006 IF (OPT2 = 2 OR OPT2 = 4) AND CQ <> 0 AND (CQ <> C OR DQ <> D) THEN LINE (CQ * 50 + 50, DQ * 50 + 51)-(CQ * 50 + 101, DQ * 50 + 101), 0, BF
1010 X$ = INKEY$: IF X$ = "" THEN 1010
1015 IF X$ = "Q" OR X$ = "q" OR ASC(X$) = 27 THEN 1400
1020 IF LEN(X$) = 2 THEN
1021 X = ASC(RIGHT$(X$, 1))
1022 IF A(C, D) = 3 AND (CC = C - 1 OR DD = D + 1) AND (X = 72 OR X = 77) THEN SOUND 60, 1: GOTO 1065
1023 IF A(C, D) = 3 AND (CC = C + 1 OR DD = D - 1) AND (X = 75 OR X = 80) THEN SOUND 60, 1: GOTO 1065
1024 IF A(C, D) = 4 AND (CC = C + 1 OR DD = D + 1) AND (X = 72 OR X = 75) THEN SOUND 60, 1: GOTO 1065
1025 IF A(C, D) = 4 AND (CC = C - 1 OR DD = D - 1) AND (X = 77 OR X = 80) THEN SOUND 60, 1: GOTO 1065
1026 CC = C: DD = D: CQ = C: DQ = D
1028 IF A(C, D) = 6 OR A(C, D) = 7 OR A(C, D) = 9 THEN CIRCLE (C * 50 + 75 + CX, D * 50 + 75 + DX), 3, 12: PAINT (C * 50 + 75 + CX, D * 50 + 75 + DX), 12, 12
1029 IF A(C, D) <> 6 AND A(C, D) <> 7 AND A(C, D) <> 9 THEN CIRCLE (C * 50 + 75 + CX, D * 50 + 75 + DX), 3, 0: PAINT (C * 50 + 75 + CX, D * 50 + 75 + DX), 0, 0
1031 IF X = 72 THEN D = D - 1: IF D < 1 THEN D = 6: DD = 7
1032 IF X = 75 THEN C = C - 1: IF C < 1 THEN C = 8: CC = 9
1033 IF X = 77 THEN C = C + 1: IF C > 8 THEN C = 1: CC = 0
1034 IF X = 80 THEN D = D + 1: IF D > 6 THEN D = 1: DD = 0
1035 IF OPT2 = 3 OR OPT2 = 4 THEN
1040 IF OPT2 <> 4 THEN Z = C: ZZ = D: GOSUB 800
1041 DFG = 0
1042 IF A(C, D) = 3 AND CC = C - 1 THEN CC = C: DD = D: D = D + 1: DFG = 1: IF D > 6 THEN D = 1: DD = 0
1043 IF A(C, D) = 3 AND CC = C + 1 THEN CC = C: DD = D: D = D - 1: DFG = 1: IF D < 1 THEN D = 6: DD = 7
1044 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1041
1045 IF A(C, D) = 3 AND DD = D - 1 THEN CC = C: DD = D: C = C + 1: DFG = 1: IF C > 8 THEN C = 1: CC = 0
1046 IF A(C, D) = 3 AND DD = D + 1 THEN CC = C: DD = D: C = C - 1: DFG = 1: IF C < 1 THEN C = 8: CC = 9
1047 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1041
1048 IF A(C, D) = 4 AND CC = C - 1 THEN CC = C: DD = D: D = D - 1: DFG = 1: IF D < 1 THEN D = 6: DD = 7
1049 IF A(C, D) = 4 AND CC = C + 1 THEN CC = C: DD = D: D = D + 1: DFG = 1: IF D > 6 THEN D = 1: DD = 0
1050 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1041
1051 IF A(C, D) = 4 AND DD = D - 1 THEN CC = C: DD = D: C = C - 1: DFG = 1: IF C < 1 THEN C = 8: CC = 9
1052 IF A(C, D) = 4 AND DD = D + 1 THEN CC = C: DD = D: C = C + 1: DFG = 1: IF C > 8 THEN C = 1: CC = 0
1053 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1041
1054 IF DFG = 1 THEN 1041
1055 END IF
1061 IF A(C, D) = 1 OR A(C, D) = 8 THEN 1400
1062 IF A(C, D) = 2 OR A(C, D) = 9 THEN 1600
1063 CX = 0: DX = 0
1064 IF A(C, D) = 3 AND (CC = C - 1 OR DD = D + 1) THEN CX = -7: DX = 7
1065 IF A(C, D) = 3 AND (CC = C + 1 OR DD = D - 1) THEN CX = 7: DX = -7
1066 IF A(C, D) = 4 AND (CC = C + 1 OR DD = D + 1) THEN CX = 7: DX = 7
1067 IF A(C, D) = 4 AND (CC = C - 1 OR DD = D - 1) THEN CX = -7: DX = -7
1070 END IF
1080 IF X$ = " " THEN
1090 LOCATE 1, 1: PRINT "WHICH DIRECTION?    ": SOUND 1000, 1
1100 X$ = INKEY$: IF X$ = "" AND LEN(X$) <> 2 THEN 1100
1121 X = ASC(RIGHT$(X$, 1))
1122 IF A(C, D) = 3 AND (CC = C - 1 OR DD = D + 1) AND (X = 72 OR X = 77) AND OPT2 < 3 THEN SOUND 60, 1: GOTO 1100
1123 IF A(C, D) = 3 AND (CC = C + 1 OR DD = D - 1) AND (X = 75 OR X = 80) AND OPT2 < 3 THEN SOUND 60, 1: GOTO 1100
1124 IF A(C, D) = 4 AND (CC = C + 1 OR DD = D + 1) AND (X = 72 OR X = 75) AND OPT2 < 3 THEN SOUND 60, 1: GOTO 1100
1125 IF A(C, D) = 4 AND (CC = C - 1 OR DD = D - 1) AND (X = 77 OR X = 80) AND OPT2 < 3 THEN SOUND 60, 1: GOTO 1100
1130 IF X = 72 THEN CC = C: DD = D: D = D - 1: IF D < 1 THEN D = 6: DD = 7
1140 IF X = 75 THEN CC = C: DD = D: C = C - 1: IF C < 1 THEN C = 8: CC = 9
1150 IF X = 77 THEN CC = C: DD = D: C = C + 1: IF C > 8 THEN C = 1: CC = 0
1160 IF X = 80 THEN CC = C: DD = D: D = D + 1: IF D > 6 THEN D = 1: DD = 0
1161 IF OPT2 = 3 OR OPT2 = 4 THEN
1162 IF OPT2 <> 4 THEN Z = C: ZZ = D: GOSUB 800
1163 DFG = 0
1164 IF A(C, D) = 3 AND CC = C - 1 THEN CC = C: DD = D: D = D + 1: DFG = 1: IF D > 6 THEN D = 1: DD = 0
1165 IF A(C, D) = 3 AND CC = C + 1 THEN CC = C: DD = D: D = D - 1: DFG = 1: IF D < 1 THEN D = 6: DD = 7
1166 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1163
1167 IF A(C, D) = 3 AND DD = D - 1 THEN CC = C: DD = D: C = C + 1: DFG = 1: IF C > 8 THEN C = 1: CC = 0
1168 IF A(C, D) = 3 AND DD = D + 1 THEN CC = C: DD = D: C = C - 1: DFG = 1: IF C < 1 THEN C = 8: CC = 9
1169 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1163
1170 IF A(C, D) = 4 AND CC = C - 1 THEN CC = C: DD = D: D = D - 1: DFG = 1: IF D < 1 THEN D = 6: DD = 7
1171 IF A(C, D) = 4 AND CC = C + 1 THEN CC = C: DD = D: D = D + 1: DFG = 1: IF D > 6 THEN D = 1: DD = 0
1172 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1163
1173 IF A(C, D) = 4 AND DD = D - 1 THEN CC = C: DD = D: C = C - 1: DFG = 1: IF C < 1 THEN C = 8: CC = 9
1174 IF A(C, D) = 4 AND DD = D + 1 THEN CC = C: DD = D: C = C + 1: DFG = 1: IF C > 8 THEN C = 1: CC = 0
1175 IF OPT2 <> 4 AND DFG = 1 THEN Z = C: ZZ = D: GOSUB 800: GOTO 1163
1176 IF DFG = 1 THEN 1163
1177 END IF
1270 IF A(C, D) <> 1 AND A(C, D) <> 8 THEN 1400
1280 IF A(C, D) = 1 OR A(C, D) = 8 THEN 1800
1310 END IF
1320 GOTO 1000

1400 CLS : MONS = MONS + 1: MONSX = 1
1410 PLAY "MB<<<<L8AL10AL24AL8A"
1440 OPEN PAT$ + "MONST.DAT" FOR INPUT AS #1
1460 X = 120: Y = 10: XX = 15: YY = 15
1480 INPUT #1, X1
1500 IF X1 = 4 THEN CLOSE #1: GOTO 1580
1510 IF X1 = 0 THEN INPUT #1, X2, X3, X4, X5, X6: LINE (X + X2 * XX, Y + X3 * YY)-(X + X4 * XX, Y + X5 * YY), X6
1530 IF X1 = 1 THEN INPUT #1, X2, X3, X4: LINE -(X + X2 * XX, Y + X3 * YY), X4
1550 IF X1 = 2 THEN INPUT #1, X2, X3, X4, X5: CIRCLE (X + X2 * XX, Y + X3 * YY), (ABS(XX) + ABS(YY)) / 2 * .5, X5
1560 IF X1 = 3 THEN INPUT #1, X2, X3, X4, X5: PAINT (X + X2 * XX, Y + X3 * YY), X4, X5
1570 GOTO 1480
1580 PLAY "MF>C<L16BL8BL16AL8AL16G+L8A>>>>"
1590 GOTO 2000

1600 CLS : PIT = PIT + 1: PITX = 1
1610 LINE (0, 0)-(220, 479), 10, BF
1620 LINE (420, 0)-(639, 479), 10, BF
1630 LINE (221, 350)-(419, 479), 9, BF
1710 FOR Z = 10 TO 400 STEP 2
1715 PSET (310, Z)
1720 DRAW "C15F10E10G10D10H10F10E10G10D5L5D10R10U10L5"
1725 SOUND 1000 - Z * 2, .1
1726 PSET (310, Z)
1730 IF Z < 326 THEN DRAW "C0F10E10G10D10H10F10E10G10D5L5D10R10U10L5"
1735 IF Z > 325 THEN DRAW "C9F10E10G10D10H10F10E10G10D5L5D10R10U10L5"
1736 IF Z > 320 AND Z < 350 THEN LINE (310, Z)-(330, Z + 1), 0, BF
1738 IF Z = 370 THEN LINE (310, 350)-(330, 350), 9
1740 NEXT Z
1745 LOCATE 27, 39: PRINT "PIT!"
1750 FOR Z = 1 TO 100
1760 SOUND INT(100 * RND) + 40, .1
1770 NEXT Z
1780 FOR Z = 1 TO 10000: NEXT Z
1790 GOTO 2000

1800 CLS : WIN = WIN + 1: WINX = 1
1810 PLAY "MB<<L16G>L8C<L16GEEGEEG>L8C>"
1820 FOR TX = 1 TO 30
1840 TT$ = "YOU GOT HIM!!": R = TX * 2: RR = TX * 2 + 100: S = 639 - TX * 2: SS = 400 - TX * 2: T = TX MOD 16: GOSUB 8000
1850 NEXT TX
1990 GOTO 2000

2000 CLS
2005 IF MONSX = 1 THEN PRINT "OOPS...": PRINT "THE MONSTER GOT YOU!!"
2010 IF PITX = 1 THEN PRINT "NEXT TIME...": PRINT "WATCH OUT FOR SLIME!!"
2020 IF WINX = 1 THEN PRINT "CONGRATULATIONS!!": PRINT "YOU GOT HIM!!"
2030 MONSX = 0: PITX = 0: WINX = 0
2040 LOCATE 3, 1: PRINT "TALLY BOARD:"
2050 PRINT "WIN -"; WIN; " MONSTER -"; MONS; " PIT -"; PIT; ""
2070 LOCATE 1, 30: PRINT "PRESS BACK SPACE TO CHANGE THE OPTIONS"
2080 LOCATE 2, 30: PRINT "PRESS ENTER TO PLAY AGAIN WITH THE SAME OPTIONS"
2090 LOCATE 3, 30: PRINT "PRESS ESC TO QUIT"
2091 LINE (98, 99)-(502, 403), 15, B
2093 MAP = 1
2094 FOR Z = 1 TO 8
2095 FOR ZZ = 1 TO 6
2096 GOSUB 800
2097 NEXT ZZ
2098 NEXT Z
2099 MAP = 0
2100 Z$ = INKEY$: IF Z$ = "" THEN 2100
2110 IF ASC(Z$) <> 8 AND ASC(Z$) <> 13 AND ASC(Z$) <> 27 THEN 2100
2120 IF ASC(Z$) = 13 THEN 190
2130 IF ASC(Z$) = 8 THEN CLS : GOTO 30
2150 END

3000 DFG = 0
3010 IF A(X, Y) = 3 AND XX = X - 1 THEN XX = X: YY = Y: Y = Y + 1: DFG = 1: IF Y > 6 THEN Y = 1: YY = 0
3020 IF A(X, Y) = 3 AND XX = X + 1 THEN XX = X: YY = Y: Y = Y - 1: DFG = 1: IF Y < 1 THEN Y = 6: YY = 7
3030 IF A(X, Y) = 3 AND YY = Y - 1 THEN XX = X: YY = Y: X = X + 1: DFG = 1: IF X > 8 THEN X = 1: XX = 0
3040 IF A(X, Y) = 3 AND YY = Y + 1 THEN XX = X: YY = Y: X = X - 1: DFG = 1: IF X < 1 THEN X = 8: XX = 9
3050 IF A(X, Y) = 4 AND XX = X - 1 THEN XX = X: YY = Y: Y = Y - 1: DFG = 1: IF Y < 1 THEN Y = 6: YY = 7
3060 IF A(X, Y) = 4 AND XX = X + 1 THEN XX = X: YY = Y: Y = Y + 1: DFG = 1: IF Y > 6 THEN Y = 1: YY = 0
3070 IF A(X, Y) = 4 AND YY = Y - 1 THEN XX = X: YY = Y: X = X - 1: DFG = 1: IF X < 1 THEN X = 8: XX = 9
3080 IF A(X, Y) = 4 AND YY = Y + 1 THEN XX = X: YY = Y: X = X + 1: DFG = 1: IF X > 8 THEN X = 1: XX = 0
3090 IF DFG = 1 THEN 3000
3100 IF ZZZ = 1 AND A(X, Y) = 0 THEN A(X, Y) = 6
3101 IF ZZZ = 1 AND A(X, Y) = 2 THEN A(X, Y) = 9
3110 IF (ZZZ = 2 OR ZZZ = 3) AND A(X, Y) = 0 THEN A(X, Y) = 5
3111 IF (ZZZ = 2 OR ZZZ = 3) AND A(X, Y) = 1 THEN A(X, Y) = 8
3120 IF (ZZZ = 2 OR ZZZ = 3) AND A(X, Y) = 6 THEN A(X, Y) = 7
3130 IF ZZZ = 4 AND A(X, Y) = 0 THEN A(X, Y) = 16
3131 IF ZZZ = 4 AND A(X, Y) = 2 THEN A(X, Y) = 19
3140 IF ZZZ = 4 AND A(X, Y) = 5 THEN A(X, Y) = 17
3160 RETURN

4000 Q$(33) = "020123023024124": Q$(34) = "010111030131"
4032 Q$(35) = "010114030134001141003143"
4033 Q$(36) = "040110101112132143134104030134010114"
4034 Q$(37) = "000110111101100044143133134144040104"
4035 Q$(38) = "044111120131113124142": Q$(39) = "020121112"
4036 Q$(40) = "020111113124": Q$(41) = "020131133124"
4037 Q$(42) = "011133031113021123012132": Q$(43) = "021123012132"
4038 Q$(44) = "022123114": Q$(45) = "012132": Q$(46) = "034134": Q$(47) = "004140"
4039 Q$(48) = "010130141143134114103101110": Q$(49) = "011120124104024144"
4040 Q$(50) = "001110130141104144": Q$(51) = "001110130141132122032143134114103"
4041 Q$(52) = "042102130134": Q$(53) = "040100102132143134104"
4042 Q$(54) = "041130110101103114134143132102": Q$(55) = "000140141114"
4043 Q$(56) = "010130141132112103114134143132012101110"
4044 Q$(57) = "044140110101112142": Q$(58) = "021121023123"
4045 Q$(59) = "021121023114": Q$(60) = "031112133": Q$(61) = "011131013133"
4046 Q$(62) = "011132113": Q$(63) = "024124023122132141130120"
4047 Q$(64) = "034114103101110130141143123121132123"
4048 Q$(65) = "004101110130141144002142"
4049 Q$(66) = "000104134143132102032141130100"
4050 Q$(67) = "040110101103114144": Q$(68) = "000104134143141130100"
4051 Q$(69) = "040100104144002132": Q$(70) = "040100104002132"
4052 Q$(71) = "040110101103114134143142122": Q$(72) = "000104002142040144"
4053 Q$(73) = "010130020124014134": Q$(74) = "010130020123114103"
4054 Q$(75) = "000104002140002144": Q$(76) = "000104144"
4055 Q$(77) = "004100122140144": Q$(78) = "004100144140"
4056 Q$(79) = "000140144104100": Q$(80) = "004100130141132102"
4057 Q$(81) = "010130141143134114103101110033144"
4058 Q$(82) = "004100130141132102032143144"
4059 Q$(83) = "040110101112132143134104": Q$(84) = "000140020124"
4060 Q$(85) = "000103114134143140": Q$(86) = "000124140"
4061 Q$(87) = "000104122144140": Q$(88) = "000144040104"
4062 Q$(89) = "000122140022124": Q$(90) = "000140104144"
4063 Q$(91) = "030110114134": Q$(92) = "000144": Q$(93) = "010130134114"
4064 Q$(94) = "011120131": Q$(95) = "004144": Q$(96) = "020121132"
4065 Q$(97) = "033113114134132112": Q$(98) = "010114134143132112"
4066 Q$(99) = "032122113124134": Q$(100) = "030134114103112132"
4067 Q$(101) = "013133122113124134": Q$(102) = "031120111112102022112114"
4068 Q$(103) = "034124113122132134135115": Q$(104) = "010114013122133134"
4069 Q$(105) = "021121022124": Q$(106) = "021121022124115104"
4070 Q$(107) = "010114013132013134": Q$(108) = "020124"
4071 Q$(109) = "014112132134022124": Q$(110) = "014112132134"
4072 Q$(111) = "034132112114134": Q$(112) = "015112122133124114"
4073 Q$(113) = "034124113122132135144": Q$(114) = "014112132"
4074 Q$(115) = "014134133113112132": Q$(116) = "021124134012132"
4075 Q$(117) = "012114134132": Q$(118) = "012124132"
4076 Q$(119) = "012114122134132": Q$(120) = "012134032114"
4077 Q$(121) = "012124032124115": Q$(122) = "012132114134"
4078 Q$(123) = "030120121112123124134": Q$(124) = "020121023124"
4079 Q$(125) = "010120121132123124114"
4100 RETURN

8000 S = (S - R) / 5: SS = (SS - RR) / 4
8010 S = S / LEN(TT$)
8020 FOR V = 1 TO LEN(TT$)
8030 IF ASC(MID$(TT$, V, 1)) > 31 AND ASC(MID$(TT$, V, 1)) < 126 THEN
8040 FOR VV = 1 TO LEN(Q$(ASC(MID$(TT$, V, 1)))) / 3
8050 U = ASC(MID$(Q$(ASC(MID$(TT$, V, 1))), (VV - 1) * 3 + 1, 1)) - 48
8060 UU = ASC(MID$(Q$(ASC(MID$(TT$, V, 1))), (VV - 1) * 3 + 2, 1)) - 48
8070 UUU = ASC(MID$(Q$(ASC(MID$(TT$, V, 1))), (VV - 1) * 3 + 3, 1)) - 48
8075 QQ = UU * S + R + (V - 1) * S * 5: QQQ = UUU * SS + RR
8080 IF U = 1 THEN LINE -(QQ, QQQ), T
8090 IF U = 0 THEN LINE (QQ, QQQ)-(QQ, QQQ), T
8100 NEXT VV
8110 END IF
8120 NEXT V
8130 RETURN

