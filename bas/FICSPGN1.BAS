1 REM +--------------------------------------------------------------------+
2 REM |                       FICSPGN1.BAS                                 |
3 REM |                                                                    |
3 REM | Version 1 of a GWBASIC Program to convert FIC output files to PGN  | 
4 REM | Written in GWBASIC Version 3.2 : 18 May 1995                       |
5 REM | Requires input file GMS.FIC a lightly edited FICS games file       |
6 REM | Comments, corrections, suggestions to NNs on FICS                  |
7 REM |                                                                    |
8 REM | See file FICSPGN.HLP for information on how to use this program    |
9 REM +--------------------------------------------------------------------+
10 REM
11 REM RR: This is a klunky string handling program.
12 REM It is inelegant. But, hopefully, it will be useful.
13 REM
20 DIM MC$(200), WM$(200), BM$(200) : REM Save space for strings
25 OPEN "I", 2, "GMS.FIC"       : REM Open the pre-prepared games file
26 OPEN "O", 3, "OUTPUT.PGN"    : REM Open the output file
40 LINE INPUT #2, A$                           : REM Read the input file
41 V=VAL(A$)                                   : REM Get its numeric value
42 IF V=999 THEN PRINT "Finished" : STOP       : REM Normal exit found 999 marker
50 X$ = MID$(A$,1,4)                           : REM Get four characters
51 IF X$ = "====" THEN 60 ELSE 52              : REM Test for ====
52 PRINT "Input file not correctly formatted"  : REM ==== not found
53 STOP
60 REM Now get the header line  -- players, ratings and date
61 LINE INPUT #2, H$   : GOSUB 2000        : REM Decompose first header line
69 REM Get the second header line 
70 LINE INPUT #2, T$   : GOSUB 3000        : REM Decompose second header line
80 LINE INPUT #2, A$ : LINE INPUT #2, A$   : REM Skip two unneeded lines
100 J=0                                    : REM Set the move counter to zero
105 GOSUB 4000                    : REM Decompose the game and get the result
120 COUNT = 0                     : REM Reset the output move print counter 
125 GOSUB 1000                    : REM Call the printing subroutine
170 PRINT #3, "     " : PRINT #3, "     " : REM Print a couple of blank lines
180 GOTO 40                               : REM Go back to get next game
500 REM ---------------------------------------------------------------------
1000 REM Subroutine to print PGN Header and game score
1005 REM S$=SITE / D$=Date / W$=White / B$=Black / R$=Result / E$=Event
1010 PRINT #3,  "[Event ";CHR$(34);E$;CHR$(34);"]"      : REM CHR$(34)="
1020 PRINT #3,  "[Site ";CHR$(34);S$;CHR$(34);"]"
1030 PRINT #3,  "[Date ";CHR$(34);D$;CHR$(34);"]"
1040 PRINT #3,  "[Round ";CHR$(34);"?";CHR$(34);"]" 
1050 PRINT #3,  "[White ";CHR$(34);W$;CHR$(34);"]"
1060 PRINT #3,  "[Black ";CHR$(34);B$;CHR$(34);"]"
1070 PRINT #3,  "[Result ";CHR$(34);R$;CHR$(34);"]"
1080 PRINT #3,  "[ECO ";CHR$(34);"?";CHR$(34);"]"
1085 PRINT #3,  "     "
1100 FOR N=1 TO J 
1105 COUNT = COUNT + 1                             : REM Five move pairs
1110 PRINT #3, MC$(N);" ";WM$(N);" ";BM$(N);" ";   : REM printed per line
1120 IF COUNT = 5 THEN PRINT #3, " " : COUNT = 0
1130 NEXT N                                       
1140 PRINT #3, R$                                  : REM print the result
1200 RETURN                                        : REM and go back
1199 REM -------------------------------------------------------------------
2000 REM Subroutine to decompose the header line
2001 REM Includes players names and date played
2010 REM Locate the "vs." to orient us in the first header line
2020 FOR N =  11 TO 30 
2030 TEST$ = MID$(H$,N,3)
2040 IF TEST$ = "vs." THEN 2060    : REM Found it
2050 NEXT N                        : REM keep looking
2060 REM Now find the "---" separator in the header line 
2070 FOR M = 26 TO 45 
2080 TEST2$ = MID$(H$,M,3)
2090 IF TEST2$ = "---" THEN 2100   : REM Found it
2091 NEXT M                        : REM Keep looking        
2100 W$ = LEFT$(H$,N-1)         : REM Get the White player's name and rating
2105 B$ = MID$(H$,N+4,M-N-4)    : REM Get the Black player's name and rating
2110 D1$ = MID$(H$,M+12,1)      : REM First digit of day (might be blank)
2111 D2$ = MID$(H$,M+13,1)      : REM Second digit of day
2115 IF ASC(D1$) = 32 THEN D1$ = "0"   :REM Set blank to zero for PGN 
2116                                   :REM ASC(64) is blank space  
2120 DA$ = D1$ + D2$                   :REM Combine the two digits of the day 
2130 MO$ = MID$(H$,M+8,3)              :REM Get the name of month
2140 IF MO$ = "Jan" THEN MO$ = "01"
2141 IF MO$ = "Feb" THEN MO$ = "02" 
2142 IF MO$ = "Mar" THEN MO$ = "03" 
2143 IF MO$ = "Apr" THEN MO$ = "04"
2144 IF MO$ = "May" THEN MO$ = "05"   :REM Convert month names to digits
2145 IF MO$ = "Jun" THEN MO$ = "06"   :REM according to PGN
2146 IF MO$ = "Jul" THEN MO$ = "07"
2147 IF MO$ = "Aug" THEN MO$ = "08" 
2148 IF MO$ = "Sep" THEN MO$ = "09"
2149 IF MO$ = "Oct" THEN MO$ = "10" 
2150 IF MO$ = "Nov" THEN MO$ = "11" 
2151 IF MO$ = "Dec" THEN MO$ = "12" 
2160 D$ = "1995."+MO$+"."+DA$         :REM Make the complete date string
2161                                  :REM Assumes 1995
2200 RETURN
2999 REM ------------------------------------------------------------------
3000 REM Subroutine to decompose the second header line
3010 FOR N = 25 TO 45  
3020 TEST$ = MID$(T$,N,1)
3030 IF TEST$ = ":" THEN 3040 ELSE NEXT N  : REM Find the first colon
3040 E$ = LEFT$(T$,N-15)                   : REM Find the type of game
3050 INIT$ = MID$(T$,N+1,3)                : REM ... and the intial time
3060 FOR M = N+15 TO N+45                 
3070 TEST2$ = MID$(T$,M,1)
3080 IF TEST2$ = ":" THEN 3090 ELSE NEXT M : REM Find the second colon
3090 INC$ = MID$(T$,M+1,3)                 : REM Get the increment time
3100 E$ = E$ + " Init" + INIT$ + "min Inc" + INC$ + " sec" 
3110 S$ ="Free Internet Chess Server"
3120 RETURN
3199 REM-------------------------------------------------------------------
4000 REM Subroutine to read the lines of the game
4010 LINE INPUT #2, L$
4020 TEST$ = LEFT$(L$,4)                    : REM Check for four blank spaces
4025 IF TEST$ = "    " THEN 4490            : REM Found the result line
4030 J=J+1                                  : REM Increment the move counter
4035 MC$(J) = MID$(L$,2,3)                  : REM get move count 
4036 IF ASC(LEFT$(MC$(J),1)) = 32 THEN MC$(J) = RIGHT$(MC$(J),2)
4037 REM Strip leading blanks from move count 
4040 WM$(J) = MID$(L$,7,7)                  : REM Get white move
4041 BM$(J) = MID$(L$,26,7)                 : REM get black move
4050 FOR N=1 TO 5
4059 REM Strip trailing blanks from white move
4060 IF ASC(RIGHT$(WM$(J),1))=32 THEN WM$(J)=LEFT$(WM$(J),7-N)
4065 IF LEN(L$)<26 THEN BL = 1 : GOTO 4090 : REM Black move absent. Set flag.
4069 REM Strip trailing blanks from black move
4070 IF ASC(RIGHT$(BM$(J),1))=32 THEN BM$(J)=LEFT$(BM$(J),7-N)
4080 NEXT N
4090 GOTO 4010
4100 REM Now test for the various game end conditions
4490 IF MID$(L$,7,9)="Checkmate" AND BL=1 THEN R$="1-0" : BL=0      : RETURN  
4500 IF MID$(L$,7,9)="Checkmate" AND BL=0 THEN R$="0-1"             : RETURN
4510 IF MID$(L$,8,1)="W" AND MID$(L$,14,6)="resign"  THEN R$="0-1"  : RETURN
4520 IF MID$(L$,8,1)="B" AND MID$(L$,14,6)="resign"  THEN R$="1-0"  : RETURN 
4530 IF MID$(L$,8,1)="W" AND MID$(L$,14,7)="ran out" THEN R$="0-1"  : RETURN 
4540 IF MID$(L$,8,1)="B" AND MID$(L$,14,7)="ran out" THEN R$="1-0"  : RETURN
4550 IF MID$(L$,14,15) = "lost connection" THEN R$ = ""             : RETURN 
4560 IF MID$(L$,8,10)  = "A draw was"      THEN R$ = "1/2-1/2"      : RETURN
4570 IF MID$(L$,8,16)  = "Both players ran"THEN R$=  "1/2-1/2"      : RETURN
4780 R$="1/2-1/2"  : REM Assume all others draw (?)
4900 RETURN
