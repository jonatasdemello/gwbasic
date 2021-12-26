1 REM ****************************
2 REM *                          *
3 REM *    Chess recreations     *
4 REM *   Placement problems     *
5 REM *      2nd April  95       *
7 REM *    (cchesput.baS)      *
8 REM ****************************
9 '  this is schesput  NO NEED FOR SPEED CTRL AS BLINKING BY COLOR cmd
10  CLEAR , 32768!, 2000
15  CLS
50 REM join
56 '
59 REM ------------------------------------------------------
62 REM 4 TYPES K-ing, R-ook,  B-ishop,   N-knight  . 2nd ltr B-lack:W-hite
65 REM 4 TYPES Q-ueen,C-astle,M-inister, H-orse    , 2nd ltr B-lack:W-hite
68 REM 1 TYPE  P-awn                               . 2nd ltr B-lack:W-hite
71 KB$ = "BM +4,+1 c1 U2E2R2F1 g4e4 U3L1U1R1U1R1D1R1D1L1D3 f4h4 E1R2F2D2 G2D1F1D1 L9d1r9u1l9 U1E1U1H2 f2 r7 d1 l7"
72 K2W$ = "BM +4,+1 s8c4 U2E2R2F1 g4e4 U3L1U1R1U1R1D1R1D1L1D3 f4h4 E1R2F2D2 G2D1F1D1 L9d1r9u1l9 U1E1U1H2 f2 r7 d1 l7"
73 K2B$ = "BM +4,+1 s8c1 U2E2R2F1 g4e4 U3L1U1R1U1R1D1R1D1L1D3 f4h4 E1R2F2D2 G2D1F1D1 L9d1r9u1l9 U1E1U1H2 f2 r7 d1 l7"
74 KW$ = "BM +4,+1 c4 U2E2R2F1 g4e4 U3L1U1R1U1R1D1R1D1L1D3 f4h4 E1R2F2D2 G2D1F1D1 L9d1r9u1l9 U1E1U1H2 f2 r7 d1 l7"
77 NB$ = "BM +5,+1 c1 H1U1e1U1E2U1EFE1 F6 D5G2 L9d1r9u1l9 E6 H1 L2G1l1 bm +2,-3 l0"
80 HB$ = "BM +5,+1 c1 H1U1e1U1E2U1EFE1 F6 D5G2 L9d1r9u1l9 E6 H1 L2G1l1 bm +2,-3 l1"
83 NW$ = "BM +5,+1 c4 H1U1e1U1E2U1EFE1 F6 D5G2 L9d1r9u1l9 E6 H1 L2G1l1 bm +2,-3 l0"
86 HW$ = "BM +5,+1 c4 H1U1e1U1E2U1EFE1 F6 D5G2 L9d1r9u1l9 E6 H1 L2G1l1 bm +2,-3 l1"
89 PB$ = "BM +7,0 c1 E2U1H1U1E1 R2 F1D1G1D1 F2D1G2F3  L8d1r8u1l8 E3H2U1"
92 PW$ = "BM +7,0 c4 E2U1H1U1E1 R2 F1D1G1D1 F2D1G2F3  L8d1r8u1l8 E3H2U1"
95 BB$ = "BM +5,0 c1 U1E4U2R2D2F4D1G2 L6D1R6U1D1 G1D1R1F1rE1D2 L12 U2F1R1E1R1U1H1 U1H2"
98 MB$ = "BM +5,0 c1 U1E4U2R2D2F4D1G2 L6D1R6U1D1 G1D1R1F1rE1D2 L12 U2F1R1E1R1U1H1 U1H2"
101 BW$ = "BM +5,0 c4 U1E4U2R2D2F4D1G2 L6D1R6U1D1 G1D1R1F1rE1D2 L12 U2F1R1E1R1U1H1 U1H2"
104 MW$ = "BM +5,0 c4 U1E4U2R2D2F4D1G2 L6D1R6U1D1 G1D1R1F1rE1D2 L12 U2F1R1E1R1U1H1 U1H2"
107 QW$ = "BM +6,0  c4 H2U2R1F2 U3E1F1D3 F1E1 U3E1F1D3 E2R1D2G2 L8R8 D2G1 L6R6 F2D1 L10d1r10u1l10 U1E2H1U2 BM +3,+2 R2D1L2U1"
110 QB$ = "BM +6,0  c1 H2U2R1F2 U3E1F1D3 F1E1 U3E1F1D3 E2R1D2G2 L8R8 D2G1 L6R6 F2D1 L10d1r10u1l10 U1E2H1U2 BM +3,+2 R2D1L2U1"
113 RW$ = "BM +6,0 c4 U2L2U4R2D2 R2U2R3D2R2 U2R2D4 L8R6 D6R2D2 L11d1r11u1l11 U2 R9L7 U4 r1"
116 CW$ = "BM +6,0 c4 U2L2U4R2D2 R2U2R3D2R2 U2R2D4 L8R6 D6R2D2 L11d1r11u1l11 U2 R9L7 U4"
128 RB$ = "BM +6,0 c1 U2L2U4R2D2 R2U2R3D2R2 U2R2D4 L8R6 D6R2D2 L11d1r11u1l11 U2 R9L7 U4 r1"
131 CB$ = "BM +6,0 c1 U2L2U4R2D2 R2U2R3D2R2 U2R2D4 L8R6 D6R2D2 L11d1r11u1l11 U2 R9L7 U4"
134 REM --------------------------------------------------------------
135 GOSUB 5000 'intro
137 '
140 GOSUB 8000   'The empty CHESSBOARD
158 '*******************************
975 '
980 '
2970 '
3045 '
5000 REM intro
5010 SCREEN 0, 0: WIDTH 80: COLOR 1, 3, 3: CLS
5020 COLOR 14: LOCATE 2, 28: PRINT "CHESS  RECREATIONS": COLOR 4
5025 LOCATE 4, 28: PRINT "Placement Problems": COLOR 1
5028 LOCATE 6, 4: PRINT "These problems require you to have the most elementary knowledge of Chess "
5030 LOCATE 8, 4: PRINT "Problem 1: To determine the MINIMUM number of a PIECE which"
5035 LOCATE 9, 4: PRINT "           can be put on the board so as to COMMAND all cells."
5037 LOCATE 10, 4: PRINT "           (Example:For Rooks: 8 rooks placed in a single row)"
5040 LOCATE 11, 4: PRINT "           (Solution required for King, Queen, Bishop & Knight.)"
5050 LOCATE 13, 4: PRINT "Problem 2: As above but with the proviso that they will also"
5055 LOCATE 14, 4: PRINT "           PROTECT one another & COMMAND all unoccupied cells."
5057 LOCATE 15, 4: PRINT "           (Example:For Rooks: 8 rooks placed in a single row)"
5060 LOCATE 16, 4: PRINT "           (Solution required for Queen, Bishop & Knight.)"
5070 LOCATE 18, 4: PRINT "Problem 3: To place 8 Queens on the Board so that no Queen"
5075 LOCATE 19, 4: PRINT "           can take another."
5080 LOCATE 21, 4: PRINT "The problems have more than 1 solution. If you wish to see a solution:"
5090 COLOR 4: LOCATE 9, 72: PRINT "  1  "
5091         LOCATE 14, 72: PRINT "  2  "
5093        : LOCATE 18, 72: PRINT "  3  "
5095 COLOR 20: LOCATE 23, 4: PRINT "           Press 1 or 2 or 3:... To Quit Press <ESC>"
5100 I$ = INKEY$: IF I$ = CHR$(27) GOTO 6000
5120 IF VAL(I$) < 1 OR VAL(I$) > 3 THEN 5100
5130 COLOR 1
5150 IF I$ = "1" THEN 6100
5155 IF I$ = "2" THEN 6500
5160 IF I$ = "3" THEN 7000
5999 '
6000 REM quit
6010 CLS : LOAD "smenu5", R
6050 '
6099 '
6100 REM placement K,Q,B,N command only
6120 FOR SP = 23 TO 6 STEP -1: LOCATE SP, 1: PRINT SPACE$(79): NEXT
6125 LOCATE 7, 5: PRINT "The problem is to determine the MINIMUM number of pieces that can"
6126 LOCATE 8, 6: PRINT "be put on the board so as to COMMAND (or occupy) ALL the cells."
6130 LOCATE 11, 15: PRINT "For placement of KINGS        -   input k"
6135 LOCATE 13, 15: PRINT "For placement of QUEENS       -   input q"
6140 LOCATE 15, 15: PRINT "For placement of BISHOPS      -   input b"
6150 LOCATE 17, 15: PRINT "For placement of KNIGHTS      -   input n"
6155 COLOR 20: LOCATE 21, 18: PRINT "PRESS k OR q OR b OR n  OR <ESC> to QUIT"
6160 I$ = INKEY$: IF I$ = CHR$(27) THEN 5000
6165 IF I$ <> "k" AND I$ <> "q" AND I$ <> "b" AND I$ <> "n" THEN 6160
6170 IF I$ = "k" THEN GOSUB 6200
6171 IF I$ = "q" THEN GOSUB 6250
6172 IF I$ = "b" THEN GOSUB 6300
6173 IF I$ = "n" THEN GOSUB 6350
6180 SCREEN 0, 0: WIDTH 80: COLOR 1, 3, 3: CLS
6182 COLOR 14: LOCATE 2, 28: PRINT "CHESS  RECREATIONS": COLOR 4
6183 LOCATE 4, 28: PRINT "Placement Problems": COLOR 1
6185 GOTO 6100
6200 REM Command only-KINGS(k)
6210 GOSUB 8000        'chesboard
6215 PSET (60, 160), 8: DRAW KW$
6217 PSET (60, 100), 8: DRAW KW$
6219 PSET (60, 40), 8: DRAW KW$
6221 PSET (120, 160), 8: DRAW KW$
6223 PSET (120, 100), 8: DRAW KW$
6225 PSET (120, 40), 8: DRAW KW$
6227 PSET (180, 160), 8: DRAW KW$
6229 PSET (180, 100), 8: DRAW KW$
6231 PSET (180, 40), 8: DRAW KW$
6232 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6233 LOCATE 17, 31: PRINT "   9"
6234 LOCATE 19, 31: PRINT " Kings": COLOR 5
6235 LOCATE 23, 8: PRINT "Press return when done"
6240 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6240
6245 RETURN
6249 '
6250 REM Command only-Queens(q)
6260 GOSUB 8000        'chesboard
6265 PSET (60, 20), 8: DRAW QW$
6267 PSET (100, 80), 8: DRAW QW$
6269 PSET (120, 160), 8: DRAW QW$
6271 PSET (180, 60), 8: DRAW QW$
6273 PSET (200, 140), 8: DRAW QW$
6282 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6283 LOCATE 17, 31: PRINT "   5"
6284 LOCATE 19, 31: PRINT "Queens"
6285 LOCATE 23, 8: PRINT "Press return when done": COLOR 1
6290 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6290
6295 RETURN
6299 '                                                                         `
6300 REM Command only-BISHOPs(b)
6310 GOSUB 8000        'chesboard
6315 PSET (120, 160), 8: DRAW BB$
6317 PSET (120, 140), 8: DRAW BB$
6319 PSET (120, 120), 8: DRAW BB$
6321 PSET (120, 100), 8: DRAW BB$
6323 PSET (120, 80), 8: DRAW BB$
6325 PSET (120, 60), 8: DRAW BB$
6327 PSET (120, 40), 8: DRAW BB$
6329 PSET (120, 20), 8: DRAW BB$
6331 'PSET(180, 40),8:DRAW bB$
6332 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6333 LOCATE 17, 31: PRINT "   8"
6334 LOCATE 19, 31: PRINT "Bishops": COLOR 1
6335 LOCATE 23, 8: PRINT "Press return when done"
6340 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6340
6345 RETURN
6349 '
6350 REM Command only-Knights(n)
6360 GOSUB 8000        'chesboard
6365 PSET (80, 60), 8: DRAW NB$
6366 PSET (100, 60), 8: DRAW NB$
6367 PSET (100, 80), 8: DRAW NB$
6368 PSET (100, 120), 8: DRAW NB$
6369 PSET (100, 140), 8: DRAW NB$
6370 PSET (120, 120), 8: DRAW NB$
6371 PSET (140, 60), 8: DRAW NB$
6372 PSET (160, 40), 8: DRAW NB$
6373 PSET (160, 60), 8: DRAW NB$
6374 PSET (160, 100), 8: DRAW NB$
6375 PSET (160, 120), 8: DRAW NB$
6376 PSET (180, 120), 8: DRAW NB$
6382 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6383 LOCATE 17, 31: PRINT "  12"
6384 LOCATE 19, 31: PRINT "Knights": COLOR 1
6385 LOCATE 23, 8: PRINT "Press return when done"
6390 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6390
6395 RETURN
6399 '                                                                         `
6500 REM placement Q,B,N command & Protect
6520 FOR SP = 23 TO 6 STEP -1: LOCATE SP, 1: PRINT SPACE$(79): NEXT
6525 LOCATE 7, 5: PRINT "The problem is to determine the MINIMUM number of pieces that can"
6526 LOCATE 8, 6: PRINT "be put on the board so as to COMMAND (or occupy) ALL the cells"
6528 LOCATE 9, 25: PRINT "AND PROTECT each other."
6535 LOCATE 13, 15: PRINT "For placement of QUEENS       -   input q"
6540 LOCATE 15, 15: PRINT "For placement of BISHOPS      -   input b"
6550 LOCATE 17, 15: PRINT "For placement of KNIGHTS      -   input n"
6555 COLOR 20: LOCATE 21, 22: PRINT "PRESS q OR b OR n  OR <ESC> to QUIT"
6560 E$ = INKEY$: IF E$ = CHR$(27) THEN 5000
6565 IF E$ <> "q" AND E$ <> "b" AND E$ <> "n" THEN 6560
6571 IF E$ = "q" THEN GOSUB 6600
6572 IF E$ = "b" THEN GOSUB 6700
6573 IF E$ = "n" THEN GOSUB 6800
6580 SCREEN 0, 0: WIDTH 80: COLOR 1, 3, 3: CLS
6582 COLOR 14: LOCATE 2, 28: PRINT "CHESS  RECREATIONS": COLOR 4
6583 LOCATE 4, 28: PRINT "Placement Problems": COLOR 1
6584 GOTO 6500
6600 REM Command and Protect-Queens(q)
6610 GOSUB 8000        'chesboard
6615 PSET (80, 100), 8: DRAW QB$
6617 PSET (100, 100), 8: DRAW QW$
6619 PSET (120, 100), 8: DRAW QW$
6621 PSET (140, 100), 8: DRAW QW$
6623 PSET (200, 100), 8: DRAW QW$
6632 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6633 LOCATE 17, 31: PRINT "   5"
6634 LOCATE 19, 31: PRINT "Queens": COLOR 1
6635 LOCATE 23, 8: PRINT "Press return when done"
6640 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6640
6695 RETURN
6699 '                                                                         `
6700 REM Command and Protect-Bishops(b)
6710 GOSUB 8000        'chesboard
6713 PSET (80, 100), 8: DRAW BW$
6715 PSET (100, 100), 8: DRAW BW$
6717 PSET (120, 100), 8: DRAW BW$
6719 PSET (160, 100), 8: DRAW BW$
6721 PSET (180, 100), 8: DRAW BW$
6723 PSET (80, 80), 8: DRAW BW$
6725 PSET (100, 80), 8: DRAW BW$
6727 PSET (120, 80), 8: DRAW BW$
6729 PSET (160, 80), 8: DRAW BW$
6731 PSET (180, 80), 8: DRAW BW$
6732 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6733 LOCATE 17, 31: PRINT "  10"
6734 LOCATE 19, 31: PRINT "Bishops": COLOR 1
6735 LOCATE 23, 8: PRINT "Press return when done"
6740 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6740
6795 RETURN
6799 '                                                                         `
6800 REM Command and Protect-Knights(n)
6810 GOSUB 8000        'chesboard
6811 PSET (100, 140), 8: DRAW NW$
6813 PSET (100, 120), 8: DRAW NW$
6815 PSET (100, 60), 8: DRAW NW$
6816 PSET (100, 40), 8: DRAW NW$
6817 PSET (120, 120), 8: DRAW NW$
6819 PSET (120, 100), 8: DRAW NW$
6821 PSET (120, 80), 8: DRAW NW$
6823 PSET (120, 60), 8: DRAW NW$
6825 PSET (160, 120), 8: DRAW NW$
6827 PSET (160, 100), 8: DRAW NW$
6829 PSET (160, 80), 8: DRAW NW$
6831 PSET (160, 60), 8: DRAW NW$
6832 PSET (180, 120), 8: DRAW NW$
6833 PSET (180, 60), 8: DRAW NW$
6835 COLOR 4: LOCATE 15, 31: PRINT "MINIMUM"
6836 LOCATE 17, 31: PRINT "  14"
6837 LOCATE 19, 31: PRINT "Knights": COLOR 1
6838 LOCATE 23, 8: PRINT "Press return when done"
6840 A$ = INKEY$: IF A$ <> CHR$(13) THEN 6740
6895 RETURN
6899 '                                                                         `
7000 REM placement of 8 queens
7020 FOR SP = 23 TO 6 STEP -1: LOCATE SP, 1: PRINT SPACE$(79): NEXT
7025 LOCATE 7, 11: PRINT "The problem is to place 8 Queens on a chess-board in such"
7026 LOCATE 9, 11: PRINT "manner that no queen can capture any other on the board."
7028 LOCATE 11, 11: PRINT "This is  one of the classical problems which has led to"
7030 LOCATE 13, 11: PRINT "plenty of mathematical analysis but we will just stick"
7032 LOCATE 15, 13: PRINT "to one of the simple solutions for placement only."
7042 COLOR 20: LOCATE 19, 14: PRINT "Please input `y' to see, or..press <ESC> to QUIT"; ""
7050 J$ = INKEY$: IF J$ = CHR$(27) THEN 5000
7060 IF J$ <> "y" THEN 7050
7100 CLS : GOSUB 8000
7150 PSET (60, 100), 8: DRAW QB$
7152 PSET (80, 60), 8: DRAW QB$
7154 PSET (100, 20), 8: DRAW QB$
7156 PSET (120, 140), 8: DRAW QB$
7158 PSET (140, 40), 8: DRAW QB$
7160 PSET (160, 160), 8: DRAW QB$
7162 PSET (180, 120), 8: DRAW QB$
7164 PSET (200, 80), 8: DRAW QB$
7180 LOCATE 23, 8: PRINT "Press return when done"
7200 I$ = INKEY$: IF I$ <> CHR$(13) THEN 7200
7210 GOTO 5000
7999 STOP
8000 REM THE CHESS BOARD
8005 SCREEN 7: COLOR 8, 7
8010 REM Horizontal Barlines(magenta)
8020 FOR Y = 10 TO 170 STEP 20 '9 hor
8030 LINE (60, Y)-(220, Y), 5: NEXT
8040 '
8050 REM Vertical Barlines(magenta)
8060 FOR X = 60 TO 220 STEP 20 '9 ver
8070 LINE (X, 10)-(X, 170), 5: NEXT
8080 '
8090 REM the white(yellow) chequered SW$
8100 REM the Black(cyan) chequered SL$
8110 '
8120 REM all white(yellow squares)with sw$
8130 FOR X = 60 TO 180 STEP 40
8140 FOR Y = 10 TO 150 STEP 40: PSET (X, Y): DRAW SW$: NEXT: NEXT
8150 FOR X = 80 TO 200 STEP 40
8160 FOR Y = 30 TO 170 STEP 40: PSET (X, Y): DRAW SW$: NEXT: NEXT
8170 '
8180 REM all black(cyan squares ) with sB$
8190 FOR X = 80 TO 200 STEP 40
8200 FOR Y = 10 TO 150 STEP 40: PSET (X, Y): DRAW SB$: NEXT: NEXT
8210 FOR X = 60 TO 180 STEP 40
8220 FOR Y = 30 TO 170 STEP 40: PSET (X, Y): DRAW SB$: NEXT: NEXT
8230 '
8240 REM Colours of the cells B or W - Cell$(column,row)
8250 FOR I = 1 TO 8 STEP 2
8260  FOR J = 2 TO 8 STEP 2
8270   CELL$(I, J) = "W"
8280 NEXT: NEXT
8290 FOR I = 2 TO 8 STEP 2
8300  FOR J = 1 TO 8 STEP 2
8310   CELL$(I, J) = "W"
8320 NEXT: NEXT
8330 FOR I = 1 TO 8 STEP 2
8340  FOR J = 1 TO 8 STEP 2
8350   CELL$(I, J) = "B"
8360 NEXT: NEXT
8370 FOR I = 2 TO 8 STEP 2
8380  FOR J = 2 TO 8 STEP 2
8390   CELL$(I, J) = "B"
8400 NEXT: NEXT
8410 RETURN
