DECLARE SUB getu (yy%, yi%)

CONST XDIM = 320, YDIM = 200, SC = 4, MAXSPH = 256
DIM SHARED u&(XDIM, 2 - 1), uxi&(XDIM, 2 - 1), uy&(XDIM), uyi&(XDIM)
DIM SHARED px(MAXSPH), py(MAXSPH), nump%, rad
DIM SHARED tp(MAXSPH)

SCREEN 13: OUT &H3C8, 255: OUT &H3C9, 44: OUT &H3C9, 32: OUT &H3C9, 16

nump% = 0: rad = 4096
mousx% = XDIM * .5: mousy% = YDIM * .5

ed% = -1
DO

   py(nump%) = 99999999: pyind% = 0

   DEF SEG = &HA000: p& = 0: CALL getu(0, 0)
   FOR y% = 0 TO YDIM \ SC - 1
      y0% = y% AND 1: y1% = y0% XOR 1: CALL getu(y% * SC + SC, y1%)
      cs& = u&(0, y0%) * SC * SC
      ci& = (u&(0, y1%) - u&(0, y0%)) * SC
      FOR x% = 0 TO XDIM \ SC
         uy&(x%) = uxi&(x%, y0%) * SC
         uyi&(x%) = uxi&(x%, y1%) - uxi&(x%, y0%)
      NEXT x%
      FOR yy% = 0 TO SC - 1
         c& = cs&: cs& = cs& + ci&
         FOR x% = 0 TO XDIM \ SC - 1
            DO
               POKE p&, c& \ 1024
               'POKE p&, c& >= 0
               c& = c& + uy&(x%): p& = p& + 1
            LOOP WHILE p& AND (SC - 1)
            uy&(x%) = uy&(x%) + uyi&(x%)
         NEXT x%
      NEXT yy%
     
      yy% = y% * SC
      IF (mousy% AND (NOT (SC - 1))) = yy% THEN PSET (mousx%, mousy%), 15
      DO WHILE yy% > py(pyind%) + 2
         PSET (px(pyind%), py(pyind%)), 14: pyind% = pyind% + 1
      LOOP
   NEXT y%
  
   regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
   obstatus% = bstatus%: bstatus% = regs%(0)
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   IF (bstatus% AND 2) THEN
      rad = rad * (1 - regs%(3) / 128)
      IF rad < 8 THEN rad = 8
      IF rad > 32767 THEN rad = 32767
   ELSE
      mousx% = mousx% + regs%(2)
      IF mousx% < 0 THEN mousx% = 0
      IF mousx% > XDIM THEN mousx% = XDIM
      mousy% = mousy% + regs%(3)
      IF mousy% < 0 THEN mousy% = 0
      IF mousy% > YDIM THEN mousy% = YDIM
   END IF
  
   grab% = -1: mind = 99999999 ': mind = (16 * 131072) / rad - 256
   FOR z% = nump% - 1 TO 0 STEP -1
      d = (mousx% - px(z%)) ^ 2 + (mousy% - py(z%)) ^ 2
      IF d < mind THEN grab% = z%: mind = d
   NEXT z%
  
   IF (bstatus% AND 1) > (obstatus% AND 1) THEN
      ed% = grab%
   ELSEIF (bstatus% AND 1) THEN
      IF ed% >= 0 THEN px(ed%) = mousx%: py(ed%) = mousy%
   ELSE
      ed% = -1
   END IF
  
   z$ = INKEY$
   IF z$ = "*" THEN rad = rad / 1.1
   IF z$ = "/" THEN rad = rad * 1.1
   IF z$ = CHR$(0) + CHR$(82) OR z$ = " " THEN px(nump%) = mousx%: py(nump%) = mousy%: nump% = nump% + 1
   IF z$ = CHR$(0) + CHR$(83) AND grab% >= 0 THEN nump% = nump% - 1: px(grab%) = px(nump%): py(grab%) = py(nump%)

   FOR z% = 1 TO nump% - 1
      FOR zz% = 0 TO z% - 1
         IF py(z%) < py(zz%) THEN
            SWAP px(z%), px(zz%): SWAP py(z%), py(zz%)
            IF ed% = z% OR ed% = zz% THEN ed% = ed% XOR z% XOR zz%
         END IF
      NEXT zz%
   NEXT z%

LOOP WHILE z$ <> CHR$(27)

SUB getu (yy%, yi%)
   xx% = (XDIM \ SC) * SC
   FOR z% = 0 TO nump% - 1
      dy = py(z%) - yy%
      tp(z%) = ((px(z%) - xx% - xx%) * px(z%) + dy * dy + 256) / (SC * 2)
   NEXT z%
  
   IF 1 THEN
      xxmul = SC * .5
      FOR x% = XDIM \ SC TO 0 STEP -1
         xx2 = x% * x% * xxmul
     
         v = 0
         FOR z% = 0 TO nump% - 1
            v = v + 1 / (tp(z%) + xx2): tp(z%) = tp(z%) + px(z%)
         NEXT z%

         u&(x%, yi%) = v * 1048576 / SC - rad
         uxi&(x%, yi%) = u&(x% + 1, yi%) - u&(x%, yi%)
      NEXT x%
   ELSEIF 0 THEN
      xxmul = SC * .5
      FOR x% = XDIM \ SC TO 0 STEP -1
         xx2 = x% * x% * xxmul
     
         v = 0
         FOR z% = 0 TO nump% - 2 STEP 2
            t = tp(z% + 0) + xx2: tp(z% + 0) = tp(z% + 0) + px(z% + 0)
            u = tp(z% + 1) + xx2: tp(z% + 1) = tp(z% + 1) + px(z% + 1)
            v = v + (t + u) / (t * u)
         NEXT z%
         IF (nump% AND 1) THEN
            v = v + 1 / (tp(nump% - 1) + xx2)
            tp(nump% - 1) = tp(nump% - 1) + px(nump% - 1)
         END IF

         u&(x%, yi%) = v * 1048576 / SC - rad
         uxi&(x%, yi%) = u&(x% + 1, yi%) - u&(x%, yi%)
      NEXT x%
   ELSE
      xxmul = SC * .5
      FOR x% = XDIM \ SC TO 0 STEP -1
         xx2 = x% * x% * xxmul

         t = 0: b = CVS(MKL$(&H800000)) 'Smallest + non-denormal number
         FOR z% = 0 TO nump% - 1
            v = tp(z%) + xx2: tp(z%) = tp(z%) + px(z%)
            t = t * v + b: b = b * v
            IF b > 1E+32 THEN t = t * 1E-32: b = b * 1E-32
         NEXT z%
         v = t / b

         u&(x%, yi%) = v * 1048576 / SC - rad
        uxi&(x%, yi%) = u&(x% + 1, yi%) - u&(x%, yi%)
      NEXT x%
  
      '((a+b)*c*d + a*b*(c+d)) / (a*b*c*d)
  
      '(     v1 * v2 * v3)* v4 +
      '(v0      * v2 * v3)* v4 +
      '(v0 * v1      * v3)* v4 +
      '(v0 * v1 * v2     )* v4 +
      ' v0 * v1 * v2 * v3

      '( )*v4 + v0*v1*v2*v3
                
      't = 0: b = 1
      'FOR z% = 0 to nump% - 1
      '   t = t * v(z%) + b    ' 1   v1+v0  (v1+v0)*v2+v0*v1
      '   b = b * v(z%)        'v0   v0*v1      v0*v1*v2
      'NEXT z%
      'v = t / b               't = 1/v(0) + 1/v(1) + ... + 1/v(nump%-1)
   END IF

END SUB

