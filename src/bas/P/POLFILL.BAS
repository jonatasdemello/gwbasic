DECLARE FUNCTION inside% (x&, y&, startlin%, endlin%)
DECLARE SUB getpolygon ()
DECLARE SUB fillpolygon (sx&(), sy&(), point2%(), numpoints%)
  
   'Original fileinfo (before 10/25/2000): POLFILL.BAS 10,680 07-25-97 2:05a
   '10/25/2000: Fixed rare sign bug in fillpolygon. First noticed it while
   '   testing TRIANGUL.BAS (polygon triangulation program). I changed
   '   exactly one line in the filling algorithm:
   '      before: IF ((x3& * y4& - x4& * y3&) XOR y4&) < 0 THEN EXIT FOR
   '       after: IF ((x4& * y3& - x3& * y4&) XOR y3&) < 0 THEN EXIT FOR
   'NOTE: This bug has not been fixed in: KENVEX.C, KENVEXBK.C, & SNOTS.BUT
   '   (all in polytex directory)
  
CONST XDIM = 640, YDIM = 350, SCRMODE = 9
CONST MAXPOINTS = 1024, MAXPOLYS = 16, MAXBUNCHES = 256

DIM SHARED regs%(7)

DIM SHARED loopnum%(MAXPOLYS), numloops%
DIM SHARED sx&(MAXPOINTS), sy&(MAXPOINTS), point2%(MAXPOINTS), numpoints%

DIM SHARED bunchindex%(MAXBUNCHES), numbunches%
TYPE bunchtype: v AS LONG: l AS LONG: END TYPE
DIM SHARED bunch(MAXBUNCHES) AS bunchtype
DIM SHARED got%(MAXPOINTS)
DIM SHARED sortlist%(MAXBUNCHES), sortlistnum%
DIM SHARED lastx%(YDIM)

SCREEN SCRMODE: RANDOMIZE TIMER

DO
   CLS
   numloops% = 0: numpoints% = 0
   DO
      CALL getpolygon
      DEF SEG = 0
   LOOP WHILE (PEEK(&H417) AND 3) > 0
  
   SCREEN SCRMODE, , 0, 0
   CLS

   FOR z% = 0 TO numpoints% - 1
      zz% = point2%(z%)
      LINE (sx&(z%), sy&(z%))-(sx&(zz%), sy&(zz%)), 4
   NEXT z%

   CALL fillpolygon(sx&(), sy&(), point2%(), numpoints%)

   DO: LOOP WHILE INKEY$ = ""
LOOP WHILE z$ <> CHR$(27)

SUB fillpolygon (sx&(), sy&(), point2%(), numpoints%)
     
   FOR z% = numpoints% - 1 TO 0 STEP -1: got%(z%) = 0: NEXT z%

      'Get bunchindex & numbunches
   z% = numpoints% - 1: numbunches% = 0
   DO
      startnumbunches% = numbunches%
      DO
         got%(z%) = 1
         zz% = point2%(z%)
         IF ((sy&(zz%) - sy&(z%)) XOR (sy&(point2%(zz%)) - sy&(zz%))) < 0 THEN
            bunchindex%(numbunches%) = numbunches%
            bunch(numbunches%).v = zz%
            bunch(numbunches%).l = numbunches% - 1
            numbunches% = numbunches% + 1
         END IF
         z% = zz%
      LOOP WHILE got%(z%) = 0
      bunch(startnumbunches%).l = numbunches% - 1
      DO: z% = z% - 1: LOOP WHILE z% >= 2 AND got%(z%)
   LOOP WHILE z% >= 2

   IF numbunches% = 2 THEN   'If only 2 bunches, do simple sort
      sortlist%(0) = -(sy&(bunch(1).v) > sy&(bunch(0).v))
      sortlist%(1) = sortlist%(0) XOR 1
      sortlistnum% = 2
   ELSE
  
         'Sort bunches by y's
      gap% = numbunches% \ 2
      DO
         FOR z% = 0 TO numbunches% - gap% - 1
            FOR zz% = z% TO 0 STEP -gap%
               IF sy&(bunch(bunchindex%(zz%)).v) <= sy&(bunch(bunchindex%(zz% + gap%)).v) THEN EXIT FOR
               SWAP bunchindex%(zz%), bunchindex%(zz% + gap%)
            NEXT zz%
         NEXT z%
         gap% = gap% \ 2
      LOOP WHILE gap% <> 0

         'Generate sortlist - go though bunch tops in increasing order
      sortlistnum% = 0: zx% = 0
      DO
         b% = bunchindex%(zx%): zx% = zx% + 1
         bv% = bunch(b%).v
         IF sy&(point2%(bv%)) >= sy&(bv%) THEN
            x& = sx&(bv%): y& = sy&(bv%)
  
               'Find where new bunch should be inserted on sort list by
               'finding first bunch on sortlist to the right of point (x,y)
               'At the same time, insert 2 new places for the 2 new bunches
            FOR i% = sortlistnum% - 1 TO 0 STEP -1
               z% = sortlist%(i%)
               IF got%(z%) = 1 THEN
                  e% = bunch(z%).v
                  IF sy&(point2%(e%)) >= sy&(e%) THEN
                     WHILE sy&(point2%(e%)) < y&: e% = point2%(e%): WEND
                  ELSE
                     WHILE sy&(point2%(e%)) > y&: e% = point2%(e%): WEND
                  END IF
                  x3& = sx&(e%) - x&: x4& = sx&(point2%(e%)) - x&
                  IF (x3& XOR x4&) < 0 THEN
                     y3& = sy&(e%) - y&: y4& = sy&(point2%(e%)) - y&
                     IF ((x4& * y3& - x3& * y4&) XOR y3&) < 0 THEN EXIT FOR
                  ELSE
                     IF x3& < 0 THEN EXIT FOR
                  END IF
               END IF
               sortlist%(i% + 2) = z%
            NEXT i%
           
            IF (i% AND 1) = 0 THEN  'Insert the 2 new bunches
               sortlist%(i% + 1) = b%: sortlist%(i% + 2) = bunch(b%).l
            ELSE
               sortlist%(i% + 1) = bunch(b%).l: sortlist%(i% + 2) = b%
            END IF
            sortlistnum% = sortlistnum% + 2
            IF sortlistnum% = numbunches% THEN EXIT DO
         ELSE
               'Don't compare these bunches any more (too high)
            got%(b%) = 2: got%(bunch(b%).l) = 2
         END IF
      LOOP WHILE 1
   END IF

      'Draw bunches
   FOR zx% = 0 TO sortlistnum% - 1
      z% = bunch(sortlist%(zx%)).v
      IF sy&(point2%(z%)) < sy&(z%) THEN
         DO
            zz% = point2%(z%)
            y0& = sy&(z%): y1& = sy&(zz%): IF y0& < y1& THEN EXIT DO
            IF y0& > y1& THEN
               x0& = sx&(z%): x1& = sx&(zz%)
               xinc& = ((x1& - x0&) * 65536) \ (y1& - y0&)
               x& = x0& * 65536 + 65535
               FOR y& = y0& TO y1& + 1 STEP -1
                  lastx%(y&) = x& \ 65536: x& = x& - xinc&
               NEXT y&
            END IF
            z% = zz%
         LOOP
         lastx%(y&) = x& \ 65536
      ELSE
         DO
            zz% = point2%(z%)
            y0& = sy&(z%): y1& = sy&(zz%): IF y0& > y1& THEN EXIT DO
            IF y0& < y1& THEN
               x0& = sx&(z%): x1& = sx&(zz%)
               xinc& = ((x1& - x0&) * 65536) \ (y1& - y0&)
               x& = x0& * 65536 + 65535
               FOR y& = y0& TO y1& - 1
                  sx0& = lastx%(y&): sx1& = x& \ 65536: x& = x& + xinc&
                  IF sx1& > sx0& THEN LINE (sx0&, y&)-(sx1& - 1, y&), 6
               NEXT y&
            END IF
            z% = zz%
         LOOP
         sx0& = lastx%(y&): sx1& = x& \ 65536
         IF sx1& > sx0& THEN LINE (sx0&, y&)-(sx1& - 1, y&), 6
      END IF
   NEXT zx%

END SUB

SUB getpolygon
   pag% = 0

   startnumpoints% = numpoints%

   loopnum%(numloops%) = startnumpoints%
   point2%(startnumpoints%) = numpoints%

   bstatus% = 3
   x& = XDIM \ 2: y& = YDIM \ 2
   DO
      regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
      x& = x& + regs%(2): y& = y& + regs%(3)
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      obstatus% = bstatus%: bstatus% = regs%(0)
      IF x& < 4 THEN x& = 4
      IF y& < 4 THEN y& = 4
      IF x& >= XDIM - 4 THEN x& = XDIM - 4 - 1
      IF y& >= YDIM - 4 THEN y& = YDIM - 4 - 1
      sx&(numpoints%) = x&: sy&(numpoints%) = y&
   
      LINE (0, 0)-(XDIM - 1, YDIM - 1), 0, BF
   
      FOR zx% = 0 TO numloops%
         IF zx% = numloops% THEN daend% = numpoints% ELSE daend% = loopnum%(zx% + 1) - 1
         FOR z% = loopnum%(zx%) TO daend%
            zz% = point2%(z%)
            LINE (sx&(z%), sy&(z%))-(sx&(zz%), sy&(zz%)), 4 - (zx% AND 1) * 3
            CIRCLE (sx&(z%), sy&(z%)), 2, 4 - (zx% AND 1) * 3, , , 1
         NEXT z%
      NEXT zx%

      SCREEN SCRMODE, , pag%, 1 - pag%: pag% = 1 - pag%
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   
      z$ = INKEY$
      IF (z$ = " " OR (bstatus% AND 1) > 0) AND numpoints% < MAXPOINTS - 1 THEN
         good% = 0
         IF numpoints% = startnumpoints% THEN
            good% = 1
         ELSE
            IF ABS(x& - sx&(numpoints% - 1)) + ABS(y& - sy&(numpoints% - 1)) > 1 THEN good% = 1
         END IF
         IF good% = 1 THEN
            point2%(numpoints%) = numpoints% + 1
            point2%(numpoints% + 1) = startnumpoints%
            numpoints% = numpoints% + 1
         END IF
      END IF
      IF z$ = CHR$(8) AND numpoints% > startnumpoints% THEN
         numpoints% = numpoints% - 1
         point2%(numpoints%) = startnumpoints%
      END IF
   LOOP WHILE ((z$ <> CHR$(13) OR z$ = " ") AND ((bstatus% AND 2) <= (obstatus% AND 2)) OR ((bstatus% AND 1) > 0)) OR (numpoints% < startnumpoints% + 2)

   numpoints% = numpoints% + 1
   loopnum%(numloops% + 1) = numpoints%
   numloops% = numloops% + 1

   FOR p% = 0 TO numloops% - 1
         'Get area of polygon using Horizontal Slabs (trapezoids)
      'area& = 0
      'FOR z% = loopnum%(p%) TO loopnum%(p%+1)-1
      '   zz% = point2%(z%)
      '   area& = area& + (sx&(z%) + sx&(zz%)) * (sy&(zz%) - sy&(z%))
      'NEXT z%
      'area& = area& \ 2

         'Get area of polygon using pieces of pie (triangles)
         '(0,0),(x1,y1),(x2,y1) using z of cross product, multiply-optimized
      area& = 0
      FOR z% = loopnum%(p%) TO loopnum%(p% + 1) - 1
         zz% = point2%(z%)
         area& = area& + (sx&(z%) - sx&(point2%(zz%))) * sy&(zz%)
      NEXT z%
      'area& = area& \ 2

      'LOCATE 1, 1: PRINT area& \ 2;
 
      cnt% = 0
      x& = sx&(loopnum%(p%)): y& = sy&(loopnum%(p%))
      FOR pp% = 0 TO numloops% - 1
         IF p% <> pp% THEN
            cnt% = cnt% XOR inside%(x&, y&, loopnum%(pp%), loopnum%(pp% + 1) - 1)
         END IF
      NEXT pp%
 
      IF (area& < 0) <> (cnt% > 0) THEN
         FOR z% = (loopnum%(p% + 1) - loopnum%(p%)) \ 2 - 1 TO 0 STEP -1
            SWAP sx&(z% + loopnum%(p%)), sx&(loopnum%(p% + 1) - 1 - z%)
            SWAP sy&(z% + loopnum%(p%)), sy&(loopnum%(p% + 1) - 1 - z%)
         NEXT z%
         FOR z% = 0 TO 31
            SOUND z% * 16 + 40, .03
         NEXT z%
      END IF
   NEXT p%
END SUB

FUNCTION inside% (x&, y&, startlin%, endlin%)
   cnt& = 0
   FOR z% = startlin% TO endlin%
      zz% = point2%(z%)
      y1& = sy&(z%) - y&: y2& = sy&(zz%) - y&
      IF (y1& XOR y2&) < 0 THEN
         x1& = sx&(z%) - x&: x2& = sx&(zz%) - x&
         IF (x1& XOR x2&) < 0 THEN
            cnt& = cnt& XOR (x2& * y1& - x1& * y2&) XOR y1&
         ELSE
            cnt& = cnt& XOR x1&
         END IF
      END IF
   NEXT z%
   inside% = ABS(cnt& < 0)
END FUNCTION

SUB printsmall (bakx&, baky&, c%, nam$)
   nam$ = LTRIM$(RTRIM$(nam$))
   x& = bakx& - LEN(nam$) * 2
   y& = baky& - 2
   IF x& >= XDIM OR y& >= YDIM THEN EXIT SUB
   'LINE (x& - 1, y& - 1)-(x& + LEN(nam$) * 4 - 1, y& + 5), 0, BF
   FOR z% = 1 TO LEN(nam$)
      n% = ASC(MID$(nam$, z%, 1)) - 48
      IF n% = -3 THEN
         IF n% <> 0 THEN LINE (x&, y& + 2)-(x& + 2, y& + 2), c%
      ELSE
         IF n% <> 1 THEN
            IF n% <> 4 THEN LINE (x&, y&)-(x& + 2, y&), c%
            IF n% <> 7 THEN
               IF n% <> 0 THEN LINE (x&, y& + 2)-(x& + 2, y& + 2), c%
               IF n% <> 4 THEN LINE (x&, y& + 4)-(x& + 2, y& + 4), c%
            END IF
         END IF
         IF n% = 0 OR (n% >= 4 AND n% <> 7) THEN LINE (x&, y&)-(x&, y& + 2), c%
         IF (n% AND 1) = 0 AND n% <> 4 THEN LINE (x&, y& + 2)-(x&, y& + 4), c%
         IF n% < 5 OR n% > 6 THEN LINE (x& + 2, y&)-(x& + 2, y& + 2), c%
         IF n% <> 2 THEN LINE (x& + 2, y& + 2)-(x& + 2, y& + 4), c%
      END IF
      x& = x& + 4
   NEXT z%
END SUB

