DECLARE SUB fastdiacircle ()
DECLARE SUB slowdiamond ()
DECLARE FUNCTION rdtsc# ()
DECLARE SUB cleanscreen ()
DECLARE SUB fastdiamond ()
DECLARE SUB fastdiamond2 ()
DECLARE SUB heapinit ()
DECLARE SUB heapremovetop ()
DECLARE SUB heapinsert (num&, tag&)
DECLARE SUB fastcircle ()
DECLARE SUB slowcircle ()

   'Before I wrote fastdiacircle, VORONOI.BAS was: 5,893 03-24-98 15:45
DEFLNG A-Z
CONST XDIM = 320, YDIM = 200, NUMCOLS = 256, BUFMASK = 16384 - 1
DIM SHARED pal(NUMCOLS, 3), cx(NUMCOLS), cy(NUMCOLS)
DIM SHARED cx5(NUMCOLS), cy5(NUMCOLS), cxy2(NUMCOLS)
DIM SHARED heapval(BUFMASK + 1 - 1), heaptag(BUFMASK + 1 - 1), heapcnt
DIM t0#(5), t1#(5)

'RANDOMIZE TIMER

SCREEN 13
OUT &H3C8, 0
FOR z = 0 TO NUMCOLS - 1
   FOR zz = 0 TO 2
      pal(z, zz) = INT(64 * RND)
      IF z = NUMCOLS - 1 THEN pal(z, zz) = 0
      OUT &H3C9, pal(z, zz)
   NEXT zz
   DO
      cx(z) = INT(XDIM * RND)
      cy(z) = INT(YDIM * RND)
      FOR zz = z - 1 TO 0 STEP -1
         IF cx(z) = cx(zz) AND cy(z) = cy(zz) THEN EXIT FOR
      NEXT zz
   LOOP WHILE zz >= 0

      'Really bad case!
   'cx(z) = (z AND 15) * 20 + ((z \ 16) AND 1) * 7# + 6#
   'cy(z) = (z \ 16) * 12.5 + 6.25

   cx5(z) = cx(z) * 512: cy5(z) = cy(z) * 512
   cxy2(z) = (cx(z) * cx(z) + cy(z) * cy(z)) * 256 + z
NEXT z

FOR z% = 0 TO 4
   IF z% < 3 THEN CALL cleanscreen
   t0#(z%) = rdtsc#               '(compiled)(not compiled)
   SELECT CASE z%                 '  P3-933  P2-266   P-133  Accuracy:
      CASE 0: CALL fastdiamond    '  193Mcc   1.23s   1.84s  terrible
      CASE 1: CALL fastdiacircle  '  220Mcc                  perfect
      CASE 2: CALL fastcircle     '  688Mcc   6.71s   9.86s  very good
      CASE 3: CALL slowdiamond    ' 3207Mcc  34.78s  61.92s  terrible
      CASE 4: CALL slowcircle     ' 6222Mcc  53.34s  90.53s  perfect
   END SELECT
   t1#(z%) = rdtsc#
NEXT z%

'DO: LOOP WHILE INKEY$ = ""

SCREEN 0: WIDTH 80, 25
FOR z% = 0 TO 4
   PRINT USING "#: #####Mcc"; z%; (t1#(z%) - t0#(z%)) * .000001#
NEXT z%

SUB cleanscreen
   LINE (0, 0)-(XDIM - 1, YDIM - 1), NUMCOLS - 1, BF
   FOR z = 0 TO NUMCOLS - 1: PSET (cx(z), cy(z)), z: NEXT z
END SUB

SUB fastcircle
   DEF SEG = &HA000
   CALL heapinit
   FOR z = 0 TO NUMCOLS - 2
      CALL heapinsert(0, cy(z) * 320 + cx(z))
   NEXT z
   DO
      p = heaptag(1): dist = heapval(1): CALL heapremovetop
      col = PEEK(p): py = p \ 320: px = p - py * 320
     
      IF px > 0 THEN
         ocol = PEEK(p - 1)
         IF ocol = NUMCOLS - 1 THEN
            POKE p - 1, col: CALL heapinsert(dist + (cx(col) - px) * 2 + 1, p - 1)
         ELSEIF ocol <> col THEN
            ox = cx(ocol) - (px - 1): oy = cy(ocol) - py
            odist = ox * ox + oy * oy
            ndist = dist + (cx(col) - px) * 2 + 1
            IF ndist < odist THEN
               POKE p - 1, col: CALL heapinsert(ndist, p - 1)
            END IF
         END IF
      END IF
      IF px < XDIM - 1 THEN
         ocol = PEEK(p + 1)
         IF ocol = NUMCOLS - 1 THEN
            POKE p + 1, col: CALL heapinsert(dist - (cx(col) - px) * 2 + 1, p + 1)
         ELSEIF ocol <> col THEN
            ox = cx(ocol) - (px + 1): oy = cy(ocol) - py
            odist = ox * ox + oy * oy
            ndist = dist - (cx(col) - px) * 2 + 1
            IF ndist < odist THEN
               POKE p + 1, col: CALL heapinsert(ndist, p + 1)
            END IF
         END IF
      END IF
      IF py > 0 THEN
         ocol = PEEK(p - 320)
         IF ocol = NUMCOLS - 1 THEN
            POKE p - 320, col: CALL heapinsert(dist + (cy(col) - py) * 2 + 1, p - 320)
         ELSEIF ocol <> col THEN
            ox = cx(ocol) - px: oy = cy(ocol) - (py - 1)
            odist = ox * ox + oy * oy
            ndist = dist + (cy(col) - py) * 2 + 1
            IF ndist < odist THEN
               POKE p - 320, col: CALL heapinsert(ndist, p - 320)
            END IF
         END IF
      END IF
      IF py < YDIM - 1 THEN
         ocol = PEEK(p + 320)
         IF ocol = NUMCOLS - 1 THEN
            POKE p + 320, col: CALL heapinsert(dist - (cy(col) - py) * 2 + 1, p + 320)
         ELSEIF ocol <> col THEN
            ox = cx(ocol) - px: oy = cy(ocol) - (py + 1)
            odist = ox * ox + oy * oy
            ndist = dist - (cy(col) - py) * 2 + 1
            IF ndist < odist THEN
               POKE p + 320, col: CALL heapinsert(ndist, p + 320)
            END IF
         END IF
      END IF
   LOOP WHILE heapcnt > 0
END SUB

SUB fastdiacircle
   DEF SEG = &HA000  'Brand new algorithm written on: 09/05/2001
   FOR z = 0 TO NUMCOLS - 2
      heapval(NUMCOLS - 2 - z) = cy(z) * 320 + cx(z)
   NEXT z
   DIM bpos AS INTEGER, bend AS INTEGER, col AS INTEGER, ocol AS INTEGER
   bpos = NUMCOLS - 2: bend = BUFMASK
   DO
      p = heapval(bpos): bpos = bpos - 1: IF bpos < 0 THEN bpos = BUFMASK
      col = PEEK(p): py = p \ 320: px = p - py * 320
      DO
         IF px > cx(col) THEN EXIT DO
         IF px <= 0 THEN EXIT DO
         ocol = PEEK(p - 1)
         IF ocol <> NUMCOLS - 1 THEN
            IF ocol = col THEN EXIT DO
            'ox = cx(ocol) - (px - 1): oy = cy(ocol) - py
            'dx = cx(col) - (px - 1): dy = cy(col) - py
            'IF (dx * dx + dy * dy - ox * ox - oy * oy) * 256 + col - ocol < 0 THEN
            IF (cx5(ocol) - cx5(col)) * (px - 1) + (cy5(ocol) - cy5(col)) * py >= cxy2(ocol) - cxy2(col) THEN EXIT DO
         END IF
         POKE p - 1, col: heapval(bend) = p - 1: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
      LOOP WHILE 0
      DO
         IF px < cx(col) THEN EXIT DO
         IF px >= XDIM - 1 THEN EXIT DO
         ocol = PEEK(p + 1)
         IF ocol <> NUMCOLS - 1 THEN
            IF ocol = col THEN EXIT DO
            IF (cx5(ocol) - cx5(col)) * (px + 1) + (cy5(ocol) - cy5(col)) * py >= cxy2(ocol) - cxy2(col) THEN EXIT DO
         END IF
         POKE p + 1, col: heapval(bend) = p + 1: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
      LOOP WHILE 0
      DO
         IF py > cy(col) THEN EXIT DO
         IF py <= 0 THEN EXIT DO
         ocol = PEEK(p - 320)
         IF ocol <> NUMCOLS - 1 THEN
            IF ocol = col THEN EXIT DO
            IF (cx5(ocol) - cx5(col)) * px + (cy5(ocol) - cy5(col)) * (py - 1) >= cxy2(ocol) - cxy2(col) THEN EXIT DO
         END IF
         POKE p - 320, col: heapval(bend) = p - 320: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
      LOOP WHILE 0
      DO
         IF py < cy(col) THEN EXIT DO
         IF py >= YDIM - 1 THEN EXIT DO
         ocol = PEEK(p + 320)
         IF ocol <> NUMCOLS - 1 THEN
            IF ocol = col THEN EXIT DO
            IF (cx5(ocol) - cx5(col)) * px + (cy5(ocol) - cy5(col)) * (py + 1) >= cxy2(ocol) - cxy2(col) THEN EXIT DO
         END IF
         POKE p + 320, col: heapval(bend) = p + 320: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
      LOOP WHILE 0
   LOOP WHILE bpos <> bend
END SUB

SUB fastdiamond
   DEF SEG = &HA000
   FOR z = 0 TO NUMCOLS - 2
      heapval(NUMCOLS - 2 - z) = cy(z) * 320 + cx(z)
   NEXT z
   DIM bpos AS INTEGER, bend AS INTEGER, col AS INTEGER
   bpos = NUMCOLS - 2: bend = BUFMASK
   DO
      p = heapval(bpos): bpos = bpos - 1: IF bpos < 0 THEN bpos = BUFMASK
      col = PEEK(p): py = p \ 320: px = p - py * 320
      IF px <= cx(col) THEN
         IF px > 0 THEN
            IF PEEK(p - 1) = NUMCOLS - 1 THEN
               POKE p - 1, col: heapval(bend) = p - 1: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
            END IF
         END IF
      END IF
      IF px >= cx(col) THEN
         IF px < XDIM - 1 THEN
            IF PEEK(p + 1) = NUMCOLS - 1 THEN
               POKE p + 1, col: heapval(bend) = p + 1: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
            END IF
         END IF
      END IF
      IF py <= cy(col) THEN
         IF py > 0 THEN
            IF PEEK(p - 320) = NUMCOLS - 1 THEN
               POKE p - 320, col: heapval(bend) = p - 320: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
            END IF
         END IF
      END IF
      IF py >= cy(col) THEN
         IF py < YDIM - 1 THEN
            IF PEEK(p + 320) = NUMCOLS - 1 THEN
               POKE p + 320, col: heapval(bend) = p + 320: bend = bend - 1: IF bend < 0 THEN bend = BUFMASK
            END IF
         END IF
      END IF
   LOOP WHILE bpos <> bend
END SUB

SUB heapinit
   heapval(0) = &H80000000
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

FUNCTION rdtsc#
   DIM asmprog%(18), t0buf%(4 - 1)
   DEF SEG = VARSEG(asmprog%(0)): p& = VARPTR(asmprog%(0))

   POKE p& + 0, &H55                                         'push bp
   POKE p& + 1, &H8B: POKE p& + 2, &HEC                      'mov bp, sp
   POKE p& + 3, &HF: POKE p& + 4, &H31                       'rdtsc
   POKE p& + 5, &H8B: POKE p& + 6, &H76: POKE p& + 7, 6      'mov si, [bp+6]
   POKE p& + 8, &H89: POKE p& + 9, &H4                       'mov [si], ax
   POKE p& + 10, &H66: POKE p& + 11, &HC1: POKE p& + 12, &HE8: POKE p& + 13, 16 'shr eax, 16
   POKE p& + 14, &H8B: POKE p& + 15, &H76: POKE p& + 16, 8   'mov si, [bp+8]
   POKE p& + 17, &H89: POKE p& + 18, &H4                     'mov [si], ax
   POKE p& + 19, &H8B: POKE p& + 20, &H76: POKE p& + 21, 10  'mov si, [bp+10]
   POKE p& + 22, &H89: POKE p& + 23, &H14                    'mov [si], dx
   POKE p& + 24, &H66: POKE p& + 25, &HC1: POKE p& + 26, &HEA: POKE p& + 27, 16 'shr edx, 16
   POKE p& + 28, &H8B: POKE p& + 29, &H76: POKE p& + 30, 12  'mov si, [bp+12]
   POKE p& + 31, &H89: POKE p& + 32, &H14                    'mov [si], dx
   POKE p& + 33, &H5D                                        'pop bp
   POKE p& + 34, &HCA: POKE p& + 35, &H8: POKE p& + 36, &H0  'ret 8

   DEF SEG = VARSEG(asmprog%(0))
   CALL ABSOLUTE(t0buf%(3), t0buf%(2), t0buf%(1), t0buf%(0), VARPTR(asmprog%(0)))
   DEF SEG = VARSEG(t0buf%(0)): p& = VARPTR(t0buf%(0))
   t# = 0: FOR z% = 7 TO 0 STEP -1: t# = t# * 256 + PEEK(p& + z%): NEXT z%

   ERASE asmprog%, t0buf%
   rdtsc# = t#
END FUNCTION

SUB slowcircle
   DEF SEG = &HA000
   FOR y = 0 TO YDIM - 1
      FOR x = 0 TO XDIM - 1
         mindist = &H7FFFFFFF
         FOR z = 0 TO NUMCOLS - 2
            dx = cx(z) - x: dy = cy(z) - y
            dist = dx * dx + dy * dy
            IF dist < mindist THEN mindist = dist: zz = z
         NEXT z
         POKE y * 320 + x, zz
      NEXT x
   NEXT y
END SUB

SUB slowdiamond
   DEF SEG = &HA000
   FOR y = 0 TO YDIM - 1
      FOR x = 0 TO XDIM - 1
         mindist = &H7FFFFFFF
         FOR z = 0 TO NUMCOLS - 2
            dist = ABS(x - cx(z)) + ABS(y - cy(z))
            IF dist < mindist THEN mindist = dist: zz = z
         NEXT z
         POKE y * 320 + x, zz
      NEXT x
   NEXT y
END SUB

