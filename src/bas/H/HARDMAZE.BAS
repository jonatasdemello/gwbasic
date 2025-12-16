DECLARE SUB vesasetmode (daxdim%, daydim%, dacdim%)
DECLARE FUNCTION getpix% (x%, y%)
DECLARE SUB setsd (i&, v%)
DECLARE FUNCTION getsd% (i&)
DECLARE FUNCTION availcount% (x%, y%)
DECLARE FUNCTION stuck% (x%, y%)
DECLARE SUB hlin (x1%, y1%, x2%, col%)
DECLARE SUB vlin (x1%, y1%, y2%, col%)
DECLARE SUB drawyou (x%, y%, col%)
DECLARE FUNCTION hbit% (x%, y%)
DECLARE SUB sethbit (x%, y%)
DECLARE SUB setvbit (x%, y%)
DECLARE FUNCTION vbit% (x%, y%)
DECLARE FUNCTION gbit% (x%, y%)
DECLARE SUB setgbit (x%, y%)
DECLARE FUNCTION hbit% (x%, y%)
'CONST sc& = 2, XRES = 640, YRES = 480, BPL = 640&
CONST sc& = 8, XRES = 1600, YRES = 1200, BPL = 1600&

   'HARDMAZE.BAS was: (7,031 bytes 12/10/1993 1:41p) until: 6/9/1999
DIM SHARED regs%(9), opag&: opag& = 0

DIM SHARED xdim AS INTEGER, ydim AS INTEGER, hsc AS INTEGER
xdim = INT((XRES - 1) / sc&)
ydim = INT((YRES - 1) / sc&)
hsc = INT(sc& * .5)

DIM SHARED pow2mask%(16 - 1)
FOR z% = 0 TO 14: pow2mask%(z%) = 2 ^ z%: NEXT z%: pow2mask%(15) = &H8000
DIM SHARED ylookup&(600), ylookup1&: ylookup&(0) = 0: ylookup1& = xdim + 2
FOR z% = 1 TO 600: ylookup&(z%) = ylookup&(z% - 1) + ylookup1&: NEXT z%

CALL vesasetmode(XRES, YRES, 8): DEF SEG = &HA000

RANDOMIZE TIMER
DIM SHARED hbuf%(30088), vbuf%(30088), gbuf%(30088)
DIM SHARED sd%(16000)
px% = 1: py% = 1: goalx% = xdim: goaly% = ydim
totcount& = xdim: totcount& = totcount& * ydim: finishit& = totcount& * .95

beginit:
FOR z% = 0 TO 30088: hbuf%(z%) = 0: vbuf%(z%) = 0: gbuf%(z%) = 0: NEXT z%
FOR z% = 0 TO xdim + 1: CALL setgbit(z%, 0): CALL setgbit(z%, ydim + 1): NEXT z%
FOR z% = 0 TO ydim + 1: CALL setgbit(0, z%): CALL setgbit(xdim + 1, z%): NEXT z%
FOR z% = 0 TO xdim + 1: CALL sethbit(z%, 0): CALL sethbit(z%, ydim + 1): NEXT z%
FOR z% = 0 TO ydim + 1: CALL setvbit(0, z%): CALL setvbit(xdim + 1, z%): NEXT z%

FOR z% = 1 TO ydim - 1: CALL hlin(0, z% * sc, xdim * sc, 7): NEXT z%
FOR z% = 1 TO xdim - 1: CALL vlin(z% * sc, 0, ydim * sc, 7): NEXT z%
CALL hlin(0, 0, xdim * sc, 15): CALL hlin(0, ydim * sc, xdim * sc, 15)
CALL vlin(0, 0, ydim * sc, 15): CALL vlin(xdim * sc, 0, ydim * sc, 15)

x% = INT(xdim * RND) + 1: xfin% = x%: xs% = x%: xdir% = 1
y% = INT(ydim * RND) + 1: yfin% = y%: ys% = y%: ydir% = 1
count& = 1: CALL setgbit(x%, y%)
DO
   xsc% = x% * sc: ysc% = y% * sc
   DO
      r = 1
      DO
         d% = INT(RND * 4)                              'Standard maze

         'r = r - .2: IF RND >= r THEN d% = INT(4 * RND)'Boxy maze

         'd% = INT(2 * RND) * 2 + ((RND > .9) AND 1)    'Directional maze
        
         'DO: nd% = INT(RND * 4): LOOP WHILE nd% = d%    'Curly maze
         'd% = nd%
        
         'd% = ((d% + 1) AND 3)                          'Fuzzy maze

            'More complex mazes
         'IF gbit%(x% - 1, y%) = 0 THEN c%(0) = availcount%(x% - 1, y%) + 1 ELSE c%(0) = 0
         'IF gbit%(x%, y% - 1) = 0 THEN c%(1) = availcount%(x%, y% - 1) + 1 ELSE c%(1) = 0
         'IF gbit%(x% + 1, y%) = 0 THEN c%(2) = availcount%(x% + 1, y%) + 1 ELSE c%(2) = 0
         'IF gbit%(x%, y% + 1) = 0 THEN c%(3) = availcount%(x%, y% + 1) + 1 ELSE c%(3) = 0
         'FOR z% = 0 TO 3
         '   IF c%(z%) > 0 THEN
         '      c%(z%) = 4096 / (c%(z%) ^ 4) + 1  'Stay close to home
         '      'c%(z%) = (c%(z%) - 1) ^ 4 + 1     'Get away from home
         '   END IF
         'NEXT z%
         'SELECT CASE INT((c%(0) + c%(1) + c%(2) + c%(3)) * RND) - c%(0)
         '   CASE IS < 0: d% = 0
         '   CASE IS < c%(1): d% = 1
         '   CASE IS < c%(1) + c%(2): d% = 2
         '   CASE ELSE: d% = 3
         'END SELECT

        
         SELECT CASE d%
            CASE 0: IF gbit%(x% - 1, y%) = 0 THEN x% = x% - 1: CALL sethbit(x%, y%): xsc% = xsc% - sc: CALL vlin(xsc%, ysc% - sc + 1, ysc% - 1, 0): EXIT DO
            CASE 1: IF gbit%(x%, y% - 1) = 0 THEN y% = y% - 1: CALL setvbit(x%, y%): ysc% = ysc% - sc: CALL hlin(xsc% - sc + 1, ysc%, xsc% - 1, 0): EXIT DO
            CASE 2: IF gbit%(x% + 1, y%) = 0 THEN x% = x% + 1: CALL sethbit(x% - 1, y%): CALL vlin(xsc%, ysc% - sc + 1, ysc% - 1, 0): xsc% = xsc% + sc: EXIT DO
            CASE 3: IF gbit%(x%, y% + 1) = 0 THEN y% = y% + 1: CALL setvbit(x%, y% - 1): CALL hlin(xsc% - sc + 1, ysc%, xsc% - 1, 0): ysc% = ysc% + sc: EXIT DO
         END SELECT
      LOOP
      CALL setgbit(x%, y%): count& = count& + 1
   LOOP WHILE stuck%(x%, y%) = 0

   IF count& >= totcount& THEN EXIT DO
   IF count& >= finishit& THEN
      DO
         xfin% = xfin% + xdir%
         IF xfin% <= 0 OR xfin% > xdim THEN
            xfin% = xs%: xdir% = -xdir%
            IF xdir% > 0 THEN
               yfin% = yfin% + ydir%
               IF yfin% <= 0 OR yfin% > ydim THEN yfin% = ys%: ydir% = -ydir%
            END IF
         END IF
      LOOP WHILE gbit%(xfin%, yfin%) = 0 OR stuck%(xfin%, yfin%) <> 0
      x% = xfin%: y% = yfin%
   ELSE
      DO
         x% = INT(xdim * RND) + 1
         y% = INT(ydim * RND) + 1
      LOOP WHILE gbit%(x%, y%) = 0 OR stuck%(x%, y%) <> 0
   END IF
LOOP

CALL drawyou(px%, py%, 14)
DO
   DO: z$ = INKEY$: LOOP WHILE z$ = ""
   CALL drawyou(px%, py%, 0)
   IF z$ = CHR$(0) + CHR$(75) AND hbit%(px% - 1, py%) THEN px% = px% - 1
   IF z$ = CHR$(0) + CHR$(77) AND hbit%(px%, py%) THEN px% = px% + 1
   IF z$ = CHR$(0) + CHR$(72) AND vbit%(px%, py% - 1) THEN py% = py% - 1
   IF z$ = CHR$(0) + CHR$(80) AND vbit%(px%, py%) THEN py% = py% + 1
   IF z$ = CHR$(0) + CHR$(134) THEN
      OPEN "hardmaze.tga" FOR BINARY AS #1
      head$ = STRING$(18, 0)
      MID$(head$, 3, 1) = CHR$(2)
      MID$(head$, 17, 1) = CHR$(32)
      MID$(head$, 18, 1) = CHR$(32)
      MID$(head$, 13, 2) = MKI$(XRES)
      MID$(head$, 15, 2) = MKI$(YRES)
      PUT #1, , head$
      z$ = STRING$(XRES * 4, 0)
      FOR y% = 0 TO YRES - 1
         FOR x% = 0 TO XRES - 1
            i% = getpix%(x%, y%)
            MID$(z$, x% * 4 + 1) = CHR$((i% AND 15) * 16)
            MID$(z$, x% * 4 + 2) = CHR$((i% AND 15) * 16)
            MID$(z$, x% * 4 + 3) = CHR$((i% AND 15) * 16)
            MID$(z$, x% * 4 + 4) = CHR$(255)
         NEXT
         PUT #1, , z$
      NEXT y%
      CLOSE #1
      z$ = ""
      SOUND 523, 1
   END IF

   CALL drawyou(px%, py%, 14)
   IF z$ = " " THEN
      x% = px%: y% = py%: CALL setsd(1, 0): i& = 1
      DO
         SELECT CASE getsd%(i&)
            CASE 0:
               IF hbit%(x% - 1, y%) THEN
                  x% = x% - 1: i& = i& + 1: CALL setsd(i&, 2)
                  CALL hlin(x% * sc - hsc, y% * sc - hsc, (x% + 1) * sc - hsc, 11)
               ELSE
                  CALL setsd(i&, 1)
               END IF
            CASE 1:
               IF hbit%(x%, y%) THEN
                  x% = x% + 1: i& = i& + 1: CALL setsd(i&, 1)
                  CALL hlin((x% - 1) * sc - hsc, y% * sc - hsc, x% * sc - hsc, 11)
               ELSE
                  CALL setsd(i&, 2)
               END IF
            CASE 2:
               IF vbit%(x%, y% - 1) THEN
                  y% = y% - 1: i& = i& + 1: CALL setsd(i&, 0)
                  CALL vlin(x% * sc - hsc, y% * sc - hsc, (y% + 1) * sc - hsc, 11)
               ELSE
                  CALL setsd(i&, 3)
               END IF
            CASE 3:
              IF vbit%(x%, y%) THEN
                 y% = y% + 1: i& = i& + 1: CALL setsd(i&, 3)
                 CALL vlin(x% * sc - hsc, (y% - 1) * sc - hsc, y% * sc - hsc, 11)
              ELSE
                 CALL setsd(i&, 0)
              END IF
         END SELECT
        
         DO WHILE i& > 1 AND getsd%(i&) = (getsd%(i& - 1) XOR 1)
            i& = i& - 1
            SELECT CASE getsd%(i&)
               CASE 0: x% = x% + 1: CALL hlin((x% - 1) * sc - hsc, y% * sc - hsc, x% * sc - hsc, 0)
               CASE 1: x% = x% - 1: CALL hlin(x% * sc - hsc, y% * sc - hsc, (x% + 1) * sc - hsc, 0)
               CASE 2: y% = y% + 1: CALL vlin(x% * sc - hsc, (y% - 1) * sc - hsc, y% * sc - hsc, 0)
               CASE 3: y% = y% - 1: CALL vlin(x% * sc - hsc, y% * sc - hsc, (y% + 1) * sc - hsc, 0)
            END SELECT
            CALL setsd(i&, (getsd%(i&) + 1) AND 3)
         LOOP

      LOOP WHILE x% <> goalx% OR y% <> goaly%
     
      DO: LOOP WHILE INKEY$ = ""

      x% = px%: y% = py%
      FOR z& = 1 TO i& - 1
         SELECT CASE getsd%(z&)
            CASE 0: x% = x% - 1: CALL hlin(x% * sc - hsc, y% * sc - hsc, (x% + 1) * sc - hsc, 0)
            CASE 1: x% = x% + 1: CALL hlin((x% - 1) * sc - hsc, y% * sc - hsc, x% * sc - hsc, 0)
            CASE 2: y% = y% - 1: CALL vlin(x% * sc - hsc, y% * sc - hsc, (y% + 1) * sc - hsc, 0)
            CASE 3: y% = y% + 1: CALL vlin(x% * sc - hsc, (y% - 1) * sc - hsc, y% * sc - hsc, 0)
         END SELECT
      NEXT z&

   END IF
   IF px% = goalx% AND py% = goaly% OR z$ = CHR$(13) THEN
      IF px% = goalx% AND py% = goaly% THEN
         SOUND 523, 1
         goalx% = goalx% XOR 1 XOR xdim
         goaly% = goaly% XOR 1 XOR ydim
      END IF
      GOTO beginit
   END IF
LOOP WHILE z$ <> CHR$(27)
regs%(0) = &H4F02: regs%(1) = &H3: CALL int86xold(&H10, regs%(), regs%())
regs%(0) = &H3: CALL int86xold(&H10, regs%(), regs%())
END

FUNCTION availcount% (x%, y%)
   p& = ylookup&(y%) + x%: c% = 0
   IF (gbuf%((p& - 1) \ 16) AND pow2mask%((p& - 1) AND 15)) = 0 THEN c% = c% + 1
   IF (gbuf%((p& + 1) \ 16) AND pow2mask%((p& + 1) AND 15)) = 0 THEN c% = c% + 1
   IF (gbuf%((p& - ylookup1&) \ 16) AND pow2mask%((p& - ylookup1&) AND 15)) = 0 THEN c% = c% + 1
   IF (gbuf%((p& + ylookup1&) \ 16) AND pow2mask%((p& + ylookup1&) AND 15)) = 0 THEN c% = c% + 1
   availcount% = c%
END FUNCTION

SUB drawyou (x%, y%, col%)
   FOR sy% = y% * sc - sc + 1 TO y% * sc - 1
      r = sc * sc * .2# - (sy% - (y% * sc - hsc)) ^ 2#
      IF r >= 0 THEN
         r = SQR(r): IF r > hsc - 1 THEN r = hsc - 1
         CALL hlin(x% * sc - hsc - r, sy%, x% * sc - hsc + r, col%)
      END IF
   NEXT sy%
END SUB

FUNCTION gbit% (x%, y%)
   p& = ylookup&(y%) + x%
   gbit% = (gbuf%(p& \ 16) AND pow2mask%(p& AND 15))
END FUNCTION

FUNCTION getpix% (x%, y%)
   p& = y% * BPL + x%
   IF (p& AND &HFFFF0000) <> opag& THEN
      opag& = p& AND &HFFFF0000
      regs%(0) = &H4F05: regs%(1) = 0: regs%(3) = opag& \ 65536: CALL int86old(&H10, regs%(), regs%())
   END IF
   getpix% = PEEK(p& AND 65535)
END FUNCTION

FUNCTION getsd% (i&)
   j% = i& AND 7: k% = i& \ 8
   IF sd%(k%) AND pow2mask%(j% + j%) THEN v% = 1 ELSE v% = 0
   IF sd%(k%) AND pow2mask%(j% + j% + 1) THEN v% = v% + 2
   getsd% = v%
END FUNCTION

FUNCTION hbit% (x%, y%)
   p& = ylookup&(y%) + x%
   hbit% = (hbuf%(p& \ 16) AND pow2mask%(p& AND 15))
END FUNCTION

SUB hlin (x1%, y1%, x2%, col%)
   p& = y1% * BPL + x1%
   IF (p& AND &HFFFF0000) <> opag& THEN
      opag& = p& AND &HFFFF0000
      regs%(0) = &H4F05: regs%(1) = 0: regs%(3) = opag& \ 65536: CALL int86old(&H10, regs%(), regs%())
   END IF
   p& = p& AND 65535
   FOR x% = x1% TO x2%
      POKE p&, col%
      p& = p& + 1
      IF p& >= 65536 THEN
         p& = 0: opag& = opag& + 65536
         regs%(0) = &H4F05: regs%(1) = 0: regs%(3) = opag& \ 65536: CALL int86old(&H10, regs%(), regs%())
      END IF
   NEXT x%
END SUB

SUB setgbit (x%, y%)
   p& = ylookup&(y%) + x%
   gbuf%(p& \ 16) = gbuf%(p& \ 16) OR pow2mask%(p& AND 15)
END SUB

SUB sethbit (x%, y%)
   p& = ylookup&(y%) + x%
   hbuf%(p& \ 16) = hbuf%(p& \ 16) OR pow2mask%(p& AND 15)
END SUB

SUB setsd (i&, v%)
   j% = i& AND 7: k% = i& \ 8
   m0% = pow2mask%(j% + j%): m1% = pow2mask%(j% + j% + 1)
   sd%(k%) = sd%(k%) AND (NOT (m0% OR m1%))
   IF (v% AND 1) THEN sd%(k%) = sd%(k%) OR m0%
   IF (v% AND 2) THEN sd%(k%) = sd%(k%) OR m1%
END SUB

SUB setvbit (x%, y%)
   p& = ylookup&(y%) + x%
   vbuf%(p& \ 16) = vbuf%(p& \ 16) OR pow2mask%(p& AND 15)
END SUB

FUNCTION stuck% (x%, y%)
   p& = ylookup&(y%) + x%
   IF (gbuf%((p& - 1) \ 16) AND pow2mask%((p& - 1) AND 15)) = 0 THEN stuck% = 0: EXIT FUNCTION
   IF (gbuf%((p& + 1) \ 16) AND pow2mask%((p& + 1) AND 15)) = 0 THEN stuck% = 0: EXIT FUNCTION
   IF (gbuf%((p& - ylookup1&) \ 16) AND pow2mask%((p& - ylookup1&) AND 15)) = 0 THEN stuck% = 0: EXIT FUNCTION
   IF (gbuf%((p& + ylookup1&) \ 16) AND pow2mask%((p& + ylookup1&) AND 15)) = 0 THEN stuck% = 0: EXIT FUNCTION
   stuck% = 1
END FUNCTION

FUNCTION vbit% (x%, y%)
   p& = ylookup&(y%) + x%
   vbit% = (vbuf%(p& \ 16) AND pow2mask%(p& AND 15))
END FUNCTION

SUB vesasetmode (daxdim%, daydim%, dacdim%)
   DIM svgainfo%(128)
   regs%(0) = &H4F00
   regs%(6) = VARPTR(svgainfo%(0))
   regs%(9) = VARSEG(svgainfo%(0))
   svgainfo%(0) = 0 'CVI("VB") 'DO NOT ENABLE VBE2: CAUSES MEMORY CORRUPTION!
   svgainfo%(1) = 0 'CVI("E2")
   CALL int86xold(&H10, regs%(), regs%())
   IF regs%(0) <> &H4F THEN SOUND 37, 10: EXIT SUB
   DEF SEG = svgainfo%(8): p& = svgainfo%(7)
   nummodes% = 0
   DO
      mode& = PEEK(p&) + PEEK(p& + 1) * 256&: p& = p& + 2
      IF mode& = 65535 THEN EXIT DO
      nummodes% = nummodes% + 1
   LOOP
   DIM modelist&(nummodes% - 1): p& = svgainfo%(7)
   FOR i% = 0 TO nummodes% - 1
      modelist&(i%) = PEEK(p&) + PEEK(p& + 1) * 256&: p& = p& + 2
   NEXT
   FOR i% = 0 TO nummodes% - 1
      regs%(0) = &H4F01  'VESA get granularity for 64K video paging
      regs%(2) = modelist&(i%)
      CALL int86xold(&H10, regs%(), regs%())
      DEF SEG = regs%(9): p& = regs%(6)
      'if (peek(p&) and 32) then vgacompatible%
      IF (PEEK(p&) AND 16) <> 0 THEN   'Make sure it's not a text mode
         IF PEEK(p& + 18) + 256& * PEEK(p& + 19) = daxdim% THEN
            IF PEEK(p& + 20) + 256& * PEEK(p& + 21) = daydim% THEN
               IF PEEK(p& + 25) = dacdim% THEN
                  vesawingran% = PEEK(p& + 4) + 256& * PEEK(p& + 5)
                  vesabpl% = PEEK(p& + 16) + 256& * PEEK(p& + 17)
                
                  regs%(0) = &H4F02                'Vesa set video mode
                  regs%(1) = modelist&(i%)
                  ERASE modelist&
                  CALL int86xold(&H10, regs%(), regs%())
                  IF regs%(0) <> &H4F THEN EXIT SUB
                  DEF SEG
                  EXIT SUB
               END IF
            END IF
         END IF
      END IF
   NEXT
   ERASE modelist&
END SUB

SUB vlin (x1%, y1%, y2%, col%)
   p& = y1% * BPL + x1%
   IF (p& AND &HFFFF0000) <> opag& THEN
      opag& = p& AND &HFFFF0000
      regs%(0) = &H4F05: regs%(1) = 0: regs%(3) = p& \ 65536: CALL int86old(&H10, regs%(), regs%())
   END IF
   p& = p& AND 65535
   FOR y% = y1% TO y2%
      POKE p&, col%
      p& = p& + BPL
      IF p& >= 65536 THEN
         p& = p& AND 65535: opag& = opag& + 65536
         regs%(0) = &H4F05: regs%(1) = 0: regs%(3) = opag& \ 65536: CALL int86old(&H10, regs%(), regs%())
      END IF
   NEXT y%
END SUB

