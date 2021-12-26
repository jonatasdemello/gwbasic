DECLARE SUB drawcar (x!, y!, c%)
DECLARE SUB kline (x0!, y0!, x1!, y1!, c%)
DECLARE SUB drawworld ()
DECLARE SUB drawtruck (ex!, ey!, eang!, wang!, tx!, ty!, vel!, rev%, usetrailer%)
DECLARE SUB movetruck (ex!, ey!, eang!, wang!, tx!, ty!, vel!, rev%, usetrailer%)
DECLARE SUB printnum (bakx, baky, c%, nam$)

SCREEN 9: CONST PI = 3.141592653589793#, LENG = 96
DIM SHARED iposx, iposy, istrx, istry, iforx, ifory
istrx = 1: istry = 0
iforx = 0: ifory = 1
iposx = 0: iposy = 0

usetrailer% = 1: rev% = 1: z$ = CHR$(8)
DO
   regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
   obstatus% = bstatus%: bstatus% = regs%(0)
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   wang = wang + regs%(2) * .002
   DEF SEG = 0: stat% = PEEK(&H417)
   IF (stat% AND 4) THEN vel = vel + .25: IF vel > 65 THEN vel = 65
   IF (stat% AND 8) THEN vel = vel - .5: IF vel < 0 THEN vel = 0
   IF (bstatus% AND 2) > (obstatus% AND 2) AND ABS(vel) < 3 THEN rev% = -rev%: vel = 0
   IF z$ = CHR$(8) THEN
      IF ex = 320 AND ey = 170 THEN
         ex = 550: ey = 300: eang = 0
      ELSE
         ex = 320: ey = 170: eang = -PI / 2
      END IF
      wang = 0: vel = 0: rev% = 1
      tx = ex - COS(eang) * LENG: ty = ey - SIN(eang) * LENG
   END IF
   IF z$ = CHR$(13) THEN usetrailer% = 1 - usetrailer%
   z$ = INKEY$
 
   CALL movetruck(ex, ey, eang, wang, tx, ty, vel, rev%, usetrailer%)

   iforx = COS(-eang): ifory = SIN(-eang)
   istrx = ifory: istry = -iforx
   iposx = 320 - (ex - 320) * istrx - (ey - 175) * iforx
   iposy = 175 - (ex - 320) * istry - (ey - 175) * ifory
  
   CLS
   CALL drawworld
   CALL drawtruck(ex, ey, eang, wang, tx, ty, vel, rev%, usetrailer%)
   SCREEN , , 1 - pag%, pag%: pag% = 1 - pag%
   SOUND 2 ^ (ABS(vel) / 24) * 55, .5
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
LOOP WHILE z$ <> CHR$(27)

SUB drawcar (x, y, c%)
   CALL kline(x, y, x + 50, y, c%)
   CALL kline(x, y + 20, x + 50, y + 20, c%)
   CALL kline(x, y, x, y + 20, c%)
   CALL kline(x + 50, y, x + 50, y + 20, c%)
END SUB

SUB drawtruck (ex, ey, eang, wang, tx, ty, vel, rev%, usetrailer%)
   evx = COS(eang): evy = SIN(eang)

   x0 = evx * 40 + evy * 12 + ex: y0 = evy * 40 - evx * 12 + ey
   x1 = evx * 40 - evy * 12 + ex: y1 = evy * 40 + evx * 12 + ey
   x2 = -evx * 12 - evy * 12 + ex: y2 = -evy * 12 + evx * 12 + ey
   x3 = -evx * 12 + evy * 12 + ex: y3 = -evy * 12 - evx * 12 + ey
   CALL kline(x0, y0, x1, y1, 7)
   CALL kline(x1, y1, x2, y2, 7)
   CALL kline(x2, y2, x3, y3, 7)
   CALL kline(x3, y3, x0, y0, 7)

   CALL kline(ex, ey, ex, ey, 15)
 
   IF rev% > 0 THEN
      x0 = ex + evx * 12: y0 = ey + evy * 12
      x1 = ex + evx * 32: y1 = ey + evy * 32
      x2 = ex + evx * 27 - evy * 5: y2 = ey + evy * 27 + evx * 5
      x3 = ex + evx * 27 + evy * 5: y3 = ey + evy * 27 - evx * 5
   ELSE
      x0 = ex + evx * 32: y0 = ey + evy * 32
      x1 = ex + evx * 12: y1 = ey + evy * 12
      x2 = ex + evx * 17 - evy * 5: y2 = ey + evy * 17 + evx * 5
      x3 = ex + evx * 17 + evy * 5: y3 = ey + evy * 17 - evx * 5
   END IF
   CALL kline(x0, y0, x1, y1, 3)
   CALL kline(x1, y1, x2, y2, 3)
   CALL kline(x1, y1, x3, y3, 3)
 
   IF usetrailer% THEN
      CALL kline(tx, ty, tx, ty, 15)
 
      dx = tx - ex: dy = ty - ey
      x0 = ex - dx * .05 + dy * .13: y0 = ey - dy * .05 - dx * .13
      x1 = ex - dx * .05 - dy * .13: y1 = ey - dy * .05 + dx * .13
      x2 = tx + dx * .22 - dy * .13: y2 = ty + dy * .22 + dx * .13
      x3 = tx + dx * .22 + dy * .13: y3 = ty + dy * .22 - dx * .13
      CALL kline(x0, y0, x1, y1, 7)
      CALL kline(x1, y1, x2, y2, 7)
      CALL kline(x2, y2, x3, y3, 7)
      CALL kline(x3, y3, x0, y0, 7)
   END IF
 
   wvx = COS(eang + wang) * 3: nex = ex + evx * 35
   wvy = SIN(eang + wang) * 3: ney = ey + evy * 35
   FOR i% = -1 TO 1 STEP 2
      x = nex + evy * i% * 9: y = ney - evx * i% * 9
      CALL kline(x + wvx, y + wvy, x - wvx, y - wvy, 15)
   NEXT i%
 
      'Draw other 16 tires
   FOR j% = 0 TO usetrailer%
      IF j% = 0 THEN
         nex = ex: nvx = evx
         ney = ey: nvy = evy
      ELSE
         nex = tx: nvx = dx / LENG
         ney = ty: nvy = dy / LENG
      END IF
      FOR i% = 8 TO 10 STEP 2
         FOR k% = -1 TO 1 STEP 2
            FOR l% = -1 TO 1 STEP 2
               x = nvy * i% * l% + nex: y = -nvx * i% * l% + ney
               CALL kline(nvx * k% * 2 + x, nvy * k% * 2 + y, nvx * k% * 8 + x, nvy * k% * 8 + y, 15)
            NEXT l%
         NEXT k%
      NEXT i%
   NEXT j%

   CALL printnum(320, 175, 15, LTRIM$(STR$(CINT(vel))))
END SUB

SUB drawworld
   CALL kline(0, 15, 639, 15, 15)
   CALL kline(0, 105, 245, 105, 15)
   CALL kline(245, 105, 245, 150, 15)
   CALL kline(639, 105, 355, 105, 15)
   CALL kline(355, 105, 355, 150, 15)
   CALL kline(0, 59, 245, 59, 14): CALL kline(355, 59, 639, 59, 14)
   CALL kline(0, 61, 245, 61, 14): CALL kline(355, 61, 639, 61, 14)
   CALL drawcar(190, 72, 13)
   CALL drawcar(360, 26, 11)

   CALL kline(0, 349, 639, 349, 15)
   FOR sx = 0 TO 160 STEP 60: CALL drawcar(sx, 325, 14 - sx / 60): NEXT sx
   FOR sx = 420 TO 639 STEP 60: CALL drawcar(sx, 325, 14 - sx / 60): NEXT sx
END SUB

SUB kline (x0, y0, x1, y1, c%)
   nx0 = (x0 - 320) * istrx + (y0 - 175) * iforx + iposx
   ny0 = (x0 - 320) * istry + (y0 - 175) * ifory + iposy
   nx1 = (x1 - 320) * istrx + (y1 - 175) * iforx + iposx
   ny1 = (x1 - 320) * istry + (y1 - 175) * ifory + iposy
   LINE (nx0, ny0)-(nx1, ny1), c%
END SUB

SUB movetruck (ex, ey, eang, wang, tx, ty, vel, rev%, usetrailer%)
   oeang = eang: oex = ex: oey = ey: otx = tx: oty = ty

   IF wang < -.8 THEN wang = -.8
   IF wang > .8 THEN wang = .8
   eang = eang + wang * (vel * rev% / 8) / 35
   ex = ex + COS(eang) * (vel * rev% / 8) * COS(wang)
   ey = ey + SIN(eang) * (vel * rev% / 8) * COS(wang)

   IF usetrailer% THEN
      d = LENG / SQR((ex - tx) ^ 2 + (ey - ty) ^ 2)
      tx = (tx - ex) * d + ex
      ty = (ty - ey) * d + ey
      d = SQR((ex - tx) ^ 2 + (ey - ty) ^ 2)
      IF (ex - tx) * COS(eang) + (ey - ty) * SIN(eang) < d * -.5 THEN
         eang = oeang: ex = oex: ey = oey: tx = otx: ty = oty: vel = 0
      END IF
   END IF
END SUB

SUB printnum (bakx, baky, c%, nam$)
   x = bakx - LEN(nam$) * 2: y = baky - 2
   FOR z% = 1 TO LEN(nam$)
      n% = ASC(MID$(nam$, z%, 1)) - 48
      IF n% = -3 THEN
         IF n% <> 0 THEN LINE (x, y + 2)-(x + 2, y + 2), c%
      ELSE
         IF n% <> 1 THEN
            IF n% <> 4 THEN LINE (x, y)-(x + 2, y), c%
            IF n% <> 7 THEN
               IF n% <> 0 THEN LINE (x, y + 2)-(x + 2, y + 2), c%
               IF n% <> 4 THEN LINE (x, y + 4)-(x + 2, y + 4), c%
            END IF
         END IF
         IF n% = 0 OR (n% >= 4 AND n% <> 7) THEN LINE (x, y)-(x, y + 2), c%
         IF (n% AND 1) = 0 AND n% <> 4 THEN LINE (x, y + 2)-(x, y + 4), c%
         IF n% < 5 OR n% > 6 THEN LINE (x + 2, y)-(x + 2, y + 2), c%
         IF n% <> 2 THEN LINE (x + 2, y + 2)-(x + 2, y + 4), c%
      END IF
      x = x + 4
   NEXT z%
END SUB

