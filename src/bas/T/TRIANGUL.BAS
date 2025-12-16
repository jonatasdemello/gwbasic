DECLARE SUB drawtri (p0%, p1%, p2%)
DECLARE SUB tesspolygon (px#(), py#(), point2%(), nump%)
DECLARE SUB tessmonotone (px#(), py#(), startind%, nnump%)

DECLARE SUB printnum (bx%, y%, c%, num%)
DECLARE FUNCTION lastpoint% (i%)
DECLARE SUB deletepoint (i%)
DECLARE FUNCTION dist2linept2d# (bx#, by#, px#, py#, vx#, vy#, cr2#)

DEFDBL A-Z
CONST XDIM = 640, YDIM = 350, SCRMODE = 9
SCREEN SCRMODE: RANDOMIZE TIMER

CONST MAXPOINTS = 1024
  
   'Original data:
DIM SHARED px(MAXPOINTS), py(MAXPOINTS), point2%(MAXPOINTS), nump%

   'Variables for tesspolygon()
   'n&l are forward & backward links, i converts new to original points
TYPE nptype: n AS INTEGER: l AS INTEGER: i AS INTEGER: END TYPE
DIM SHARED np(MAXPOINTS) AS nptype
CONST MAXBUNCHES = 256
TYPE bunchtype: v AS INTEGER: l AS INTEGER: END TYPE
DIM SHARED bunch(MAXBUNCHES) AS bunchtype
DIM SHARED bunchi%(MAXBUNCHES), slist%(MAXBUNCHES), got%(MAXPOINTS)

   'Variables that aren't needed for algorithm, but make output look pretty
DIM SHARED lastx%(YDIM + 4), gcol%, gcol2%, cuts%, totarea
DIM SHARED pauseit%, fillmode%, shownodes%

mousx = XDIM * .5: mousy = YDIM * .5
startnump% = 0: nump% = 0: editp% = 0: ruband% = 0: dragp% = -1
gridsiz% = 16: drawgrid% = 0
shownodes% = 1: fillmode% = 1
DO
   regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
   obstatus% = bstatus%: bstatus% = regs%(0)
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   mousx = mousx + regs%(2): mousy = mousy + regs%(3)
   IF mousx < 0 THEN mousx = 0
   IF mousy < 0 THEN mousy = 0
   IF mousx >= XDIM THEN mousx = XDIM - 1
   IF mousy >= YDIM THEN mousy = YDIM - 1

   IF drawgrid% THEN
      qmousx = (mousx + gridsiz% \ 2) AND (NOT (gridsiz% - 1))
      qmousy = (mousy + gridsiz% \ 2) AND (NOT (gridsiz% - 1))
   ELSE
      qmousx = mousx
      qmousy = mousy
   END IF

   mind = 12 ^ 2: grabp% = -1
   FOR z% = nump% - 1 TO 0 STEP -1
      d = (qmousx - px(z%)) ^ 2 + (qmousy - py(z%)) ^ 2
      IF d < mind THEN mind = d: grabp% = z%
   NEXT z%
  
   IF (bstatus% AND 1) THEN
      IF (bstatus% AND 1) > (obstatus% AND 1) THEN dragp% = grabp%
      IF dragp% >= 0 AND ruband% = 0 THEN
         px(dragp%) = qmousx
         py(dragp%) = qmousy
      END IF
   ELSEIF (obstatus% AND 1) AND dragp% >= 0 THEN
      z1% = point2%(dragp%): z2% = lastpoint%(dragp%)
      IF z1% > z2% THEN SWAP z1%, z2%
      IF (qmousx - px(z2%)) ^ 2 + (qmousy - py(z2%)) ^ 2 < 10 ^ 2 THEN CALL deletepoint(z2%)
      IF (qmousx - px(z1%)) ^ 2 + (qmousy - py(z1%)) ^ 2 < 10 ^ 2 THEN CALL deletepoint(z1%)
   END IF

   z$ = INKEY$
   IF z$ = CHR$(13) THEN fillmode% = fillmode% XOR 1
   IF (z$ = "P" OR z$ = "p") AND ruband% = 0 THEN pauseit% = 1: fillmode% = 0 ELSE pauseit% = 0
   IF z$ = "S" OR z$ = "s" THEN shownodes% = shownodes% XOR 1
   IF z$ = "G" OR z$ = "g" THEN drawgrid% = drawgrid% XOR 1
   IF z$ = CHR$(8) AND ruband% THEN
      IF nump% > startnump% THEN nump% = nump% - 1
      IF nump% = startnump% THEN ruband% = 0
   END IF
   IF z$ = CHR$(0) + CHR$(82) AND ruband% = 0 THEN
     
      minl = 12 ^ 2: grabl% = -1
      FOR z% = nump% - 1 TO 0 STEP -1
         zz% = point2%(z%)
         IF dist2linept2d(mousx, mousy, px(z%), py(z%), px(zz%) - px(z%), py(zz%) - py(z%), minl) <> 0 THEN
            grabl% = z%
         END IF
      NEXT z%

      IF grabl% >= 0 THEN
         nump% = nump% + 1 'Insert after grabl%
         FOR z% = nump% - 1 TO grabl% + 2 STEP -1
            px(z%) = px(z% - 1)
            py(z%) = py(z% - 1)
            point2%(z%) = point2%(z% - 1)
         NEXT z%
         FOR z% = 0 TO nump% - 1
            IF point2%(z%) > grabl% THEN point2%(z%) = point2%(z%) + 1
         NEXT z%
         point2%(grabl% + 1) = point2%(grabl%)
         point2%(grabl%) = grabl% + 1
         px(grabl% + 1) = qmousx
         py(grabl% + 1) = qmousy
      END IF
   END IF
   IF z$ = " " THEN
      IF grabp% < 0 THEN
         IF ruband% = 0 THEN startnump% = nump%: ruband% = 1
         px(nump%) = qmousx
         py(nump%) = qmousy
         point2%(nump%) = nump% + 1
         nump% = nump% + 1
      ELSE
         IF grabp% = startnump% THEN
            point2%(nump% - 1) = startnump%: ruband% = 0
         END IF
      END IF
   END IF
   IF ruband% THEN px(nump%) = qmousx: py(nump%) = qmousy
  
   IF pauseit% THEN SCREEN , , pag%, pag%
   CLS 1
   IF drawgrid% THEN
      FOR y% = 0 TO YDIM - 1 STEP gridsiz%
         FOR x% = 0 TO XDIM - 1 STEP gridsiz%
            PSET (x%, y%), 8
         NEXT x%
      NEXT y%
   END IF
  
   IF pauseit% THEN
      FOR z% = 0 TO nump% - 1
         zz% = point2%(z%): LINE (px(z%), py(z%))-(px(zz%), py(zz%)), 4
      NEXT z%
   END IF

   IF ruband% = 0 THEN CALL tesspolygon(px(), py(), point2%(), nump%)

   IF ruband% OR fillmode% = 0 THEN
      FOR z% = 0 TO nump% - 1
         zz% = point2%(z%): IF ruband% = 0 AND zz% >= nump% THEN zz% = 0
         LINE (px(z%), py(z%))-(px(zz%), py(zz%)), 4
         IF shownodes% THEN
            x = (px(z%) + px(zz%)) * .5: vx = px(zz%) - px(z%)
            y = (py(z%) + py(zz%)) * .5: vy = py(zz%) - py(z%)
            IF vx <> 0 OR vy <> 0 THEN
               t = 1 / SQR(vx * vx + vy * vy): vx = vx * t: vy = vy * t
               LINE (x, y)-(x - vy * 4, y + vx * 4), 5
            END IF
         END IF
      NEXT z%
   END IF
  
   IF shownodes% THEN
      FOR z% = 0 TO nump% - 1
         CALL printnum(INT(px(z%)), INT(py(z%)), 15, z%)
      NEXT z%
   END IF

   IF (bstatus% AND 1) = 0 THEN CIRCLE (mousx, mousy), 2, 15, , , 1
   SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
  
LOOP WHILE z$ <> CHR$(27)

SUB deletepoint (i%)
   IF i% < 0 THEN EXIT SUB
   z% = lastpoint%(i%): IF z% >= 0 THEN point2%(z%) = point2%(i%)
   nump% = nump% - 1
   FOR z% = i% TO nump% - 1
      px(z%) = px(z% + 1)
      py(z%) = py(z% + 1)
      point2%(z%) = point2%(z% + 1)
   NEXT z%
   FOR z% = 0 TO nump% - 1
      IF point2%(z%) > i% THEN point2%(z%) = point2%(z%) - 1
   NEXT z%
END SUB

    'Point: (x,y), line segment: (px,py)-(px+vx,py+vy)
    'Returns 1 if point is closer than sqrt(cr2) to line
FUNCTION dist2linept2d (bx, by, px, py, vx, vy, cr2)
   x = bx - px
   y = by - py
   f = x * vx + y * vy
   IF f <= 0 THEN dist2linept2d = ABS(x * x + y * y <= cr2): EXIT FUNCTION
   g = vx * vx + vy * vy
   IF f >= g THEN
      x = x - vx: y = y - vy
      dist2linept2d = ABS(x * x + y * y <= cr2)
      EXIT FUNCTION
   END IF
   x = x * g - vx * f
   y = y * g - vy * f
   dist2linept2d = ABS(x * x + y * y <= cr2 * g * g)
END FUNCTION

SUB drawtri (p0%, p1%, p2%)
   DIM x(3), y(3)
   x(0) = px(p0%) + 1: y(0) = py(p0%)
   x(1) = px(p1%) + 1: y(1) = py(p1%)
   x(2) = px(p2%) + 1: y(2) = py(p2%)
   mini% = ABS(y(0) >= y(1)): maxi% = 1 - mini%
   IF y(2) < y(mini%) THEN mini% = 2
   IF y(2) > y(maxi%) THEN maxi% = 2

   area = (x(1) - x(0)) * (y(2) - y(0)) - (y(1) - y(0)) * (x(2) - x(0))
   IF area < 0 THEN EXIT SUB
   IF area > 0 THEN totarea = totarea + area
   IF fillmode% = 0 THEN
      IF cuts% > 0 THEN LINE (x(0), y(0))-(x(2), y(2)), 8
      EXIT SUB
   END IF
   gcol2% = gcol2% + 1: IF gcol2% = 16 THEN gcol2% = 1

   i% = maxi%: y2% = INT(y(i%) - .5)
   DO
      j% = i% + 1: IF j% = 3 THEN j% = 0
      y% = INT(y(j%) + .5)
      IF y% <= y2% THEN
         xi = (x(j%) - x(i%)) / (y(j%) - y(i%))
         x = (y2% - y(j%)) * xi + x(j%)
         FOR y2% = y2% TO y% STEP -1
            lastx%(y2%) = INT(x): x = x - xi
         NEXT y2%
      END IF
      i% = j%
   LOOP WHILE i% <> mini%
   DO
      j% = i% + 1: IF j% = 3 THEN j% = 0
      y2% = INT(y(j%) - .5)
      IF y2% >= y% THEN
         xi = (x(j%) - x(i%)) / (y(j%) - y(i%))
         x = (y% - y(i%)) * xi + x(i%)
         FOR y% = y% TO y2%
            LINE (lastx%(y%), y%)-(INT(x), y%), gcol2%: x = x + xi
         NEXT y%
      END IF
      i% = j%
   LOOP WHILE i% <> maxi%
END SUB

FUNCTION lastpoint% (i%)
   IF i% > 0 THEN
      IF point2%(i% - 1) = i% THEN lastpoint% = i% - 1: EXIT FUNCTION
   END IF
   FOR z% = 0 TO nump% - 1
      IF point2%(z%) = i% THEN lastpoint% = z%: EXIT FUNCTION
   NEXT z%
   lastpoint% = -1
END FUNCTION

SUB printnum (bx%, y%, c%, num%)
   nam$ = LTRIM$(STR$(num%)): l% = LEN(nam$): x% = bx% - l% - l% - 1
   LINE (x% - 1, y% - 3)-(x% + l% * 4 - 1, y% + 3), 0, BF
   FOR z% = 1 TO l%
      v% = 2 ^ (ASC(MID$(nam$, z%, 1)) AND 15)
      IF (v% AND &H3ED) THEN LINE (x%, y% - 2)-(x% + 2, y% - 2), c%
      IF (v% AND &H237C) THEN LINE (x%, y%)-(x% + 2, y%), c%
      IF (v% AND &H36D) THEN LINE (x%, y% + 2)-(x% + 2, y% + 2), c%
      IF (v% AND &H371) THEN LINE (x%, y% - 2)-(x%, y%), c%
      IF (v% AND &H39F) THEN LINE (x% + 2, y% - 2)-(x% + 2, y%), c%
      IF (v% AND &H145) THEN LINE (x%, y%)-(x%, y% + 2), c%
      IF (v% AND &H3FB) THEN LINE (x% + 2, y%)-(x% + 2, y% + 2), c%
      x% = x% + 4
   NEXT z%
END SUB

   'This triangulation algorithm works only for MONOTONIC polygons
   'The function that calls this is responsible for splitting complex
   '   polygons into MONOTONIC polygons
SUB tessmonotone (px(), py(), startind%, nnump%)
  
      '(This paragraph of code is just for debugging purposes)
   IF fillmode% = 0 AND shownodes% THEN
      z% = startind%
      DO
         zz% = np(z%).n
         x = (px(np(z%).i) + px(np(zz%).i)) * .5: vx = px(np(zz%).i) - px(np(z%).i)
         y = (py(np(z%).i) + py(np(zz%).i)) * .5: vy = py(np(zz%).i) - py(np(z%).i)
         IF vx <> 0 OR vy <> 0 THEN
            t = 1 / SQR(vx * vx + vy * vy): vx = vx * t: vy = vy * t
            LINE (x, y)-(x - vy * 4, y + vx * 4), gcol%
         END IF
         z% = zz%
      LOOP WHILE z% <> startind%
   END IF
  
     'A description of that cryptic, but cool s% parameter:
     '   Bit 0: 1:Top point (p0%) touches left side
     '   Bit 1: 1:Top point (p0%) touches right side
     '   Bit 2: 1:Mid point (p1%) touches left side
     '   Bit 3: 1:Mid point (p1%) touches right side
     '   Bit 4: 1:Bot point (p2%) touches left side
     '   Bit 5: 1:Bot point (p2%) touches right side
  
   cuts% = nnump% - 3: IF cuts% < 0 THEN EXIT SUB
   p1% = startind%
   DO WHILE py(np(np(p1%).n).i) <= py(np(p1%).i)
      p1% = np(p1%).n: IF p1% = startind% THEN EXIT SUB
   LOOP
   DO WHILE py(np(np(p1%).l).i) <= py(np(p1%).i): p1% = np(p1%).l: LOOP
   itop% = p1%: pl% = np(p1%).l: pr% = np(p1%).n
   IF py(np(pl%).i) < py(np(pr%).i) THEN
      p2% = pl%: pl% = np(pl%).l: s% = &H1C
   ELSE
      p2% = pr%: pr% = np(pr%).n: s% = &H2C
   END IF
   DO
      p0% = p1%: p1% = p2%
      IF pl% = pr% THEN
         IF s% AND &H100 THEN LOCATE 1, 1: PRINT "Invalid polygon"; : EXIT SUB
         p2% = pl%: s% = s% \ 4 + &H110
      ELSEIF py(np(pl%).i) < py(np(pr%).i) THEN
         p2% = pl%: pl% = np(pl%).l: s% = s% \ 4 + &H10
      ELSE
         p2% = pr%: pr% = np(pr%).n: s% = s% \ 4 + &H20
      END IF
    
      IF pauseit% THEN
         CIRCLE (px(np(p0%).i), py(np(p0%).i)), 6, 1, , , 1
         CIRCLE (px(np(p1%).i), py(np(p1%).i)), 5, 2, , , 1
         CIRCLE (px(np(p2%).i), py(np(p2%).i)), 4, 4, , , 1
         DO: LOOP WHILE INKEY$ = ""
         CIRCLE (px(np(p0%).i), py(np(p0%).i)), 6, 0, , , 1
         CIRCLE (px(np(p1%).i), py(np(p1%).i)), 5, 0, , , 1
         CIRCLE (px(np(p2%).i), py(np(p2%).i)), 4, 0, , , 1
      END IF
    
      IF (s% AND &H24) = &H24 THEN
         p0% = np(p2%).l
        
         DO WHILE p0% <> p1%
            CALL drawtri(np(np(p0%).l).i, np(p0%).i, np(p2%).i)
            cuts% = cuts% - 1: IF cuts% < 0 THEN EXIT SUB
            p0% = np(p0%).l: np(p2%).l = p0%: np(p0%).n = p2% 'Delete node
         LOOP
         itop% = p1%: s% = s% OR &HC
      ELSEIF (s% AND &H18) = &H18 THEN
         p0% = np(p2%).n
         DO WHILE p0% <> p1%
            CALL drawtri(np(p2%).i, np(p0%).i, np(np(p0%).n).i)
            cuts% = cuts% - 1: IF cuts% < 0 THEN EXIT SUB
            p0% = np(p0%).n: np(p0%).l = p2%: np(p2%).n = p0% 'Delete node
         LOOP
         itop% = p1%: s% = s% OR &HC
      ELSEIF (s% AND &H15) = &H15 THEN
         DO
            IF (py(np(p1%).i) - py(np(p0%).i)) * (px(np(p2%).i) - px(np(p0%).i)) < (px(np(p1%).i) - px(np(p0%).i)) * (py(np(p2%).i) - py(np(p0%).i)) THEN EXIT DO
            CALL drawtri(np(p2%).i, np(p1%).i, np(p0%).i)
            cuts% = cuts% - 1: IF cuts% < 0 THEN EXIT SUB
            np(p0%).l = p2%: np(p2%).n = p0% 'Delete p1%
            p1% = p0%: IF p1% = itop% THEN EXIT DO
            p0% = np(p0%).n
         LOOP
      ELSEIF (s% AND &H2A) = &H2A THEN
         DO
            IF (px(np(p1%).i) - px(np(p0%).i)) * (py(np(p2%).i) - py(np(p0%).i)) < (py(np(p1%).i) - py(np(p0%).i)) * (px(np(p2%).i) - px(np(p0%).i)) THEN EXIT DO
            CALL drawtri(np(p0%).i, np(p1%).i, np(p2%).i)
            cuts% = cuts% - 1: IF cuts% < 0 THEN EXIT SUB
            np(p0%).n = p2%: np(p2%).l = p0% 'Delete p1%
            p1% = p0%: IF p1% = itop% THEN EXIT DO
            p0% = np(p0%).l
         LOOP
      END IF
   LOOP
END SUB

SUB tesspolygon (px(), py(), point2%(), nump%)
   IF nump% < 3 THEN EXIT SUB
  
   calcarea = 0
   FOR z% = 0 TO nump% - 1
      zz% = point2%(z%)
      calcarea = calcarea + (px(z%) - px(zz%)) * (py(z%) + py(zz%))
   NEXT z%
  
   FOR z% = nump% - 1 TO 0 STEP -1: got%(z%) = 0: NEXT z%
  
      'Get bunchindex(alias:bunch[].n) & numbunch
   sz% = nump% - 1: numbunch% = 0
   DO
      z% = sz%
      DO WHILE py(point2%(z%)) <= py(z%)
         z% = point2%(z%)
         IF z% = sz% THEN
            DO: got%(z%) = 1: z% = point2%(z%): LOOP WHILE z% <> sz%
            GOTO skiphoriz
         END IF
      LOOP
      DO WHILE py(point2%(z%)) >= py(z%): z% = point2%(z%): LOOP
      snumbunch% = numbunch%
      DO
         bunch(numbunch%).v = z%: bunch(numbunch%).l = numbunch% - 1
         DO: got%(z%) = 1: z% = point2%(z%): LOOP WHILE py(point2%(z%)) <= py(z%)
         bunch(numbunch% + 1).v = z%: bunch(numbunch% + 1).l = numbunch%
         DO: got%(z%) = 1: z% = point2%(z%): LOOP WHILE py(point2%(z%)) >= py(z%)
         numbunch% = numbunch% + 2
      LOOP WHILE got%(z%) = 0
      bunch(snumbunch%).l = numbunch% - 1
skiphoriz:
      FOR sz% = sz% - 1 TO 2 STEP -1
         IF got%(sz%) = 0 THEN EXIT FOR
      NEXT sz%
   LOOP WHILE sz% >= 2
  
   IF numbunch% = 2 THEN 'If only 2 bunches, do simple sort
      slist%(0) = 0: slist%(1) = 1: slistnum% = 2
   ELSE
         'Sort bunches by y's
      FOR z% = numbunch% - 1 TO 0 STEP -1: bunchi%(z%) = z%: NEXT z%
      gap% = numbunch% \ 2
      DO
         FOR z% = 0 TO numbunch% - gap% - 1
            FOR zz% = z% TO 0 STEP -gap%
               IF py(bunch(bunchi%(zz%)).v) <= py(bunch(bunchi%(zz% + gap%)).v) THEN EXIT FOR
               SWAP bunchi%(zz%), bunchi%(zz% + gap%)
            NEXT zz%
         NEXT z%
         gap% = gap% \ 2
      LOOP WHILE gap%
     
         'Generate slist - go though bunch tops in increasing order
      slistnum% = 0: j% = 0
      DO
         b% = bunchi%(j%)
         IF (b% AND 1) THEN
            bv% = bunch(b%).v: x = px(bv%): y = py(bv%)
               'Find where new bunch should be inserted on sort list by
               'finding first bunch on slist to the right of point (x,y)
               'At the same time, insert 2 new places for the 2 new bunches
            FOR i% = slistnum% - 1 TO 0 STEP -1
               IF got%(slist%(i%)) <> 2 THEN
                  e% = bunch(slist%(i%)).v
                  IF (slist%(i%) AND 1) THEN
                     WHILE py(point2%(e%)) < y: e% = point2%(e%): WEND
                  ELSE
                     WHILE py(point2%(e%)) > y: e% = point2%(e%): WEND
                  END IF
                  x3 = px(e%) - x: x4 = px(point2%(e%)) - x
                  IF (x3 < 0) <> (x4 < 0) THEN
                     y3 = py(e%) - y: y4 = py(point2%(e%)) - y
                     IF (x4 * y3 < x3 * y4) <> (y3 < 0) THEN EXIT FOR
                  ELSE
                     IF x3 < 0 THEN EXIT FOR
                  END IF
               END IF
               slist%(i% + 2) = slist%(i%)
            NEXT i%
               'Insert the 2 new bunches
            slist%(i% + (i% AND 1) + 1) = b%
            slist%(i% - (i% AND 1) + 2) = bunch(b%).l
            slistnum% = slistnum% + 2: IF slistnum% = numbunch% THEN EXIT DO
         ELSE
               'Don't compare these bunches any more (too high)
            got%(b%) = 2: got%(bunch(b%).l) = 2
         END IF
         j% = j% + 1
      LOOP
   END IF
   FOR z% = numbunch% - 1 TO 0 STEP -1: bunchi%(bunch(z%).l) = z%: NEXT z%
  
      'Put original data into a temporary doubly-linked list workspace
   FOR z% = 0 TO nump% - 1
      np(z%).n = point2%(z%): np(point2%(z%)).l = z%: np(z%).i = z%
   NEXT z%
   nnump% = nump%

   FOR j% = slistnum% - 2 TO 1 STEP -1
      z% = bunch(slist%(j%)).v: nz% = point2%(z%): lz% = np(np(z%).l).i
      IF (px(lz%) - px(z%)) * (py(nz%) - py(z%)) > (px(nz%) - px(z%)) * (py(lz%) - py(z%)) THEN
         x = px(z%): y = py(z%): sid% = (slist%(j%) AND 1)
        
         i% = np(z%).n
         DO WHILE i% >= nump%
            IF ABS(py(np(i%).i) < y OR (py(np(i%).i) = y AND px(np(i%).i) < x)) = sid% THEN GOTO cont
            i% = np(i% + 1 - ((i% XOR nump%) AND 1) * 2).n
         LOOP
        
         FOR i0% = j% - 1 TO 1 STEP -1
            i% = slist%(i0%)
            IF (i% AND 1) = 0 THEN
               IF y < py(bunch(i%).v) THEN
                  IF py(bunch(bunchi%(i%)).v) <= y THEN EXIT FOR
               END IF
            END IF
         NEXT i0%
         FOR i1% = j% + 1 TO slistnum% - 2
            i% = slist%(i1%)
            IF (i% AND 1) <> 0 THEN
               IF y > py(bunch(i%).v) THEN
                  IF py(bunch(bunchi%(i%)).v) >= y THEN EXIT FOR
               END IF
            END IF
         NEXT i1%

         sid% = sid% * 2 - 1
         bestx = 3E+38: IF sid% <= 0 THEN besty = 3E+38 ELSE besty = -3E+38
         lastb% = bunch(slist%(j%)).l
         FOR k% = i0% TO i1%
            IF k% <> j% AND slist%(k%) <> lastb% THEN
               i% = bunch(slist%(k%)).v: csid% = ((slist%(k%) AND 1) = 0)
               DO
                  xx = px(i%): yy = py(i%)
                  IF yy = besty AND besty <> y THEN
                     IF (bestx < xx) = csid% THEN bestx = xx: besti% = i%
                  ELSE
                     s0% = ABS(y < yy OR (y = yy AND x < xx))
                     s1% = ABS(besty < yy OR (besty = yy AND bestx < xx))
                     IF s1% - s0% = sid% THEN bestx = xx: besty = yy: besti% = i%
                  END IF
                  i% = point2%(i%)
               LOOP WHILE (py(i%) < yy) = csid% OR py(i%) = yy
            END IF
         NEXT k%

         IF besti% = z% THEN LOCATE 1, 1: PRINT z%; "attached to itself :("; : EXIT SUB

            'Make sure besti% is on correct np[].n,np[].l loop
         DO WHILE np(besti%).n >= nump%
            x0 = px(np(np(besti%).l).i): y0 = py(np(np(besti%).l).i)
            x1 = px(np(besti%).i): y1 = py(np(besti%).i)
            x2 = px(np(np(besti%).n).i): y2 = py(np(np(besti%).n).i)
            x3 = px(z%): y3 = py(z%)

            i0% = ((x1 - x0) * (y3 - y1) >= (y1 - y0) * (x3 - x1))
            i1% = ((x1 - x3) * (y2 - y1) >= (y1 - y3) * (x2 - x1))
            IF (x1 - x0) * (y2 - y1) >= (y1 - y0) * (x2 - x1) THEN 'ang < 180
               IF i0% AND i1% THEN EXIT DO
            ELSE
               IF i0% OR i1% THEN EXIT DO
            END IF

            besti% = np(besti%).n
            besti% = besti% + 1 - ((besti% XOR nump%) AND 1) * 2
         LOOP
           
            'Make sure z% is on correct np[].n,npl[].l loop
         DO WHILE np(z%).n >= nump%
            x0 = px(np(np(z%).l).i): y0 = py(np(np(z%).l).i)
            x1 = px(np(z%).i): y1 = py(np(z%).i)
            x2 = px(np(np(z%).n).i): y2 = py(np(np(z%).n).i)
            x3 = px(np(besti%).i): y3 = py(np(besti%).i)
           
            i0% = ((x1 - x0) * (y3 - y1) >= (y1 - y0) * (x3 - x1))
            i1% = ((x1 - x3) * (y2 - y1) >= (y1 - y3) * (x2 - x1))
            IF (x1 - x0) * (y2 - y1) >= (y1 - y0) * (x2 - x1) THEN 'ang < 180
               IF i0% AND i1% THEN EXIT DO
            ELSE
               IF i0% OR i1% THEN EXIT DO
            END IF

            z% = np(z%).n
            z% = z% + 1 - ((z% XOR nump%) AND 1) * 2
         LOOP
        
         IF fillmode% = 0 THEN
            IF shownodes% THEN
               LINE (px(np(z%).i), py(np(z%).i))-(px(np(besti%).i), py(np(besti%).i)), 5, , &H5555
            ELSE
               LINE (px(np(z%).i), py(np(z%).i))-(px(np(besti%).i), py(np(besti%).i)), 8
            END IF
         END IF
         np(nnump%).i = np(z%).i: np(nnump% + 1).i = np(besti%).i
         np(nnump%).n = np(z%).n: np(nnump% + 1).n = np(besti%).n
         np(nnump%).l = besti%:   np(nnump% + 1).l = z%
         np(np(z%).n).l = nnump%: np(np(besti%).n).l = nnump% + 1
         np(besti%).n = nnump%:   np(z%).n = nnump% + 1
         nnump% = nnump% + 2
      END IF
cont:
   NEXT j%
  
      'For debugging only...
   IF shownodes% THEN
      FOR i% = 0 TO slistnum% - 1
         z% = bunch(slist%(i%)).v: zz% = point2%(z%)
         x = px(z%) + (px(zz%) - px(z%)) * .25
         y = py(z%) + (py(zz%) - py(z%)) * .25
         CALL printnum(INT(x), INT(y), 3, i%)
      NEXT i%
   END IF
   DEF SEG = 0: IF (PEEK(&H417) AND 1) THEN EXIT SUB
   totarea = 0: gcol% = 0: gcol2% = 0

   FOR z% = nump% TO nnump% - 2: got%(z%) = 0: NEXT z%
   z% = nnump% - 1
   DO
      n% = 0
      DO
         got%(z%) = 3: z% = np(z%).n: n% = n% + 1
         IF n% > nnump% THEN LOCATE 1, 1: PRINT "Bad loop!"; : EXIT SUB
      LOOP WHILE got%(z%) <> 3
      gcol% = gcol% + 1: IF gcol% = 16 THEN gcol% = 1
      CALL tessmonotone(px(), py(), z%, n%)
      DO
         z% = z% - 1
         IF z% < 2 THEN
            IF calcarea <> totarea THEN LOCATE 1, 1: PRINT calcarea; "!="; totarea;
            EXIT SUB
         END IF
      LOOP WHILE got%(z%) = 3
   LOOP
END SUB

