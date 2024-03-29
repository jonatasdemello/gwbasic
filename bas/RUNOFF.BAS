10 REM  RUNOFF - A simple text formatter      February, 1982
20 REM
30 REM  COPYRIGHT 1982 John M. Nevison Associates, Concord, Mass.
32 REM  
34 REM  Timothy J. Stein
36 REM  John M. Nevison Associates
38 REM  Concord, Mass. 01742
40 REM  (617) 369 4214
42 REM
44 REM  Takes a text file and formats it for output to a line
46 REM  printer, screen, or another file. All lines starting with
48 REM  a period are considered formatting commands. The program
50 REM  recognizes these commands:
52 REM          .PAGE or .P             Force a new page
54 REM          .SPACING n or .S n      Set line spacing to n
56 REM          .LEFTMARGIN n or .LM n  Set left margin to column n
58 REM          .RIGHTMARGIN n or .RM n Set right margin to column n
60 REM          .JUSTIFY or .J          Fill lines to fit
62 REM          .NOJUSTIFY or .NJ       Don't bother
64 REM          .CENTER or .C           Center all lines
66 REM          .NOCENTER or .NC        Don't center any more
68 REM          .INCLUDE file or
70 REM            .I file               Read text from file specified
72 REM  
73 REM  A few notes:
74 REM  1. The program does not reassemble lines. If a line is longer
75 REM     than the distance from LM to RM it will be truncated.
76 REM     It will also not be justified or centered.
77 REM  2. The INCLUDE command cannot be nested. That is, an INCLUDED
78 REM     file cannot contain an INCLUDE command.
79 REM
80 REM  MAJOR VARIABLES:
81 REM          L$              The current line
82 REM          PAGE$           One page of lines
83 REM          V.xxx           Values used globally
84 REM          S.xxx           Switches used globally
85 REM
87 'PAGE
90 '------------------------------------------------------------------------
91 ' MAIN LOOP
92 '
93 ' 1. Set up initial values, get command names
94 ' 2. Get file names
95 ' 3. IF input file entered THEN
96 '      UNTIL eof seen on input file
97 '      1. Get a page of text
98 '      2. Send it out
99 ' 4. Close files and exit
100 '-----------------------------------------------------------------------
102 '
105 GOSUB 500                           'Initialize
110 GOSUB 2000                          'Get file names
120 IF INFILE$ = "" THEN 200
130   GOSUB 5000                        'Assemble a page
140   GOSUB 11000                       'Print it out
150   IF S.EOF = 0 THEN 130              'Until EOF
160 CLOSE
200 '
210 SYSTEM
390 'PAGE
400 '------------------------------------------------------------------------
500 'SUB: Initialize
510 '------------------------------------------------------------------------
515 '
520 DIM PAGE$(60)               'page of text
530 S.JUSTIFY = 0               'justify off
540 S.CENTER = 0                'center off
550 S.EOF = 0                   'not eof yet
560 S.PAGE = 0                  'not end of page yet
565 V.PAGE = 1                  'page number
567 V.INF = 1                   'current input file number
570 V.LM = 10                   'left margin value
580 V.RM = 70                   'right margin value
585 V.COL = V.RM - V.LM + 1     'current column width
590 V.SPACING = 1               'single spacing value
595 V.CC$ = "."                 'command character
597 V.PAGESIZE = 50             'page length
600 '
605 DATA 9 
606                             'number of commands (DIM if greater than 10)
610 DATA PAGE, P
620 DATA SPACING, S
630 DATA LEFTMARGIN, LM
640 DATA RIGHTMARGIN, RM
650 DATA JUSTIFY,J
660 DATA NOJUSTIFY, NJ
670 DATA CENTER, C
680 DATA NOCENTER, NC
685 DATA INCLUDE, I
690 '
700 READ NCMDS
710 FOR I = 1 TO NCMDS
720   READ CMD$(I), CMDA$(I)
730 NEXT I
740 '
750 RETURN
1900 'PAGE
1910 '-----------------------------------------------------------------------
1920 ' SUB: Get file names
1921 '      IN: none
1922 '     OUT: infile$ - input file name (null if none typed)
1930 '----------------------------------------------------------------------
1990 '
2000 CLS
2100 LOCATE 10,26
2110 INPUT "File: "; INFILE$
2120 IF INFILE$ = "" THEN 2410                'return
2130 ON ERROR GOTO 2160
2140 OPEN INFILE$ FOR INPUT AS #1
2150 GOTO 2220
2160 LOCATE 11,26
2170   IF ERR = 53 THEN 2200
2180      PRINT "File open error ";ERR
2190      GOTO 2210
2200   PRINT "No such file"
2210   RESUME 2100
2220 '
2225 V.INF = 1
2230 LOCATE 11,26
2240 INPUT "Output device: ";O$
2250 ON ERROR GOTO 2280
2260 OPEN O$ FOR OUTPUT AS #2
2270 GOTO 2310
2280   LOCATE 12,26
2290   PRINT "Illegal device, error ";ERR
2300   RESUME 2230
2310 '
2311 IF LEFT$(O$,3) <> "LPT" AND LEFT$(O$,3) <> "lpt" THEN 2318
2312    A$=CHR$(27)+"D"
2313    LPRINT A$;
2314    FOR I = 8 TO 64 STEP 8
2315      LPRINT CHR$(I);
2316    NEXT I
2317    PRINT #2,CHR$(0);
2318 '
2319 ON ERROR GOTO 0
2320 LOCATE 12,26
2330 PRINT "                              "
2410 RETURN
4900 'PAGE
4910 '-----------------------------------------------------------------------
5000 'SUB: Assemble a page
5001 '     IN: v.inf - input file number
5002 '    OUT: s.eof - if end of input file seen
5003 '         s.page - if .page command seen
5004 '         v.inf - changed if .include command seen
5005 '         linecount - number of lines this page
5006 '         page() - assembled page
5007 '-----------------------------------------------------------------------
5010 '
5020 LINECOUNT = 0
5030 GOSUB 5500                         'Get a good line
5040   IF S.EOF = 1 OR S.PAGE = 1 THEN 5100
5045     IF S.GOODLINE = 0 THEN 5070
5050       GOSUB 6000                    'Insert a line in the page
5060       IF LINECOUNT >= V.PAGESIZE THEN 5100
5070 GOTO 5030
5100 '
5110 RETURN
5400 'PAGE
5410 '-----------------------------------------------------------------------
5500 'SUB: Get a good line
5501 '     IN: v.inf - input file number
5502 '    OUT: l$ - line
5503 '         s.goodline - 0 if no text line, 1 if so
5504 '         v.inf - may have changed if .include seen
5505 '         s.eof - may be set if end of file seen
5507 '   NOTE: also processes commands seen; if .justify or .center are
5508 '         in effect, l$ is returned as justified or centered.
5509 '-----------------------------------------------------------------------
5510 '
5515 S.GOODLINE = 0
5520 IF EOF(V.INF) THEN 5585
5530   LINE INPUT #V.INF,L$
5540   LLEN = LEN(L$)
5550   IF LEFT$(L$,1) <> V.CC$ THEN 5560
5553     GOSUB 6500                     'Do command
5555     GOTO 5600
5560   IF S.JUSTIFY = 1 THEN GOSUB 8000 'Justify
5570   IF S.CENTER = 1 THEN GOSUB 8500  'Center line
5575   S.GOODLINE = 1
5580   GOTO 5600
5585 '
5587 IF V.INF = 1 THEN 5595
5589   CLOSE V.INF
5591   V.INF = 1
5593   GOTO 5520
5595 '
5597 S.EOF = 1
5600 '
5610 RETURN
5900 'PAGE
5910 '-----------------------------------------------------------------------
6000 'SUB: Insert a line
6001 '     IN: l$ - line to be inserted
6002 '         linecount - current number of lines this page
6003 '    OUT: page$() - page array
6004 '         linecount - modified to reflect line plus spacing
6005 '-----------------------------------------------------------------------
6010 '
6020 LINECOUNT = LINECOUNT + 1
6030 PAGE$(LINECOUNT) = LEFT$((SPACE$(V.LM-1) + L$),V.RM)
6040 IF V.SPACING <= 1 THEN 6100
6050   FOR I = 1 TO V.SPACING - 1
6060     LINECOUNT = LINECOUNT + 1
6070     PAGE$(LINECOUNT) = " "
6080   NEXT I
6100 '
6110 RETURN
6400 'PAGE
6410 '-----------------------------------------------------------------------
6500 'SUB: Do command
6501 '     IN: l$ - line with command on it (first char is ".")
6502 '    OUT: none
6503 '   NOTE: as side effect, the command is done
6504 '-----------------------------------------------------------------------
6510 '
6520 TPOS = 2
6530 GOSUB 9000                         'Get token
6540 IF TOKEN$ = "" THEN 6610
6550   FOR I = 1 TO NCMDS
6560     IF CMD$(I) = TOKEN$ THEN 6650
6570   NEXT I
6580   FOR I = 1 TO NCMDS
6590     IF CMDA$(I) = TOKEN$ THEN 6650
6600   NEXT I
6610   ERRX$ = "Illegal command <" + TOKEN$ + ">"
6620   GOSUB 10000                      'Print error
6630   GOTO 6690
6650 '
6660 ON I GOSUB 6700, 6800, 6900, 7000, 7100, 7200, 7300, 7400, 7500
6670 '
6690 RETURN
6695 'PAGE
6697 '-----------------------------------------------------------------------
6700 'SUB: page eject
6701 '-----------------------------------------------------------------------
6710 '
6720 S.PAGE = 1
6730 RETURN
6740 '
6790 '-----------------------------------------------------------------------
6800 'SUB: spacing
6801 '-----------------------------------------------------------------------
6810 '
6820 GOSUB 9300                         'Get value
6830 IF VALUE = -.001 THEN VALUE = 1
6840   V.SPACING = VALUE
6850 RETURN
6860 '
6890 '-----------------------------------------------------------------------
6900 'SUB: left margin
6901 '-----------------------------------------------------------------------
6910 '
6920 GOSUB 9300
6930 IF VALUE = -.001 THEN VALUE = 1
6940   IF V.RM > VALUE THEN 6947
6942      ERROR$ = "Left margin greater than right margin"
6944      GOSUB 10000
6946      GOTO 6950
6947   V.LM = VALUE
6948   V.COL = V.RM - V.LM + 1
6950 RETURN
6960 '
6990 '-----------------------------------------------------------------------
7000 'SUB: right margin
7001 '-----------------------------------------------------------------------
7010 '
7020 GOSUB 9300
7030 IF VALUE = -.001 THEN VALUE = 1
7040   IF V.LM < VALUE THEN 7047
7042      ERROR$ = "Left margin greater than right margin"
7044      GOSUB 10000
7046      GOTO 7050
7047   V.RM = VALUE
7048   V.COL = V.RM - V.LM + 1
7050 RETURN
7060 '
7090 '-----------------------------------------------------------------------
7100 'SUB: justify
7101 '-----------------------------------------------------------------------
7110 '
7120 S.JUSTIFY = 1
7130 RETURN
7140 '
7190 '-----------------------------------------------------------------------
7200 'SUB: nojustify
7201 '-----------------------------------------------------------------------
7210 '
7220 S.JUSTIFY = 0
7230 RETURN
7240 '
7290 '-----------------------------------------------------------------------
7300 'SUB: center
7301 '-----------------------------------------------------------------------
7310 '
7320 S.CENTER = 1
7330 RETURN
7340 '
7390 '-----------------------------------------------------------------------
7400 'SUB: nocenter
7401 '-----------------------------------------------------------------------
7410 '
7420 S.CENTER = 0
7430 RETURN
7440 'PAGE
7490 '-----------------------------------------------------------------------
7500 'SUB: include
7501 '-----------------------------------------------------------------------
7510 '
7512 IF V.INF = 1 THEN 7520
7514   ERRX$ = "Cannot nest .include files"
7516   GOSUB 10000
7518   GOTO 7650
7520 GOSUB 9000                         'Get token
7530 ON ERROR GOTO 7560
7540 OPEN TOKEN$ FOR INPUT AS #3
7550   GOTO 7600
7560 ON ERROR GOTO 0
7570 ERRX$ = "Error opening .include file " + TOKEN$
7580 GOSUB 10000
7590 GOTO 7650
7600 '
7610 V.INF = 3
7620 '
7650 RETURN
7900 'PAGE
7910 '-----------------------------------------------------------------------
8000 'SUB: JUSTIFY
8001 '     IN: l$ - line to justify
8002 '         v.col - column width
8003 '    OUT: l$ - line justified
8004 '-----------------------------------------------------------------------
8010 '
8020 SCOUNT = 0
8030 FOR I = 1 TO LLEN
8040   IF MID$(L$,I,1) = " " THEN SCOUNT = SCOUNT + 1
8050 NEXT I
8060 IF SCOUNT = 0 THEN 8400
8070   LET SLOP = V.COL - LLEN
8080   IF SLOP <= 0 THEN 8400
8090   LET SSIZE = INT(SLOP/SCOUNT)
8100   LET SREM = SLOP - SSIZE * SCOUNT
8110   L2$ = L$
8120   L$ = ""
8130   FOR I = 1 TO LLEN
8140     X$ = MID$(L2$,I,1)
8150     L$ = L$ + X$
8160     IF X$ = " " THEN 8190
8180       GOTO 8300
8190     'else
8200       FOR J = 1 TO SSIZE
8210         L$ = L$ + " "
8230       NEXT J
8240       IF SREM <= 0 THEN 8300
8250         L$ = L$ + " "
8260         SREM = SREM - 1
8300   NEXT I
8310   LLEN = LEN(L$)
8320 '
8400 RETURN
8490 'PAGE
8495 '-----------------------------------------------------------------------
8500 'SUB: Center 
8501 '     IN: l$ - line to center
8502 '         v.col - column width
8503 '    OUT: l$ - line center
8504 '-----------------------------------------------------------------------
8510  '
8520 SLOP = V.COL - LLEN
8530 IF SLOP <= 0 THEN 8700
8540   L$ = SPACE$(SLOP/2) + L$
8550   LLEN = LEN(L$)
8560 '
8700 RETURN
8900 'PAGE
8910 '-----------------------------------------------------------------------
9000 'SUB: Get token
9001 '     IN: l$ - line in which to look for token
9002 '         tpos - character to start the search
9003 '         llen - length of line
9004 '    OUT: token$ - token found, or null if none
9005 '         tpos - moved to point to char after token
9007 '   NOTE: tokens delimited by spaces, leading spaces ignored, all
9008 '         alpha characters shift to upper case
9009 '-----------------------------------------------------------------------
9010 '
9020 TOKEN$ = ""
9030 FOR I = TPOS TO LLEN
9040   X$ = MID$(L$,I,1)
9050   IF X$ <> " " THEN 9080
9060 NEXT I
9070 GOTO 9250
9080 '
9090 FPOS = I
9100   FOR I = FPOS TO LLEN
9110     X$ = MID$(L$,I,1)
9120     IF X$ = " " THEN 9140
9130   NEXT I
9140 '
9150 TPOS = I + 1
9160 TOKEN$ = MID$(L$,FPOS,TPOS-FPOS-1)
9162 X = LEN(TOKEN$)
9164 FOR I = 1 TO X
9165   X$ = MID$(TOKEN$,I,1)
9166   IF X$ < "a" OR X$ > "z" THEN 9169
9167     X$ = CHR$(ASC(X$) - 32)
9168     MID$(TOKEN$,I,1) = X$
9169 NEXT I
9170 '
9250 RETURN
9290 'PAGE
9295 '-----------------------------------------------------------------------
9300 'SUB: get value
9301 '     IN: l$ - line to find value on
9302 '         tpos - place to start search
9303 '    OUT: value - numeric value of next token, or -.001 if none
9304 '         tpos - updated to point after token
9305 '-----------------------------------------------------------------------
9310 '
9320 GOSUB 9000                         'Get token
9330 ON ERROR GOTO 9400
9340   VALUE = VAL(TOKEN$)
9350   GOTO 9450
9400 RESUME 9410
9410 VALUE = -.001
9420 '
9450 ON ERROR GOTO 0
9460 RETURN
9470 '
9900 'PAGE
9910 '-----------------------------------------------------------------------
10000 'SUB: print errors
10001 '----------------------------------------------------------------------
10010 '
10020 PRINT "ERROR: ";ERRX$;" in this line: "
10030 PRINT "   ";L$
10040 RETURN
11000 'SUB: print a page
11001 '     IN: page$() - page array
11002 '         linecount - number of lines assembled for this page
11003 '         v.page - current page number
11004 '    OUT: v.page - next page number
11005 '         s.page - reset to 0
11006 '----------------------------------------------------------------------
11010 '
11020 IF LINECOUNT > V.PAGESIZE THEN LINECOUNT = V.PAGESIZE
11030 FOR I = 1 TO LINECOUNT
11040   PRINT #2,PAGE$(I)
11050 NEXT I
11060 FOR I = 1 TO V.PAGESIZE - LINECOUNT + 4
11070   PRINT #2," "
11080 NEXT I
11090 PRINT #2,SPACE$((V.RM - 7)/2);"--";V.PAGE;"--"
11100 V.PAGE = V.PAGE + 1
11110 PRINT #2,CHR$(12)
11120 S.PAGE = 0
11130 RETURN
11140 END
11900 'PAGE
11910 '----------------------------------------------------------------------
