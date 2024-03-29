10 KEY OFF: CLS : LOCATE 1, 22: PRINT "HEARING EVALUATION"
20  LOCATE 2, 24: PRINT "E. WEISSBERGER"
30 LOCATE 3, 24: PRINT "version 6-15-82"
40 COLOR 0, 7, 0
50 PRINT " While this evaluation may be interesting, it is not a medically "
60 PRINT "                   sound evaluation.                             "
70 COLOR 7, 0, 0
80 PRINT
90 PRINT "You will hear a tone (or not hear it) depending on your hearing."
100 PRINT "Your response will be monitored to control tone frequency."
110 COLOR 0, 7, 0
120 PRINT " Indicate that you hear the tone by typing Y "
130 COLOR 7, 0, 0
140 LOCATE 15, 15: PRINT "Type any key to continue"
150 A$ = INKEY$: IF A$ = "" THEN 150 ELSE 160
160 CLS : INPUT "What is your first name? ", N$
170 FOR I = 1 TO 1000: NEXT I
180 R = 1000: S = 125
190 FOR I = 5 TO 30 STEP 1
200 STOP: TIME$ = "00:00:00"
210 SOUND I * R, 50
220 A$ = INKEY$: IF A$ = "" AND TIME$ < "00:00:05" THEN 220 ELSE IF A$ = "Y" OR A$ = "y" GOTO 240 ELSE IF TIME$ >= "00:00:05" THEN GOTO 230
230 F1 = I - 1: I = 30
240 NEXT I
250 FOR J = 1 TO 7
260 TIME$ = "00:00:00"
270 SOUND (F1 * R + J * S), 50
280 A$ = INKEY$: IF A$ = "" AND TIME$ < "00:00:05" THEN 280 ELSE IF A$ = "Y" OR A$ = "y" GOTO 300 ELSE IF TIME$ >= "00:00:05" THEN GOTO 290
290 F2 = J - 1: J = 7
300 NEXT J
310 FR = R * F1 + S * F2
320 PRINT USING "&, your upper hearing limit is ##### hertz "; N$; FR
330 PRINT
340 PRINT "Will you run this program again (Y/N)?"
350 A$ = INKEY$: IF A$ = "" THEN 350 ELSE IF A$ = "Y" OR A$ = "y" THEN CLS : GOTO 190 ELSE CLS : KEY ON: END

