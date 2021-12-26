10 SCREEN 12: CLS
11 DIM regs%(7): regs%(0) = 0: CALL int86old(&H33, regs%(), regs%())
15 mousx% = 320: mousy% = 240
20 DIM a%(22, 8), m%(4, 2), mx%(4), mon%(12, 3), q$(125)
25 GOSUB 9000
30 FOR z% = 1 TO 22
40 FOR zz% = 1 TO 8
50 READ a%(z%, zz%)
60 NEXT zz%
70 NEXT z%
80 LINE (40, 40)-(600, 440), 15, B
90 LINE (0, 220)-(40, 220), 15
100 LINE (0, 260)-(40, 260), 15
110 LINE (600, 220)-(639, 220), 15
120 LINE (600, 260)-(639, 260), 15
130 LINE (300, 440)-(300, 480), 15
140 LINE (340, 440)-(340, 480), 15
150 LINE (300, 0)-(300, 40), 15
160 LINE (340, 0)-(340, 40), 15
170 LINE (0, 0)-(39, 219), 6, BF
180 LINE (40, 0)-(299, 39), 6, BF
190 LINE (341, 0)-(639, 39), 6, BF
200 LINE (601, 40)-(639, 219), 6, BF
210 LINE (0, 261)-(39, 479), 6, BF
220 LINE (40, 441)-(299, 479), 6, BF
230 LINE (341, 441)-(639, 479), 6, BF
240 LINE (601, 261)-(639, 440), 6, BF
250 board% = board% + 1: IF board% > 8 THEN 500
260 IF a%(19, board%) = 1 THEN m%(1, 1) = 80: m%(1, 2) = 400: mx%(1) = 0: x% = m%(1, 1): y% = m%(1, 2): col% = 14: GOSUB 2100
270 IF a%(20, board%) = 1 THEN m%(2, 1) = 560: m%(2, 2) = 400: x% = m%(2, 1): y% = m%(2, 2): col% = 14: GOSUB 2200
280 IF a%(21, board%) = 1 THEN m%(3, 1) = 560: m%(3, 2) = 80: mx%(3) = 0: x% = m%(3, 1): y% = m%(3, 2): col% = 14: GOSUB 2300
290 IF a%(22, board%) = 1 THEN m%(4, 1) = 80: m%(4, 2) = 80: x% = m%(4, 1): y% = m%(4, 2): col% = 14: GOSUB 2400
300 GOSUB 6500
310 LOCATE 1, 1: PRINT money% / 100
500 d1% = 3: ya% = 260: z% = 40
510 GOSUB 3000
520 FOR zz% = 1 TO 500: NEXT zz%
530 IF d1% = 3 THEN 510
540 d = 240
550 FOR c = -20 TO 82
560 col% = 14: GOSUB 2000
570 FOR zz% = 1 TO 500: NEXT zz%
580 col% = 0: GOSUB 2000
590 NEXT c
600 col% = 14: GOSUB 2000
610 d1% = 2: ya% = 220: z% = 40
620 GOSUB 3100
630 FOR zz% = 1 TO 500: NEXT zz%
640 IF d1% = 2 THEN 620
650 IF board% > 8 THEN END
660 cc = 1: dd = 0

1000 WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8 'speed fix 12/26/2006
1001 GOSUB mouse
1010 cc = cc + m3% / 100
1020 dd = dd + m4% / 100
1050 col% = 0: GOSUB 2000
1060 c = c + cc: d = d + dd
1070 cc = cc * .995: dd = dd * .995
1110 IF d1% = 1 AND c < 46 AND d > 226 AND d < 254 THEN 1270
1120 IF d1% = 1 AND c < 46 AND d < 226 THEN d = 226: dd = dd * -.5: SOUND 2094, .05: GOTO 1270
1130 IF d1% = 1 AND c < 46 AND d > 254 THEN d = 254: dd = dd * -.5: SOUND 2094, .05: GOTO 1270
1140 IF d2% = 1 AND d > 434 AND c > 306 AND c < 334 THEN 1270
1150 IF d2% = 1 AND d > 434 AND c < 306 THEN c = 306: cc = cc * -.5: SOUND 2094, .05: GOTO 1270
1160 IF d2% = 1 AND d > 434 AND c > 334 THEN c = 334: cc = cc * -.5: SOUND 2094, .05: GOTO 1270
1170 IF d3% = 1 AND c > 594 AND d > 226 AND d < 254 THEN 1270
1180 IF d3% = 1 AND c > 594 AND d < 226 THEN d = 226: dd = dd * -.5: SOUND 2094, .05: GOTO 1270
1190 IF d3% = 1 AND c > 594 AND d > 254 THEN d = 254: dd = dd * -.5: SOUND 2094, .05: GOTO 1270
1200 IF d4% = 1 AND d < 46 AND c > 306 AND c < 334 THEN 1270
1210 IF d4% = 1 AND d < 46 AND c < 306 THEN c = 306: cc = cc * -.5: SOUND 2094, .05: GOTO 1270
1220 IF d4% = 1 AND d < 46 AND c > 334 THEN c = 334: cc = cc * -.5: SOUND 2094, .05: GOTO 1270
1230 IF c < 46 THEN c = 46: cc = cc * -.5: SOUND 2094, .05
1240 IF c > 594 THEN c = 594: cc = cc * -.5: SOUND 2094, .05
1250 IF d < 46 THEN d = 46: dd = dd * -.5: SOUND 2094, .05
1260 IF d > 434 THEN d = 434: dd = dd * -.5: SOUND 2094, .05
1270 col% = 14: GOSUB 2000
1280 IF c < 80 AND d > 220 AND d < 260 AND d1% = 0 THEN d1% = 2: ya% = 260
1290 IF (c > 80 OR d < 220 OR d > 260) AND d1% = 1 THEN d1% = 3: ya% = 220
1300 IF c > 300 AND c < 340 AND d > 400 AND d2% = 0 THEN d2% = 2: ya% = 340
1310 IF (c < 300 OR c > 340 OR d < 400) AND d2% = 1 THEN d2% = 3: ya% = 300
1320 IF c > 560 AND d > 220 AND d < 260 AND d3% = 0 THEN d3% = 2: ya% = 260
1330 IF (c < 560 OR d < 220 OR d > 260) AND d3% = 1 THEN d3% = 3: ya% = 220
1340 IF c > 300 AND c < 340 AND d < 80 AND d4% = 0 THEN d4% = 2: ya% = 340
1350 IF (c < 300 OR c > 340 OR d > 80) AND d4% = 1 THEN d4% = 3: ya% = 300
1360 IF d1% = 2 THEN z% = 40: GOSUB 3000
1370 IF d1% = 3 THEN z% = 40: GOSUB 3100
1380 IF d2% = 2 THEN z% = 440: GOSUB 3200
1390 IF d2% = 3 THEN z% = 440: GOSUB 3300
1400 IF d3% = 2 THEN z% = 600: GOSUB 3000
1410 IF d3% = 3 THEN z% = 600: GOSUB 3100
1420 IF d4% = 2 THEN z% = 40: GOSUB 3200
1430 IF d4% = 3 THEN z% = 40: GOSUB 3300
1500 za% = 0: zb% = 0
1505 FOR z% = 1 TO coins%
1510 dis% = SQR((mon%(z%, 1) - c) ^ 2 + (mon%(z%, 2) - d) ^ 2)
1520 IF dis% < 15 AND mon%(z%, 3) = 1 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1530 IF dis% < 17 AND mon%(z%, 3) = 2 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1540 IF dis% < 14 AND mon%(z%, 3) = 3 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1550 IF dis% < 21 AND mon%(z%, 3) = 4 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1560 IF dis% < 25 AND mon%(z%, 3) = 5 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1570 IF mon%(z%, 1) > c - 30 AND mon%(z%, 1) < c + 30 AND mon%(z%, 2) > d - 15 AND mon%(z%, 2) < d + 15 AND mon%(z%, 3) > 5 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 523, 1
1580 NEXT z%
1590 IF za% <> 0 OR zb% <> 0 THEN coin% = coin% - 1: GOSUB 6800
1970 GOSUB 4000
1980 IF c > 640 THEN CLS : GOTO 80
1990 GOTO 1000

2000 LINE (c - 5, d - 5)-(c + 5, d + 5), col%, B
2010 RETURN

2100 LINE (x% - 8, y%)-(x% + 8, y%), col%
2110 LINE (x% - 8, y% + 12)-(x% - 4, y% + 12), col%
2120 LINE -(x% - 4, y% - 8), col%
2130 LINE -(x% + 4, y% - 8), col%
2140 LINE -(x% + 4, y% + 12), col%
2150 LINE -(x% + 8, y% + 12), col%
2160 RETURN

2200 LINE (x% - 8, y%)-(x% + 8, y%), col%
2210 LINE -(x%, y% + 4), col%
2220 LINE -(x% - 8, y%), col%
2230 LINE (x% - 8, y% + 12)-(x% - 4, y% + 12), col%
2240 LINE -(x% - 4, y% - 8), col%
2250 LINE -(x%, y% - 12), col%
2260 LINE -(x% + 4, y% - 8), col%
2270 LINE -(x% + 4, y% + 12), col%
2280 LINE -(x% + 8, y% + 12), col%
2290 RETURN

2300 LINE (x% - 12, y% - 12)-(x% + 12, y% + 12), col%, B
2310 LINE (x% - 4, y% - 4)-(x%, y%), col%
2320 LINE -(x% + 4, y% - 4), col%
2330 LINE (x% - 8, y% + 4)-(x% - 4, y% + 8), col%
2340 LINE -(x% + 4, y% + 8), col%
2350 LINE -(x% + 8, y% + 4), col%
2360 RETURN

2400 LINE (x% - 12, y% - 12)-(x% + 12, y% + 12), col%, B
2410 LINE (x% - 4, y% - 4)-(x%, y%), col%
2420 LINE -(x% + 4, y% - 4), col%
2430 LINE (x% - 8, y% + 8)-(x% - 4, y% + 4), col%
2440 LINE -(x% + 4, y% + 4), col%
2450 LINE -(x% + 8, y% + 8), col%
2460 RETURN

3000 ya% = ya% - 1
3010 PSET (z%, ya%), 0
3020 PSET (z%, ya% - 40), 7
3030 PSET (z%, ya% - 39), 15
3060 IF ya% = 221 AND z% = 40 THEN d1% = 1
3070 IF ya% = 221 AND z% = 600 THEN d3% = 1
3080 RETURN

3100 ya% = ya% + 1
3110 PSET (z%, ya%), 15
3120 PSET (z%, ya% - 39), 7
3130 PSET (z%, ya% - 40), 15
3170 IF ya% = 259 AND z% = 40 THEN d1% = 0
3180 IF ya% = 259 AND z% = 600 THEN d3% = 0
3190 RETURN

3200 ya% = ya% - 1
3210 PSET (ya%, z%), 0
3220 PSET (ya% - 40, z%), 7
3230 PSET (ya% - 39, z%), 15
3240 IF ya% = 301 AND z% = 440 THEN d2% = 1
3250 IF ya% = 301 AND z% = 40 THEN d4% = 1
3270 RETURN

3300 ya% = ya% + 1
3310 PSET (ya%, z%), 15
3320 PSET (ya% - 39, z%), 7
3330 PSET (ya% - 40, z%), 15
3340 IF ya% = 339 AND z% = 440 THEN d2% = 0
3350 IF ya% = 339 AND z% = 40 THEN d4% = 0
3380 RETURN

4000 FOR mt% = 1 TO 4
4010 IF a%(mt% + 18, board%) = 1 THEN
4020 x% = m%(mt%, 1): y% = m%(mt%, 2): col% = 0: ON mt% GOSUB 2100, 2200, 2300, 2400
4030 IF mt% / 2 <> INT(mt% / 2) THEN
4040 IF (mx%(mt%) = 0 OR mon%(mx%(mt%), 3) = 0) AND coin% > 0 THEN mx%(mt%) = INT(coins% * RND) + 1: GOTO 4040
4050 IF coin% = 0 THEN mon%(mx%(mt%), 1) = c: mon%(mx%(mt%), 2) = d
4060 dis% = SQR((m%(mt%, 1) - mon%(mx%(mt%), 1)) ^ 2 + (m%(mt%, 2) - mon%(mx%(mt%), 2)) ^ 2)
4070 IF dis% > 0 THEN m%(mt%, 1) = m%(mt%, 1) + (mon%(mx%(mt%), 1) - m%(mt%, 1)) / dis% * 1.5
4080 IF dis% > 0 THEN m%(mt%, 2) = m%(mt%, 2) + (mon%(mx%(mt%), 2) - m%(mt%, 2)) / dis% * 1.5
4090 END IF
4100 IF mt% / 2 = INT(mt% / 2) THEN
4110 dis% = SQR((m%(mt%, 1) - c) ^ 2 + (m%(mt%, 2) - d) ^ 2)
4120 IF dis% > 0 THEN m%(mt%, 1) = m%(mt%, 1) + (c - m%(mt%, 1)) / dis% * 2
4130 IF dis% > 0 THEN m%(mt%, 2) = m%(mt%, 2) + (d - m%(mt%, 2)) / dis% * 2
4140 END IF
4150 IF mt% < 3 AND m%(mt%, 1) < 49 THEN m%(mt%, 1) = 49
4160 IF mt% > 2 AND m%(mt%, 1) < 53 THEN m%(mt%, 1) = 53
4170 IF mt% < 3 AND m%(mt%, 1) > 591 THEN m%(mt%, 1) = 591
4180 IF mt% > 2 AND m%(mt%, 1) > 587 THEN m%(mt%, 1) = 587
4190 IF mt% = 1 AND m%(mt%, 2) < 49 THEN m%(mt%, 2) = 49
4200 IF mt% > 1 AND m%(mt%, 2) < 53 THEN m%(mt%, 2) = 53
4210 IF m%(mt%, 2) > 427 THEN m%(mt%, 2) = 427
4220 x% = m%(mt%, 1): y% = m%(mt%, 2): col% = 14: ON mt% GOSUB 2100, 2200, 2300, 2400
4230 IF mt% = 1 AND money% > 1 AND m%(mt%, 1) > c - 12 AND m%(mt%, 1) < c + 12 AND m%(mt%, 2) > d - 12 AND m%(mt%, 2) < d + 17 THEN SOUND 523, .1: money% = money% - 1
4240 IF mt% = 2 AND money% > 5 AND m%(mt%, 1) > c - 12 AND m%(mt%, 1) < c + 12 AND m%(mt%, 2) > d - 17 AND m%(mt%, 2) < d + 17 THEN SOUND 523, .1: money% = money% - 5
4250 IF mt% = 3 AND money% > 10 AND m%(mt%, 1) > c - 17 AND m%(mt%, 1) < c + 17 AND m%(mt%, 2) > d - 17 AND m%(mt%, 2) < d + 17 THEN SOUND 523, .1: money% = money% - 10
4260 IF mt% = 4 AND money% > 200 AND m%(mt%, 1) > c - 17 AND m%(mt%, 1) < c + 17 AND m%(mt%, 2) > d - 17 AND m%(mt%, 2) < d + 17 THEN SOUND 523, .1: money% = money% - 200
4270 END IF
4280 za% = 0: zb% = 0
4290 FOR z% = 1 TO coins%
4300 dis% = SQR((mon%(z%, 1) - m%(mt%, 1)) ^ 2 + (mon%(z%, 2) - m%(mt%, 2)) ^ 2)
4310 IF dis% < 15 AND mon%(z%, 3) = 1 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4320 IF dis% < 17 AND mon%(z%, 3) = 2 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4330 IF dis% < 14 AND mon%(z%, 3) = 3 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4340 IF dis% < 21 AND mon%(z%, 3) = 4 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4350 IF dis% < 25 AND mon%(z%, 3) = 5 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4360 IF mon%(z%, 1) > m%(mt%, 1) - 30 AND mon%(z%, 1) < m%(mt%, 1) + 30 AND mon%(z%, 2) > m%(mt%, 2) - 15 AND mon%(z%, 2) < m%(mt%, 2) + 15 AND mon%(z%, 3) > 5 THEN za% = mon%(z%, 3): zb% = z%: mon%(z%, 3) = 0: SOUND 40, 1
4370 NEXT z%
4380 IF za% <> 0 OR zb% <> 0 THEN coin% = coin% - 1: GOSUB 6600
4480 NEXT mt%
4490 RETURN

5000 DATA 3,3,3,2,1,1,1,1
5010 DATA 2,2,2,2,2,1,1,1
5020 DATA 0,1,1,2,2,2,1,1
5030 DATA 0,0,1,1,2,2,2,1
5040 DATA 0,0,0,1,1,2,2,2
5050 DATA 0,0,0,0,1,1,2,2
5060 DATA 0,0,0,0,0,1,1,2
5070 DATA 0,0,0,0,0,0,1,1
5080 DATA 0,0,0,0,0,0,0,1
5090 DATA 13,23,48,102,231,776,1866,4341
5100 DATA 5,10,20,40,80,160,320,640
5110 DATA 1,1,2,4,8,16,32,64
5120 DATA 1,2,5,10,23,78,187,434
5130 DATA 10,20,40,80,160,320,640,1280
5140 DATA 1,2,4,8,16,32,64,128
5150 DATA 2,5,9,14,20,27,35,44
5160 DATA 3,5,12,25,57,194,466,1085
5170 DATA 3,6,11,16,23,30,39,48
5180 DATA 1,1,0,0,1,1,0,0
5190 DATA 1,0,1,1,0,0,1,0
5200 DATA 0,1,1,1,1,0,0,1
5210 DATA 0,0,0,0,0,1,1,1

6000 IF kind% = 1 THEN CIRCLE (x%, y%), 10, 4
6005 IF kind% = 2 THEN CIRCLE (x%, y%), 12, 4
6010 IF kind% = 3 THEN CIRCLE (x%, y%), 9, 4
6015 IF kind% = 4 THEN CIRCLE (x%, y%), 16, 4
6020 IF kind% = 5 THEN CIRCLE (x%, y%), 20, 4
6025 IF kind% < 6 THEN PAINT (x%, y%), 7, 4
6030 IF kind% = 1 THEN CIRCLE (x%, y%), 10, col%
6035 IF kind% = 2 THEN CIRCLE (x%, y%), 12, col%
6040 IF kind% = 3 THEN CIRCLE (x%, y%), 9, col%
6045 IF kind% = 4 THEN CIRCLE (x%, y%), 16, col%
6050 IF kind% = 5 THEN CIRCLE (x%, y%), 20, col%
6060 IF kind% > 5 THEN LINE (x% - 30, y% - 15)-(x% + 30, y% + 15), col%, B
6070 IF kind% > 5 THEN LINE (x% - 29, y% - 14)-(x% + 29, y% + 14), 2, BF
6080 IF kind% = 1 THEN tt$ = "1": r% = x% - 5: rr% = y% - 5: s% = x% + 5: ss% = y% + 5: t% = 8: GOSUB 8000
6090 IF kind% = 2 THEN tt$ = "5": r% = x% - 6: rr% = y% - 6: s% = x% + 6: ss% = y% + 6: t% = 8: GOSUB 8000
6100 IF kind% = 3 THEN tt$ = "10": r% = x% - 5: rr% = y% - 5: s% = x% + 5: ss% = y% + 5: t% = 8: GOSUB 8000
6110 IF kind% = 4 THEN tt$ = "25": r% = x% - 8: rr% = y% - 8: s% = x% + 8: ss% = y% + 8: t% = 8: GOSUB 8000
6120 IF kind% = 5 THEN tt$ = "50": r% = x% - 10: rr% = y% - 10: s% = x% + 10: ss% = y% + 10: t% = 8: GOSUB 8000
6130 IF kind% = 6 THEN tt$ = "$1.00": r% = x% - 25: rr% = y% - 8: s% = x% + 25: ss% = y% + 8: t% = 8: GOSUB 8000
6140 IF kind% = 7 THEN tt$ = "$5.00": r% = x% - 25: rr% = y% - 8: s% = x% + 25: ss% = y% + 8: t% = 8: GOSUB 8000
6150 IF kind% = 8 THEN tt$ = "$10.00": r% = x% - 25: rr% = y% - 8: s% = x% + 25: ss% = y% + 8: t% = 8: GOSUB 8000
6160 IF kind% = 9 THEN tt$ = "$20.00": r% = x% - 25: rr% = y% - 8: s% = x% + 25: ss% = y% + 8: t% = 8: GOSUB 8000
6170 RETURN

6200 IF kind% = 1 THEN CIRCLE (x%, y%), 10, 4
6210 IF kind% = 2 THEN CIRCLE (x%, y%), 12, 4
6220 IF kind% = 3 THEN CIRCLE (x%, y%), 9, 4
6230 IF kind% = 4 THEN CIRCLE (x%, y%), 16, 4
6240 IF kind% = 5 THEN CIRCLE (x%, y%), 20, 4
6250 IF kind% < 6 THEN PAINT (x%, y%), 0, 4
6260 IF kind% = 1 THEN CIRCLE (x%, y%), 10, 0
6270 IF kind% = 2 THEN CIRCLE (x%, y%), 12, 0
6280 IF kind% = 3 THEN CIRCLE (x%, y%), 9, 0
6290 IF kind% = 4 THEN CIRCLE (x%, y%), 16, 0
6300 IF kind% = 5 THEN CIRCLE (x%, y%), 20, 0
6310 IF kind% > 5 THEN LINE (x% - 30, y% - 15)-(x% + 30, y% + 15), 0, BF
6320 RETURN

6500 coins% = 0
6510 FOR z% = 1 TO 9
6520 FOR zz% = 1 TO a%(z%, board%)
6530 x% = INT(400 * RND) + 120
6540 y% = INT(300 * RND) + 90
6550 kind% = z%: col% = 8: GOSUB 6000
6560 coins% = coins% + 1: mon%(coins%, 1) = x%: mon%(coins%, 2) = y%: mon%(coins%, 3) = z%
6570 NEXT zz%
6580 NEXT z%
6585 coin% = coins%
6590 RETURN

6600 x% = mon%(zb%, 1): y% = mon%(zb%, 2): kind% = za%: GOSUB 6200
6610 FOR z% = 1 TO coins%
6620 IF mon%(z%, 1) - 50 < m%(mt%, 1) AND mon%(z%, 1) + 50 > m%(mt%, 1) AND mon%(z%, 2) - 50 < m%(mt%, 2) AND mon%(z%, 2) + 50 > m%(mt%, 2) AND mon%(z%, 3) <> 0 THEN x% = mon%(z%, 1): y% = mon%(z%, 2): kind% = mon%(z%, 3): col% = 8: GOSUB 6000
6630 NEXT z%
6640 RETURN

6800 IF za% = 1 THEN money% = money% + 1
6810 IF za% = 2 THEN money% = money% + 5
6820 IF za% = 3 THEN money% = money% + 10
6830 IF za% = 4 THEN money% = money% + 25
6840 IF za% = 5 THEN money% = money% + 50
6850 IF za% = 6 THEN money% = money% + 100
6860 IF za% = 7 THEN money% = money% + 500
6870 IF za% = 8 THEN money% = money% + 1000
6880 IF za% = 9 THEN money% = money% + 2000
6890 LOCATE 1, 1: PRINT money% / 100
6900 x% = mon%(zb%, 1): y% = mon%(zb%, 2): kind% = za%: GOSUB 6200
6910 FOR z% = 1 TO coins%
6920 IF mon%(z%, 1) - 50 < c AND mon%(z%, 1) + 50 > c AND mon%(z%, 2) - 50 < d AND mon%(z%, 2) + 50 > d AND mon%(z%, 3) <> 0 THEN x% = mon%(z%, 1): y% = mon%(z%, 2): kind% = mon%(z%, 3): col% = 8: GOSUB 6000
6930 NEXT z%
6940 RETURN

8000 s% = (s% - r%) / 5: ss% = (ss% - rr%) / 4
8010 s% = s% / LEN(tt$)
8020 FOR v% = 1 TO LEN(tt$)
8030 IF ASC(MID$(tt$, v%, 1)) > 31 AND ASC(MID$(tt$, v%, 1)) < 126 THEN
8040 FOR vv% = 1 TO LEN(q$(ASC(MID$(tt$, v%, 1)))) / 3
8050 u% = ASC(MID$(q$(ASC(MID$(tt$, v%, 1))), (vv% - 1) * 3 + 1, 1)) - 48
8060 uu% = ASC(MID$(q$(ASC(MID$(tt$, v%, 1))), (vv% - 1) * 3 + 2, 1)) - 48
8070 uuu% = ASC(MID$(q$(ASC(MID$(tt$, v%, 1))), (vv% - 1) * 3 + 3, 1)) - 48
8075 qq% = uu% * s% + r% + (v% - 1) * s% * 5: qqq% = uuu% * ss% + rr%
8080 IF u% = 1 THEN LINE -(qq%, qqq%), t%
8090 IF u% = 0 THEN LINE (qq%, qqq%)-(qq%, qqq%), t%
8100 NEXT vv%
8110 END IF
8120 NEXT v%
8130 RETURN

9000 q$(33) = "020123023024124": q$(34) = "010111030131"
9032 q$(35) = "010114030134001141003143"
9033 q$(36) = "040110101112132143134104030134010114"
9034 q$(37) = "000110111101100044143133134144040104"
9035 q$(38) = "044111120131113124142": q$(39) = "020121112"
9036 q$(40) = "020111113124": q$(41) = "020131133124"
9037 q$(42) = "011133031113021123012132": q$(43) = "021123012132"
9038 q$(44) = "022123114": q$(45) = "012132": q$(46) = "034134": q$(47) = "004140"
9039 q$(48) = "010130141143134114103101110": q$(49) = "011120124104024144"
9040 q$(50) = "001110130141104144": q$(51) = "001110130141132122032143134114103"
9041 q$(52) = "042102130134": q$(53) = "040100102132143134104"
9042 q$(54) = "041130110101103114134143132102": q$(55) = "000140141114"
9043 q$(56) = "010130141132112103114134143132012101110"
9044 q$(57) = "044140110101112142": q$(58) = "021121023123"
9045 q$(59) = "021121023114": q$(60) = "031112133": q$(61) = "011131013133"
9046 q$(62) = "011132113": q$(63) = "024124023122132141130120"
9047 q$(64) = "034114103101110130141143123121132123"
9048 q$(65) = "004101110130141144002142"
9049 q$(66) = "000104134143132102032141130100"
9050 q$(67) = "040110101103114144": q$(68) = "000104134143141130100"
9051 q$(69) = "040100104144002132": q$(70) = "040100104002132"
9052 q$(71) = "040110101103114134143142122": q$(72) = "000104002142040144"
9053 q$(73) = "010130020124014134": q$(74) = "010130020123114103"
9054 q$(75) = "000104002140002144": q$(76) = "000104144"
9055 q$(77) = "004100122140144": q$(78) = "004100144140"
9056 q$(79) = "000140144104100": q$(80) = "004100130141132102"
9057 q$(81) = "010130141143134114103101110033144"
9058 q$(82) = "004100130141132102032143144"
9059 q$(83) = "040110101112132143134104": q$(84) = "000140020124"
9060 q$(85) = "000103114134143140": q$(86) = "000124140"
9061 q$(87) = "000104122144140": q$(88) = "000144040104"
9062 q$(89) = "000122140022124": q$(90) = "000140104144"
9063 q$(91) = "030110114134": q$(92) = "000144": q$(93) = "010130134114"
9064 q$(94) = "011120131": q$(95) = "004144": q$(96) = "020121132"
9065 q$(97) = "033113114134132112": q$(98) = "010114134143132112"
9066 q$(99) = "032122113124134": q$(100) = "030134114103112132"
9067 q$(101) = "013133122113124134": q$(102) = "031120111112102022112114"
9068 q$(103) = "034124113122132134135115": q$(104) = "010114013122133134"
9069 q$(105) = "021121022124": q$(106) = "021121022124115104"
9070 q$(107) = "010114013132013134": q$(108) = "020124"
9071 q$(109) = "014112132134022124": q$(110) = "014112132134"
9072 q$(111) = "034132112114134": q$(112) = "015112122133124114"
9073 q$(113) = "034124113122132135144": q$(114) = "014112132"
9074 q$(115) = "014134133113112132": q$(116) = "021124134012132"
9075 q$(117) = "012114134132": q$(118) = "012124132"
9076 q$(119) = "012114122134132": q$(120) = "012134032114"
9077 q$(121) = "012124032124115": q$(122) = "012132114134"
9078 q$(123) = "030120121112123124134": q$(124) = "020121023124"
9079 q$(125) = "010120121132123124114"
9080 RETURN

mouse:
   regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
   IF regs%(0) = 1 AND regs%(1) = 1 THEN CIRCLE (mousx% + 4, mousy% + 4), 2, 15: SOUND 262, .4
   IF regs%(0) = 2 THEN END
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   m3% = regs%(2): m4% = regs%(3)
RETURN

