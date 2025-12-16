DECLARE FUNCTION findbestmove% (a%(), b%(), bx0%, by0%, bx1%, by1%, turn%, recurse%, osc%, obsc%)
DECLARE FUNCTION trymove% (a%(), b%(), x0%, y0%, x1%, y1%, turn%, pat%(), patc%, whitx%, whity%, wbits%())
DECLARE SUB getvisitlaser (a%(), b%(), bx%, by%, bd%, hitx%, hity%, bits%())
DECLARE SUB printsmall (bx%, y%, c%, nam$)
DECLARE SUB domove (a%(), b%(), x0%, y0%, x1%, y1%, turn%)
DECLARE SUB firelaser (a%(), b%(), bx%, by%, bd%, hitx%, hity%, dodraw%)
DECLARE SUB drawboard (a%(), b%())
DECLARE SUB drawpiece (xx!, yy!, a!, b!)
DECLARE SUB initboard (a%(), b%())
DEFINT A-Z
SCREEN 9
CONST BSIZ = 40, XOFF = 120, YOFF = 15, PI = 3.141592653589793#
DIM SHARED pag, recnum

DIM SHARED pow2(16 - 1)
FOR i = 0 TO 14: pow2(i) = 2 ^ i: NEXT: pow2(15) = &H8000
DIM SHARED firex(2 - 1), firey(2 - 1), fired(2 - 1)
firex(0) = 9: firey(0) = 8: fired(0) = 1
firex(1) = 0: firey(1) = -1: fired(1) = 3
DIM SHARED dirx(4 - 1), diry(4 - 1)
dirx(0) = 1: dirx(1) = 0: dirx(2) = -1: dirx(3) = 0
diry(0) = 0: diry(1) = -1: diry(2) = 0: diry(3) = 1
DIM SHARED scv(2 - 1, 9 - 1)
scv(1, 0) = 0: scv(1, 1) = 90: scv(1, 2) = 1: scv(1, 3) = 1: scv(1, 4) = 1
FOR i = 1 TO 4: scv(1, i + 4) = -scv(1, i): NEXT
FOR i = 0 TO 8: scv(0, i) = -scv(1, i): NEXT

DIM playertyp(2 - 1), a(10 - 1, 8 - 1), b(10 - 1, 8 - 1)

   'Based on Deflexion (http://deflexion.biz)
   'Game found & demonstrated by Lynn&Jim Grandpre (04/05/2006)
   'Code started by Marshall and Ken (04/05/2006)
   'Code cleaned & finished by Ken

DIM SHARED smallfnt(64 - 1) AS LONG  '0-63 represent chars: 32-95
FOR z = 0 TO 63: READ smallfnt(z): NEXT z
   '3*5 font, chars:32-95.  HACK: ; looks like a , (Should be &H40480)
DATA 0,&H444040,&HAA0000,&HAFAFA0,&H6C46C0,&HA248A0,&H4A4CE0,&H240000
DATA &H488840,&H422240,&HA4A00,&H4E400,&H224,&HE000,&H40,&H224480
DATA &HEAAAE0,&H444440,&HE2E8E0,&HE2E2E0,&HAAE220,&HE8E2E0,&HE8EAE0,&HE22220
DATA &HEAEAE0,&HEAE220,&H40400,&H224,&H248420,&HE0E00,&H842480,&HC24040
DATA &HEAECE0,&H4AEAA0,&HCACAC0,&H688860,&HCAAAC0,&HE8C8E0,&HE8C880,&HE8AAE0
DATA &HAAEAA0,&HE444E0,&HE22A60,&HAACAA0,&H8888E0,&HAEEAA0,&HAEEEA0,&HEAAAE0
DATA &HEAE880,&HEAAE60,&HEACAA0,&HE8E2E0,&HE44440,&HAAAAE0,&HAAA440,&HAAEEA0
DATA &HAA4AA0,&HAAE440,&HE248E0,&HC888C0,&H844220,&H622260,&H4A0000,&HE0

RANDOMIZE TIMER

IF COMMAND$ <> "" THEN
   si = INSTR(COMMAND$, " ")
   playertyp(0) = VAL(LEFT$(COMMAND$, si - 1))
   playertyp(1) = VAL(RIGHT$(COMMAND$, LEN(COMMAND$) - si))
ELSE
   playertyp(0) = 0
   playertyp(1) = 4
END IF
FOR i = 0 TO 1
   IF playertyp(i) < 0 THEN playertyp(i) = 0
   IF playertyp(i) > 5 THEN playertyp(i) = 5
NEXT

CALL initboard(a(), b())
px = 4: py = 7: px0 = -1: turn = 0: numturns& = 0
IF playertyp(0) <> 0 THEN 'Ugly hack to show screen when CPU goes 1st
   FOR i = 0 TO 1: SCREEN , , i: CLS : CALL drawboard(a(), b()): NEXT
END IF
DO
   IF playertyp(turn) = 0 THEN
      IF numturns& <> 0 THEN SLEEP 1
      IF px < 1 - turn THEN px = px + 1
      IF px > 9 - turn THEN px = px - 1
      DO
         CLS : CALL drawboard(a(), b())
         IF px0 >= 0 THEN
            LINE (px0 * BSIZ + XOFF + 2, py0 * BSIZ + YOFF + 2)-(px0 * BSIZ + XOFF + BSIZ - 2, py0 * BSIZ + YOFF + BSIZ - 2), turn + 6, B
         END IF
         LINE (px * BSIZ + XOFF, py * BSIZ + YOFF)-(px * BSIZ + XOFF + BSIZ, py * BSIZ + YOFF + BSIZ), turn + 14, B
         SCREEN , , 1 - pag, pag: pag = 1 - pag
         WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
        
         DO: z$ = INKEY$: LOOP WHILE z$ = ""
         IF z$ = " " THEN
            IF b(px, py) >= turn * 4 + 1 AND b(px, py) <= turn * 4 + 4 THEN
               px0 = px: py0 = py
            ELSE
               px0 = -1
            END IF
         END IF
         IF z$ = CHR$(13) AND px0 >= 0 THEN
            IF b(px, py) = 0 OR ((b(px0, py0) AND 3) = 3 AND (b(px, py) AND 1) = 0) THEN
               dx = ABS(px - px0): dy = ABS(py - py0)
               IF (dx <= 1 AND dy <= 1) AND (dx OR dy) THEN
                  CALL domove(a(), b(), px0, py0, px, py, turn)
                  px0 = -1: turn = 1 - turn: EXIT DO
               END IF
            END IF
         END IF
         IF (z$ = "," OR z$ = "<" OR z$ = "." OR z$ = ">") AND px0 >= 0 THEN
            bb = b(px0, py0)
            IF bb = 3 OR bb = 4 OR bb = 7 OR bb = 8 THEN
               IF z$ = "," OR z$ = "<" THEN dir = 1 ELSE dir = 3
               CALL domove(a(), b(), px0, py0, 10, dir, turn)
               px0 = -1: turn = 1 - turn: EXIT DO
            END IF
         END IF
         IF z$ = CHR$(0) + CHR$(75) AND px > 1 - turn THEN px = px - 1
         IF z$ = CHR$(0) + CHR$(77) AND px < 9 - turn THEN px = px + 1
         IF z$ = CHR$(0) + CHR$(72) AND py > 0 THEN py = py - 1
         IF z$ = CHR$(0) + CHR$(80) AND py < 7 THEN py = py + 1
         IF z$ = CHR$(27) THEN END
      LOOP
   ELSE
      'CLS : CALL drawboard(a(), b())
      SCREEN , , 1 - pag, 1 - pag
      recnum = playertyp(turn)
      zx = findbestmove(a(), b(), bx0, by0, bx1, by1, turn, 1, 0, 32767)
     
      'DO: LOOP WHILE INKEY$ = ""
      SCREEN , , 1 - pag, pag: pag = 1 - pag
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
     
      CALL domove(a(), b(), bx0, by0, bx1, by1, turn)
      px0 = -1: turn = 1 - turn
     
      IF playertyp(0) <> 0 AND playertyp(1) <> 0 THEN z$ = INKEY$
   END IF
   numturns& = numturns& + 1
LOOP WHILE z$ <> CHR$(27)

SUB domove (a(), b(), x0, y0, x1, y1, turn)
   t0! = TIMER
   DO
      t! = TIMER - t0!: IF t! >= 1 THEN EXIT DO
      CLS
      FOR y = YOFF + 2 TO BSIZ * 8 + YOFF - 2 STEP 2
         IF (y AND 2) THEN
            LINE (XOFF + 1, y)-(BSIZ + XOFF - 1, y), 8, , &H1111
            LINE (BSIZ * 9 + XOFF + 1, y)-(BSIZ * 10 + XOFF - 1, y), 4, , &H1111
         ELSE
            LINE (XOFF + 1, y)-(BSIZ + XOFF - 1, y), 8, , &H4444
            LINE (BSIZ * 9 + XOFF + 1, y)-(BSIZ * 10 + XOFF - 1, y), 4, , &H4444
         END IF
      NEXT
      FOR x = 0 TO 10: LINE (x * BSIZ + XOFF, YOFF)-(x * BSIZ + XOFF, BSIZ * 8 + YOFF), 1: NEXT
      FOR y = 0 TO 8: LINE (XOFF, y * BSIZ + YOFF)-(BSIZ * 10 + XOFF, y * BSIZ + YOFF), 1: NEXT
      FOR y = 0 TO 7
         FOR x = 0 TO 9
            IF b(x, y) THEN
               fx! = x: fy! = y: fa! = a(x, y): fb! = b(x, y)
               IF x1 < 10 THEN
                  IF (x = x0 AND y = y0) THEN
                     CALL drawpiece(fx! + (x1 - fx!) * t!, fy! + (y1 - fy!) * t!, fa!, fb!)
                  ELSEIF (x = x1 AND y = y1) THEN
                     CALL drawpiece(fx! + (x0 - fx!) * t!, fy! + (y0 - fy!) * t!, fa!, fb!)
                  ELSE
                     CALL drawpiece(fx!, fy!, fa!, fb!)
                  END IF
               ELSE
                  IF x = x0 AND y = y0 THEN
                     IF y1 = 3 THEN nyy = -1 ELSE nyy = 1
                     CALL drawpiece(fx!, fy!, fa! + nyy * t!, fb!)
                  ELSE
                     CALL drawpiece(fx!, fy!, fa!, fb!)
                  END IF
               END IF
            END IF
         NEXT
      NEXT
      SCREEN , , 1 - pag, pag: pag = 1 - pag
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   LOOP
  
   IF x1 < 10 THEN
      SWAP a(x0, y0), a(x1, y1)
      SWAP b(x0, y0), b(x1, y1)
   ELSE
      a(x0, y0) = (a(x0, y0) + y1) AND 3
   END IF
  
   CLS
   CALL drawboard(a(), b())

   CALL firelaser(a(), b(), firex(turn), firey(turn), fired(turn), hitx, hity, 1)
  
   gameover = 0
   IF hitx >= 0 THEN
      IF (b(hitx, hity) AND 3) = 1 THEN
         LOCATE 13, 35
         IF b(hitx, hity) >= 4 THEN
            COLOR 6: PRINT " Gold wins ";
         ELSE
            COLOR 7: PRINT "Silver wins";
         END IF
         gameover = 1
      END IF
      b(hitx, hity) = 0
   END IF

   SCREEN , , 1 - pag, pag: pag = 1 - pag
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   IF gameover THEN DO: LOOP WHILE INKEY$ = "": END
  
END SUB

SUB drawboard (a(), b())
   FOR y = YOFF + 2 TO BSIZ * 8 + YOFF - 2 STEP 2
      IF (y AND 2) THEN
         LINE (XOFF + 1, y)-(BSIZ + XOFF - 1, y), 8, , &H1111
         LINE (BSIZ * 9 + XOFF + 1, y)-(BSIZ * 10 + XOFF - 1, y), 4, , &H1111
      ELSE
         LINE (XOFF + 1, y)-(BSIZ + XOFF - 1, y), 8, , &H4444
         LINE (BSIZ * 9 + XOFF + 1, y)-(BSIZ * 10 + XOFF - 1, y), 4, , &H4444
      END IF
   NEXT
   FOR x = 0 TO 10: LINE (x * BSIZ + XOFF, YOFF)-(x * BSIZ + XOFF, BSIZ * 8 + YOFF), 1: NEXT
   FOR y = 0 TO 8: LINE (XOFF, y * BSIZ + YOFF)-(BSIZ * 10 + XOFF, y * BSIZ + YOFF), 1: NEXT
   FOR y = 0 TO 7
      FOR x = 0 TO 9
         IF b(x, y) THEN
            fx! = x: fy! = y: fa! = a(x, y): fb! = b(x, y)
            CALL drawpiece(fx!, fy!, fa!, fb!)
         END IF
      NEXT
   NEXT
END SUB

SUB drawpiece (xx!, yy!, a!, b!)
   IF b! >= 5 THEN bb = b! - 4: col = 7 ELSE bb = b!: col = 6
   x = (xx! + .5) * BSIZ + XOFF: c! = COS(a! * PI / 2) * BSIZ
   y = (yy! + .5) * BSIZ + YOFF: s! = SIN(a! * PI / 2) * BSIZ
   SELECT CASE bb
      CASE 1:
         CIRCLE (x, y - c! * .22), c! * .2, col, , , 1
         PAINT (x, y - c! * .22), col, col
         CIRCLE (x - c! * .2, y + c! * .22), c! * .15, col, , , 1
         PAINT (x - c! * .2, y + c! * .22), col, col
         CIRCLE (x + c! * .2, y + c! * .22), c! * .15, col, , , 1
         PAINT (x + c! * .2, y + c! * .22), col, col
         CIRCLE (x, y), c! * .3, col, , , 1
         PAINT (x, y), col, col
      CASE 2:
         LINE (x - c! * .4, y - c! * .4)-(x + c! * .4, y + c! * .4), col, BF
      CASE 3:
         PSET (x - c! * .2 - s! * .4, y + s! * .2 - c! * .4)
         LINE -(x - c! * .4 - s! * .2, y + s! * .4 - c! * .2), col
         LINE -(x + c! * .2 + s! * .4, y - s! * .2 + c! * .4), col
         LINE -(x + c! * .4 + s! * .2, y - s! * .4 + c! * .2), col
         LINE -(x - c! * .2 - s! * .4, y + s! * .2 - c! * .4), col
         PAINT (x, y), col, col
         PSET (x - c! * .3 - s! * .3, y + s! * .3 - c! * .3)
         LINE -(x + c! * .3 + s! * .3, y - s! * .3 + c! * .3), 3
      CASE 4:
         PSET (x - c! * .4 - s! * .4, y + s! * .4 - c! * .4)
         LINE -(x + c! * .4 + s! * .4, y - s! * .4 + c! * .4), col
         LINE -(x - c! * .4 + s! * .4, y + s! * .4 + c! * .4), col
         LINE -(x - c! * .4 - s! * .4, y + s! * .4 - c! * .4), col
         PAINT (x - c! * .3 - s! * .1, y + s! * .3 - c! * .1), col, col
         PSET (x - c! * .3 - s! * .3, y + s! * .3 - c! * .3)
         LINE -(x + c! * .3 + s! * .3, y - s! * .3 + c! * .3), 3
   END SELECT
END SUB

FUNCTION findbestmove (a(), b(), bx0, by0, bx1, by1, turn, recurse, osc, obsc)
   DIM pat(12 - 1), patc, bits(8 - 1), mov(114 - 1) '4:4:4:4
  
      'Get valid moves
   movc = 0
   FOR py0 = 0 TO 7
      FOR px0 = 0 TO 9
         bb = b(px0, py0)
         IF bb >= turn * 4 + 1 AND bb <= turn * 4 + 4 THEN
            FOR yy = py0 - 1 TO py0 + 1
               IF (yy AND 8) = 0 THEN
                  FOR xx = px0 - 1 TO px0 + 1
                     IF ABS(xx + turn - 5) < 5 THEN
                        IF b(xx, yy) = 0 OR ((bb AND 3) = 3 AND (b(xx, yy) AND 1) = 0) THEN
                           mov(movc) = yy * 4096 + xx * 256 + py0 * 16 + px0
                           movc = movc + 1
                        END IF
                     END IF
                  NEXT
               END IF
            NEXT
            IF ((bb + 3) AND 2) THEN
               xx = 10
               FOR yy = 1 TO 3 STEP 2
                  mov(movc) = yy * 4096 + xx * 256 + py0 * 16 + px0
                  movc = movc + 1
                  IF (bb AND 3) = 3 THEN EXIT FOR
               NEXT
            END IF
         END IF
      NEXT
   NEXT
  
   debug = 1 '0=disable,1=use

   CALL getvisitlaser(a(), b(), firex(turn), firey(turn), fired(turn), hitx, hity, bits())
  
   bsc = -32767
   FOR m = movc - 1 TO 0 STEP -1
      mm = INT((m + 1) * RND): SWAP mov(mm), mov(m)
      px0 = mov(m) AND 15: py0 = (mov(m) \ 16) AND 15
      xx = (mov(m) \ 256) AND 15: yy = mov(m) \ 4096

      sc = osc + trymove(a(), b(), px0, py0, xx, yy, turn, pat(), patc, hitx, hity, bits())
      IF recurse < recnum AND ABS(sc) < 50 THEN
         sc = -findbestmove(a(), b(), j, j, j, j, 1 - turn, recurse + 1, -sc, -bsc)
      END IF
                                
      FOR i = patc - 4 TO 0 STEP -4
         b(pat(i), pat(i + 1)) = pat(i + 2)
         a(pat(i), pat(i + 1)) = pat(i + 3)
      NEXT
                                
      IF recurse = debug THEN
         IF xx >= 10 THEN
            IF yy = 3 THEN nyy = -1 ELSE nyy = 1
            sx = px0 * BSIZ + BSIZ * .5 + XOFF - nyy * BSIZ * .2
            sy = py0 * BSIZ + BSIZ * .5 + YOFF - BSIZ * .2
         ELSE
            sx = px0 * BSIZ + BSIZ * .5 + XOFF + (xx - px0) * BSIZ * .4
            sy = py0 * BSIZ + BSIZ * .5 + YOFF + (yy - py0) * BSIZ * .4
         END IF
         zx$ = LTRIM$(STR$(sc)): sx = sx - LEN(zx$) * 2 + 2
         CALL printsmall(sx, sy, 15, zx$)
      END IF

      IF sc > bsc THEN
         bsc = sc: bx0 = px0: by0 = py0: bx1 = xx: by1 = yy
         IF sc >= obsc THEN findbestmove = bsc: EXIT FUNCTION'alpha-beta pruning
      END IF
   NEXT
   findbestmove = bsc
END FUNCTION

SUB firelaser (a(), b(), bx, by, bd, hitx, hity, dodraw)
   x = bx: y = by: d = bd
   IF dodraw THEN PSET (x * BSIZ + BSIZ * .5 + XOFF, y * BSIZ + BSIZ * .5 + YOFF), 12
   DO
      x = x + dirx(d)
      y = y + diry(d)
      IF dodraw THEN LINE -(x * BSIZ + BSIZ * .5 + XOFF, y * BSIZ + BSIZ * .5 + YOFF), 12
      IF x < 0 OR x >= 10 OR y < 0 OR y >= 8 THEN hitx = -1: EXIT SUB
      IF b(x, y) THEN
         IF ((b(x, y) + 1) AND 2) THEN EXIT DO
         IF (b(x, y) AND 3) = 0 AND ((d - a(x, y)) AND 2) = 0 THEN EXIT DO
         d = (a(x, y) * 2 - 1 - d) AND 3
      END IF
   LOOP
   hitx = x: hity = y
   IF dodraw THEN
      x = hitx * BSIZ + BSIZ * .5 + XOFF
      y = hity * BSIZ + BSIZ * .5 + YOFF
      CIRCLE (x, y), BSIZ * .25, 4, , , 1
      PAINT (x, y), 12, 4
   END IF
END SUB

SUB getvisitlaser (a(), b(), bx, by, bd, hitx, hity, bits())
   x = bx: y = by: d = bd
   FOR i = 0 TO 7: bits(i) = 0: NEXT
   DO
      x = x + dirx(d)
      y = y + diry(d)
      IF x < 0 OR x >= 10 OR y < 0 OR y >= 8 THEN hitx = -1: EXIT SUB
      bits(y) = bits(y) OR pow2(x)
      IF b(x, y) THEN
         IF ((b(x, y) + 1) AND 2) THEN EXIT DO
         IF (b(x, y) AND 3) = 0 AND ((d - a(x, y)) AND 2) = 0 THEN EXIT DO
         d = (a(x, y) * 2 - 1 - d) AND 3
      END IF
   LOOP
   hitx = x: hity = y
END SUB

SUB initboard (a(), b())
     
      'Board format:
      '   b(x,y): board piece
      '      0   = air
      '      1-4=gold, 5-8=silver
      '      1,5 = Pharoah (king)
      '      2,6 = Obelisk (square fully opaque blocker)
      '      3,7 = Djed    (double-sided mirror)
      '      4,8 = Pyramid (single-sided mirror)
      '
      '   a(x,y): Angle defined as normal vector:
      '      1   0
      '       \ /
      '       / \
      '      2   3
  
   IF 1 THEN
         'Classic
      b(4, 7) = 1
      b(3, 7) = 2
      b(5, 7) = 2
      b(4, 4) = 3: a(4, 4) = 1
      b(5, 4) = 3: a(5, 4) = 0
      b(2, 3) = 4: a(2, 3) = 2
      b(2, 4) = 4: a(2, 4) = 1
      b(2, 7) = 4: a(2, 7) = 1
      b(3, 2) = 4: a(3, 2) = 1
      b(7, 6) = 4: a(7, 6) = 0
      b(9, 3) = 4: a(9, 3) = 1
      b(9, 4) = 4: a(9, 4) = 2
   ELSE
         'Imhotep
      b(4, 7) = 1
      b(3, 7) = 2
      b(5, 7) = 2
      b(2, 7) = 3: a(2, 7) = 1
      b(4, 4) = 3: a(4, 4) = 1
      b(1, 3) = 4: a(1, 3) = 2
      b(1, 4) = 4: a(1, 4) = 1
      b(3, 2) = 4: a(3, 2) = 1
      b(3, 5) = 4: a(3, 5) = 2
      b(4, 3) = 4: a(4, 3) = 3
      b(9, 3) = 4: a(9, 3) = 1
      b(9, 4) = 4: a(9, 4) = 2
   END IF
   FOR y = 0 TO 7
      FOR x = 0 TO 9
         IF b(x, y) >= 1 AND b(x, y) <= 4 THEN
            b(9 - x, 7 - y) = b(x, y) + 4
            IF b(x, y) >= 3 THEN a(9 - x, 7 - y) = a(x, y) XOR 2
         END IF
      NEXT
   NEXT
END SUB

SUB printsmall (bx, y, c, nam$)
   l = LEN(nam$): IF l = 0 THEN EXIT SUB
   x = bx - l - l: LINE (x - 1, y - 3)-STEP(l * 4, 6), 0, BF
   FOR z = 1 TO l
      i& = smallfnt((ASC(MID$(nam$, z, 1)) - 32) AND 63)
      FOR yy = y + 3 TO y - 2 STEP -1
         IF (i& AND 8) THEN PSET (x + 0, yy), c
         IF (i& AND 4) THEN PSET (x + 1, yy), c
         IF (i& AND 2) THEN PSET (x + 2, yy), c
         IF (i& AND 1) THEN PSET (x + 3, yy), c
         i& = i& \ 16
      NEXT
      x = x + 4
   NEXT
END SUB

FUNCTION trymove (a(), b(), x0, y0, x1, y1, turn, pat(), patc, whitx, whity, wbits())
   IF x1 < 10 THEN
      pat(0) = x0: pat(1) = y0: pat(2) = b(x0, y0): pat(3) = a(x0, y0)
      pat(4) = x1: pat(5) = y1: pat(6) = b(x1, y1): pat(7) = a(x1, y1): patc = 8
      SWAP a(x0, y0), a(x1, y1)
      SWAP b(x0, y0), b(x1, y1)
      IF (wbits(y0) AND pow2(x0)) OR (wbits(y1) AND pow2(x1)) THEN
         CALL firelaser(a(), b(), firex(turn), firey(turn), fired(turn), hitx, hity, 0)
      ELSE
         hitx = whitx: hity = whity
      END IF
   ELSE
      pat(0) = x0: pat(1) = y0: pat(2) = b(x0, y0): pat(3) = a(x0, y0): patc = 4
      a(x0, y0) = (a(x0, y0) + y1) AND 3
      IF (wbits(y0) AND pow2(x0)) THEN
         CALL firelaser(a(), b(), firex(turn), firey(turn), fired(turn), hitx, hity, 0)
      ELSE
         hitx = whitx: hity = whity
      END IF
   END IF
   IF hitx < 0 THEN trymove = 0: EXIT FUNCTION
   pat(patc + 0) = hitx
   pat(patc + 1) = hity
   pat(patc + 2) = b(hitx, hity)
   pat(patc + 3) = a(hitx, hity): patc = patc + 4
   b(hitx, hity) = 0: trymove = scv(turn, pat(patc - 2))
END FUNCTION

