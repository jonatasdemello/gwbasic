5 SCREEN 12: CLS
10 OPEN "KENSETUP.DAT" FOR INPUT AS #1: INPUT #1, PAT$: INPUT #1, PAT$: CLOSE #1
11 DIM A(640), D(5, 2), E(102), f%(10, 20)
12 FOR z% = 80 TO 480
13 IF SDF <> 1 THEN LINE (350 - z%, z%)-(450 + z%, z%), 8
14 z% = z% + z% / 50: IF z% < 321 AND z% > 220 THEN E(z% - 220) = 1
15 NEXT z%
16 LINE (270, 80)-(530, 80), 15
17 LINE (270, 80)-(0, 350), 15
18 LINE (530, 80)-(640, 190), 15
19 LINE (170, 180)-(170, 30), 15
20 LINE -(100, 100), 15
21 LINE -(100, 250), 15
22 LINE (170, 160)-(150, 160), 15
23 LINE -(150, 140), 15
24 LINE -(130, 140), 15
25 LINE -(130, 120), 15
26 LINE -(110, 120), 15
27 LINE -(110, 100), 15
28 LINE -(100, 100), 15
29 PAINT (110, 200), 13, 15
30 PAINT (160, 50), 4, 15
31 LINE (101, 229)-(170, 160), 0
32 LINE (101, 209)-(150, 160), 0
33 LINE (101, 189)-(150, 140), 0
34 LINE (101, 169)-(130, 140), 0
35 LINE (101, 149)-(130, 120), 0
36 LINE (101, 129)-(110, 120), 0
37 LINE (101, 109)-(110, 100), 0
40 PAINT (5, 5), 12, 15
41 LINE (270, 80)-(270, 0), 15
42 LINE (530, 80)-(530, 0), 15
43 LINE (230, 220)-(230, 290), 6
44 LINE -(220, 300), 6
45 LINE -(200, 300), 6
46 LINE -(200, 200), 6
47 LINE -(300, 100), 6
48 LINE -(500, 100), 6
49 LINE -(500, 200), 6
50 LINE -(490, 210), 6
55 LINE -(470, 210), 6
60 LINE -(470, 160), 6
65 LINE -(410, 220), 6
70 LINE -(410, 290), 6
75 LINE -(400, 300), 6
80 LINE -(380, 300), 6
85 LINE -(380, 220), 6
90 LINE -(230, 220), 6
91 PAINT (250, 180), 6, 6
92 LINE (220, 300)-(220, 221), 0
93 LINE -(230, 221), 0
94 LINE (200, 200)-(400, 200), 0
95 LINE -(400, 300), 0
96 LINE (400, 200)-(500, 100), 0
97 LINE (490, 210)-(490, 141), 0
98 LINE -(470, 161), 0
99 GOSUB 800
100 GOSUB 14000
104 LINE (200, 200)-(400, 200), 2
108 CIRCLE (300, 200), 100, 2, 0, 3.14159, 1 / 4
109 PAINT (290, 199), 2, 2
110 FOR z% = 1 TO 1500
111 zz% = INT(200 * RND) + 200: zzz% = INT(50 * RND) + 150
112 IF POINT(zz%, zzz%) = 2 THEN LINE (zz%, zzz%)-(zz%, zzz% + 1), 10
113 ZX = ZX + 1: IF ZX = 10 AND ZXX < 60 THEN ZX = 0: ZXX = ZXX + 1: SOUND 1000 * RND + 2200, .2
119 NEXT z%
125 FOR C = 1 TO 8000
130 B = 100 * RND
135 B = SQR(B) * 10
136 BB = INT(2 * RND) + 1
137 IF BB = 1 THEN B = 199 - B
140 B = B + 200
150 A(B) = A(B) + 2
160 IF A(B) < 101 THEN LINE (B, A(B) + 200 - 1)-(B, A(B) + 200), INT(2 * RND) * 8 + 2, BF
162 IF A(B) > 100 THEN CIRCLE (B, 300), (A(B) - 100) / 4, INT(2 * RND) * 8 + 2, 0, 2 * 3.14159, 1 / 3
166 CD = INT(20 * RND) + 1
167 IF CD = 5 OR CDC > 0 THEN CDC = CDC + 1
168 IF CDC > 0 THEN SOUND INT(100 * RND) + 100, .05
169 IF CDC > 2 THEN CDC = 0
170 NEXT C
180 GOSUB 500
200 GOSUB 3000
210 GOSUB 10000
220 GOSUB 12000
390 CLEAR : SDF = 1: GOTO 10
500 LINE (50, 250)-(70, 250), 8
510 LINE -(70, 255), 8
520 LINE -(60, 255), 8
530 LINE -(55, 265), 8
540 LINE -(50, 265), 8
550 LINE -(50, 250), 8
559 PAINT (60, 252), 8, 8
560 SOUND 262, 10: FOR z% = 1 TO 3000: NEXT z%
561 FOR z% = 70 TO 300
562 zz% = POINT(z%, 252): zzz% = POINT(z% + 1, 252)
563 LINE (z%, 252)-(z% + 1, 252), 15
564 SOUND z%, .1
565 LINE (z%, 252)-(z%, 252), zz%
566 LINE (z% + 1, 252)-(z% + 1, 252), zzz%
567 NEXT z%
568 FOR z% = 50 TO 350 STEP 50
569 SOUND z%, .5
570 NEXT z%
628 LINE (100, 0)-(400, 150), 14
629 LINE -(450, 0), 14
630 LINE (400, 150)-(450, 200), 14
640 LINE -(500, 200), 14
650 LINE -(640, 100), 14
660 LINE (500, 200)-(500, 480), 14
670 LINE (450, 200)-(300, 300), 14
680 LINE -(400, 480), 14
690 LINE (300, 300)-(250, 350), 14
700 LINE -(50, 480), 14
710 LINE (250, 350)-(0, 250), 14
720 FOR z% = 1 TO 50
730 SOUND 1000 * RND + 2000, z% / 100
740 NEXT z%
745 LINE (50, 250)-(70, 265), 12, BF
757 FOR z% = 1 TO 5000: NEXT z%
750 RETURN

800 OPEN PAT$ + "MAP.DAT" FOR INPUT AS #1
801 XXX = .2: YYY = .2: XXXX = 250: YYYY = 200
802 XXXX = 280: YYYY = 0
807 FOR W = 1 TO 422
808 INPUT #1, x%, y%, z%
810 IF z% = 0 THEN
820 INPUT #1, XX, YY, zz%
830 LINE (x% * XXX + XXXX, y% * YYY + YYYY)-(XX * XXX + XXXX, YY * YYY + YYYY), 15
840 END IF
850 IF z% = 1 THEN LINE -(x% * XXX + XXXX, y% * YYY + YYYY), 15
860 NEXT W
870 FOR W = 1 TO 63
880 INPUT #1, x%, y%, z%
890 PAINT (x% * XXX + XXXX, y% * YYY + YYYY), z%, 15
900 NEXT W
905 CLOSE #1
910 RETURN

3000 LINE (50, 40)-(70, 40), 8
3010 LINE -(70, 45), 8
3020 LINE -(60, 45), 8
3030 LINE -(55, 55), 8
3040 LINE -(50, 55), 8
3050 LINE -(50, 40), 8
3060 PAINT (60, 42), 8, 8
3560 SOUND 262, 10: FOR z% = 1 TO 3000: NEXT z%
3561 FOR z% = 70 TO 350
3562 zz% = POINT(z%, 42): zzz% = POINT(z% + 1, 42)
3563 LINE (z%, 42)-(z% + 1, 42), 15
3564 SOUND z%, .1
3565 LINE (z%, 42)-(z%, 42), zz%
3566 LINE (z% + 1, 42)-(z% + 1, 42), zzz%
3567 NEXT z%
3570 FOR z = 1 TO 10 STEP .05
3580 CIRCLE (350, 42), z, 0
3590 SOUND INT(50 * RND) + 50, .1
3600 NEXT z
3768 PAINT (60, 42), 12, 12
3700 SOUND 60, 1: LINE (280, 0)-(400, 79), 12, BF
3710 RETURN
                           
10000 FOR z% = 1 TO 5000: NEXT z%
10010 x% = 281: y% = 116: XX = 2: YY = 2: z% = 1: zz% = 10: GOSUB 10400
10020 FOR z% = 110 TO 660 STEP 5
10030 SOUND z%, .1
10040 NEXT z%
10050 FOR z% = 660 TO 65 STEP -8
10060 SOUND z%, .1
10070 NEXT z%
10080 FOR z% = 318 TO 221 STEP -1
10090 LINE (231, z%)-(379, z%), 0
10100 IF E(z% - 221) = 1 THEN LINE (231, z%)-(379, z%), 8
10110 LINE (450, 200)-(300, 300), 14
10120 LINE -(400, 480), 14
10130 LINE (300, 300)-(250, 350), 14
10140 IF z% < 280 THEN LINE (221, z%)-(230, z%), 6
10150 IF z% < 280 THEN LINE (200, z%)-(219, z%), 6
10160 IF z% < 280 THEN LINE (380, z%)-(399, z%), 6
10170 IF z% < 280 THEN LINE (401, z%)-(410, z%), 6
10180 IF z% < 280 THEN LINE (220, z%)-(220, z%), 0
10190 IF z% < 280 THEN LINE (400, z%)-(400, z%), 0
10200 IF z% = 221 THEN LINE (221, z%)-(230, z%), 0
10210 SOUND INT(100 * RND) + 50, .3
10220 FOR zz% = 1 TO 1000: NEXT zz%
10230 NEXT z%
10240 FOR z% = 220 TO 200 STEP -1
10250 IF z% > 200 THEN LINE (200, z%)-(399, z%), 6
10260 IF z% = 200 THEN LINE (200, z%)-(400, z%), 0
10270 SOUND INT(100 * RND) + 50, .3
10280 FOR zz% = 1 TO 1000: NEXT zz%
10290 NEXT z%
10300 FOR z% = 199 TO 175 STEP -1
10310 LINE (400 - z%, z%)-(599 - z%, z%), 6
10320 IF z% > 185 THEN LINE (395 - z%, z%)-(399 - z%, z%), 0
10330 IF z% = 195 OR z% = 190 THEN LINE (395 - z%, z%)-(399 - z%, z%), 8
10340 SOUND INT(100 * RND) + 50, .3
10350 FOR zz% = 1 TO 1000: NEXT zz%
10360 NEXT z%
10365 x% = 281: y% = 116
10375 FOR XX = 2 TO 2.5 STEP .5
10370 FOR z% = 1 TO 5000: NEXT z%
10380 YY = XX: z% = 0: zz% = 0: GOSUB 10400
10384 x% = x% - 2: y% = y% + 6
10386 YY = XX: z% = 1: zz% = 10: GOSUB 10400
10387 SOUND 62, 1
10388 NEXT XX
10398 RETURN


10400 LINE (x% + 17 * XX, y% + 27 * YY)-(x% + 16 * XX, y% + 26 * YY), z% * 15
10410 LINE -(x% + 15 * XX, y% + 24 * YY), z% * 15
10420 LINE -(x% + 15 * XX, y% + 19 * YY), z% * 15
10430 LINE -(x% + 17 * XX, y% + 23 * YY), z% * 15
10440 LINE -(x% + 16.5 * XX, y% + 24 * YY), z% * 15
10450 LINE -(x% + 16.5 * XX, y% + 25 * YY), z% * 15
10460 LINE -(x% + 17 * XX, y% + 26 * YY), z% * 15
10470 LINE -(x% + 17 * XX, y% + 29 * YY), z% * 15
10480 LINE -(x% + 21 * XX, y% + 29 * YY), z% * 15
10490 LINE -(x% + 21 * XX, y% + 27 * YY), z% * 15
10500 LINE -(x% + 20 * XX, y% + 24 * YY), z% * 15
10510 LINE -(x% + 20 * XX, y% + 23 * YY), z% * 15
10520 LINE -(x% + 21 * XX, y% + 20 * YY), z% * 15
10530 LINE -(x% + 21 * XX, y% + 19 * YY), z% * 15
10540 LINE -(x% + 19 * XX, y% + 16 * YY), z% * 15
10550 LINE -(x% + 16 * XX, y% + 15 * YY), z% * 15
10560 LINE -(x% + 16 * XX, y% + 11 * YY), z% * 15
10570 LINE -(x% + 18 * XX, y% + 8 * YY), z% * 15
10580 LINE -(x% + 25 * XX, y% + 8 * YY), z% * 15
10590 LINE -(x% + 26 * XX, y% + 7 * YY), z% * 15
10600 LINE -(x% + 25 * XX, y% + 3 * YY), z% * 15
10610 LINE -(x% + 25 * XX, y% + 1 * YY), z% * 15
10620 LINE -(x% + 23 * XX, y% + 1 * YY), z% * 15
10630 LINE -(x% + 23 * XX, y% + 6 * YY), z% * 15
10640 LINE -(x% + 21 * XX, y% + 6 * YY), z% * 15
10650 LINE -(x% + 19 * XX, y% + 5 * YY), z% * 15
10660 LINE -(x% + 17 * XX, y% + 3 * YY), z% * 15
10670 LINE -(x% + 15 * XX, y% + 3 * YY), z% * 15
10680 LINE -(x% + 16 * XX, y% + 2 * YY), z% * 15
10690 LINE -(x% + 15 * XX, y% + 2 * YY), z% * 15
10700 LINE -(x% + 15 * XX, y% + 1 * YY), z% * 15
10710 LINE -(x% + 14 * XX, y% + 0 * YY), z% * 15
10720 LINE -(x% + 12 * XX, y% + 0 * YY), z% * 15
10730 LINE -(x% + 11 * XX, y% + 1 * YY), z% * 15
10740 LINE -(x% + 11 * XX, y% + 2 * YY), z% * 15
10750 LINE -(x% + 10 * XX, y% + 2 * YY), z% * 15
10760 LINE -(x% + 11 * XX, y% + 3 * YY), z% * 15
10770 LINE -(x% + 9 * XX, y% + 3 * YY), z% * 15
10780 LINE -(x% + 7 * XX, y% + 5 * YY), z% * 15
10790 LINE -(x% + 5 * XX, y% + 6 * YY), z% * 15
10800 LINE -(x% + 3 * XX, y% + 6 * YY), z% * 15
10810 LINE -(x% + 3 * XX, y% + 1 * YY), z% * 15
10820 LINE -(x% + 1 * XX, y% + 1 * YY), z% * 15
10830 LINE -(x% + 1 * XX, y% + 3 * YY), z% * 15
10840 LINE -(x% + 0 * XX, y% + 7 * YY), z% * 15
10850 LINE -(x% + 1 * XX, y% + 8 * YY), z% * 15
10860 LINE -(x% + 8 * XX, y% + 8 * YY), z% * 15
10870 LINE -(x% + 10 * XX, y% + 11 * YY), z% * 15
10880 LINE -(x% + 10 * XX, y% + 15 * YY), z% * 15
10890 LINE -(x% + 7 * XX, y% + 16 * YY), z% * 15
10900 LINE -(x% + 5 * XX, y% + 19 * YY), z% * 15
10910 LINE -(x% + 5 * XX, y% + 20 * YY), z% * 15
10920 LINE -(x% + 6 * XX, y% + 23 * YY), z% * 15
10930 LINE -(x% + 6 * XX, y% + 24 * YY), z% * 15
10940 LINE -(x% + 5 * XX, y% + 27 * YY), z% * 15
10950 LINE -(x% + 5 * XX, y% + 29 * YY), z% * 15
10960 LINE -(x% + 9 * XX, y% + 29 * YY), z% * 15
10970 LINE -(x% + 9 * XX, y% + 26 * YY), z% * 15
10980 LINE -(x% + 9.5 * XX, y% + 25 * YY), z% * 15
10990 LINE -(x% + 9.5 * XX, y% + 24 * YY), z% * 15
11000 LINE -(x% + 9 * XX, y% + 23 * YY), z% * 15
11010 LINE -(x% + 10 * XX, y% + 21 * YY), z% * 15
11020 LINE -(x% + 12 * XX, y% + 26 * YY), z% * 15
11030 LINE -(x% + 15 * XX, y% + 28 * YY), z% * 15
11040 LINE -(x% + 17 * XX, y% + 28 * YY), z% * 15
11050 PAINT (x% + 13 * XX, y% + 17 * YY), z% * zz%, z% * 15
11060 LINE (x% + 10 * XX, y% + 21 * YY)-(x% + 11 * XX, y% + 19 * YY), z% * 15
11070 LINE -(x% + 12.5 * XX, y% + 20 * YY), z% * 15
11080 LINE -(x% + 13.5 * XX, y% + 20 * YY), z% * 15
11090 LINE -(x% + 15 * XX, y% + 19 * YY), z% * 15
11100 LINE (x% + 6 * XX, y% + 27 * YY)-(x% + 6 * XX, y% + 29 * YY), z% * 8
11110 LINE (x% + 7 * XX, y% + 27 * YY)-(x% + 7 * XX, y% + 29 * YY), z% * 8
11120 LINE (x% + 8 * XX, y% + 27 * YY)-(x% + 8 * XX, y% + 29 * YY), z% * 8
11130 LINE (x% + 18 * XX, y% + 27 * YY)-(x% + 18 * XX, y% + 29 * YY), z% * 8
11140 LINE (x% + 19 * XX, y% + 27 * YY)-(x% + 19 * XX, y% + 29 * YY), z% * 8
11150 LINE (x% + 20 * XX, y% + 27 * YY)-(x% + 20 * XX, y% + 29 * YY), z% * 8
11160 LINE (x% + 10 * XX, y% + 11 * YY)-(x% + 16 * XX, y% + 15 * YY), z% * 15, B
11170 PAINT (x% + 13 * XX, y% + 13 * YY), z% * 7, z% * 15
11180 LINE (x% + 1.5 * XX, y% + 1 * YY)-(x% + 1.5 * XX, y% + 3 * YY), z% * 8
11190 LINE (x% + 2 * XX, y% + 1 * YY)-(x% + 2 * XX, y% + 3 * YY), z% * 8
11200 LINE (x% + 2.5 * XX, y% + 1 * YY)-(x% + 2.5 * XX, y% + 3 * YY), z% * 8
11210 LINE (x% + 23.5 * XX, y% + 1 * YY)-(x% + 23.5 * XX, y% + 3 * YY), z% * 8
11220 LINE (x% + 24 * XX, y% + 1 * YY)-(x% + 24 * XX, y% + 3 * YY), z% * 8
11230 LINE (x% + 24.5 * XX, y% + 1 * YY)-(x% + 24.5 * XX, y% + 3 * YY), z% * 8
11240 LINE (x% + 9 * XX, y% + 6 * YY)-(x% + 11.5 * XX, y% + 3.5 * YY), z% * 8
11250 LINE -(x% + 13 * XX, y% + 5 * YY), z% * 8
11260 LINE -(x% + 14.5 * XX, y% + 3.5 * YY), z% * 8
11270 LINE -(x% + 17 * XX, y% + 6 * YY), z% * 8
11280 LINE -(x% + 15 * XX, y% + 5 * YY), z% * 8
11290 LINE -(x% + 14 * XX, y% + 5 * YY), z% * 8
11300 LINE -(x% + 14 * XX, y% + 6 * YY), z% * 8
11310 LINE -(x% + 15 * XX, y% + 5 * YY), z% * 8
11320 LINE -(x% + 11 * XX, y% + 5 * YY), z% * 8
11330 LINE -(x% + 12 * XX, y% + 6 * YY), z% * 8
11340 LINE -(x% + 12 * XX, y% + 5 * YY), z% * 8
11350 LINE -(x% + 11 * XX, y% + 5 * YY), z% * 8
11360 LINE -(x% + 9 * XX, y% + 6 * YY), z% * 8
11370 LINE (x% + 10 * XX, y% + 3 * YY)-(x% + 9 * XX, y% + 5 * YY), z% * 8
11380 LINE -(x% + 9 * XX, y% + 6 * YY), z% * 8
11390 LINE -(x% + 13 * XX, y% + 8 * YY), z% * 8
11400 LINE -(x% + 17 * XX, y% + 6 * YY), z% * 8
11410 LINE -(x% + 17 * XX, y% + 5 * YY), z% * 8
11420 LINE -(x% + 16 * XX, y% + 3 * YY), z% * 8
11430 LINE (x% + 11 * XX, y% + 2 * YY)-(x% + 15 * XX, y% + 2 * YY), z% * 8
11440 LINE (x% + 11 * XX, y% + 1 * YY)-(x% + 13 * XX, y% + 2 * YY), z% * 8
11450 LINE -(x% + 15 * XX, y% + 1 * YY), z% * 8
11460 CIRCLE (x% + 12 * XX, y% + 2.5 * YY), (ABS(XX) + ABS(YY)) / 2 * .5, z% * 15
11470 CIRCLE (x% + 14 * XX, y% + 2.5 * YY), (ABS(XX) + ABS(YY)) / 2 * .5, z% * 15
11480 PAINT (x% + 12 * XX, y% + 2.5 * YY), z% * 12, z% * 15
11490 PAINT (x% + 14 * XX, y% + 2.5 * YY), z% * 12, z% * 15
11500 RETURN

12000 z% = 99: zz% = 0
12002 IF POINT(z% + 1, zz% + 1) = 14 THEN z% = z% + 1: zz% = zz% + 1: GOTO 12020
12004 IF POINT(z% + 1, zz%) = 14 THEN z% = z% + 1: GOTO 12020
12006 IF POINT(z% + 1, zz% - 1) = 14 THEN z% = z% + 1: zz% = zz% - 1: GOTO 12020
12008 IF POINT(z%, zz% + 1) = 14 THEN zz% = zz% + 1: GOTO 12020
12012 IF POINT(z%, zz% - 1) = 14 THEN zz% = zz% - 1: GOTO 12020
12014 IF POINT(z% - 1, zz% + 1) = 14 THEN z% = z% - 1: zz% = zz% + 1: GOTO 12020
12016 IF POINT(z% - 1, zz%) = 14 THEN z% = z% - 1: GOTO 12020
12018 IF POINT(z% - 1, zz% - 1) = 14 THEN z% = z% - 1: zz% = zz% - 1: GOTO 12020
12020 x% = POINT(z% - 1, zz%)
12040 IF z% = 167 AND zz% = 34 THEN x% = 4
12050 IF z% = 168 AND zz% = 34 THEN x% = 4
12060 IF z% = 170 AND zz% = 35 THEN x% = 15
12070 IF z% = 171 AND zz% = 36 THEN x% = 12
12080 IF z% = 172 AND zz% = 36 THEN x% = 12
12090 IF z% = 267 AND zz% = 84 THEN x% = 0
12100 IF z% = 268 AND zz% = 84 THEN x% = 0
12110 IF z% = 300 AND zz% = 100 THEN x% = 6
12120 IF z% = 425 AND zz% = 175 THEN x% = 0
12130 IF DFX = 1 AND z% > 469 AND z% < 490 AND zz% = 200 THEN x% = 6
12140 IF DFX = 1 AND z% = 490 AND zz% = 200 THEN x% = 0
12150 IF DFX = 1 AND z% > 490 AND z% < 501 AND zz% = 200 THEN x% = 6
12160 IF DFX = 1 AND z% = 501 AND zz% = 199 THEN x% = 0
12165 IF z% = 500 AND zz% = 201 THEN x% = 0
12170 IF z% = 450 AND zz% = 0 THEN x% = 12
12180 IF z% = 400 AND zz% = 233 THEN x% = 0
12190 IF z% = 401 AND zz% = 232 THEN x% = 6
12200 IF z% = 402 AND zz% = 232 THEN x% = 6
12210 IF z% = 380 AND zz% = 246 THEN x% = 6
12220 IF z% = 381 AND zz% = 246 THEN x% = 6
12230 IF z% = 71 AND zz% = 279 THEN x% = 15
12240 IF z% = 72 AND zz% = 279 THEN x% = 0
12250 IF z% = 73 AND zz% = 279 THEN x% = 0
12260 IF z% = 0 AND zz% = 250 THEN x% = 12
12270 IF z% = 588 AND zz% = 137 THEN x% = 12
12324 LINE (z%, zz%)-(z%, zz%), x%
12325 IF z% = 500 AND zz% = 479 THEN z% = 450: zz% = -1
12326 IF z% = 401 AND zz% = 149 THEN z% = 0: zz% = 249: DFX = 1
12327 IF z% = 399 AND zz% = 479 THEN z% = 51: zz% = 479
12328 IF z% = 248 AND zz% = 351 THEN z% = 300: zz% = 300
12329 IF z% = 639 AND zz% = 101 THEN 12340
12300 SOUND INT(500 * RND) + 100, .03
12335 GOTO 12002
12340 x% = 277: y% = 128: XX = 2.5: YY = 2.5
12350 FOR ZX = 115 TO 200
12356 XDX = 277
12357 IF ZX < 125 THEN XDX = 401 - ZX
12360 LINE (XDX, ZX)-(344, ZX), 0: SOUND 250 - ZX, .1
12370 IF ZX / 5 = INT(ZX / 5) AND ZX > 122 THEN
12380 z% = 0: zz% = 0: GOSUB 10400
12384 YY = YY - .1638: y% = y% + 4.55
12386 z% = 1: zz% = 10: GOSUB 10400
12387 END IF
12388 NEXT ZX
12840 LINE (200, 200)-(200, 200), 6
12850 LINE (400, 200)-(400, 200), 6
12860 PAINT (300, 130), 6, 6
12870 LINE (200, 200)-(400, 200), 0
12880 RETURN

14000 FOR z% = -20 TO 193
14010 x% = x% + 1: IF x% > 20 THEN x% = 1
14020 FOR y% = 1 TO 10
14030 f%(y%, x%) = POINT(y% + 299, z%)
14040 NEXT y%
14050 LINE (300, z%)-(309, z%), 2
14060 XX = x% + 1: IF XX > 20 THEN XX = XX - 20
14061 XXX = x% + 3: IF XXX > 20 THEN XXX = XXX - 20
14062 XXXX = x% + 5: IF XXXX > 20 THEN XXXX = XXXX - 20
14063 XXXXX = x% + 7: IF XXXXX > 20 THEN XXXXX = XXXXX - 20
14070 y% = 1: LINE (y% + 299, z% - 13)-(y% + 299, z% - 13), f%(y%, XXXXX)
14071 y% = 2: LINE (y% + 299, z% - 13)-(y% + 299, z% - 13), f%(y%, XXXXX)
14073 y% = 3: LINE (y% + 299, z% - 15)-(y% + 299, z% - 15), f%(y%, XXXX)
14074 y% = 4: LINE (y% + 299, z% - 17)-(y% + 299, z% - 17), f%(y%, XXX)
14075 y% = 5: LINE (y% + 299, z% - 19)-(y% + 299, z% - 19), f%(y%, XX)
14076 y% = 6: LINE (y% + 299, z% - 19)-(y% + 299, z% - 19), f%(y%, XX)
14077 y% = 7: LINE (y% + 299, z% - 17)-(y% + 299, z% - 17), f%(y%, XXX)
14078 y% = 8: LINE (y% + 299, z% - 15)-(y% + 299, z% - 15), f%(y%, XXXX)
14079 y% = 9: LINE (y% + 299, z% - 13)-(y% + 299, z% - 13), f%(y%, XXXXX)
14080 y% = 10: LINE (y% + 299, z% - 13)-(y% + 299, z% - 13), f%(y%, XXXXX)
14100 SOUND 425 - z% * 2, .2
14110 NEXT z%
14120 RETURN

