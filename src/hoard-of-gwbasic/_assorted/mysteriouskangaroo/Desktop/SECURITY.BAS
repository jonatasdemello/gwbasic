5  SCREEN 1: SCREEN 0: COLOR 1, 0: CLS
10 PRINT "ษออออออออออออออออออออออออออออออออออออออป"
15 PRINT "บ                                      บ"
20 PRINT "บ                                      บ"
25 PRINT "บ                                      บ"
30 PRINT "บ                                      บ"
35 PRINT "บ                                      บ"
40 PRINT "บ                                      บ"
45 PRINT "บ                                      บ"
50 PRINT "บ                                      บ"
55 PRINT "บ       ษออออออออออออออออออออออป       บ"
60 PRINT "บ       บ                      บ       บ"
65 PRINT "บ       บ                      บ       บ"
70 PRINT "บ       ศออออออออออออออออออออออผ       บ"
75 PRINT "บ                                      บ"
80 PRINT "บ                                      บ"
85 PRINT "บ                                      บ"
90 PRINT "บ                                      บ"
95 PRINT "บ                                      บ"
100 PRINT "บ                                      บ"
105 PRINT "บ                                      บ"
110 PRINT "บ                                      บ"
115 PRINT "บ                                      บ"
120 PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
125 REM""
130 LOCATE 11, 10, 1, 7: COLOR 31: PRINT " SOMEONE IS SCREWING!"
135 LOCATE 12, 10, 1, 7: COLOR 31: PRINT " AROUND WITH ME!!!!!!"
140 REM""
141 R$ = "HELP!": KEY 8, "ฦ"
142 LOCATE 2, 3, 1, 7: COLOR 15: PRINT R$
145 LOCATE 2, 34, 1, 7: COLOR 15: PRINT R$
150 LOCATE 22, 3, 1, 7: COLOR 15: PRINT R$
155 LOCATE 22, 34, 1, 7: COLOR 15: PRINT R$
LOCATE 14, 9, 0: COLOR 9: PRINT "Press F8 to leave."
160 SOUND 800, 5
165 PLAY "BD"
170 B$ = INKEY$: IF B$ = "" THEN GOTO 165
175 IF B$ = "ฦ" THEN CHAIN "startup"
180 GOTO 165

