8 REM "FALCON SOFTWARE: MICHAEL SAO PEDRO"
2 REM "---1 9 9 3---"
9 SCREEN 1: SCREEN 0: COLOR 4, 0: CLS
10 PRINT "ษออออออออออออออออออออออออออออออออออออออป"
11 PRINT "บ ษออออออออออออออออออออออออออออออออออป บ"
12 PRINT "บ บ                                  บ บ"
13 PRINT "บ บ                                  บ บ"
14 PRINT "บ บ                                  บ บ"
15 PRINT "บ บ                                  บ บ"
16 PRINT "บ บ                                  บ บ"
17 PRINT "บ บ                                  บ บ"
18 PRINT "บ บ                                  บ บ"
19 PRINT "บ บ                                  บ บ"
20 PRINT "บ บ                                  บ บ"
21 PRINT "บ บ                                  บ บ"
22 PRINT "บ บ                                  บ บ"
23 PRINT "บ บ                                  บ บ"
24 PRINT "บ บ                                  บ บ"
25 PRINT "บ บ                                  บ บ"
26 PRINT "บ บ                                  บ บ"
27 PRINT "บ บ                                  บ บ"
28 PRINT "บ บ                                  บ บ"
29 PRINT "บ บ                                  บ บ"
30 PRINT "บ ศออออออออออออออออออออออออออออออออออผ บ"
34 PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
35 LOCATE 10, 8, 1, 7: COLOR 14: PRINT "FALCON SOFTWARE PRESENTS..."
36 LOCATE 18, 14, 1, 7: COLOR 25: PRINT "PRESS ANY KEY"
37 LOCATE 20, 15, 1, 7: COLOR 29: PRINT "TO CONTINUE"
38 LOCATE 20, 13, 1, 7: COLOR 2: PRINT CHR$(1): LOCATE 20, 27, 1, 7: PRINT CHR$(1)
39 B$ = INKEY$
40 IF B$ = "" THEN GOTO 39
41 SOUND 2500, .5: A = 3: AA = 4
42 FOR Z = 1 TO 18
43 FOR ZZ = 1 TO 34
44 LOCATE A, AA, 1, 7: COLOR 0: PRINT CHR$(109)
45 AA = AA + 1
46 NEXT ZZ
47 A = A + 1: AA = 4: NEXT Z
48 LOCATE 3, 15, 1, 0: COLOR 9: PRINT "SELECT ONE:"
49 LOCATE 7, 10, 1, 0: COLOR 14: PRINT "1:"
60 LOCATE 8, 10, 1, 0: PRINT "2:"
51 LOCATE 9, 10, 1, 0: PRINT "3:"
52 LOCATE 10, 10, 1, 0: PRINT "4:"
53 LOCATE 11, 10, 1, 0: PRINT "5:"
54 LOCATE 15, 10, 1, 0: PRINT "6:"
84 LOCATE 16, 10, 1, 0: PRINT "7:"
85 LOCATE 17, 10, 1, 0: PRINT "8:"
86 LOCATE 18, 10, 1, 0: PRINT "9:"
87 LOCATE 19, 9, 1, 0: PRINT "10:"
55 LOCATE 7, 13, 1, 0: COLOR 2: PRINT "Super Spinner 2"
56 LOCATE 8, 13, 1, 0: COLOR 13: PRINT "Super Spinner 3"
57 LOCATE 9, 13, 1, 0: COLOR 15: PRINT "Diamonds"
58 LOCATE 10, 13, 1, 0: COLOR 12: PRINT "Zap-it"
59 LOCATE 11, 13, 1, 0: COLOR 3: PRINT "Pickup Stix Graphics"
61 LOCATE 15, 13, 1, 0: COLOR 6: PRINT "Boxes Graphics"
80 LOCATE 16, 13, 1, 0: COLOR 9: PRINT "Calculator"
81 LOCATE 17, 13, 1, 0: COLOR 5: PRINT "Nibbles"
82 LOCATE 18, 13, 1, 0: COLOR 7: PRINT "Gorillas"
83 LOCATE 19, 13, 1, 0: COLOR 1: PRINT "DeskMate"
62 B$ = INKEY$
63 IF B$ = "" THEN GOTO 62
65 SOUND 2500, .5
66 FOR Z = 1 TO 30
67 PRINT "                        "
68 NEXT Z
69 COLOR 15: LOCATE 11, 7, 1, 7: PRINT "Program by: Michael Sao Pedro"
70 PLAY "MF P1": IF B$ = "1" THEN CHAIN "SPINNER2.BAS"
71 IF B$ = "2" THEN CHAIN "SPINNER3.BAS"
72 IF B$ = "3" THEN CHAIN "DIAMONDS.BAS"
73 IF B$ = "4" THEN CHAIN "ZAP-IT!.BAS"
74 IF B$ = "5" THEN CHAIN "LINES.BAS"
75 IF B$ = "6" THEN CHAIN "BOXES.BAS"
76 IF B$ = "7" THEN CHAIN "CALCULAT.BAS"
77 IF B$ = "8" THEN CHAIN "NIBBLES.BAS"
78 IF B$ = "9" THEN CHAIN "GORILLAS.BAS"
79 IF B$ = "0" THEN CHAIN "C:\DESK.COM"






















































































































































































































































