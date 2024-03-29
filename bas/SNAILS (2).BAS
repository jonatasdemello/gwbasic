1 REM A scientist was studying snail populations in a pond.
2 REM The method he used was to capture and paint a dot on
3 REM some snales and release them. He allowed some time for
4 REM the snales to scatter. Then he captured and counted a number
5 REM of snales and counted the ones with and without the dots.
6 REM He then reasoned that the ratio of the ones without dots
7 REM divided by the ones with dots would be the ratio thruout
8 REM the pond, and that the square of all snails marked divided by
10 REM the number of sampled snales marked is a snail population estimate.
11 REM This programs test that assumtion.

100 REM ***** BUILD POND *****
110 DIM P%(100,100)

200 REM ***** FILL WITH 900 SNAILS *****
210 RANDOMIZE TIMER
220 FOR N = 1 TO 900
230 LET X = 1 + (INT (RND * 100))
240 LET Y = 1 + (INT(RND * 100))
250 IF P%(X,Y) = 1 THEN GO TO 230 ' REPEAT IF FULL
260 LET P%(X,Y) = 1
270 NEXT N
300 REM ***** FILL WITH 100 MARKED SNAILS *****
310 FOR N = 1 TO 100
320 LET X = 1 + (INT (RND * 100))
330 LET Y = 1 + (INT(RND * 100))
340 IF P%(X,Y) = 1 THEN GO TO 320 ' REPEAT IF FULL
350 IF P%(X,Y) = 2 THEN GO TO 320 ' REPEAT IF FULL
355 LET P%(X,Y) = 2
360 NEXT N
400 REM ***** PICK 100 SNAILS *****
410 FOR N = 1 TO 100
420 LET X = 1 + (INT (RND * 100))
430 LET Y = 1 + (INT (RND * 100))
440 IF P%(X,Y) = 0 THEN GOTO 420
450 IF P%(X,Y) = 1 THEN LET B = B + 1
460 IF P%(X,Y) = 2 THEN LET M = M + 1
470 NEXT N
480 REM ***** CALCULATE AND DISPLAY *****
485 PRINT ,"REAL","ESTIMATED"

490 PRINT "UNMARKED     (90) ",B
500 PRINT "MARKED       (10) ",M
510 REM TotalMarked * TotalMarked /TotalMarkedPicked = Estimate
520 E = 100 * 100 / M
525 PRINT
530 PRINT "ESTIMATED  ( 1000 )  ", E
540 PRINT
560 END



