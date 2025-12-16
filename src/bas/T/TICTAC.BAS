10 SCREEN 12: WINDOW SCREEN (0, 0)-(639, 479)
20 DIM A(10)
25 DIM K(10)
30 PRINT "0,1 OR 2 PLAYERS?"
40 B$ = INKEY$: IF B$ = "" THEN 40
50 IF B$ <> "0" AND B$ <> "1" AND B$ <> "2" THEN 40 ELSE C = VAL(B$)
55 IF C = 0 THEN D$ = "X"
60 IF C > 0 THEN
70 PRINT "WHO GOES FIRST? (X),(O),(R)ANDOM,(W)INNERS,(L)OSERS),(E)VERY OTHER GAME?"
80 B$ = INKEY$: IF B$ = "" THEN 80
90 IF B$ <> "X" AND B$ <> "x" AND B$ <> "O" AND B$ <> "o" AND B$ <> "R" AND B$ <> "r" AND B$ <> "W" AND B$ <> "w" AND B$ <> "L" AND B$ <> "l" AND B$ <> "E" AND B$ <> "e" THEN 80
91 IF B$ = "x" THEN B$ = "X"
92 IF B$ = "o" THEN B$ = "O"
93 IF B$ = "r" THEN B$ = "R"
94 IF B$ = "w" THEN B$ = "W"
95 IF B$ = "l" THEN B$ = "L"
96 IF B$ = "e" THEN B$ = "E"
97 DDD$ = B$
98 IF C = 1 THEN
99 PRINT "ARE YOU X OR O?"
100 B$ = INKEY$: IF B$ = "" THEN 100
101 IF B$ <> "X" AND B$ <> "x" AND B$ <> "O" AND B$ <> "o" THEN 100
102 IF B$ = "x" THEN B$ = "X"
103 IF B$ = "o" THEN B$ = "O"
104 DD$ = B$
108 END IF
109 END IF
110 CLS
111 IF (DDD$ = "X" OR DDD$ = "x") THEN D$ = "X"
112 IF (DDD$ = "O" OR DDD$ = "o") THEN D$ = "O"
113 IF (DDD$ = "R" OR DDD$ = "r") THEN
114 B = INT(2 * RND) + 1
115 IF B = 1 THEN D$ = "X"
116 IF B = 2 THEN D$ = "O"
117 END IF
118 IF (DDD$ = "W" OR DDD$ = "w") AND I = 1 THEN D$ = "X"
119 IF (DDD$ = "W" OR DDD$ = "w") AND I = 2 THEN D$ = "O"
120 IF (DDD$ = "L" OR DDD$ = "l") AND I = 1 THEN D$ = "O"
122 IF (DDD$ = "L" OR DDD$ = "l") AND I = 2 THEN D$ = "X"
123 IF (DDD$ = "E" OR DDD$ = "e") THEN
124 SFYJ = 0
125 IF D$ = "X" THEN SFYJ = 1
126 D$ = "X"
127 IF SFYJ = 1 THEN D$ = "O"
128 END IF
129 IF (DDD$ = "W" OR DDD$ = "w" OR DDD$ = "L" OR DDD$ = "l") AND I = 0 THEN
130 PRINT "WHO GOES FIRST FOR THE FIRST GAME? X OR O?"
131 B$ = INKEY$: IF B$ = "" THEN 131
132 IF B$ <> "X" AND B$ <> "x" AND B$ <> "O" AND B$ <> "o" THEN 131
133 IF B$ = "X" OR B$ = "x" THEN D$ = "X": CLS
134 IF B$ = "O" OR B$ = "o" THEN D$ = "O": CLS
135 END IF
136 I = 0
138 LINE (250, 0)-(260, 450), 15, BF
139 LINE (400, 0)-(410, 450), 15, BF
140 LINE (100, 150)-(550, 160), 15, BF
150 LINE (100, 300)-(550, 310), 15, BF
155 J = 0
158 J = J + 1
160 IF C = 0 AND D$ = "X" THEN GOSUB 3000
165 IF C = 0 AND D$ = "O" THEN GOSUB 4000
170 IF C = 1 AND D$ = "X" AND DD$ = "X" THEN GOSUB 1000
175 IF C = 1 AND D$ = "O" AND DD$ = "X" THEN GOSUB 4000
176 IF C = 1 AND D$ = "X" AND DD$ = "O" THEN GOSUB 3000
177 IF C = 1 AND D$ = "O" AND DD$ = "O" THEN GOSUB 2000
180 IF C = 2 AND D$ = "X" THEN GOSUB 1000
181 IF C = 2 AND D$ = "O" THEN GOSUB 2000
185 GOSUB 7000
188 J = J + 1
190 IF C = 0 AND D$ = "X" THEN GOSUB 4000
195 IF C = 0 AND D$ = "O" THEN GOSUB 3000
200 IF C = 1 AND D$ = "X" AND DD$ = "X" THEN GOSUB 4000
205 IF C = 1 AND D$ = "O" AND DD$ = "X" THEN GOSUB 1000
206 IF C = 1 AND D$ = "X" AND DD$ = "O" THEN GOSUB 2000
207 IF C = 1 AND D$ = "O" AND DD$ = "O" THEN GOSUB 3000
210 IF C = 2 AND D$ = "X" THEN GOSUB 2000
215 IF C = 2 AND D$ = "O" THEN GOSUB 1000
218 GOSUB 7000
220 GOTO 158
1000 PRINT CHR$(11); "X'S TURN    "
1001 BB = 0: BC = 0
1002 FOR B = 1 TO 9
1003 IF A(B) <> 0 THEN BB = BB + 1
1004 IF A(B) = 0 THEN BC = B
1005 NEXT B
1006 IF BB = 8 THEN F = BC: GOTO 1030
1010 B$ = INKEY$: IF B$ = "" THEN 1010
1015 IF B$ = "q" OR B$ = "Q" THEN STOP
1020 IF VAL(B$) < 10 AND VAL(B$) > 0 AND A(VAL(B$)) = 0 THEN F = VAL(B$) ELSE 1010
1030 IF F < 4 THEN G = F * 150 - 40: H = 310
1040 IF F > 3 AND F < 7 THEN G = (F - 3) * 150 - 40: H = 160
1050 IF F > 6 THEN G = (F - 6) * 150 - 40: H = 10
1060 GOSUB 5000
1070 RETURN
2000 LOCATE 1, 1: PRINT "O'S TURN    "
2001 BB = 0: BC = 0
2002 FOR B = 1 TO 9
2003 IF A(B) <> 0 THEN BB = BB + 1
2004 IF A(B) = 0 THEN BC = B
2005 NEXT B
2006 IF BB = 8 THEN F = BC: GOTO 2030
2010 B$ = INKEY$: IF B$ = "" THEN 2010
2015 IF B$ = "q" OR B$ = "Q" THEN STOP
2020 IF VAL(B$) < 10 AND VAL(B$) > 0 AND A(VAL(B$)) = 0 THEN F = VAL(B$) ELSE 2010
2030 IF F < 4 THEN G = F * 150 - 40: H = 310
2040 IF F > 3 AND F < 7 THEN G = (F - 3) * 150 - 40: H = 160
2050 IF F > 6 THEN G = (F - 6) * 150 - 40: H = 10
2060 GOSUB 6000
2070 RETURN
3000 LOCATE 1, 1: PRINT "X'S TURN    "
3002 F = 0
3005 IF ((A(2) = 1 AND A(3) = 1) OR (A(5) = 1 AND A(9) = 1) OR (A(4) = 1 AND A(7) = 1)) AND A(1) = 0 AND F = 0 THEN F = 1
3010 IF ((A(1) = 1 AND A(3) = 1) OR (A(5) = 1 AND A(8) = 1)) AND A(2) = 0 AND F = 0 THEN F = 2
3015 IF ((A(1) = 1 AND A(2) = 1) OR (A(5) = 1 AND A(7) = 1) OR (A(6) = 1 AND A(9) = 1)) AND A(3) = 0 AND F = 0 THEN F = 3
3020 IF ((A(1) = 1 AND A(7) = 1) OR (A(5) = 1 AND A(6) = 1)) AND A(4) = 0 AND F = 0 THEN F = 4
3025 IF ((A(1) = 1 AND A(9) = 1) OR (A(2) = 1 AND A(8) = 1) OR (A(3) = 1 AND A(7) = 1) OR (A(4) = 1 AND A(6) = 1)) AND A(5) = 0 AND F = 0 THEN F = 5
3030 IF ((A(3) = 1 AND A(9) = 1) OR (A(4) = 1 AND A(5) = 1)) AND A(6) = 0 AND F = 0 THEN F = 6
3035 IF ((A(1) = 1 AND A(4) = 1) OR (A(3) = 1 AND A(5) = 1) OR (A(8) = 1 AND A(9) = 1)) AND A(7) = 0 AND F = 0 THEN F = 7
3040 IF ((A(2) = 1 AND A(5) = 1) OR (A(7) = 1 AND A(9) = 1)) AND A(8) = 0 AND F = 0 THEN F = 8
3045 IF ((A(1) = 1 AND A(5) = 1) OR (A(3) = 1 AND A(6) = 1) OR (A(7) = 1 AND A(8) = 1)) AND A(9) = 0 AND F = 0 THEN F = 9
3050 IF ((A(2) = 2 AND A(3) = 2) OR (A(5) = 2 AND A(9) = 2) OR (A(4) = 2 AND A(7) = 2)) AND A(1) = 0 AND F = 0 THEN F = 1
3055 IF ((A(1) = 2 AND A(3) = 2) OR (A(5) = 2 AND A(8) = 2)) AND A(2) = 0 AND F = 0 THEN F = 2
3060 IF ((A(1) = 2 AND A(2) = 2) OR (A(5) = 2 AND A(7) = 2) OR (A(6) = 2 AND A(9) = 2)) AND A(3) = 0 AND F = 0 THEN F = 3
3065 IF ((A(1) = 2 AND A(7) = 2) OR (A(5) = 2 AND A(6) = 2)) AND A(4) = 0 AND F = 0 THEN F = 4
3070 IF ((A(1) = 2 AND A(9) = 2) OR (A(2) = 2 AND A(8) = 2) OR (A(3) = 2 AND A(7) = 2) OR (A(4) = 2 AND A(6) = 2)) AND A(5) = 0 AND F = 0 THEN F = 5
3075 IF ((A(3) = 2 AND A(9) = 2) OR (A(4) = 2 AND A(5) = 2)) AND A(6) = 0 AND F = 0 THEN F = 6
3080 IF ((A(1) = 2 AND A(4) = 2) OR (A(3) = 2 AND A(5) = 2) OR (A(8) = 2 AND A(9) = 2)) AND A(7) = 0 AND F = 0 THEN F = 7
3085 IF ((A(2) = 2 AND A(5) = 2) OR (A(7) = 2 AND A(9) = 2)) AND A(8) = 0 AND F = 0 THEN F = 8
3090 IF ((A(1) = 2 AND A(5) = 2) OR (A(3) = 2 AND A(6) = 2) OR (A(7) = 2 AND A(8) = 2)) AND A(9) = 0 AND F = 0 THEN F = 9
3091 IF D$ = "X" AND K(1) = 1 AND K(2) = 9 AND F = 0 AND A(3) = 0 THEN F = 3
3092 IF D$ = "X" AND K(1) = 3 AND K(2) = 7 AND F = 0 AND A(1) = 0 THEN F = 1
3093 IF D$ = "X" AND K(1) = 9 AND K(2) = 1 AND F = 0 AND A(3) = 0 THEN F = 3
3094 IF D$ = "X" AND K(1) = 7 AND K(2) = 3 AND F = 0 AND A(1) = 0 THEN F = 1
3095 IF D$ = "X" AND K(1) = 1 AND K(2) = 9 AND K(3) = 3 AND K(4) = 2 AND F = 0 AND A(7) = 0 THEN F = 7
3096 IF D$ = "X" AND K(1) = 3 AND K(2) = 7 AND K(3) = 1 AND K(4) = 2 AND F = 0 AND A(9) = 0 THEN F = 9
3097 IF D$ = "X" AND K(1) = 9 AND K(2) = 1 AND K(3) = 3 AND K(4) = 6 AND F = 0 AND A(7) = 0 THEN F = 7
3098 IF D$ = "X" AND K(1) = 7 AND K(2) = 3 AND K(3) = 1 AND K(4) = 4 AND F = 0 AND A(9) = 0 THEN F = 9
3099 IF D$ = "X" AND K(1) = 1 AND (K(2) = 2 OR K(2) = 4) AND F = 0 AND A(5) = 0 THEN F = 5
3100 IF D$ = "X" AND K(1) = 3 AND (K(2) = 2 OR K(2) = 6) AND F = 0 AND A(5) = 0 THEN F = 5
3101 IF D$ = "X" AND K(1) = 7 AND (K(2) = 4 OR K(2) = 8) AND F = 0 AND A(5) = 0 THEN F = 5
3102 IF D$ = "X" AND K(1) = 9 AND (K(2) = 6 OR K(2) = 8) AND F = 0 AND A(5) = 0 THEN F = 5
3103 IF D$ = "X" AND K(1) = 1 AND K(2) = 2 AND K(3) = 5 AND K(4) = 9 AND F = 0 AND A(7) = 0 THEN F = 7
3104 IF D$ = "X" AND K(1) = 1 AND K(2) = 4 AND K(3) = 5 AND K(4) = 9 AND F = 0 AND A(3) = 0 THEN F = 3
3105 IF D$ = "X" AND K(1) = 3 AND K(2) = 2 AND K(3) = 5 AND K(4) = 7 AND F = 0 AND A(9) = 0 THEN F = 9
3106 IF D$ = "X" AND K(1) = 3 AND K(2) = 6 AND K(3) = 5 AND K(4) = 7 AND F = 0 AND A(1) = 0 THEN F = 1
3107 IF D$ = "X" AND K(1) = 7 AND K(2) = 4 AND K(3) = 5 AND K(4) = 3 AND F = 0 AND A(1) = 0 THEN F = 9
3108 IF D$ = "X" AND K(1) = 7 AND K(2) = 8 AND K(3) = 5 AND K(4) = 3 AND F = 0 AND A(9) = 0 THEN F = 1
3109 IF D$ = "X" AND K(1) = 9 AND K(2) = 6 AND K(3) = 5 AND K(4) = 1 AND F = 0 AND A(7) = 0 THEN F = 7
3110 IF D$ = "X" AND K(1) = 9 AND K(2) = 8 AND K(3) = 5 AND K(4) = 1 AND F = 0 AND A(3) = 0 THEN F = 3
3111 IF D$ = "X" AND K(1) = 1 AND (K(2) = 3 OR K(2) = 7) AND F = 0 AND A(9) = 0 THEN F = 9
3112 IF D$ = "X" AND K(1) = 3 AND (K(2) = 1 OR K(2) = 9) AND F = 0 AND A(7) = 0 THEN F = 7
3113 IF D$ = "X" AND K(1) = 7 AND (K(2) = 1 OR K(2) = 9) AND F = 0 AND A(3) = 0 THEN F = 3
3114 IF D$ = "X" AND K(1) = 9 AND (K(2) = 3 OR K(2) = 7) AND F = 0 AND A(1) = 0 THEN F = 1
3115 IF D$ = "X" AND K(1) = 1 AND K(2) = 3 AND K(3) = 9 AND K(4) = 5 AND F = 0 AND A(7) = 0 THEN F = 7
3116 IF D$ = "X" AND K(1) = 1 AND K(2) = 7 AND K(3) = 9 AND K(4) = 5 AND F = 0 AND A(3) = 0 THEN F = 3
3117 IF D$ = "X" AND K(1) = 3 AND K(2) = 1 AND K(3) = 7 AND K(4) = 5 AND F = 0 AND A(9) = 0 THEN F = 9
3118 IF D$ = "X" AND K(1) = 3 AND K(2) = 9 AND K(3) = 7 AND K(4) = 5 AND F = 0 AND A(1) = 0 THEN F = 1
3119 IF D$ = "X" AND K(1) = 7 AND K(2) = 1 AND K(3) = 3 AND K(4) = 5 AND F = 0 AND A(9) = 0 THEN F = 9
3120 IF D$ = "X" AND K(1) = 7 AND K(2) = 9 AND K(3) = 3 AND K(4) = 5 AND F = 0 AND A(1) = 0 THEN F = 1
3121 IF D$ = "X" AND K(1) = 9 AND K(2) = 3 AND K(3) = 1 AND K(4) = 5 AND F = 0 AND A(7) = 0 THEN F = 7
3122 IF D$ = "X" AND K(1) = 9 AND K(2) = 7 AND K(3) = 1 AND K(4) = 5 AND F = 0 AND A(3) = 0 THEN F = 3
3123 IF D$ = "X" AND K(1) = 1 AND (K(2) = 6 OR K(2) = 8) AND F = 0 AND A(5) = 0 THEN F = 5
3124 IF D$ = "X" AND K(1) = 3 AND (K(2) = 4 OR K(2) = 8) AND F = 0 AND A(5) = 0 THEN F = 5
3125 IF D$ = "X" AND K(1) = 7 AND (K(2) = 2 OR K(2) = 6) AND F = 0 AND A(5) = 0 THEN F = 5
3126 IF D$ = "X" AND K(1) = 9 AND (K(2) = 2 OR K(2) = 4) AND F = 0 AND A(5) = 0 THEN F = 5
3127 IF D$ = "X" AND K(1) = 1 AND K(2) = 6 AND K(3) = 5 AND K(4) = 9 AND F = 0 AND A(3) = 0 THEN F = 3
3128 IF D$ = "X" AND K(1) = 1 AND K(2) = 8 AND K(3) = 5 AND K(4) = 9 AND F = 0 AND A(7) = 0 THEN F = 7
3129 IF D$ = "X" AND K(1) = 3 AND K(2) = 4 AND K(3) = 5 AND K(4) = 7 AND F = 0 AND A(1) = 0 THEN F = 1
3130 IF D$ = "X" AND K(1) = 3 AND K(2) = 8 AND K(3) = 5 AND K(4) = 7 AND F = 0 AND A(9) = 0 THEN F = 9
3131 IF D$ = "X" AND K(1) = 7 AND K(2) = 2 AND K(3) = 5 AND K(4) = 3 AND F = 0 AND A(1) = 0 THEN F = 1
3132 IF D$ = "X" AND K(1) = 7 AND K(2) = 6 AND K(3) = 5 AND K(4) = 3 AND F = 0 AND A(9) = 0 THEN F = 9
3133 IF D$ = "X" AND K(1) = 9 AND K(2) = 2 AND K(3) = 5 AND K(4) = 1 AND F = 0 AND A(3) = 0 THEN F = 3
3134 IF D$ = "X" AND K(1) = 9 AND K(2) = 4 AND K(3) = 5 AND K(4) = 1 AND F = 0 AND A(7) = 0 THEN F = 7
3420 IF F = 0 THEN
3430 F = INT(9 * RND) + 1
3440 IF A(F) <> 0 THEN 3430
3450 END IF
3460 IF F < 4 THEN G = F * 150 - 40: H = 310
3470 IF F > 3 AND F < 7 THEN G = (F - 3) * 150 - 40: H = 160
3480 IF F > 6 THEN G = (F - 6) * 150 - 40: H = 10
3490 GOSUB 5000
3500 RETURN
4000 PRINT CHR$(11); "O'S TURN    "
4002 F = 0
4005 IF ((A(2) = 2 AND A(3) = 2) OR (A(5) = 2 AND A(9) = 2) OR (A(4) = 2 AND A(7) = 2)) AND A(1) = 0 AND F = 0 THEN F = 1
4010 IF ((A(1) = 2 AND A(3) = 2) OR (A(5) = 2 AND A(8) = 2)) AND A(2) = 0 AND F = 0 THEN F = 2
4015 IF ((A(1) = 2 AND A(2) = 2) OR (A(5) = 2 AND A(7) = 2) OR (A(6) = 2 AND A(9) = 2)) AND A(3) = 0 AND F = 0 THEN F = 3
4020 IF ((A(1) = 2 AND A(7) = 2) OR (A(5) = 2 AND A(6) = 2)) AND A(4) = 0 AND F = 0 THEN F = 4
4025 IF ((A(1) = 2 AND A(9) = 2) OR (A(2) = 2 AND A(8) = 2) OR (A(3) = 2 AND A(7) = 2) OR (A(4) = 2 AND A(6) = 2)) AND A(5) = 0 AND F = 0 THEN F = 5
4030 IF ((A(3) = 2 AND A(9) = 2) OR (A(4) = 2 AND A(5) = 2)) AND A(6) = 0 AND F = 0 THEN F = 6
4035 IF ((A(1) = 2 AND A(4) = 2) OR (A(3) = 2 AND A(5) = 2) OR (A(8) = 2 AND A(9) = 2)) AND A(7) = 0 AND F = 0 THEN F = 7
4040 IF ((A(2) = 2 AND A(5) = 2) OR (A(7) = 2 AND A(9) = 2)) AND A(8) = 0 AND F = 0 THEN F = 8
4045 IF ((A(1) = 2 AND A(5) = 2) OR (A(3) = 2 AND A(6) = 2) OR (A(7) = 2 AND A(8) = 2)) AND A(9) = 0 AND F = 0 THEN F = 9
4050 IF ((A(2) = 1 AND A(3) = 1) OR (A(5) = 1 AND A(9) = 1) OR (A(4) = 1 AND A(7) = 1)) AND A(1) = 0 AND F = 0 THEN F = 1
4055 IF ((A(1) = 1 AND A(3) = 1) OR (A(5) = 1 AND A(8) = 1)) AND A(2) = 0 AND F = 0 THEN F = 2
4060 IF ((A(1) = 1 AND A(2) = 1) OR (A(5) = 1 AND A(7) = 1) OR (A(6) = 1 AND A(9) = 1)) AND A(3) = 0 AND F = 0 THEN F = 3
4065 IF ((A(1) = 1 AND A(7) = 1) OR (A(5) = 1 AND A(6) = 1)) AND A(4) = 0 AND F = 0 THEN F = 4
4070 IF ((A(1) = 1 AND A(9) = 1) OR (A(2) = 1 AND A(8) = 1) OR (A(3) = 1 AND A(7) = 1) OR (A(4) = 1 AND A(6) = 1)) AND A(5) = 0 AND F = 0 THEN F = 5
4075 IF ((A(3) = 1 AND A(9) = 1) OR (A(4) = 1 AND A(5) = 1)) AND A(6) = 0 AND F = 0 THEN F = 6
4080 IF ((A(1) = 1 AND A(4) = 1) OR (A(3) = 1 AND A(5) = 1) OR (A(8) = 1 AND A(9) = 1)) AND A(7) = 0 AND F = 0 THEN F = 7
4085 IF ((A(2) = 1 AND A(5) = 1) OR (A(7) = 1 AND A(9) = 1)) AND A(8) = 0 AND F = 0 THEN F = 8
4090 IF ((A(1) = 1 AND A(5) = 1) OR (A(3) = 1 AND A(6) = 1) OR (A(7) = 1 AND A(8) = 1)) AND A(9) = 0 AND F = 0 THEN F = 9
4100 IF F = 0 THEN
4105 F = INT(9 * RND) + 1
4110 IF A(F) <> 0 THEN 4105
4115 END IF
4460 IF F < 4 THEN G = F * 150 - 40: H = 310
4470 IF F > 3 AND F < 7 THEN G = (F - 3) * 150 - 40: H = 160
4480 IF F > 6 THEN G = (F - 6) * 150 - 40: H = 10
4490 GOSUB 6000
4500 RETURN
5000 FOR GG = G - 10 TO G + 10 STEP 2
5005 LINE (GG, H)-(GG + 140, H + 140), INT(10 * RND) + 1
5010 LINE (GG + 140, H)-(GG, H + 140), INT(10 * RND) + 1
5011 SOUND (GG - G + 11) * 30 + 50, .1
5012 NEXT GG
5015 A(F) = 1: K(J) = F
5020 RETURN
6000 FOR GG = G - 10 TO G + 10 STEP 2
6005 LINE (GG + 10, H + GG - G + 10)-(GG + 130, H + GG - G + 10), INT(10 * RND) + 1
6010 LINE (GG + 10, H + GG - G + 130)-(GG + 130, H + GG - G + 130), INT(10 * RND) + 1
6020 LINE (GG + 130, H + GG - G + 10)-(GG + 130, H + GG - G + 130), INT(10 * RND) + 1
6030 LINE (GG + 10, H + GG - G + 10)-(GG + 10, H + GG - G + 130), INT(10 * RND) + 1
6031 SOUND (GG - G + 11) * 30 + 50, .1
6032 NEXT GG
6035 A(F) = 2: K(J) = F
6040 RETURN
7000 BB = 0
7008 FOR B = 1 TO 2
7009 IF A(1) = B AND A(2) = B AND A(3) = B THEN I = B: LINE (105, 380)-(555, 380), 13
7010 IF A(4) = B AND A(5) = B AND A(6) = B THEN I = B: LINE (105, 230)-(555, 230), 13
7015 IF A(7) = B AND A(8) = B AND A(9) = B THEN I = B: LINE (105, 80)-(555, 80), 13
7020 IF A(1) = B AND A(4) = B AND A(7) = B THEN I = B: LINE (180, 5)-(180, 455), 13
7025 IF A(2) = B AND A(5) = B AND A(8) = B THEN I = B: LINE (330, 5)-(330, 455), 13
7030 IF A(3) = B AND A(6) = B AND A(9) = B THEN I = B: LINE (480, 5)-(480, 455), 13
7035 IF A(1) = B AND A(5) = B AND A(9) = B THEN I = B: LINE (555, 5)-(105, 455), 13
7040 IF A(3) = B AND A(5) = B AND A(7) = B THEN I = B: LINE (105, 5)-(555, 455), 13
7050 NEXT B
7060 IF I = 1 THEN PRINT "X WINS": SOUND 523, 10: GOTO 7200
7070 IF I = 2 THEN PRINT "O WINS": SOUND 523, 10: GOTO 7200
7071 FOR B = 1 TO 9
7072 IF A(B) <> 0 THEN BB = BB + 1
7073 NEXT B
7074 IF BB = 9 THEN PRINT "DRAW": SOUND 262, 10: GOTO 7200
7100 RETURN
7200 FOR B = 1 TO 9
7210 A(B) = 0: K(B) = 0
7220 NEXT B
7230 F = 0
7240 G = 0
7250 H = 0
7260 GOTO 110


