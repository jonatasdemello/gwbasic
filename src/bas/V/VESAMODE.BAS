DECLARE SUB vesadrawpixelpal (x&, y&, col&)
DECLARE FUNCTION vesasetvideomode% (daxdim&, daydim&, dabits&)
DECLARE SUB vesadrawpixelrgb (x&, y&, r&, g&, b&)
DECLARE SUB vesasetpage (page&)
DECLARE FUNCTION checkvesa% ()
DECLARE SUB selectmode (daxdim&, daydim&, dabits&)

DIM SHARED regs%(10)      'ax, bx, cx, dx, bp, si, di, flags, ds, es
DIM SHARED vesamode%(256), vesaxdim%(256), numvesas%
DIM SHARED vesaydim%(256), vesabits%(256)
DIM SHARED vesabpl%(256), vesapage%(256)
DIM SHARED vesawingran%, bytesperline&, curnumcols&, ovesapage&
DIM SHARED curmodebits%, curmodedim%, vgacompatible%

'Last touch before fixing memory corruption related to "VBE2" on 11/06/2004:
'01/20/1999 04:48 PM   11,819 VESAMODE.BAS

DIM SHARED lastrefresh#

IF checkvesa% <> 0 THEN PRINT "Vesa not found": END

DO
   CALL selectmode(daxdim&, daydim&, dabits&)

   lastrefresh# = 0

   IF vesasetvideomode%(daxdim&, daydim&, dabits&) >= 0 THEN
      SELECT CASE dabits&
         CASE 4, 8:
            FOR x& = 0 TO daxdim& - 1
               CALL vesadrawpixelpal(x&, 0, 15)
               CALL vesadrawpixelpal(x&, daydim& - 1, 15)
            NEXT x&
            FOR y& = 1 TO daydim& - 2
               CALL vesadrawpixelpal(0, y&, 15)
               CALL vesadrawpixelpal(daxdim& - 1, y&, 15)
            NEXT y&
            FOR y& = 1 TO daydim& - 2
               FOR x& = 1 TO daxdim& - 2
                  CALL vesadrawpixelpal(x&, y&, (x& * y&) \ 256)
               NEXT x&
               z$ = INKEY$: IF z$ <> "" THEN EXIT FOR
            NEXT y&
         CASE 15, 16, 24, 32:
            FOR x& = 0 TO daxdim& - 1
               CALL vesadrawpixelrgb(x&, 0, 255, 255, 255)
               CALL vesadrawpixelrgb(x&, daydim& - 1, 255, 255, 255)
            NEXT x&
            FOR y& = 1 TO daydim& - 2
               CALL vesadrawpixelrgb(0, y&, 255, 255, 255)
               CALL vesadrawpixelrgb(daxdim& - 1, y&, 255, 255, 255)
            NEXT y&
            FOR y& = 1 TO daydim& - 2
               FOR x& = 1 TO daxdim& - 2
                  r& = ((x& XOR y&) AND 255)
                  g& = (((x& * y&) \ 64) AND 255)
                  b& = (((x& + y&) \ 2) AND 255)
                  CALL vesadrawpixelrgb(x&, y&, r&, g&, b&)
               NEXT x&
               z$ = INKEY$: IF z$ <> "" THEN EXIT FOR
            NEXT y&
      END SELECT
      IF z$ = "" THEN
         IF vgacompatible% = 1 THEN
               'Init timer &H42
            OUT &H61, INP(&H61) OR 1
            OUT &H43, &HB4: OUT &H42, 0: OUT &H42, 0

            WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
            OUT &H43, &H84: l0% = INP(&H42): h0% = INP(&H42)
            WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
            OUT &H43, &H84: l1% = INP(&H42): h1% = INP(&H42)

            tim& = ((h0% * 256& + l0%) - (h1% * 256& + l1%)) AND 65535
           
               'Uninit timer &H42
            OUT &H61, INP(&H61) AND &HFC
        
            lastrefresh# = 1193181# / tim&
         END IF
         DO: LOOP WHILE INKEY$ = ""
      END IF
   ELSE
      SOUND 37, 2
   END IF
LOOP

FUNCTION checkvesa%
   DIM svgainfo%(128)
   regs%(0) = &H4F00
   regs%(6) = VARPTR(svgainfo%(0))
   regs%(9) = VARSEG(svgainfo%(0))
   svgainfo%(0) = 0 'CVI("VB") 'DO NOT ENABLE VBE2: CAUSES MEMORY CORRUPTION!
   svgainfo%(1) = 0 'CVI("E2")
   CALL int86xold(&H10, regs%(), regs%())
   checkvesa% = ABS(regs%(0) <> &H4F)
   DEF SEG = svgainfo%(8): p& = svgainfo%(7)
   CLS
   numvesas% = 0
   DO
      mode& = PEEK(p&) + PEEK(p& + 1) * 256&: p& = p& + 2
      IF mode& = 65535 THEN EXIT DO
      vesamode%(numvesas%) = mode&
      numvesas% = numvesas% + 1
   LOOP
   FOR z% = 0 TO numvesas% - 1
      regs%(0) = &H4F01           'VESA get granularity for 64K video paging
      regs%(2) = vesamode%(z%)
      CALL int86xold(&H10, regs%(), regs%())
      DEF SEG = regs%(9): p& = regs%(6)
      'if (peek(p&) and 32) then vgacompatible%
      IF (PEEK(p&) AND 16) <> 0 THEN   'Make sure it's not a text mode
         vesawingran% = PEEK(p& + 4) + 256& * PEEK(p& + 5)
         vesabpl%(z%) = PEEK(p& + 16) + 256& * PEEK(p& + 17)
         vesaxdim%(z%) = PEEK(p& + 18) + 256& * PEEK(p& + 19)
         vesaydim%(z%) = PEEK(p& + 20) + 256& * PEEK(p& + 21)
         vesabits%(z%) = PEEK(p& + 25)
         vesapage%(z%) = PEEK(p& + 29)
      END IF
   NEXT z%

      'Sort modes
   FOR z% = 1 TO numvesas% - 1
      FOR zz% = 0 TO z% - 1
         IF vesaxdim%(z%) < vesaxdim%(zz%) OR (vesaxdim%(z%) = vesaxdim%(zz%) AND vesaydim%(z%) < vesaydim%(zz%)) OR (vesaxdim%(z%) = vesaxdim%(zz%) AND vesaydim%(z%) = vesaydim%(zz%) AND vesabits%(z%) < vesabits%(zz%)) THEN
            SWAP vesamode%(z%), vesamode%(zz%)
            SWAP vesaxdim%(z%), vesaxdim%(zz%)
            SWAP vesaydim%(z%), vesaydim%(zz%)
            SWAP vesabits%(z%), vesabits%(zz%)
            SWAP vesabpl%(z%), vesabpl%(zz%)
            SWAP vesapage%(z%), vesapage%(zz%)
         END IF
      NEXT zz%
   NEXT z%
  
   curmodebits% = 1: curmodedim% = 0
END FUNCTION

SUB selectmode (daxdim&, daydim&, dabits&)
   regs%(0) = &H4F02: regs%(1) = &H3: CALL int86xold(&H10, regs%(), regs%())
   'SCREEN 0: WIDTH 80, 25: CLS
   DO
      LOCATE 1, 1: PRINT "Dimensions:         4:   8:  15:  16:  24:  32:"
      oxdim% = 0: oydim% = 0: obits% = 0: numrez% = 0
      daxdim& = 0: daydim& = 0: gotz% = -1
      FOR z% = 0 TO numvesas% - 1
         IF vesaxdim%(z%) <> oxdim% OR vesaydim%(z%) <> oydim% THEN
            oxdim% = vesaxdim%(z%): oydim% = vesaydim%(z%)
            LOCATE numrez% + 3, 1: PRINT oxdim%; "x"; oydim%;
            numrez% = numrez% + 1
         END IF
         SELECT CASE vesabits%(z%)
            CASE 4: x% = 20
            CASE 8: x% = 25
            CASE 15: x% = 30
            CASE 16: x% = 35
            CASE 24: x% = 40
            CASE 32: x% = 45
            CASE ELSE: x% = 0
         END SELECT
         IF x% <> 0 THEN
            LOCATE numrez% + 2, x%: PRINT HEX$(vesamode%(z%));
            IF curmodedim% = numrez% - 1 AND curmodebits% * 5 + 20 = x% THEN gotz% = z%
         END IF
      NEXT z%
      LOCATE curmodedim% + 3, curmodebits% * 5 + 19: PRINT ">";
      LOCATE curmodedim% + 3, curmodebits% * 5 + 23: PRINT "<";
      SELECT CASE curmodebits%
         CASE 0: dabits& = 4
         CASE 1: dabits& = 8
         CASE 2: dabits& = 15
         CASE 3: dabits& = 16
         CASE 4: dabits& = 24
         CASE 5: dabits& = 32
      END SELECT
      LOCATE 25, 1: PRINT STRING$(80, 32);
      IF gotz% >= 0 THEN
         daxdim& = vesaxdim%(gotz%): daydim& = vesaydim%(gotz%)
         pagesize& = (((dabits& + 1) AND (NOT 1)) * vesaxdim%(gotz%) * vesaydim%(gotz%)) \ 8
         LOCATE 25, 1: PRINT vesaxdim%(gotz%); "x"; vesaydim%(gotz%); "x"; dabits&; pagesize&; "bytes";
        
         IF dabits& = 4 THEN
            optibpl& = vesaxdim%(gotz%) \ 8
         ELSE
            optibpl& = (vesaxdim%(gotz%) * ((dabits& + 1) AND (NOT 1))) \ 8
         END IF
         IF vesabpl%(gotz%) <> optibpl& THEN COLOR 0, 4
         LOCATE 25, 35: PRINT "BPL:"; vesabpl%(gotz%);
         COLOR 7, 0

         IF vesapage%(gotz%) + 1 < 4194304 \ pagesize& THEN COLOR 0, 4
         LOCATE 25, 45: PRINT "PAGES:"; vesapage%(gotz%) + 1;
         COLOR 7, 0

         LOCATE 25, 1
      END IF
      IF lastrefresh# <> 0 THEN LOCATE 1, 60: PRINT USING "###.##"; lastrefresh#;
      DO: z$ = INKEY$: LOOP WHILE z$ = ""
      LOCATE curmodedim% + 3, curmodebits% * 5 + 19: PRINT " ";
      LOCATE curmodedim% + 3, curmodebits% * 5 + 23: PRINT " ";
      IF z$ = CHR$(0) + CHR$(72) AND curmodedim% > 0 THEN curmodedim% = curmodedim% - 1
      IF z$ = CHR$(0) + CHR$(80) AND curmodedim% < numrez% - 1 THEN curmodedim% = curmodedim% + 1
      IF z$ = CHR$(0) + CHR$(75) AND curmodebits% > 0 THEN curmodebits% = curmodebits% - 1
      IF z$ = CHR$(0) + CHR$(77) AND curmodebits% < 5 THEN curmodebits% = curmodebits% + 1
      IF z$ = CHR$(27) THEN END
   LOOP WHILE z$ <> CHR$(13)
END SUB

SUB vesadrawpixelpal (x&, y&, col&)
   DEF SEG = &HA000
   SELECT CASE curnumcols&
      CASE 4:
         p& = y& * bytesperline& + x& \ 8
         OUT &H3CE, &H8: OUT &H3CF, 2 ^ (x& AND 7 XOR 7)    'bit mask
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         POKE p& AND 65535, (PEEK(p& AND 65535) AND 0) + (col& AND 15)
      CASE 8:
         p& = y& * bytesperline& + x&
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         POKE p& AND 65535, col&
   END SELECT
END SUB

SUB vesadrawpixelrgb (x&, y&, r&, g&, b&)
   DEF SEG = &HA000
   SELECT CASE curnumcols&
      CASE 15:
         p& = y& * bytesperline& + x& * 2
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         p& = p& AND 65535
         v& = (r& \ 8) * 1024 + (g& \ 8) * 32 + (b& \ 8)
         POKE p&, (v& AND 255): POKE p& + 1, (v& \ 256)
      CASE 16:
         p& = y& * bytesperline& + x& * 2
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         p& = p& AND 65535
         v& = (r& \ 8) * 2048 + (g& \ 4) * 32 + (b& \ 8)
         POKE p&, (v& AND 255): POKE p& + 1, (v& \ 256)
      CASE 24:
         p& = y& * bytesperline& + x& * 3
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         POKE p& AND 65535, b&
         p& = p& + 1: IF (p& AND 65535) = 0 THEN CALL vesasetpage(p& \ 65536)
         POKE p& AND 65535, g&
         p& = p& + 1: IF (p& AND 65535) = 0 THEN CALL vesasetpage(p& \ 65536)
         POKE p& AND 65535, r&
      CASE 32:
         p& = y& * bytesperline& + x& * 4
         IF p& \ 65536 <> ovesapage& THEN CALL vesasetpage(p& \ 65536)
         p& = p& AND 65535
         POKE p& + 2, r&: POKE p& + 1, g&: POKE p& + 0, b&
   END SELECT
END SUB

SUB vesasetnumbytes (dabytesperline&, xmax&, ymax&)
   regs%(0) = &H4F06            'Vesa set bytes per line
   regs%(1) = 0                 '0 - set, 1 - get
   regs%(2) = dabytesperline&   'width in pixels
   CALL int86xold(&H10, regs%(), regs%())
   IF regs%(0) <> &H4F THEN xmax& = 0: ymax& = 0: EXIT SUB
   bytesperline& = regs%(1)
   xmax& = regs%(2)
   ymax& = regs%(3)
END SUB

SUB vesasetpage (page&)
   ovesapage& = page&
   regs%(0) = &H4F05
   regs%(1) = &H0
   regs%(3) = (page& * 64) \ vesawingran%
   CALL int86xold(&H10, regs%(), regs%())
END SUB

SUB vesasetpan (x&, y&)
   regs%(0) = &H4F07            'Vesa set visual page
   regs%(1) = 0                 '0 - set, 1 - get
   regs%(2) = x&                'x-coordinate
   regs%(3) = y&                'y-coordinate
   CALL int86xold(&H10, regs%(), regs%())
END SUB

FUNCTION vesasetvideomode% (daxdim&, daydim&, dabits&)
   FOR z% = numvesas% - 1 TO 0 STEP -1
      IF vesaxdim%(z%) = daxdim& AND vesaydim%(z%) = daydim& AND vesabits%(z%) = dabits& THEN EXIT FOR
   NEXT z%
   IF z% < 0 THEN vesasetvideomode% = -1: EXIT FUNCTION
     
   regs%(0) = &H4F01           'VESA get granularity for 64K video paging
   regs%(2) = vesamode%(z%)
   CALL int86xold(&H10, regs%(), regs%())
   DEF SEG = regs%(9): p& = regs%(6)
   IF (PEEK(p&) AND 32) = 0 THEN vgacompatible% = 1 ELSE vgacompatible% = 0

   regs%(0) = &H4F02                'Vesa set video mode
   regs%(1) = vesamode%(z%)
   CALL int86xold(&H10, regs%(), regs%())
   IF regs%(0) <> &H4F THEN IF z% < 0 THEN vesasetvideomode% = -2: EXIT FUNCTION
   bytesperline& = vesabpl%(z%)
   curnumcols& = vesabits%(z%)
   ovesapage& = 0
   IF vesabits%(z%) = 4 THEN
      OUT &H3CE, &H0: OUT &H3CF, 15                               'set/reset
      OUT &H3CE, &H1: OUT &H3CF, 15                               'enable set/reset
      OUT &H3CE, &H5: OUT &H3CF, (INP(&H3CF) AND (255 - 3)) + 2
   END IF
   vesasetvideomode% = 0
   CALL vesasetpage(0)
END FUNCTION

