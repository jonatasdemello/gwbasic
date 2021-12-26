DECLARE SUB initopticansee (x!, y!)
DECLARE FUNCTION opticansee! (x2!, y2!)
DECLARE SUB findbunches (x!, y!)
DECLARE SUB precalcpaths ()
DECLARE SUB heapremove (offs!)
DECLARE SUB heapchangeval (heapindex!, newheapval!)
DECLARE SUB heapinit ()
DECLARE SUB heapinsert (num!, tag!)
DECLARE SUB heapremovetop ()
DECLARE FUNCTION getfakeangle! (dx!, dy!)
DECLARE FUNCTION easyinside! (x!, y!)
DECLARE FUNCTION inside! (x!, y!)
DECLARE SUB findpaths (x1!, y1!, x2!, y2!)
DECLARE FUNCTION cansee! (x1!, y1!, x2!, y2!)
DECLARE SUB drawboard ()
DECLARE SUB initboard ()
DECLARE SUB printsmall (bakx&, baky&, c%, nam$)

CONST XDIM = 640, YDIM = 350

CONST MAXPOINTS = 1024, MAXPOLYS = 64

DIM SHARED px(MAXPOINTS) AS SINGLE
DIM SHARED py(MAXPOINTS) AS SINGLE
DIM SHARED point2(MAXPOINTS) AS LONG
DIM SHARED numpoints AS LONG

DIM SHARED poly(MAXPOLYS) AS LONG, numpolys AS LONG

DIM SHARED obx(MAXPOINTS) AS SINGLE
DIM SHARED oby(MAXPOINTS) AS SINGLE
DIM SHARED obp(MAXPOINTS) AS LONG
DIM SHARED got(MAXPOINTS) AS LONG
DIM SHARED obparent(MAXPOINTS) AS LONG
DIM SHARED obhead(MAXPOINTS) AS LONG
DIM SHARED obcnt AS LONG

DIM SHARED obpoint2(MAXPOINTS) AS LONG
DIM SHARED obdist(MAXPOINTS) AS LONG
DIM SHARED obn(MAXPOINTS) AS LONG
DIM SHARED obconnectcnt AS LONG

DIM SHARED ocsx, ocsy AS SINGLE
DIM SHARED ocsx31(MAXPOINTS) AS SINGLE
DIM SHARED ocsy31(MAXPOINTS) AS SINGLE
DIM SHARED ocsx34(MAXPOINTS) AS SINGLE
DIM SHARED ocsy34(MAXPOINTS) AS SINGLE
DIM SHARED ocshead(8), ocsnext(8, MAXPOINTS) AS LONG
DIM SHARED ocslistcnt AS LONG

DIM SHARED heapval(MAXPOINTS) AS SINGLE
DIM SHARED heaptag(MAXPOINTS) AS LONG
DIM SHARED heapcnt AS LONG

DIM SHARED regs%(7), pag%: pag% = 0
regs%(0) = 0: CALL int86old(&H33, regs%(), regs%())

SCREEN 9
DO
   CALL initboard
   CALL precalcpaths
   CLS 1
   goalx = -1: goaly = -1: mousx = XDIM \ 2: mousy = YDIM \ 2
   DO
      CLS 1

      z$ = INKEY$
      IF z$ = " " THEN
         IF easyinside(mousx, mousy) <> 0 THEN goalx = mousx: goaly = mousy
      END IF
      IF z$ = CHR$(8) THEN goalx = -1: goaly = -1
     
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      obstatus% = bstatus%: bstatus% = regs%(0)
      IF (bstatus% AND 1) < (obstatus% AND 1) THEN
         mousx = px(caughtvert): mousy = py(caughtvert)
         CALL precalcpaths
      END IF
      IF (bstatus% AND 1) <> 0 THEN
         IF caughtvert >= numpoints THEN obstatus% = 0
         IF (bstatus% AND 1) > (obstatus% AND 1) THEN
            mindist = &H7FFFFFFF
            FOR zx = 0 TO numpoints - 1
               ndist = (mousx - px(zx)) * (mousx - px(zx)) + (mousy - py(zx)) * (mousy - py(zx))
               IF ndist < mindist THEN mindist = ndist: caughtvert = zx
            NEXT zx
         END IF
         regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
         px(caughtvert) = px(caughtvert) + regs%(2) \ 2
         py(caughtvert) = py(caughtvert) + regs%(3) \ 2
         IF px(caughtvert) < 4 THEN px(caughtvert) = 4
         IF px(caughtvert) > XDIM - 4 THEN px(caughtvert) = XDIM - 4
         IF py(caughtvert) < 4 THEN py(caughtvert) = 4
         IF py(caughtvert) > YDIM - 4 THEN py(caughtvert) = YDIM - 4
      ELSE
         regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
         mousx = mousx + regs%(2): mousy = mousy + regs%(3)
         IF mousx < 4 THEN mousx = 4
         IF mousx > XDIM - 4 THEN mousx = XDIM - 4
         IF mousy < 4 THEN mousy = 4
         IF mousy > YDIM - 4 THEN mousy = YDIM - 4
         CIRCLE (mousx, mousy), 2, 15, , , 1
      END IF
     
      CALL drawboard
      IF goalx >= 0 THEN
         CIRCLE (goalx, goaly), 2, 15, , , 1
         CALL findpaths(goalx, goaly, mousx, mousy)
      ELSE
         CALL findbunches(mousx, mousy)
      END IF
    
      SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
     
   LOOP WHILE z$ <> CHR$(13) AND z$ <> CHR$(27)
LOOP WHILE z$ <> CHR$(27)

FUNCTION cansee (x1, y1, x2, y2)
   x21 = x2 - x1: y21 = y2 - y1
   FOR z = numpoints - 1 TO 0 STEP -1
      x34 = px(z) - px(point2(z)): y34 = py(z) - py(point2(z))
      bot = y21 * x34 - x21 * y34
      IF bot > 0 THEN
         x31 = px(z) - x1: y31 = py(z) - y1
         t = y21 * x31 - x21 * y31
         IF t > 0 AND t < bot THEN
            t = y31 * x34 - x31 * y34
            IF t >= 0 AND t <= bot THEN cansee = 0: EXIT FUNCTION
         END IF
      END IF
   NEXT z
   cansee = 1
END FUNCTION

SUB drawboard
   FOR z = 0 TO numpoints - 1
      x1 = px(z): x2 = px(point2(z))
      y1 = py(z): y2 = py(point2(z))
      CIRCLE (x1, y1), 2, 4, , , 1
      LINE (x1, y1)-(x2, y2), 4
      'CALL printsmall((x1 + x2) / 2, (y1 + y2) / 2, 4, STR$(z))
   NEXT z
END SUB

FUNCTION easyinside (x, y)
      'on line test
   FOR z = 0 TO numpoints - 1
      IF (px(point2(z)) - px(z)) * (y - py(z)) = (py(point2(z)) - py(z)) * (x - px(z)) THEN easyinside = 1: EXIT FUNCTION
   NEXT z
   easyinside = inside(x, y)
END FUNCTION

SUB findbunches (x, y)
   IF easyinside(x, y) = 0 THEN EXIT SUB

   b = 0: f = 0
   FOR z = 0 TO numpoints - 1
      zz = point2(z): zzz = point2(zz)
      t1 = (x - px(z)) * (py(zz) - py(z)) - (y - py(z)) * (px(zz) - px(z))
     
      't2 = (x - px(zz)) * (py(zzz) - py(zz)) - (y - py(zz)) * (px(zzz) - px(zz))
      IF t1 >= 0 THEN
         b = b + 1
      ELSE
         f = f + 1
         LINE (px(z) + 1, py(z))-(px(zz) + 1, py(zz)), 12
         LINE (px(z) - 1, py(z))-(px(zz) - 1, py(zz)), 12
         LINE (px(z), py(z) + 1)-(px(zz), py(zz) + 1), 12
         LINE (px(z), py(z) - 1)-(px(zz), py(zz) - 1), 12
         LINE (px(z), py(z))-(px(zz), py(zz)), 12
      END IF
      'IF (t1 XOR t2) < 0 THEN
      '   CIRCLE (px(zz), py(zz)), 2, 15,,,1
      '   PAINT (px(zz), py(zz)), 15, 15
      'END IF
   NEXT z
   LOCATE 1, 1: PRINT f; b

END SUB

SUB findpaths (x1, y1, x2, y2)
   IF easyinside(x1, y1) = 0 THEN EXIT SUB
   IF easyinside(x2, y2) = 0 THEN EXIT SUB

   IF cansee(x1, y1, x2, y2) <> 0 THEN LINE (x1, y1)-(x2, y2), 15: EXIT SUB
  
   FOR z = 0 TO obcnt + 1: got(z) = 0: NEXT z

   obx(obcnt) = x1: oby(obcnt) = y1: obhead(obcnt) = -1
   obx(obcnt + 1) = x2: oby(obcnt + 1) = y2: obhead(obcnt + 1) = -1
  
   nobconnectcnt = obconnectcnt
  
   CALL initopticansee(obx(obcnt), oby(obcnt))
   FOR z = 0 TO obcnt - 1
      p1 = obp(z): p2 = point2(p1): p3 = point2(p2)
      t1 = (obx(obcnt) - px(p2)) * (py(p1) - py(p2)) - (oby(obcnt) - py(p2)) * (px(p1) - px(p2))
      t2 = (obx(obcnt) - px(p2)) * (py(p3) - py(p2)) - (oby(obcnt) - py(p2)) * (px(p3) - px(p2))
      IF (t1 >= 0 AND t2 >= 0) OR (t1 <= 0 AND t2 <= 0) THEN
         'LINE (obx(obcnt), oby(obcnt))-(obx(z), oby(z)), 8, , &H1111
         IF opticansee(obx(z), oby(z)) <> 0 THEN
            obn(nobconnectcnt) = obhead(z)
            obhead(z) = nobconnectcnt
            obpoint2(nobconnectcnt) = obcnt
            obdist(nobconnectcnt) = SQR((obx(obcnt) - obx(z)) * (obx(obcnt) - obx(z)) + (oby(obcnt) - oby(z)) * (oby(obcnt) - oby(z)))
            nobconnectcnt = nobconnectcnt + 1
         END IF
      END IF
   NEXT z
     
   CALL initopticansee(obx(obcnt + 1), oby(obcnt + 1))
   FOR z = 0 TO obcnt - 1
      p1 = obp(z): p2 = point2(p1): p3 = point2(p2)
      t1 = (obx(obcnt + 1) - px(p2)) * (py(p1) - py(p2)) - (oby(obcnt + 1) - py(p2)) * (px(p1) - px(p2))
      t2 = (obx(obcnt + 1) - px(p2)) * (py(p3) - py(p2)) - (oby(obcnt + 1) - py(p2)) * (px(p3) - px(p2))
      IF (t1 >= 0 AND t2 >= 0) OR (t1 <= 0 AND t2 <= 0) THEN
         'LINE (obx(obcnt + 1), oby(obcnt + 1))-(obx(z), oby(z)), 8, , &H1111
         IF opticansee(obx(z), oby(z)) <> 0 THEN
            obn(nobconnectcnt) = obhead(obcnt + 1)
            obhead(obcnt + 1) = nobconnectcnt
            obpoint2(nobconnectcnt) = z
            obdist(nobconnectcnt) = SQR((obx(obcnt + 1) - obx(z)) * (obx(obcnt + 1) - obx(z)) + (oby(obcnt + 1) - oby(z)) * (oby(obcnt + 1) - oby(z)))
            nobconnectcnt = nobconnectcnt + 1
         END IF
      END IF
   NEXT z
  
   CALL heapinit
   CALL heapinsert(0, obcnt + 1): got(obcnt + 1) = 1: obparent(obcnt + 1) = -1
   DO
      cdist = heapval(1): startz = heaptag(1): IF startz = obcnt THEN EXIT DO
      CALL heapremovetop

      got(startz) = 2
     
      z = obhead(startz)
      DO WHILE z >= 0
         zz = obpoint2(z)
         IF got(zz) = 0 THEN
            CALL heapinsert(cdist + obdist(z), zz): got(zz) = 1
            obparent(zz) = startz
         ELSEIF got(zz) = 1 THEN
            FOR zzz = 1 TO heapcnt
               IF heaptag(zzz) = zz THEN EXIT FOR
            NEXT zzz
            IF cdist + obdist(z) < heapval(zzz) THEN
               CALL heapchangeval(zzz, cdist + obdist(z))
               obparent(zz) = startz
            END IF
         END IF
         z = obn(z)
      LOOP
   LOOP WHILE heapcnt > 0
  
      'Restore obheads so I don't need to call precalcpaths next time
   FOR z = 0 TO obcnt - 1
      IF obhead(z) >= obconnectcnt THEN obhead(z) = obn(obhead(z))
   NEXT z

   z = obcnt
   DO
      zz = obparent(z): IF zz < 0 THEN EXIT DO
      LINE (obx(z), oby(z))-(obx(zz), oby(zz)), 15
      z = zz
   LOOP

END SUB

FUNCTION getfakeangle (dx, dy)
   IF dx = 0 AND dy = 0 THEN getfakeangle = 0: EXIT FUNCTION
   IF dx < 0 THEN getfakeangle = 1024 - dy * 512 / (ABS(dx) + ABS(dy)): EXIT FUNCTION
   IF dy < 0 THEN getfakeangle = 2048 + dy * 512 / (ABS(dx) + ABS(dy)): EXIT FUNCTION
   getfakeangle = dy * 512 / (ABS(dx) + ABS(dy))
END FUNCTION

SUB heapchangeval (heapindex, newheapval)
   datag = heaptag(heapindex)
   CALL heapremove(heapindex)
   CALL heapinsert(newheapval, datag)
END SUB

SUB heapinit
   heapval(0) = -2147483647
   heapcnt = 0
END SUB

SUB heapinsert (num, tag)
   heapcnt = heapcnt + 1
 
   z = heapcnt: zz = z \ 2
   WHILE heapval(zz) > num
      heapval(z) = heapval(zz)
      heaptag(z) = heaptag(zz)
      z = zz: zz = zz \ 2
   WEND
   heapval(z) = num
   heaptag(z) = tag
END SUB

SUB heapremove (offs)
   daval = heapval(heapcnt)
   datag = heaptag(heapcnt)
   heapcnt = heapcnt - 1
 
   z = offs: zz = z \ 2
   IF heapval(zz) > daval THEN
      DO
         heapval(z) = heapval(zz)
         heaptag(z) = heaptag(zz)
         z = zz: zz = zz \ 2
      LOOP WHILE heapval(zz) > daval
      heapval(z) = daval
      heaptag(z) = datag
      EXIT SUB
   END IF

   DO
      zz = z + z: IF zz > heapcnt THEN EXIT DO
      IF zz <> heapcnt AND heapval(zz + 1) < heapval(zz) THEN zz = zz + 1
      IF heapval(zz) >= daval THEN EXIT DO
      heapval(z) = heapval(zz)
      heaptag(z) = heaptag(zz)
      z = zz
   LOOP
   heapval(z) = daval
   heaptag(z) = datag
END SUB

SUB heapremovetop
   daval = heapval(heapcnt)
   datag = heaptag(heapcnt)
   heapcnt = heapcnt - 1

   z = 1
   DO
      zz = z + z: IF zz > heapcnt THEN EXIT DO
      IF zz <> heapcnt AND heapval(zz + 1) < heapval(zz) THEN zz = zz + 1
      IF heapval(zz) >= daval THEN EXIT DO
      heapval(z) = heapval(zz)
      heaptag(z) = heaptag(zz)
      z = zz
   LOOP
   heapval(z) = daval
   heaptag(z) = datag
END SUB

SUB initboard
   numpoints = 1
   poly(0) = 0: numpolys = 1

   mousx = XDIM \ 2: mousy = YDIM \ 2
   DO
      numpoints = numpoints - 1
      regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
      mousx = mousx + regs%(2): mousy = mousy + regs%(3)

      IF mousx < 4 THEN mousx = 4
      IF mousx > XDIM - 4 THEN mousx = XDIM - 4
      IF mousy < 4 THEN mousy = 4
      IF mousy > YDIM - 4 THEN mousy = YDIM - 4
     
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      obstatus% = bstatus%: bstatus% = regs%(0)
     
      z$ = INKEY$
      IF z$ = CHR$(8) AND numpoints > 0 THEN
         IF numpoints = poly(numpolys - 1) THEN numpolys = numpolys - 1
         numpoints = numpoints - 1
      END IF
      IF z$ = " " OR (bstatus% AND 1) <> 0 THEN
         bad = 0
         IF numpoints > poly(numpolys - 1) THEN
            IF ABS(px(numpoints - 1) - mousx) + ABS(py(numpoints - 1) - mousy) < 8 THEN bad = 1
         END IF
         IF bad = 0 THEN
            px(numpoints) = mousx
            py(numpoints) = mousy
            point2(numpoints) = numpoints + 1
            numpoints = numpoints + 1
         END IF
      END IF
     
      DEF SEG = &H0
      IF z$ = CHR$(13) AND (PEEK(&H417) AND 3) <> 0 THEN
         point2(numpoints) = poly(numpolys - 1)
         poly(numpolys) = numpoints + 1
         numpolys = numpolys + 1
         numpoints = numpoints + 1
         z$ = " "
      END IF
     
      px(numpoints) = mousx
      py(numpoints) = mousy
      point2(numpoints) = poly(numpolys - 1)
      numpoints = numpoints + 1

      CLS 1
      CALL drawboard
      CIRCLE (mousx, mousy), 2, 15, , , 1
     
      SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
      WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   LOOP WHILE z$ <> CHR$(13)
END SUB

SUB initopticansee (x1, y1)
   FOR z = 0 TO 3: ocshead(z) = -1: NEXT z
   ocsx = x1: ocsy = y1
   ocslistcnt = 0
   FOR z = 0 TO numpoints - 1
      zz = point2(z)
      IF (x1 - px(z)) * (py(zz) - py(z)) >= (y1 - py(z)) * (px(zz) - px(z)) THEN
         IF px(z) < x1 OR px(zz) < x1 THEN
            IF py(z) < y1 OR py(zz) < y1 THEN ocsnext(0, ocslistcnt) = ocshead(0): ocshead(0) = ocslistcnt
            IF py(z) >= y1 OR py(zz) >= y1 THEN ocsnext(2, ocslistcnt) = ocshead(2): ocshead(2) = ocslistcnt
         END IF
         IF px(z) >= x1 OR px(zz) >= x1 THEN
            IF py(z) < y1 OR py(zz) < y1 THEN ocsnext(1, ocslistcnt) = ocshead(1): ocshead(1) = ocslistcnt
            IF py(z) >= y1 OR py(zz) >= y1 THEN ocsnext(3, ocslistcnt) = ocshead(3): ocshead(3) = ocslistcnt
         END IF
         ocsx31(ocslistcnt) = px(z) - x1
         ocsy31(ocslistcnt) = py(z) - y1
         ocsx34(ocslistcnt) = px(z) - px(zz)
         ocsy34(ocslistcnt) = py(z) - py(zz)
         ocslistcnt = ocslistcnt + 1
      END IF
   NEXT z
END SUB

FUNCTION inside (x, y)
   cnt = 0
   FOR z = numpoints - 1 TO 0 STEP -1
      y1 = py(z) - y: y2 = py(point2(z)) - y
      IF (y1 XOR y2) < 0 THEN
         x1 = px(z) - x: x2 = px(point2(z)) - x
         IF (x1 XOR x2) < 0 THEN
            cnt = cnt XOR (x2 * y1 - x1 * y2) XOR y1
         ELSE
            cnt = cnt XOR x1
         END IF
      END IF
   NEXT z
   inside = ABS(cnt < 0)
END FUNCTION

FUNCTION opticansee (x2, y2)
   x21 = x2 - ocsx: y21 = y2 - ocsy
   q = 0
   IF x21 >= 0 THEN q = q + 1
   IF y21 >= 0 THEN q = q + 2
   z = ocshead(q)
   DO WHILE z >= 0
      t = x21 * ocsy31(z) - y21 * ocsx31(z)
      IF t > 0 THEN
         bot = x21 * ocsy34(z) - y21 * ocsx34(z)
         IF t < bot THEN
            IF ocsx31(z) * ocsy34(z) - ocsy31(z) * ocsx34(z) <= bot THEN opticansee = 0: EXIT FUNCTION
         END IF
      END IF
      z = ocsnext(q, z)
   LOOP
   opticansee = 1
END FUNCTION

SUB precalcpaths
   obcnt = 0
   FOR z = 0 TO numpoints - 1
      zz = point2(z): zzz = point2(zz)
      IF (px(z) - px(zz)) * (py(zzz) - py(zz)) >= (py(z) - py(zz)) * (px(zzz) - px(zz)) THEN
         obx(obcnt) = px(zz)
         oby(obcnt) = py(zz)
         obp(obcnt) = z
         obhead(obcnt) = -1
         obcnt = obcnt + 1
      END IF
   NEXT z

   obconnectcnt = 0
   FOR z = 0 TO obcnt - 1
      inited = 0
      FOR zz = 0 TO z - 1
         bad = 0
         p1 = obp(z): p2 = point2(p1): p3 = point2(p2)
         t1 = (obx(zz) - px(p2)) * (py(p1) - py(p2)) - (oby(zz) - py(p2)) * (px(p1) - px(p2))
         t2 = (obx(zz) - px(p2)) * (py(p3) - py(p2)) - (oby(zz) - py(p2)) * (px(p3) - px(p2))
         IF (t1 < 0 OR t2 < 0) AND (t1 > 0 OR t2 > 0) THEN bad = 1
        
         p1 = obp(zz): p2 = point2(p1): p3 = point2(p2)
         t1 = (obx(z) - px(p2)) * (py(p1) - py(p2)) - (oby(z) - py(p2)) * (px(p1) - px(p2))
         t2 = (obx(z) - px(p2)) * (py(p3) - py(p2)) - (oby(z) - py(p2)) * (px(p3) - px(p2))
         IF (t1 < 0 OR t2 < 0) AND (t1 > 0 OR t2 > 0) THEN bad = 1
        
         IF bad = 0 THEN
            IF inited = 0 THEN CALL initopticansee(obx(z), oby(z)): inited = 1
            IF opticansee(obx(zz), oby(zz)) <> 0 THEN
               'LINE (obx(z), oby(z))-(obx(zz), oby(zz)), 8, , &H5555
               obn(obconnectcnt) = obhead(z)
               obhead(z) = obconnectcnt
               obpoint2(obconnectcnt) = zz
               obdist(obconnectcnt) = SQR((obx(zz) - obx(z)) * (obx(zz) - obx(z)) + (oby(zz) - oby(z)) * (oby(zz) - oby(z)))
               obconnectcnt = obconnectcnt + 1
             
               obn(obconnectcnt) = obhead(zz)
               obhead(zz) = obconnectcnt
               obpoint2(obconnectcnt) = z
               obdist(obconnectcnt) = obdist(obconnectcnt - 1)
               obconnectcnt = obconnectcnt + 1
            END IF
         END IF
      NEXT zz
   NEXT z
END SUB

SUB printsmall (bakx&, baky&, c%, nam$)
   nam$ = LTRIM$(RTRIM$(nam$))
   x& = bakx& - LEN(nam$) * 2
   y& = baky& - 2
   IF x& >= XDIM OR y& >= YDIM THEN EXIT SUB
   LINE (x& - 1, y& - 1)-(x& + LEN(nam$) * 4 - 1, y& + 5), 0, BF
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

