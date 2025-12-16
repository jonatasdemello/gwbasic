DECLARE FUNCTION dist2linept2d! (bx!, by!, px!, py!, vx!, vy!, cr2!)
DECLARE SUB drawtri (x0!, y0!, x1!, y1!, x2!, y2!, col%)
DECLARE SUB printsmall (bakx&, baky&, c%, nam$)
DECLARE SUB deletepoint (z%)
DECLARE FUNCTION back2% (z%)
DECLARE SUB drawtrap (x0!, x1!, y0!, x2!, x3!, y1!)
DECLARE SUB triangupol (px() AS SINGLE, py() AS SINGLE, point2%(), numpoints%)
DECLARE FUNCTION inside% (x, y, startlin%, endlin%)
DECLARE SUB getpolygon ()

   'NOTE: This codebase started independently from TRIANGUL.BAS
   'Pros: Simpler algo, therefore less likely to have bugs
   'Cons: Generates more polygons than necessary
   '
   'Code originally taken from ORDFILL.BAS on 07/25/2005
   'ORDFILL.BAS originally taken from POLFILL.BAS on 06/07/2001
  
CONST XDIM = 640, YDIM = 350
SCREEN 9: DIM SHARED regs%(7)

CONST MAXPOINTS = 1024
DIM SHARED px(MAXPOINTS) AS SINGLE, py(MAXPOINTS) AS SINGLE
DIM SHARED point2%(MAXPOINTS), numpoints%

   '6 variables per vertex (TRIANGUL.BAS requires 8 variables per vertex)
DIM SHARED slist%(MAXPOINTS), npoint2%(MAXPOINTS)
TYPE raster: x AS SINGLE: y AS SINGLE: xi AS SINGLE: i AS INTEGER: END TYPE
DIM SHARED rst(MAXPOINTS) AS raster

CONST MAXPOLYS = 16
DIM SHARED loopnum%(MAXPOLYS), numloops%
DIM SHARED lastx%(YDIM)
DIM SHARED gridlock%, fillmode%, shownodes%
DIM SHARED mousx%, mousy%, numtris&, gcnt&
gridlock% = 0: fillmode% = 0: shownodes% = 1
mousx% = XDIM \ 2: mousy% = YDIM \ 2

DO
   CLS
   IF 1 THEN
      numloops% = 0: numpoints% = 0
      DO
         CALL getpolygon
         DEF SEG = 0
      LOOP WHILE (PEEK(&H417) AND 3) > 0
   ELSE
      IF numsectors% = 0 THEN
         OPEN "nsnoal.map" FOR BINARY ACCESS READ AS #1
         GET #1, , mapver&: GET #1, , posx&: GET #1, , posy&: GET #1, , posz&
         GET #1, , ang%: GET #1, , cursectnum%
         GET #1, , numsectors%
         DIM walptr%(numsectors%), walnum%(numsectors%)
         FOR z% = 0 TO numsectors% - 1
            z$ = STRING$(40, 0): GET #1, , z$
            walptr%(z%) = CVI(MID$(z$, 1, 2)): walnum%(z%) = CVI(MID$(z$, 3, 2))
         NEXT
         GET #1, , numwalls%
         DIM walx&(numwalls%), waly&(numwalls%), walpoint2%(numwalls%)
         FOR z% = 0 TO numwalls% - 1
            z$ = STRING$(32, 0): GET #1, , z$
            walx&(z%) = CVL(MID$(z$, 1, 4)): waly&(z%) = CVL(MID$(z$, 5, 4))
            walpoint2%(z%) = CVI(MID$(z$, 9, 2))
         NEXT
         CLOSE #1
         sec% = 0
      END IF
      DO
         j% = walptr%(sec%): n% = walnum%(sec%)
         sec% = sec% + 1: IF sec% >= numsectors% THEN sec% = 0
      LOOP WHILE n% <= 16
      minx& = &H7FFFFFFF: maxx& = &H80000000
      miny& = &H7FFFFFFF: maxy& = &H80000000
      FOR i% = j% TO j% + n% - 1
         IF walx&(i%) < minx& THEN minx& = walx&(i%)
         IF waly&(i%) < miny& THEN miny& = waly&(i%)
         IF walx&(i%) > maxx& THEN maxx& = walx&(i%)
         IF waly&(i%) > maxy& THEN maxy& = waly&(i%)
      NEXT
      sc = (XDIM - 1 - 4 * 2) / (maxx& - minx&)
      f = (YDIM - 1 - 3 * 2) / (maxy& - miny&): IF f < sc THEN sc = f
      sc = CVS(MKL$((CVL(MKS$(sc)) AND &HFF800000))) 'round sc down to power of 2
     
      numpoints% = n%
      FOR i% = j% TO j% + n% - 1
         px(i% - j%) = (walx&(i%) - minx&) * sc + 4
         py(i% - j%) = (waly&(i%) - miny&) * sc + 3
         point2%(i% - j%) = walpoint2%(i%) - j%
      NEXT
   END IF
  
   grabi% = -1
   DO
      regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
      mousx% = mousx% + regs%(2): mousy% = mousy% + regs%(3)
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      obstatus% = bstatus%: bstatus% = regs%(0)
      IF mousx% < 4 THEN mousx% = 4
      IF mousy% < 4 THEN mousy% = 4
      IF mousx% >= XDIM - 4 THEN mousx% = XDIM - 4 - 1
      IF mousy% >= YDIM - 4 THEN mousy% = YDIM - 4 - 1
      IF (bstatus% AND 1) > (obstatus% AND 1) THEN
         maxdist2 = 16 ^ 2
         FOR z% = 0 TO numpoints% - 1
            dist2 = (px(z%) - mousx%) ^ 2 + (py(z%) - mousy%) ^ 2
            IF dist2 < maxdist2 THEN grabi% = z%: maxdist2 = dist2
         NEXT
      ELSEIF (bstatus% AND 1) < (obstatus% AND 1) THEN
         IF grabi% >= 0 THEN
            i% = back2%(grabi%): j% = point2%(grabi%)
            IF (px(i%) - px(grabi%)) ^ 2 + (py(i%) - py(grabi%)) ^ 2 < 10 ^ 2 THEN
               CALL deletepoint(grabi%)
            ELSEIF (px(j%) - px(grabi%)) ^ 2 + (py(j%) - py(grabi%)) ^ 2 < 10 ^ 2 THEN
               CALL deletepoint(grabi%)
            END IF
            grabi% = -1
         END IF
      END IF
      IF grabi% >= 0 THEN
         IF gridlock% = 0 THEN
            px(grabi%) = mousx%: py(grabi%) = mousy%
         ELSE
            px(grabi%) = (mousx% + 8) AND NOT 15
            py(grabi%) = (mousy% + 8) AND NOT 15
         END IF
      END IF
      IF numpoints% = 0 THEN EXIT DO

      z$ = INKEY$
      IF UCASE$(z$) = "S" THEN shownodes% = 1 - shownodes%
      IF UCASE$(z$) = "G" THEN gridlock% = 1 - gridlock%
      IF UCASE$(z$) = "R" THEN
         dax = px(0): day = py(0)
         FOR z% = 0 TO numpoints% - 1
            IF point2%(z%) < z% THEN EXIT FOR
            px(z%) = px(z% + 1)
            py(z%) = py(z% + 1)
         NEXT
         px(z%) = dax: py(z%) = day
      END IF
      IF UCASE$(z$) = "F" THEN fillmode% = 1 - fillmode%
      IF z$ = CHR$(0) + CHR$(82) THEN
         minl = 12 ^ 2: grabl% = -1
         fmousx = mousx%: fmousy = mousy%
         FOR z% = numpoints% - 1 TO 0 STEP -1
            zz% = point2%(z%)
            IF dist2linept2d(fmousx, fmousy, px(z%), py(z%), px(zz%) - px(z%), py(zz%) - py(z%), minl) <> 0 THEN
               grabl% = z%
            END IF
         NEXT z%
         IF grabl% >= 0 THEN
            numpoints% = numpoints% + 1 'Insert after grabl%
            FOR z% = numpoints% - 1 TO grabl% + 2 STEP -1
               px(z%) = px(z% - 1)
               py(z%) = py(z% - 1)
               point2%(z%) = point2%(z% - 1)
            NEXT z%
            FOR z% = 0 TO numpoints% - 1
               IF point2%(z%) > grabl% THEN point2%(z%) = point2%(z%) + 1
            NEXT z%
            point2%(grabl% + 1) = point2%(grabl%)
            point2%(grabl%) = grabl% + 1
            px(grabl% + 1) = fmousx
            py(grabl% + 1) = fmousy
         END IF
      END IF


      CLS 0
      IF gridlock% THEN
         FOR y% = 0 TO YDIM - 1 STEP 16
            FOR x% = 0 TO XDIM - 1 STEP 16: PSET (x%, y%), 8: NEXT
         NEXT
      END IF
      IF fillmode% = 0 THEN
         FOR i% = 0 TO numpoints% - 1
            j% = point2%(i%)
            LINE (px(i%), py(i%))-(px(j%), py(j%)), 7, , &H6666
         NEXT
      END IF
      numtris& = 0: gcnt& = 0
      CALL triangupol(px(), py(), point2%(), numpoints%)
      IF shownodes% THEN
         FOR i% = 0 TO numpoints% - 1
            CALL printsmall(INT(px(i%)), INT(py(i%)), 15, STR$(i%))
         NEXT
      END IF
      CIRCLE (mousx%, mousy%), 2, 15, , , 1

      st$ = LTRIM$(STR$(numtris&)) + "tris"
      LOCATE 1, 80 - LEN(st$): PRINT st$;
      st$ = LTRIM$(STR$(gcnt&)) + "/" + LTRIM$(STR$(numpoints%)) + "=" + LTRIM$(STR$(gcnt& / numpoints%))
      LOCATE 2, 80 - LEN(st$): PRINT st$;

      SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8

   LOOP WHILE z$ <> CHR$(13) AND z$ <> CHR$(27)
LOOP WHILE z$ <> CHR$(27)

FUNCTION back2% (z%)
   IF z% > 0 THEN IF point2%(z% - 1) = z% THEN back2% = z% - 1: EXIT FUNCTION
   FOR i% = z% + 1 TO numpoints% - 1
      IF point2%(i%) = z% THEN back2% = i%: EXIT FUNCTION
   NEXT
   FOR i% = z% TO 0 STEP -1
      IF point2%(i%) = z% THEN EXIT FOR
   NEXT
   back2% = i%
END FUNCTION

SUB deletepoint (i%)
   IF i% < 0 THEN EXIT SUB
   z% = back2%(i%): IF z% >= 0 THEN point2%(z%) = point2%(i%)
   numpoints% = numpoints% - 1
   FOR z% = i% TO numpoints% - 1
      px(z%) = px(z% + 1)
      py(z%) = py(z% + 1)
      point2%(z%) = point2%(z% + 1)
   NEXT z%
   FOR z% = 0 TO numpoints% - 1
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

SUB drawtrap (x0, x1, y0, x2, x3, y1)
   IF y0 = y1 THEN EXIT SUB
   IF x0 = x1 THEN
      x = (x2 + x3 + x0) / 3: y = (y0 + y1 * 2) / 3: numtris& = numtris& + 1
   ELSEIF x2 = x3 THEN
      x = (x3 + x0 + x1) / 3: y = (y0 * 2 + y1) / 3: numtris& = numtris& + 1
   ELSE
      x = (x0 + x1 + x2 + x3) / 4: y = (y0 + y1) / 2: numtris& = numtris& + 2
   END IF
   
   IF fillmode% = 0 THEN
      LINE (x0, y0)-(x, y), 8, , &H5555
      LINE (x1, y0)-(x, y), 8, , &H5555
      LINE (x2, y1)-(x, y), 8, , &H5555
      LINE (x3, y1)-(x, y), 8, , &H5555
      CIRCLE (x, y), 1, 8, , , 1
  
      'LINE (x3, y1)-(x0, y0), 5
      PSET (x0, y0), 4
      LINE -(x1, y0), 4: LINE -(x3, y1), 4
      LINE -(x2, y1), 4: LINE -(x0, y0), 4
   ELSE
      IF x0 = x1 THEN
         CALL drawtri(x0, y0, x3, y1, x2, y1, 5)
      ELSEIF x2 = x3 THEN
         CALL drawtri(x0, y0, x1, y0, x3, y1, 4)
      ELSE
         CALL drawtri(x0, y0, x1, y0, x3, y1, 4)
         CALL drawtri(x0, y0, x3, y1, x2, y1, 5)
      END IF
   END IF
END SUB

SUB drawtri (x0, y0, x1, y1, x2, y2, col%)
   IF (x1 - x0) * (y2 - y0) <= (y1 - y0) * (x2 - x0) THEN EXIT SUB
   DIM x(3), y(3)
   x(0) = x0: y(0) = y0
   x(1) = x1: y(1) = y1
   x(2) = x2: y(2) = y2
   mini% = ABS(y(0) >= y(1)): maxi% = 1 - mini%
   IF y(2) < y(mini%) THEN mini% = 2
   IF y(2) > y(maxi%) THEN maxi% = 2
  
   i% = maxi%: y% = INT(y(maxi%))
   DO
      j% = i% + 1: IF j% >= 3 THEN j% = 0
      yn% = INT(y(j%))
      IF yn% < y% THEN
         m = (x(j%) - x(i%)) / (y(j%) - y(i%)): x = (y% - y(j%)) * m + x(j%)
         DO WHILE yn% < y%
            lastx%(y%) = INT(x): x = x - m: y% = y% - 1
         LOOP
      END IF
      i% = j%
   LOOP WHILE i% <> mini%
   DO
      j% = i% + 1: IF j% >= 3 THEN j% = 0
      yn% = INT(y(j%))
      IF yn% > y% THEN
         m = (x(j%) - x(i%)) / (y(j%) - y(i%)): x = (y% - y(i%)) * m + x(i%)
         DO WHILE yn% > y%
            y% = y% + 1: x = x + m: LINE (lastx%(y%), y%)-(INT(x), y%), col%
         LOOP
      END IF
      i% = j%
   LOOP WHILE i% <> maxi%
END SUB

SUB getpolygon
   pag% = 0
   startnumpoints% = numpoints%
   loopnum%(numloops%) = startnumpoints%
   point2%(startnumpoints%) = numpoints%
   bstatus% = 3
   DO
      regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
      mousx% = mousx% + regs%(2): mousy% = mousy% + regs%(3)
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      obstatus% = bstatus%: bstatus% = regs%(0)
      IF mousx% < 4 THEN mousx% = 4
      IF mousy% < 4 THEN mousy% = 4
      IF mousx% >= XDIM - 4 THEN mousx% = XDIM - 4 - 1
      IF mousy% >= YDIM - 4 THEN mousy% = YDIM - 4 - 1
      IF gridlock% = 0 THEN
         px(numpoints%) = mousx%: py(numpoints%) = mousy%
      ELSE
         px(numpoints%) = (mousx% + 8) AND NOT 15
         py(numpoints%) = (mousy% + 8) AND NOT 15
      END IF
   
      CLS 0
      IF gridlock% THEN
         FOR y% = 0 TO YDIM - 1 STEP 16
            FOR x% = 0 TO XDIM - 1 STEP 16: PSET (x%, y%), 8: NEXT
         NEXT
      END IF

   
      FOR zx% = 0 TO numloops%
         IF zx% = numloops% THEN daend% = numpoints% ELSE daend% = loopnum%(zx% + 1) - 1
         FOR z% = loopnum%(zx%) TO daend%
            zz% = point2%(z%)
            LINE (px(z%), py(z%))-(px(zz%), py(zz%)), 4 - (zx% AND 1) * 3
            CIRCLE (px(z%), py(z%)), 2, 4 - (zx% AND 1) * 3, , , 1
         NEXT z%
      NEXT zx%
     
      FOR zx% = 0 TO numloops%
         IF zx% = numloops% THEN daend% = numpoints% ELSE daend% = loopnum%(zx% + 1) - 1
         FOR z% = loopnum%(zx%) TO daend%
            zz% = point2%(z%): zzz% = point2%(zz%)
            'IF (py(z%) < py(zz%)) <> (py(zz%) < py(zzz%)) THEN
            '   CIRCLE (px(zz%), py(zz%)), 3, 15, , , 1
            'END IF
         NEXT z%
      NEXT zx%
     
      SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   
      z$ = INKEY$
      IF (z$ = " " OR (bstatus% AND 1) > 0) AND numpoints% < MAXPOINTS - 1 THEN
         good% = 0
         IF numpoints% = startnumpoints% THEN
            good% = 1
         ELSE
            IF ABS(mousx% - px(numpoints% - 1)) + ABS(mousy% - py(numpoints% - 1)) > 1 THEN good% = 1
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
      IF UCASE$(z$) = "G" THEN gridlock% = 1 - gridlock%
   LOOP WHILE ((z$ <> CHR$(13) OR z$ = " ") AND ((bstatus% AND 2) <= (obstatus% AND 2)) OR ((bstatus% AND 1) > 0)) OR (numpoints% < startnumpoints% + 2)

   numpoints% = numpoints% + 1
   loopnum%(numloops% + 1) = numpoints%
   numloops% = numloops% + 1

   FOR p% = 0 TO numloops% - 1
         'Get area of polygon using Horizontal Slabs (trapezoids)
      'area& = 0
      'FOR z% = loopnum%(p%) TO loopnum%(p%+1)-1
      '   zz% = point2%(z%)
      '   area& = area& + (px(z%) + px(zz%)) * (py(zz%) - py(z%))
      'NEXT z%
      'area& = area& \ 2

         'Get area of polygon using pieces of pie (triangles)
         '(0,0),(x1,y1),(x2,y1) using z of cross product, multiply-optimized
      area& = 0
      FOR z% = loopnum%(p%) TO loopnum%(p% + 1) - 1
         zz% = point2%(z%)
         area& = area& + (px(z%) - px(point2%(zz%))) * py(zz%)
      NEXT z%
      'area& = area& \ 2

      'LOCATE 1, 1: PRINT area& \ 2;
 
      cnt% = 0: fx = px(loopnum%(p%)): fy = py(loopnum%(p%))
      FOR pp% = 0 TO numloops% - 1
         IF p% <> pp% THEN
            cnt% = cnt% XOR inside%(fx, fy, loopnum%(pp%), loopnum%(pp% + 1) - 1)
         END IF
      NEXT pp%
 
      IF (area& < 0) <> (cnt% > 0) THEN
         FOR z% = (loopnum%(p% + 1) - loopnum%(p%)) \ 2 - 1 TO 0 STEP -1
            SWAP px(z% + loopnum%(p%)), px(loopnum%(p% + 1) - 1 - z%)
            SWAP py(z% + loopnum%(p%)), py(loopnum%(p% + 1) - 1 - z%)
         NEXT z%
         FOR z% = 0 TO 31
            SOUND z% * 16 + 40, .03
         NEXT z%
      END IF
   NEXT p%
END SUB

FUNCTION inside% (x, y, startlin%, endlin%)
   cnt% = 0
   FOR z% = startlin% TO endlin%
      zz% = point2%(z%)
      y1 = py(z%) - y: y2 = py(zz%) - y
      IF y1 * y2 < 0 THEN
         x1 = px(z%) - x: x2 = px(zz%) - x
         IF x1 * x2 < 0 THEN
            IF (x2 * y1 - x1 * y2) * y1 < 0 THEN cnt% = 1 - cnt%
         ELSE
            IF x1 < 0 THEN cnt% = 1 - cnt%
         END IF
      END IF
   NEXT z%
   inside% = cnt%
END FUNCTION

SUB printsmall (bakx&, baky&, c%, nam$)
   nam$ = LTRIM$(RTRIM$(nam$))
   x& = bakx& - LEN(nam$) * 2
   y& = baky& - 2
   IF x& >= XDIM OR y& >= YDIM THEN EXIT SUB
   'LINE (x& - 1, y& - 1)-(x& + LEN(nam$) * 4 - 1, y& + 5), 0, BF
   FOR z% = 1 TO LEN(nam$)
      n% = ASC(MID$(nam$, z%, 1)) - 48
      IF n% = -2 THEN
         PSET (x& + 1, y& + 4), c%
      ELSEIF n% = -3 THEN
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

SUB triangupol (px() AS SINGLE, py() AS SINGLE, point2%(), numpoints%)
     
      'Remove unnecessary collinear points:
   FOR i% = 0 TO numpoints% - 1: npoint2%(i%) = point2%(i%): NEXT
   i% = 0: npoints% = numpoints%: z% = 0
   DO WHILE i% < numpoints%
      j% = npoint2%(i%)
      IF point2%(i%) < i% AND i% < numpoints% - 1 THEN z% = 3
      IF j% < 0 THEN i% = i% + 1: GOTO cont0
      k% = npoint2%(j%) '(i)---(j)---(k)
      m0 = (px(j%) - px(i%)) * (py(k%) - py(j%))
      m1 = (py(j%) - py(i%)) * (px(k%) - px(j%))
      IF m0 < m1 THEN z% = z% OR 1: i% = i% + 1: GOTO cont0
      IF m0 > m1 THEN z% = z% OR 2: i% = i% + 1: GOTO cont0
      npoint2%(i%) = k%: npoint2%(j%) = -1: npoints% = npoints% - 1
cont0:
   LOOP
   IF z% = 0 THEN EXIT SUB
   j% = 0
   FOR i% = 0 TO numpoints% - 1
      IF npoint2%(i%) >= 0 THEN slist%(j%) = i%: j% = j% + 1
   NEXT
   IF z% <> 3 THEN
      x0 = px(slist%(0)): y0 = py(slist%(0))
      FOR i% = 1 TO npoints% - 1
         j% = slist%(i%)
         x1 = px(j%): y1 = py(j%): j% = npoint2%(j%)
         x2 = px(j%): y2 = py(j%)
         IF fillmode% = 0 THEN
            PSET (x0, y0), 4: LINE -(x1, y1), 4
            LINE -(x2, y2), 4: LINE -(x0, y0), 4
         ELSE
            CALL drawtri(x0, y0, x1, y1, x2, y2, 5 - (i% AND 1))
         END IF
         numtris& = numtris& + 1
      NEXT
      EXIT SUB
   END IF

      'Sort points by y's
   gap% = npoints% \ 2
   DO
      FOR i% = 0 TO npoints% - gap% - 1
         FOR j% = i% TO 0 STEP -gap%
            IF py(npoint2%(slist%(j%))) <= py(npoint2%(slist%(j% + gap%))) THEN EXIT FOR
            SWAP slist%(j%), slist%(j% + gap%)
         NEXT
      NEXT
      gap% = gap% \ 2
   LOOP WHILE gap%
  
   numrst% = 0
   FOR z% = 0 TO npoints% - 1
      i0% = slist%(z%): i1% = npoint2%(i0%): IF py(i0%) = py(i1%) THEN GOTO cont1
      i2% = i1%: i3% = npoint2%(i1%)
      'DO WHILE py(i1%) = py(i3%): i2% = i3%: i3% = npoint2%(i3%): LOOP
      IF py(i1%) = py(i3%) THEN i2% = i3%: i3% = npoint2%(i3%)

      sy = py(i1%)
     
         'i0        i3
         '  \      /
         '   i1--i2
         '  /      \
         'i0        i3
     
      IF py(i1%) < py(i0%) AND py(i2%) < py(i3%) THEN 'Insert raster
         FOR i% = numrst% TO 1 STEP -1
            gcnt& = gcnt& + 1
            IF rst(i% - 1).x + rst(i% - 1).xi * (sy - rst(i% - 1).y) < px(i1%) THEN EXIT FOR
            rst(i% + 1) = rst(i% - 1)
         NEXT
         numrst% = numrst% + 2

         IF (i% AND 1) THEN 'split inside area
            j% = i% - 1
           
            x0 = rst(j% + 0).x + rst(j% + 0).xi * (sy - rst(j% + 0).y)
            x1 = rst(j% + 1).x + rst(j% + 1).xi * (sy - rst(j% + 1).y)
            CALL drawtrap(rst(j%).x, rst(j% + 1).x, rst(j%).y, x0, x1, sy)
            rst(j% + 0).x = x0: rst(j% + 0).y = sy
            rst(j% + 3).x = x1: rst(j% + 3).y = sy
         END IF
        
         m0 = (px(i0%) - px(i1%)) / (py(i0%) - py(i1%))
         m1 = (px(i3%) - px(i2%)) / (py(i3%) - py(i2%))
         j% = i% + ABS((px(i1%) > px(i2%)) OR ((i1% = i2%) AND (m0 >= m1)))
         k% = i% + i% + 1 - j%
         rst(j%).i = i0%: rst(j%).xi = m0: rst(j%).x = px(i1%): rst(j%).y = py(i1%)
         rst(k%).i = i3%: rst(k%).xi = m1: rst(k%).x = px(i2%): rst(k%).y = py(i2%)
        
      ELSE
        
         IF i1% = i2% THEN
            FOR i% = 0 TO numrst% - 1
               gcnt& = gcnt& + 1
               IF rst(i%).i = i1% THEN EXIT FOR
            NEXT
         ELSE
            FOR i% = 0 TO numrst% - 1
               gcnt& = gcnt& + 1
               IF rst(i%).i = i1% OR rst(i%).i = i2% THEN EXIT FOR
            NEXT
         END IF
         j% = i% AND (NOT 1)
     
         IF py(i1%) > py(i0%) AND py(i2%) > py(i3%) THEN 'Delete raster
            FOR j% = j% TO i% + 1 STEP 2
               x0 = rst(j% + 0).x + rst(j% + 0).xi * (sy - rst(j% + 0).y)
               IF j% = i% AND i1% = i2% THEN
                  x1 = x0
               ELSE
                  x1 = rst(j% + 1).x + rst(j% + 1).xi * (sy - rst(j% + 1).y)
               END IF
               CALL drawtrap(rst(j%).x, rst(j% + 1).x, rst(j%).y, x0, x1, sy)
               rst(j% + 0).x = x0: rst(j% + 0).y = sy
               rst(j% + 1).x = x1: rst(j% + 1).y = sy
            NEXT
                                           
            numrst% = numrst% - 2
            FOR i% = i% TO numrst% - 1
               gcnt& = gcnt& + 1
               rst(i%) = rst(i% + 2)
            NEXT
         ELSE
            x0 = rst(j% + 0).x + rst(j% + 0).xi * (sy - rst(j% + 0).y)
            x1 = rst(j% + 1).x + rst(j% + 1).xi * (sy - rst(j% + 1).y)
            CALL drawtrap(rst(j%).x, rst(j% + 1).x, rst(j%).y, x0, x1, sy)
            rst(j% + 0).x = x0: rst(j% + 0).y = sy
            rst(j% + 1).x = x1: rst(j% + 1).y = sy
           
            IF py(i0%) < py(i3%) THEN
               rst(i%).x = px(i2%): rst(i%).y = py(i2%): rst(i%).i = i3%
            ELSE
               rst(i%).x = px(i1%): rst(i%).y = py(i1%): rst(i%).i = i0%
            END IF
            rst(i%).xi = (px(rst(i%).i) - rst(i%).x) / (py(rst(i%).i) - sy)
         END IF
      END IF
cont1:
   NEXT
END SUB

