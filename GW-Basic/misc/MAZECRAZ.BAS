5 SCREEN 1: SCREEN 0: COLOR 9, 0: PLAY "Mb C8C16f": CLS
6 IF Q = 1 THEN COLOR 4, 0
7 IF Q = 1 THEN CLS
10 PRINT "ษออออออออออออออออออออออออออออออออออออออป"
15 PRINT "บ                                      บ"
20 PRINT "บ                                      บ"
25 PRINT "บ                                      บ"
30 PRINT "บ                                      บ"
35 PRINT "บ                                      บ"
40 PRINT "บ                                      บ"
45 PRINT "บ                                      บ"
50 PRINT "บ                                      บ"
55 PRINT "บ                                      บ"
60 PRINT "บ                                      บ"
65 PRINT "บ                                      บ"
70 PRINT "บ                                      บ"
75 PRINT "บ                                      บ"
80 PRINT "บ                                      บ"
85 PRINT "บ                                      บ"
90 PRINT "บ                                      บ"
95 PRINT "บ                                      บ"
100 PRINT "บ                                      บ"
105 PRINT "บ                                      บ"
110 PRINT "บ                                      บ"
115 PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
116 IF Q = 1 THEN GOTO 7005
120 A$(0) = "Main Menu."
125 A$(1) = "Start Game!!."
130 A$(2) = "Enter your password."
135 A$(3) = "Quit to basic."
140 A$(4) = "Quit to Windows."
145 A$(5) = "Made by Larry!"
150 A$(6) = "Started on Jan. 14, 1994"
155 A$(7) = "Welcome to Mazecraze!"
160 A$(8) = ""
165 A$(9) = ""
170 REM"Fkey setup"
175 REM"KEY 1 = "
180 REM"KEY 2 = "
185 REM"KEY 3 = "
190 REM"KEY 4 = "
195 REM"KEY 5 = "
200 REM"KEY 6 = "
205 REM"KEY 7 = "
210 REM"KEY 8 = "
215 REM"KEY 9 = "
220 REM"KEY 10 = "
225 REM"KEY 11 = "
230 REM"KEY 12 = "
235 B = 9: C = 9
240 LOCATE 2, 3, 0, 7: COLOR 31: PRINT A$(7)
245 LOCATE 5, 3, 0, 7: COLOR 15: PRINT A$(0)
250 LOCATE 7, 3, 0, 7: COLOR 9: PRINT A$(1)
255 LOCATE 8, 3, 0, 7: COLOR 9: PRINT A$(2)
260 LOCATE 9, 3, 0, 7: COLOR 9: PRINT A$(3)
265 LOCATE 10, 3, 0, 7: COLOR 9: PRINT A$(4)
270 LOCATE 20, 3, 0, 7: COLOR 15: PRINT A$(5)
275 LOCATE 21, 3, 0, 7: PRINT A$(6)
285 A = 7: B = 15: C = 9: D = 1
295 LOCATE A, 3, 0, 7: COLOR B: PRINT A$(D)
300 B$ = INKEY$: IF B$ = "" THEN GOTO 300
305 IF B$ = " " THEN GOTO 320
310 IF B$ = "S" THEN GOTO 5000
315 SOUND 1500, 1: GOTO 1000
320 LOCATE A, 3, 0, 7: COLOR C: PRINT A$(D)
325 A = A + 1: D = D + 1: IF D = 5 THEN GOTO 350
330 SOUND 1400, 1
335 GOTO 295
340 A = 7: D = 1: SOUND 1400, 1: GOTO 295
345 A = A + 1: D = D + 1: IF D = 5 THEN GOTO 350
350 SOUND 1400, 1: A = 7: D = 1
355 GOTO 295
360 REM "STARTED ON JAN. 14, 1994         "
400 REM "BY LARRY!"
405 REM "STARTED ON JAN. 14, 1994"      
1000 IF D = 1 THEN GOTO 3000
1005 IF D = 2 THEN GOTO 2000
1010 IF D = 3 THEN COLOR 15, 1: CLS : PRINT "Bye!!": END
1015 IF D = 4 THEN SYSTEM
2000 LOCATE 17, 3, 0, 7: COLOR 15: PRINT "Password:"
2005 LOCATE 17, 13, 0, 7: COLOR 1, 1: INPUT A$
2010 IF A$ = "JOSHI" THEN L = 1: GOTO 7000
2015 IF A$ = "FELIE" THEN L = 2: GOTO 7000
2020 IF A$ = "LATIN" THEN L = 3: GOTO 7000
2025 IF A$ = "PENES" THEN L = 4: GOTO 7000
2030 IF A$ = "DISCO" THEN L = 5: GOTO 7000
2035 IF A$ = "SIPLA" THEN L = 6: GOTO 7000
2040 IF A$ = "VAGIN" THEN L = 7: GOTO 7000
2045 IF A$ = "HORNE" THEN L = 8: GOTO 7000
2050 IF A$ = "DUCHE" THEN L = 9: GOTO 7000
2055 IF A$ = "PUSSE" THEN L = 10: GOTO 7000
2056 IF M = 1 THEN GOTO 8130
2060 LOCATE 17, 3, 0, 7: COLOR 0, 0: PRINT "Password:"
2065 LOCATE 17, 13, 0, 7: COLOR 0, 0: PRINT "                    "
2070 GOTO 295
2090 REM""
2105 REM""
2110 REM""
3000 REM""
5000 LOCATE 17, 3, 0, 7: COLOR 15: PRINT "SAVING!"
5001 REM "MAZECRAZE", A
5002 LOCATE 17, 3, 0, 7: COLOR 0, 0: PRINT "SAVING!"
5003 GOTO 295
7000 Q = 1: GOTO 6
7004 IF W = 1 THEN GOTO 7010
7005 DIM B$(11)
7006 W = 1
7010 B$(0) = "Level 1 - A"
7015 B$(1) = "Level 1 - B"
7020 B$(2) = "Level 2 - A"
7025 B$(3) = "Level 2 - B"
7030 B$(4) = "Level 3 - A"
7035 B$(5) = "Level 3 - B"
7040 B$(6) = "Level 4 - A"
7045 B$(7) = "Level 4 - B"
7050 B$(8) = "Level 5 - A"
7055 B$(9) = "Level 5 - B"
7060 B$(10) = "Please choose a level."
7065 LOCATE 2, 3, 0, 7: COLOR 15: PRINT B$(10)
7070 REM""
7075 LOCATE 5, 3, 0, 7: COLOR 3: PRINT B$(0)
7080 IF L >= 2 THEN GOTO 7090
7085 F = 2: GOTO 8000
7090 LOCATE 6, 3, 0, 7: COLOR 3: PRINT B$(1)
7095 IF L >= 3 THEN GOTO 7105
7100 F = 3: GOTO 8000
7105 LOCATE 7, 3, 0, 7: COLOR 3: PRINT B$(2)
7110 IF L >= 4 THEN GOTO 7120
7115 F = 4: GOTO 8000
7120 LOCATE 8, 3, 0, 7: COLOR 3: PRINT B$(3)
7125 IF L >= 5 THEN GOTO 7135
7130 F = 5: GOTO 8000
7135 LOCATE 9, 3, 0, 7: COLOR 3: PRINT B$(4)
7140 IF L >= 6 THEN GOTO 7150
7145 F = 6: GOTO 8000
7150 LOCATE 10, 3, 0, 7: COLOR 3: PRINT B$(5)
7155 IF L >= 7 THEN GOTO 7165
7160 F = 7: GOTO 8000
7165 LOCATE 11, 3, 0, 7: COLOR 3: PRINT B$(6)
7170 IF L >= 8 THEN GOTO 7180
7175 F = 8: GOTO 8000
7180 LOCATE 12, 3, 0, 7: COLOR 3: PRINT B$(7)
7185 IF L >= 9 THEN GOTO 7195
7190 F = 9: GOTO 8000
7195 LOCATE 13, 3, 0, 7: COLOR 3: PRINT B$(8)
7200 IF L >= 10 THEN GOTO 7210
7205 F = 10: GOTO 8000
7210 LOCATE 14, 3, 0, 7: COLOR 3: PRINT B$(9)
7215 F = 11: GOTO 8000
7220 REM""
8000 IF F = 2 THEN A = 1: L = 6: GOTO 8100
8010 IF F = 3 THEN A = 2: L = 7: GOTO 8100
8020 IF F = 4 THEN A = 3: L = 8: GOTO 8100
8030 IF F = 5 THEN A = 4: L = 9: GOTO 8100
8040 IF F = 6 THEN A = 5: L = 10: GOTO 8100
8050 IF F = 7 THEN A = 6: L = 11: GOTO 8100
8060 IF F = 8 THEN A = 7: L = 12: GOTO 8100
8070 IF F = 9 THEN A = 8: L = 13: GOTO 8100
8080 IF F = 10 THEN A = 9: L = 14: GOTO 8100
8090 IF F = 11 THEN GOTO 8500
8100 LOCATE L, 3, 1, 7: COLOR 6: PRINT B$(A)
8110 IF L = 14 THEN GOTO 8130
8120 A = A + 1: L = L + 1: GOTO 8100
8125 M = 1: GOTO 2010
8130 REM""
8135 LOCATE 5, 3, 1, 7: COLOR 15: PRINT B$(0)
8140 B$ = INKEY$: IF B$ = "" THEN GOTO 8140
8145 IF B$ = " " THEN GOTO 8160
8150 IF B$ = "Q" THEN GOTO 5
8155 GOTO 8500
8160 LOCATE 5, 3, 1, 7: COLOR 3: PRINT B$(0)
8165 SOUND 1400, 1
8170 IF L = 1 THEN GOTO 8130
8175 LOCATE 6, 3, 1, 7: COLOR 15: PRINT B$(1)
8180 B$ = INKEY$: IF B$ = "" THEN GOTO 8180
8185 IF B$ = " " THEN GOTO 8200
8190 IF B$ = "Q" THEN GOTO 5
8200 LOCATE 6, 3, 1, 7: COLOR 3: PRINT B$(1)
8205 SOUND 1400, 1
8210 IF L = 2 THEN GOTO 8130
8215 LOCATE 7, 3, 1, 7: COLOR 15: PRINT B$(2)
8220 B$ = INKEY$: IF B$ = "" THEN GOTO 8220
8225 IF B$ = " " THEN GOTO 8240
8230 IF B$ = "Q" THEN GOTO 5
8235 GOTO 8500
8240 LOCATE 7, 3, 1, 7: COLOR 3: PRINT B$(2)
8245 SOUND 1400, 1
8250 IF L = 3 THEN GOTO 8130
8255 LOCATE 8, 3, 1, 7: COLOR 15: PRINT B$(3)
8500 REM ""

