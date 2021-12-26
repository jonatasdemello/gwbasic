SCREEN 13: DEF SEG = &HA000: CONST XDIM = 320, YDIM = 200, BPL = 320&
DIM regs%(7): regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())

CONST BWIDTH = 1: DIM SHARED sp(XDIM), lorecip(XDIM)
FOR z% = 1 TO XDIM - 1: lorecip(z%) = 1 / z%: NEXT z%

CONST HITSIZ = 4096
DIM SHARED hitp&(HITSIZ * 2), hitc%, ohitc%

LINE (0, 0)-(XDIM - 1, YDIM - 1), 1, BF
LINE (BWIDTH, BWIDTH)-(XDIM - 1 - BWIDTH, YDIM - 1 - BWIDTH), 255, BF
FOR z% = 0 TO 63
   x = INT(XDIM * RND): y = INT(YDIM * RND): r = INT(16 * RND) + 4
   CIRCLE (x, y), r, 8, , , 1
   PAINT (x, y), 6, 8: PAINT (x, y), 1, 8
   CIRCLE (x, y), r, 1, , , 1
NEXT z%

'DIM scrbit%(8000), pow2char%(8)
'pow2char%(0) = 1: pow2char%(1) = 2: pow2char%(2) = 4: pow2char%(3) = 8
'pow2char%(4) = 16: pow2char%(5) = 32: pow2char%(6) = 64: pow2char%(7) = 128
'FOR z% = 0 TO 7999: scrbit%(z%) = 0: NEXT z%
'FOR p& = 0 TO 63999
'   IF PEEK(p&) < 16 THEN
'      scrbit%(p& \ 8) = scrbit%(p& \ 8) OR pow2char%(p& AND 7)
'   END IF
'NEXT p&
'
'peek(p&) < 16                                     is equivalent to:
'(scrbit%(p& \ 8) and pow2char%(p& and 7)) <> 0

DO
   ox% = INT((XDIM - BWIDTH * 2) * RND) + BWIDTH
   oy% = INT((YDIM - BWIDTH * 2) * RND) + BWIDTH
LOOP WHILE PEEK(oy% * BPL + ox%) < 16

hitc% = 0

framecnt% = 0: ogcol% = YDIM - 2 + 16: gcol% = YDIM - 1 + 16
DO
      '1st half of PALETTE TRICK (cls)
   pe& = (framecnt% + 1) * BPL - 1
   FOR p& = pe& - BPL + 1 TO pe&
      c% = PEEK(p&): IF c% >= 16 AND c% <> gcol% THEN POKE p&, 255
   NEXT p&
   framecnt% = framecnt% + 1: IF framecnt% >= YDIM THEN framecnt% = 0
   oogcol% = ogcol%: ogcol% = gcol%: gcol% = framecnt% + 16
   OUT &H3C8, oogcol%: OUT &H3C9, 0: OUT &H3C9, 0: OUT &H3C9, 0
   OUT &H3C8, gcol%: OUT &H3C9, 15: OUT &H3C9, 15: OUT &H3C9, 15
  
   ocol% = PEEK(oy% * BPL + ox%): POKE oy% * BPL + ox%, gcol%

      '1st half of PALETTE TRICK (lit solid block animation)
   ohitc% = hitc%
   OUT &H3C7, 9: r% = INP(&H3C9): g% = INP(&H3C9): b% = INP(&H3C9)
   OUT &H3C8, 3: OUT &H3C9, r%: OUT &H3C9, g%: OUT &H3C9, b%
   FOR z% = (ohitc% AND HITSIZ) TO ohitc% - 1: POKE hitp&(z%), 3: NEXT z%
   hitc% = (hitc% AND HITSIZ) XOR HITSIZ
 
   FOR d% = -1 TO 1 STEP 2
           
      sp(0) = -1: sp(1) = .999999: n% = 2
      x% = 1: pof& = (oy% + 1) * BPL + ox%
      DO
         i% = 0
         DO
            y% = INT(sp(i%) * x%): ye% = INT(sp(i% + 1) * x%) + 1
            p& = pof& + y% * BPL
            IF PEEK(p&) < 16 THEN GOTO skipit1
skipit0:    DO
               POKE p&, gcol%
               y% = y% + 1: IF y% >= ye% THEN GOTO skipit3
               p& = p& + BPL
            LOOP WHILE PEEK(p&) >= 16
skipit1:    b0 = y% * lorecip(x%)
            DO
               POKE p&, 9: hitp&(hitc%) = p&: hitc% = hitc% + 1
               y% = y% + 1: IF y% >= ye% THEN GOTO skipit2
               p& = p& + BPL
            LOOP WHILE PEEK(p&) < 16
            b1 = y% * lorecip(x%)
            IF b1 >= sp(i% + 1) THEN
skipit2:       IF b0 <= sp(i%) THEN  'Delete span
                  n% = n% - 2: IF n% <= 0 THEN EXIT DO
                  sp(i%) = sp(n%): sp(i% + 1) = sp(n% + 1): i% = i% - 2
               ELSE                  'Nudge bottom of span up
                  sp(i% + 1) = b0
               END IF
            ELSEIF b0 <= sp(i%) THEN 'Nudge top of span down
               sp(i%) = b1: GOTO skipit0
            ELSE                     'Split span
               sp(n%) = b1: sp(n% + 1) = sp(i% + 1)
               n% = n% + 2: sp(i% + 1) = b0
            END IF
skipit3:    i% = i% + 2
         LOOP WHILE i% < n%
         x% = x% + 1: pof& = pof& + d%
      LOOP WHILE n% > 0

      sp(0) = -1: sp(1) = .999999: n% = 2
      y% = 1: pof& = oy% * BPL + ox% + 1
      DO
         i% = 0
         DO
            x% = INT(sp(i%) * y%): xe% = INT(sp(i% + 1) * y%) + 1
            p& = pof& + x%
            IF PEEK(p&) < 16 THEN GOTO skipit5
skipit4:    DO
               POKE p&, gcol%
               x% = x% + 1: IF x% >= xe% THEN GOTO skipit7
               p& = p& + 1
            LOOP WHILE PEEK(p&) >= 16
skipit5:    b0 = x% * lorecip(y%)
            DO
               POKE p&, 9: hitp&(hitc%) = p&: hitc% = hitc% + 1
               x% = x% + 1: IF x% >= xe% THEN GOTO skipit6
               p& = p& + 1
            LOOP WHILE PEEK(p&) < 16
            b1 = x% * lorecip(y%)
            IF b1 >= sp(i% + 1) THEN
skipit6:       IF b0 <= sp(i%) THEN  'Delete span
                  n% = n% - 2: IF n% <= 0 THEN EXIT DO
                  sp(i%) = sp(n%): sp(i% + 1) = sp(n% + 1): i% = i% - 2
               ELSE                  'Nudge bottom of span up
                  sp(i% + 1) = b0
               END IF
            ELSEIF b0 <= sp(i%) THEN 'Nudge top of span down
               sp(i%) = b1: GOTO skipit4
            ELSE                     'Split span
               sp(n%) = b1: sp(n% + 1) = sp(i% + 1)
               n% = n% + 2: sp(i% + 1) = b0
            END IF
skipit7:    i% = i% + 2
         LOOP WHILE i% < n%
         y% = y% + 1: pof& = pof& + d% * BPL
      LOOP WHILE n% > 0

   NEXT d%
  
      '2nd half of PALETTE TRICK (cls)
   FOR p& = pe& - BPL + 1 TO pe&
      IF PEEK(p&) = ogcol% THEN POKE p&, 255
   NEXT p&
   OUT &H3C8, ogcol%: OUT &H3C9, 0: OUT &H3C9, 0: OUT &H3C9, 0

      '2nd half of PALETTE TRICK (lit solid block animation)
   OUT &H3C7, 1: r% = INP(&H3C9): g% = INP(&H3C9): b% = INP(&H3C9)
   OUT &H3C8, 3: OUT &H3C9, r%: OUT &H3C9, g%: OUT &H3C9, b%
   FOR z% = (ohitc% AND HITSIZ) TO ohitc% - 1
      IF PEEK(hitp&(z%)) = 3 THEN POKE hitp&(z%), 1
   NEXT z%

   POKE oy% * BPL + ox%, 15
   DO
      z$ = INKEY$
      regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   LOOP WHILE z$ = "" AND regs%(2) = 0 AND regs%(3) = 0
   POKE oy% * BPL + ox%, ocol%

   ox% = ox% + regs%(2): oy% = oy% + regs%(3)
   IF z$ = CHR$(0) + CHR$(75) THEN ox% = ox% - 1
   IF z$ = CHR$(0) + CHR$(77) THEN ox% = ox% + 1
   IF z$ = CHR$(0) + CHR$(72) THEN oy% = oy% - 1
   IF z$ = CHR$(0) + CHR$(80) THEN oy% = oy% + 1
   IF ox% < BWIDTH THEN ox% = BWIDTH
   IF ox% >= XDIM - BWIDTH THEN ox% = XDIM - 1 - BWIDTH
   IF oy% < BWIDTH THEN oy% = BWIDTH
   IF oy% >= YDIM - BWIDTH THEN oy% = YDIM - 1 - BWIDTH
 
LOOP WHILE z$ <> CHR$(27)

