10 RANDOMIZE TIMER
15 SCREEN 12
20 DIM A(20, 20)
30 DIM J(20, 20)
50 DIM B(18)
60 B(1) = 3
61 B(2) = 4
62 B(3) = 4
63 B(4) = 3
64 B(5) = 2
65 B(6) = 150
66 B(7) = 30
67 B(8) = 10
68 B(9) = 40
69 B(10) = 1
70 B(11) = 3
71 B(12) = 4
72 B(13) = 3
73 B(14) = 2
74 B(15) = 2
80 B(16) = 1
90 B(17) = 1
111 FOR Y = 1 TO 21
112 FOR YY = 1 TO 21
113 LINE (Y * 20, 20)-(Y * 20, 420), 15
114 LINE (20, YY * 20)-(420, YY * 20), 15
118 NEXT YY
119 NEXT Y
120 FOR Y = 1 TO 17
130 FOR YY = 1 TO B(Y)
140 Z = INT(20 * RND) + 1: ZZ = INT(20 * RND) + 1
150 IF A(Z, ZZ) <> 0 OR (Z = 1 AND ZZ = 20) THEN 140
160 A(Z, ZZ) = Y
161 Z = Z * 20: ZZ = ZZ * 20
162 IF Y < 6 THEN GOSUB 200
163 IF Y = 6 OR Y = 7 THEN GOSUB 300
164 IF Y = 8 THEN GOSUB 400
165 IF Y = 9 THEN GOSUB 500
166 IF Y > 9 AND Y < 17 THEN GOSUB 600
167 IF Y = 17 THEN GOSUB 700
170 NEXT YY
180 NEXT Y
190 GOTO 1000
200 LINE (Z + 1, ZZ + 1)-(Z + 19, ZZ + 1), 12: LINE -(Z + 19, ZZ + 19), 12
210 LINE -(Z + 1, ZZ + 19), 12: LINE -(Z + 1, ZZ + 1), 12
220 IF Y = 1 THEN LINE (Z + 10, ZZ + 5)-(Z + 10, ZZ + 15), 12
230 IF Y = 2 THEN LINE (Z + 7, ZZ + 5)-(Z + 13, ZZ + 5), 12: LINE -(Z + 13, ZZ + 10), 12: LINE -(Z + 7, ZZ + 10), 12: LINE -(Z + 7, ZZ + 15), 12: LINE -(Z + 13, ZZ + 15), 12
240 IF Y = 3 THEN LINE (Z + 7, ZZ + 5)-(Z + 13, ZZ + 5), 12: LINE -(Z + 13, ZZ + 15), 12: LINE -(Z + 7, ZZ + 15), 12: LINE (Z + 7, ZZ + 10)-(Z + 13, ZZ + 10), 12
250 IF Y = 4 THEN LINE (Z + 13, ZZ + 5)-(Z + 13, ZZ + 15), 12: LINE (Z + 7, ZZ + 5)-(Z + 7, ZZ + 10), 12: LINE -(Z + 13, ZZ + 10), 12
260 IF Y = 5 THEN LINE (Z + 13, ZZ + 5)-(Z + 7, ZZ + 5), 12: LINE -(Z + 7, ZZ + 10), 12: LINE -(Z + 13, ZZ + 10), 12: LINE -(Z + 13, ZZ + 15), 12: LINE -(Z + 7, ZZ + 15), 12
290 RETURN
300 IF Y = 7 THEN XX = 9 ELSE XX = 14
305 LINE (Z + 1, ZZ + 1)-(Z + 19, ZZ + 19), XX
310 LINE (Z + 19, ZZ + 1)-(Z + 1, ZZ + 19), XX
390 RETURN
400 FOR X = 2 TO 18 STEP 2
410 LINE (Z + X, ZZ + 1)-(Z + X, ZZ + 19), X / 2
415 LINE (Z + X + 1, ZZ + 1)-(Z + X + 1, ZZ + 19), X / 2
420 NEXT X
490 RETURN
500 LINE (Z + 1, ZZ + 1)-(Z + 19, ZZ + 19), 13, BF
590 RETURN
600 LINE (Z + 1, ZZ + 1)-(Z + 19, ZZ + 1), 2: LINE -(Z + 19, ZZ + 19), 2
604 LINE -(Z + 1, ZZ + 19), 2: LINE -(Z + 1, ZZ + 1), 2
608 IF Y = 10 THEN LINE (Z + 10, ZZ + 5)-(Z + 10, ZZ + 15), 2
610 IF Y = 11 THEN LINE (Z + 7, ZZ + 5)-(Z + 13, ZZ + 5), 2: LINE -(Z + 13, ZZ + 10), 2: LINE -(Z + 7, ZZ + 10), 2: LINE -(Z + 7, ZZ + 15), 2: LINE -(Z + 13, ZZ + 15), 2
620 IF Y = 12 THEN LINE (Z + 13, ZZ + 5)-(Z + 13, ZZ + 15), 2: LINE (Z + 7, ZZ + 5)-(Z + 7, ZZ + 10), 2: LINE -(Z + 13, ZZ + 10), 2
630 IF Y = 13 THEN LINE (Z + 13, ZZ + 5)-(Z + 7, ZZ + 5), 2: LINE -(Z + 7, ZZ + 15), 2: LINE -(Z + 13, ZZ + 15), 2: LINE -(Z + 13, ZZ + 10), 2: LINE -(Z + 7, ZZ + 10), 2
640 IF Y = 14 THEN LINE (Z + 7, ZZ + 10)-(Z + 13, ZZ + 10), 2: LINE -(Z + 13, ZZ + 5), 2: LINE -(Z + 7, ZZ + 5), 2: LINE -(Z + 7, ZZ + 15), 2: LINE -(Z + 13, ZZ + 15), 2: LINE -(Z + 13, ZZ + 10), 2
650 IF Y = 15 THEN LINE (Z + 7, ZZ + 5)-(Z + 7, ZZ + 15), 2: LINE (Z + 16, ZZ + 5)-(Z + 10, ZZ + 5), 2: LINE -(Z + 10, ZZ + 15), 2: LINE -(Z + 16, ZZ + 15), 2: LINE -(Z + 16, ZZ + 5), 2
660 IF Y = 16 THEN LINE (Z + 7, ZZ + 5)-(Z + 7, ZZ + 15), 2: LINE (Z + 10, ZZ + 5)-(Z + 16, ZZ + 5), 2: LINE -(Z + 16, ZZ + 10), 2: LINE -(Z + 10, ZZ + 10), 2: LINE -(Z + 10, ZZ + 15), 2: LINE -(Z + 16, ZZ + 15), 2
690 RETURN
700 LINE (Z + 7, ZZ + 12)-(Z + 5, ZZ + 12), 15
710 LINE -(Z + 3, ZZ + 10), 15: LINE -(Z + 4, ZZ + 8), 15
720 LINE -(Z + 6, ZZ + 8), 15: LINE -(Z + 7, ZZ + 10), 15
730 LINE -(Z + 3, ZZ + 10), 15
735 LINE (Z + 9, ZZ + 12)-(Z + 9, ZZ + 6), 15
740 LINE (Z + 9, ZZ + 8)-(Z + 11, ZZ + 7), 15
745 LINE -(Z + 13, ZZ + 8), 15: LINE -(Z + 13, ZZ + 12), 15
750 LINE (Z + 18, ZZ + 3)-(Z + 18, ZZ + 12), 15
755 LINE -(Z + 16, ZZ + 12), 15: LINE -(Z + 15, ZZ + 11), 15
760 LINE -(Z + 15, ZZ + 9), 15: LINE -(Z + 16, ZZ + 8), 15
765 LINE -(Z + 18, ZZ + 8), 15
790 RETURN
1000 '  MM AA II NN    PP RR OO GG RR AA MM
1010 C = 1
1020 D = 20
1025 H = 1
1030 LINE (C * 20 + 1, D * 20 + 1)-(C * 20 + 19, D * 20 + 19), 6, BF
1035 LOCATE 1, 1: PRINT H; " X-KILLERS,"; I; " POINTS"
1040 E$ = INKEY$: IF E$ = "" THEN 1040
1050 IF E$ <> "W" AND E$ < "w" AND E$ <> "E" AND E$ <> "e" AND E$ <> "R" AND E$ <> "r" AND E$ <> "S" AND E$ <> "s" AND E$ <> "D" AND E$ <> "d" AND E$ <> "Z" AND E$ <> "z" AND E$ <> "X" AND E$ <> "x" AND E$ <> "C" AND E$ <> "c" AND E$ <> "Q" AND E$  _
<> "q" THEN 1040
1060 CC = C: DD = D
1070 IF (E$ = "W" OR E$ = "w") AND C > 1 AND D > 1 THEN C = C - 1: D = D - 1
1080 IF (E$ = "R" OR E$ = "r") AND C < 20 AND D > 1 THEN C = C + 1: D = D - 1
1090 IF (E$ = "Z" OR E$ = "z") AND C > 1 AND D < 20 THEN C = C - 1: D = D + 1
1100 IF (E$ = "C" OR E$ = "c") AND C < 20 AND D < 20 THEN C = C + 1: D = D + 1
1110 IF (E$ = "E" OR E$ = "e") AND D > 1 THEN D = D - 1
1120 IF (E$ = "X" OR E$ = "x") AND D < 20 THEN D = D + 1
1130 IF (E$ = "S" OR E$ = "s") AND C > 1 THEN C = C - 1
1140 IF (E$ = "D" OR E$ = "d") AND C < 20 THEN C = C + 1
1145 IF (E$ = "Q" OR E$ = "q") THEN 2100
1150 IF (A(C, D) = 8 AND F > 0) OR (A(C, D) = 9 AND F = 0) OR (A(C, D) = 17 AND I < 50) OR (A(C, D) = 6 AND H < 1) OR (A(C, D) = 7 AND H < 2) THEN C = CC: D = DD: SOUND 60, 1: GOTO 1040
1160 IF A(C, D) = 8 THEN F = 1: FOR Z = 100 TO 1000 STEP 75: SOUND Z, .5: NEXT Z
1170 IF A(C, D) < 6 AND A(C, D) > 0 THEN H = H + A(C, D): SOUND 262, 1: SOUND 330, 1: SOUND 392, 1: SOUND 523, 1
1180 IF A(C, D) = 10 THEN I = I + 1: SOUND 300, 3
1190 IF A(C, D) = 11 THEN I = I + 2: SOUND 350, 3
1200 IF A(C, D) = 12 THEN I = I + 4: SOUND 400, 3
1205 IF A(C, D) = 13 THEN I = I + 6: SOUND 450, 3
1210 IF A(C, D) = 14 THEN I = I + 8: SOUND 500, 3
1215 IF A(C, D) = 15 THEN I = I + 10: SOUND 600, 3
1220 IF A(C, D) = 16 THEN I = I + 12: SOUND 800, 3
1230 IF A(C, D) = 6 THEN H = H - 1: SOUND 131, 1: SOUND 262, 1: SOUND 131, 1: SOUND 262, 1: SOUND 131, 1
1240 IF A(C, D) = 7 THEN H = H - 2: SOUND 131, 1: SOUND 262, 1: SOUND 523, 1: SOUND 262, 1: SOUND 131, 1: SOUND 262, 1: SOUND 523, 1: SOUND 262, 1: SOUND 131, 1
1250 IF A(C, D) = 9 THEN F = 0: SOUND 2093, 4: FOR Z = 500 TO 1500 STEP 100: SOUND Z, .5: NEXT Z
1252 IF (A(C, D) < 8 AND A(C, D) > 0) OR (A(C, D) > 9 AND A(C, D) < 17) THEN LOCATE 1, 1: PRINT H; " X-KILLERS,"; I; " POINTS   "
1255 IF A(C, D) = 17 THEN GOTO 2000
1260 LINE (CC * 20 + 1, DD * 20 + 1)-(CC * 20 + 19, DD * 20 + 19), 0, BF
1270 LINE (C * 20 + 1, D * 20 + 1)-(C * 20 + 19, D * 20 + 19), 6, BF
1280 J(CC, DD) = J(CC, DD) + 1
1290 IF J(CC, DD) = 3 THEN FOR Z = 1 TO 19 STEP 5: LINE (CC * 20 + 1, DD * 20 + Z)-(CC * 20 + 19, DD * 20 + Z), 13: NEXT Z
1300 IF J(CC, DD) = 4 THEN FOR Z = 1 TO 19 STEP 2: LINE (CC * 20 + 1, DD * 20 + Z)-(CC * 20 + 19, DD * 20 + Z), 13: NEXT Z
1310 IF J(CC, DD) = 5 THEN LINE (CC * 20 + 1, DD * 20 + 1)-(CC * 20 + 19, DD * 20 + 19), 13, BF: A(CC, DD) = 9
1320 A(C, D) = 0
1330 GOTO 1040
2000 FOR Z = 1 TO 460
2010 ZZ = Z MOD 15
2020 LINE (0, Z)-(639, Z), ZZ
2025 SOUND (Z + 20) * 5, .1
2030 NEXT Z
2040 LINE (0, 0)-(639, 460), 12, BF
2050 FOR Z = 1 TO 1000
2060 ZZ = INT(639 * RND) + 1
2070 ZZZ = INT(459 * RND) + 1
2080 LINE -(ZZ, ZZZ), 0
2085 SOUND INT(1000 * RND) + 200, .1
2090 NEXT Z
2100 PRINT "PLAY AGAIN?"
2110 Y$ = INKEY$: IF Y$ = "" THEN 2110
2120 IF Y$ = "Y" OR Y$ = "y" THEN CLEAR : GOTO 15
2130 IF Y$ <> "n" AND Y$ <> "N" THEN 2110
2140 END

