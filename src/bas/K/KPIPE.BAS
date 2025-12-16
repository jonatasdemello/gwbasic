DECLARE SUB drawcursor (x%, y%)
DECLARE SUB clearcursor (x%, y%)
DECLARE SUB youlose ()
DECLARE SUB drawblock (x%, y%, blocknum%)
RANDOMIZE TIMER
SCREEN 12
DIM block%(8, 6), queue%(6)
CONST blocksiz = 64
CONST xcorn = 128
CONST ycorn = 40

FOR z% = 0 TO 7
   FOR zz% = 0 TO 5
      block%(z%, zz%) = 0
   NEXT zz%
NEXT z%

FOR z% = 0 TO 7
   FOR zz% = 0 TO 5
       CALL drawblock(z%, zz%, block%(z%, zz%))
   NEXT zz%
NEXT z%

LOCATE 29, 36: PRINT "Press any key to start!";
DO
   z$ = UCASE$(INKEY$)
LOOP WHILE z$ = ""
LOCATE 29, 36: PRINT "                       ";
IF z$ = "K" THEN evil% = 0 ELSE evil% = 1

IF evil% = 1 THEN
   DO
      startx% = INT(8 * RND): starty% = INT(6 * RND)
   LOOP WHILE startx% <> 0 AND startx% <> 7 AND starty% <> 0 AND starty% <> 5
   DO
      block%(startx%, starty%) = INT(4 * RND) + 8 + 48
      bad% = 0
      IF block%(startx%, starty%) = 56 AND startx% > 0 THEN bad% = 1
      IF block%(startx%, starty%) = 57 AND startx% < 7 THEN bad% = 1
      IF block%(startx%, starty%) = 58 AND starty% > 0 THEN bad% = 1
      IF block%(startx%, starty%) = 59 AND starty% < 5 THEN bad% = 1
   LOOP WHILE bad% = 1
ELSE
   startx% = INT(6 * RND) + 1: starty% = INT(4 * RND) + 1
   block%(startx%, starty%) = INT(4 * RND) + 8 + 48
END IF

CALL drawblock(startx%, starty%, block%(startx%, starty%))

FOR z% = 0 TO 5
   queue%(z%) = INT(7 * RND) + 1
   CALL drawblock(-2, z%, queue%(z%))
NEXT z%
curx% = startx%: cury% = starty%
watx% = startx%: waty% = starty%
watsx% = blocksiz% \ 2: watsy% = blocksiz% \ 2
IF (block%(watx%, waty%) AND 15) = 8 THEN watsxd% = -1: watsyd% = 0
IF (block%(watx%, waty%) AND 15) = 9 THEN watsxd% = 1: watsyd% = 0
IF (block%(watx%, waty%) AND 15) = 10 THEN watsxd% = 0: watsyd% = -1
IF (block%(watx%, waty%) AND 15) = 11 THEN watsxd% = 0: watsyd% = 1
CALL drawcursor(curx%, cury%)
speed% = 4
tim& = TIMER
DO
   z$ = INKEY$
   IF z$ <> "" THEN
      CALL clearcursor(curx%, cury%)
      IF z$ = CHR$(0) + CHR$(75) AND curx% > 0 THEN curx% = curx% - 1
      IF z$ = CHR$(0) + CHR$(77) AND curx% < 7 THEN curx% = curx% + 1
      IF z$ = CHR$(0) + CHR$(72) AND cury% > 0 THEN cury% = cury% - 1
      IF z$ = CHR$(0) + CHR$(80) AND cury% < 5 THEN cury% = cury% + 1
      CALL drawcursor(curx%, cury%)
      IF (z$ = " " OR z$ = CHR$(13)) AND block%(curx%, cury%) < 16 THEN
         block%(curx%, cury%) = queue%(5)
         CALL drawblock(curx%, cury%, block%(curx%, cury%))
         CALL drawcursor(curx%, cury%)
         FOR z% = 5 TO 1 STEP -1
            queue%(z%) = queue%(z% - 1)
         NEXT z%
         queue%(0) = INT(7 * RND) + 1
         FOR z% = 0 TO 5
            CALL drawblock(-2, z%, queue%(z%))
         NEXT z%
      END IF
   END IF
   IF z$ = CHR$(27) THEN speed% = 0
   IF (TIMER - tim& > 4) THEN
      FOR z% = 1 TO speed%
         WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
      NEXT z%
      IF watsx% = blocksiz% \ 2 AND watsy% = blocksiz% \ 2 THEN
         IF (block%(watx%, waty%) AND 15) = 1 THEN
            IF watsxd% = 0 THEN
               watsxd% = -1: watsyd% = 0
            ELSE
               watsxd% = 0: watsyd% = -1
            END IF
         END IF
         IF (block%(watx%, waty%) AND 15) = 2 THEN
            IF watsxd% = 0 THEN
               watsxd% = -1: watsyd% = 0
            ELSE
               watsxd% = 0: watsyd% = 1
            END IF
         END IF
         IF (block%(watx%, waty%) AND 15) = 3 THEN
            IF watsxd% = 0 THEN
               watsxd% = 1: watsyd% = 0
            ELSE
               watsxd% = 0: watsyd% = -1
            END IF
         END IF
         IF (block%(watx%, waty%) AND 15) = 6 THEN
            IF watsxd% = 0 THEN
               watsxd% = 1: watsyd% = 0
            ELSE
               watsxd% = 0: watsyd% = 1
            END IF
         END IF
      END IF
      watsx% = watsx% + watsxd%
      watsy% = watsy% + watsyd%
      IF watsxd% > 0 AND watsx% = 64 THEN
         watsx% = 0
         watx% = watx% + 1
         IF watx% < 8 THEN
            z% = block%(watx%, waty%)
            IF z% <> 1 AND z% <> 2 AND z% <> 5 AND z% <> 7 AND z% <> 7 + 32 THEN CALL youlose
            block%(watx%, waty%) = block%(watx%, waty%) OR 16
         ELSE
            CALL youlose
         END IF
      END IF
      IF watsxd% < 0 AND watsx% = -1 THEN
         watsx% = 63
         watx% = watx% - 1
         IF watx% >= 0 THEN
            z% = block%(watx%, waty%)
            IF z% <> 3 AND z% <> 5 AND z% <> 6 AND z% <> 7 AND z% <> 7 + 32 THEN CALL youlose
            block%(watx%, waty%) = block%(watx%, waty%) OR 16
         ELSE
            CALL youlose
         END IF
      END IF
      IF watsyd% > 0 AND watsy% = 64 THEN
         watsy% = 0
         waty% = waty% + 1
         IF waty% < 6 THEN
            z% = block%(watx%, waty%)
            IF z% <> 1 AND z% <> 3 AND z% <> 4 AND z% <> 7 AND z% <> 7 + 16 THEN CALL youlose
            block%(watx%, waty%) = block%(watx%, waty%) OR 32
         ELSE
            CALL youlose
         END IF
      END IF
      IF watsyd% < 0 AND watsy% = -1 THEN
         watsy% = 63
         waty% = waty% - 1
         IF waty% >= 0 THEN
            z% = block%(watx%, waty%)
            IF z% <> 2 AND z% <> 4 AND z% <> 6 AND z% <> 7 AND z% <> 7 + 16 THEN CALL youlose
            block%(watx%, waty%) = block%(watx%, waty%) OR 32
         ELSE
            CALL youlose
         END IF
      END IF
      IF watsxd% <> 0 THEN
         LINE (watx% * blocksiz% + watsx% + xcorn, waty% * blocksiz% + watsy% + ycorn - 2)-(watx% * blocksiz% + watsx% + xcorn, waty% * blocksiz% + watsy% + ycorn + 2), 12
      ELSE
         LINE (watx% * blocksiz% + watsx% + xcorn - 2, waty% * blocksiz% + watsy% + ycorn)-(watx% * blocksiz% + watsx% + xcorn + 2, waty% * blocksiz% + watsy% + ycorn), 12
      END IF
   END IF
LOOP

SUB clearcursor (x%, y%)
   x1% = x% * blocksiz% + xcorn
   y1% = y% * blocksiz% + ycorn
   x2% = x1% + blocksiz% - 1
   y2% = y1% + blocksiz% - 1
   LINE (x1%, y1%)-(x1% + blocksiz% \ 2 - 4, y1% + 4), 10, BF
   LINE (x1% + blocksiz% \ 2 + 4, y1%)-(x2%, y1% + 4), 10, BF
   LINE (x1%, y2% - 4)-(x1% + blocksiz% \ 2 - 4, y2%), 8, BF
   LINE (x1% + blocksiz% \ 2 + 4, y2% - 4)-(x2%, y2%), 8, BF
   LINE (x1%, y1%)-(x1% + 4, y1% + blocksiz% \ 2 - 4), 10, BF
   LINE (x1%, y1% + blocksiz% \ 2 + 4)-(x1% + 4, y2%), 10, BF
   LINE (x2% - 4, y1%)-(x2%, y1% + blocksiz% \ 2 - 4), 8, BF
   LINE (x2% - 4, y1% + blocksiz% \ 2 + 4)-(x2%, y2%), 8, BF
  
   LINE (x1%, y1%)-(x2%, y1% + 4), 10, BF
   LINE (x1%, y1%)-(x1% + 4, y2%), 10, BF
   LINE (x2%, y2%)-(x2% - 4, y1%), 8, BF
   LINE (x2%, y2%)-(x1%, y2% - 4), 8, BF
   LINE (x2% - 4, y1% + 0)-(x2%, y1% + 0), 10
   LINE (x2% - 4, y1% + 1)-(x2% - 1, y1% + 1), 10
   LINE (x2% - 4, y1% + 2)-(x2% - 2, y1% + 2), 10
   LINE (x2% - 4, y1% + 3)-(x2% - 3, y1% + 3), 10
   LINE (x2% - 4, y1% + 4)-(x2% - 4, y1% + 4), 10
   LINE (x1% + 0, y2% - 4)-(x1% + 0, y2%), 10
   LINE (x1% + 1, y2% - 4)-(x1% + 1, y2% - 1), 10
   LINE (x1% + 2, y2% - 4)-(x1% + 2, y2% - 2), 10
   LINE (x1% + 3, y2% - 4)-(x1% + 3, y2% - 3), 10
   LINE (x1% + 4, y2% - 4)-(x1% + 4, y2% - 4), 10
END SUB

SUB drawblock (x%, y%, blockzz%)
   blocknum% = blockzz% AND 15
   x1% = x% * blocksiz% + xcorn
   y1% = y% * blocksiz% + ycorn
   x2% = x1% + blocksiz% - 1
   y2% = y1% + blocksiz% - 1
   LINE (x1%, y1%)-(x2%, y2%), 2, BF
   IF blocknum% = 1 OR blocknum% = 2 OR blocknum% = 5 OR blocknum% = 7 OR blocknum% = 8 THEN
      LINE (x1%, y1% + blocksiz% \ 2 - 6)-(x1% + blocksiz% \ 2, y1% + blocksiz% \ 2 + 6), 1, BF
   END IF
   IF blocknum% = 3 OR blocknum% = 5 OR blocknum% = 6 OR blocknum% = 7 OR blocknum% = 9 THEN
      LINE (x1% + blocksiz% \ 2, y1% + blocksiz% \ 2 - 6)-(x2%, y1% + blocksiz% \ 2 + 6), 1, BF
   END IF
   IF blocknum% = 1 OR blocknum% = 3 OR blocknum% = 4 OR blocknum% = 7 OR blocknum% = 10 THEN
      LINE (x1% + blocksiz% \ 2 - 6, y1%)-(x1% + blocksiz% \ 2 + 6, y1% + blocksiz% \ 2), 1, BF
   END IF
   IF blocknum% = 2 OR blocknum% = 4 OR blocknum% = 6 OR blocknum% = 7 OR blocknum% = 11 THEN
      LINE (x1% + blocksiz% \ 2 - 6, y1% + blocksiz% \ 2)-(x1% + blocksiz% \ 2 + 6, y2%), 1, BF
   END IF
   IF blocknum% = 6 THEN
      LINE (x1% + blocksiz% \ 2 - 5, y1% + blocksiz% \ 2 - 1)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 - 1), 1
      LINE (x1% + blocksiz% \ 2 - 5, y1% + blocksiz% \ 2 - 2)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 - 2), 1
      LINE (x1% + blocksiz% \ 2 - 4, y1% + blocksiz% \ 2 - 3)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 - 3), 1
      LINE (x1% + blocksiz% \ 2 - 3, y1% + blocksiz% \ 2 - 4)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 - 4), 1
      LINE (x1% + blocksiz% \ 2 - 2, y1% + blocksiz% \ 2 - 5)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 - 5), 1
      LINE (x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 + 7)-(x1% + blocksiz% \ 2 + 9, y1% + blocksiz% \ 2 + 7), 1
      LINE (x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 + 8)-(x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 + 8), 1
      LINE (x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 + 9)-(x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 + 9), 1
   END IF
   IF blocknum% = 2 THEN
      LINE (x1% + blocksiz% \ 2 + 5, y1% + blocksiz% \ 2 - 1)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 - 1), 1
      LINE (x1% + blocksiz% \ 2 + 5, y1% + blocksiz% \ 2 - 2)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 - 2), 1
      LINE (x1% + blocksiz% \ 2 + 4, y1% + blocksiz% \ 2 - 3)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 - 3), 1
      LINE (x1% + blocksiz% \ 2 + 3, y1% + blocksiz% \ 2 - 4)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 - 4), 1
      LINE (x1% + blocksiz% \ 2 + 2, y1% + blocksiz% \ 2 - 5)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 - 5), 1
      LINE (x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 + 7)-(x1% + blocksiz% \ 2 - 9, y1% + blocksiz% \ 2 + 7), 1
      LINE (x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 + 8)-(x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 + 8), 1
      LINE (x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 + 9)-(x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 + 9), 1
   END IF
   IF blocknum% = 3 THEN
      LINE (x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 + 5)-(x1% + blocksiz% \ 2 - 1, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 - 2, y1% + blocksiz% \ 2 + 5)-(x1% + blocksiz% \ 2 - 2, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 - 3, y1% + blocksiz% \ 2 + 4)-(x1% + blocksiz% \ 2 - 3, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 - 4, y1% + blocksiz% \ 2 + 3)-(x1% + blocksiz% \ 2 - 4, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 - 5, y1% + blocksiz% \ 2 + 2)-(x1% + blocksiz% \ 2 - 5, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 + 7, y1% + blocksiz% \ 2 - 9), 1
      LINE (x1% + blocksiz% \ 2 + 8, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 + 8, y1% + blocksiz% \ 2 - 7), 1
      LINE (x1% + blocksiz% \ 2 + 9, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 + 9, y1% + blocksiz% \ 2 - 7), 1
   END IF
   IF blocknum% = 1 THEN
      LINE (x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 + 5)-(x1% + blocksiz% \ 2 + 1, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 + 2, y1% + blocksiz% \ 2 + 5)-(x1% + blocksiz% \ 2 + 2, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 + 3, y1% + blocksiz% \ 2 + 4)-(x1% + blocksiz% \ 2 + 3, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 + 4, y1% + blocksiz% \ 2 + 3)-(x1% + blocksiz% \ 2 + 4, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 + 5, y1% + blocksiz% \ 2 + 2)-(x1% + blocksiz% \ 2 + 5, y1% + blocksiz% \ 2 + 1), 1
      LINE (x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 - 7, y1% + blocksiz% \ 2 - 9), 1
      LINE (x1% + blocksiz% \ 2 - 8, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 - 8, y1% + blocksiz% \ 2 - 7), 1
      LINE (x1% + blocksiz% \ 2 - 9, y1% + blocksiz% \ 2 - 7)-(x1% + blocksiz% \ 2 - 9, y1% + blocksiz% \ 2 - 7), 1
   END IF
   LINE (x1%, y1%)-(x2%, y1% + 4), 10, BF
   LINE (x1%, y1%)-(x1% + 4, y2%), 10, BF
   LINE (x2%, y2%)-(x2% - 4, y1%), 8, BF
   LINE (x2%, y2%)-(x1%, y2% - 4), 8, BF
   LINE (x2% - 4, y1% + 0)-(x2%, y1% + 0), 10
   LINE (x2% - 4, y1% + 1)-(x2% - 1, y1% + 1), 10
   LINE (x2% - 4, y1% + 2)-(x2% - 2, y1% + 2), 10
   LINE (x2% - 4, y1% + 3)-(x2% - 3, y1% + 3), 10
   LINE (x2% - 4, y1% + 4)-(x2% - 4, y1% + 4), 10
   LINE (x1% + 0, y2% - 4)-(x1% + 0, y2%), 10
   LINE (x1% + 1, y2% - 4)-(x1% + 1, y2% - 1), 10
   LINE (x1% + 2, y2% - 4)-(x1% + 2, y2% - 2), 10
   LINE (x1% + 3, y2% - 4)-(x1% + 3, y2% - 3), 10
   LINE (x1% + 4, y2% - 4)-(x1% + 4, y2% - 4), 10
END SUB

SUB drawcursor (x%, y%)
   x1% = x% * blocksiz% + xcorn
   y1% = y% * blocksiz% + ycorn
   x2% = x1% + blocksiz% - 1
   y2% = y1% + blocksiz% - 1
   LINE (x1%, y1%)-(x1% + blocksiz% \ 2 - 4, y1% + 4), 0, BF
   LINE (x1% + blocksiz% \ 2 + 4, y1%)-(x2%, y1% + 4), 0, BF
   LINE (x1%, y2% - 4)-(x1% + blocksiz% \ 2 - 4, y2%), 15, BF
   LINE (x1% + blocksiz% \ 2 + 4, y2% - 4)-(x2%, y2%), 15, BF
   LINE (x1%, y1%)-(x1% + 4, y1% + blocksiz% \ 2 - 4), 0, BF
   LINE (x1%, y1% + blocksiz% \ 2 + 4)-(x1% + 4, y2%), 0, BF
   LINE (x2% - 4, y1%)-(x2%, y1% + blocksiz% \ 2 - 4), 15, BF
   LINE (x2% - 4, y1% + blocksiz% \ 2 + 4)-(x2%, y2%), 15, BF
END SUB

SUB youlose
   LOCATE 14, 43: PRINT "            ";
   LOCATE 15, 43: PRINT "  YOU LOSE  ";
   LOCATE 16, 43: PRINT "            ";
   DO: LOOP WHILE INKEY$ = ""
   END
END SUB

