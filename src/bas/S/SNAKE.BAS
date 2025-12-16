RANDOMIZE TIMER
SCREEN 0: CLS : WIDTH 40, 25: DEF SEG = &HB800
numobj% = 22: xpos% = 20: xdir% = 0: speed% = 2: hs = 0: sc& = 0: rand% = 300
lives% = 3: bord% = 1: firx% = 0: firy% = 0: level& = 0
DIM st$(numobj%), col%(numobj%)
st$(0) = "ÜÜ": col%(0) = 4
st$(1) = "++": col%(1) = 14
st$(2) = "ÜÜÜ": col%(2) = 4
st$(3) = "##": col%(3) = 13
st$(4) = "ÜÜÜÜ": col%(4) = 4
st$(5) = "+": col%(5) = 14
st$(6) = "ÜÜÜÜÜ": col%(6) = 4
st$(7) = "#": col%(7) = 13
st$(8) = "Ü Ü Ü": col%(8) = 4
st$(9) = "&&": col%(9) = 9
st$(10) = "Ü Ü Ü Ü": col%(10) = 4
st$(11) = "&": col%(11) = 9
st$(12) = "$$": col%(12) = 10
st$(13) = "+ +": col%(13) = 14
st$(14) = "# #": col%(14) = 13
st$(15) = "& &": col%(15) = 9
st$(16) = "$ $": col%(16) = 10
st$(17) = "+ + +": col%(17) = 14
st$(18) = "# # #": col%(18) = 13
st$(19) = "& & &": col%(19) = 9
st$(20) = "$ $ $": col%(20) = 10
st$(21) = "+#&$&#+": col%(21) = 26
OUT &H3D4, &H15: OUT &H3D5, 113
DO
   z$ = INKEY$
   IF z$ = CHR$(0) + CHR$(75) THEN xdir% = -1
   IF z$ = CHR$(0) + CHR$(77) THEN xdir% = 1
   IF z$ = CHR$(0) + CHR$(72) AND speed% > 1 THEN speed% = speed% / 2
   IF z$ = CHR$(0) + CHR$(80) AND speed% < 8 THEN speed% = speed% * 2
   IF z$ = CHR$(32) THEN xdir% = 0
   xpos% = xpos% + xdir%
   DEF SEG = &H40
   IF (PEEK(&H17) AND 2) > 0 AND xdir% = 0 THEN xpos% = xpos% - 1
   IF (PEEK(&H17) AND 1) > 0 AND xdir% = 0 THEN xpos% = xpos% + 1
   DEF SEG = &HB800
   IF PEEK(718 + level& * 80 + xpos% * 2) = 179 THEN
      IF xpos% > 20 THEN xdir% = 0: xpos% = xpos% - 1
      IF xpos% < 20 THEN xdir% = 0: xpos% = xpos% + 1
   END IF
   IF (placeon% = 220 OR placeon% = 191 OR placeon% = 192 OR placeon% = 217 OR placeon% = 218) AND blink% = 0 THEN
      lives% = lives% - 1
      IF lives% > 0 THEN
         SOUND 62, 2
         blink% = 20
         FOR zz% = 0 TO 798 + level& * 80 STEP 2
            IF PEEK(zz%) = 219 THEN POKE zz%, 32
         NEXT zz%
      END IF
   END IF
   IF blink% > 0 THEN
      blink% = blink% - 1
      IF blink% = 0 THEN
         FOR zz% = 1 TO 799 + level& * 80 STEP 2
            IF PEEK(zz%) = 139 THEN POKE zz%, 11
         NEXT zz%
      END IF
   END IF
   IF lives% = 0 THEN
      SOUND 117, 2
      FOR zz% = 0 TO 798 + level& * 80 STEP 2
         IF PEEK(zz%) = 219 THEN POKE zz%, 178
      NEXT zz%
      SOUND 110, 2
      FOR zz% = 0 TO 798 + level& * 80 STEP 2
         IF PEEK(zz%) = 178 THEN POKE zz%, 177
      NEXT zz%
      SOUND 104, 2
      FOR zz% = 0 TO 798 + level& * 80 STEP 2
         IF PEEK(zz%) = 177 THEN POKE zz%, 176
      NEXT zz%
      SOUND 98, 8
      FOR zz% = 0 TO 798 + level& * 80 STEP 2
         IF PEEK(zz%) = 176 THEN POKE zz%, 32
      NEXT zz%
      LOCATE 25, 7: COLOR 11, 0: PRINT "Press any key to play again";
      LOCATE 10, 16: COLOR 13, 0: PRINT "Score:";
      COLOR 29, 0: PRINT sc& + level& * 16000
      IF sc& + level& * 16000 > hs THEN hs = sc& + level& * 16000
      LOCATE 12, 13: COLOR 13, 0: PRINT "High Score:";
      IF hs = sc& THEN COLOR 29, 0
      PRINT hs
      WHILE INKEY$ <> "": WEND
      DO
         z$ = INKEY$
      LOOP WHILE z$ = ""
      xpos% = 20: xdir% = 0: sc& = 0
      lives% = 3: blink% = 0: bord% = 1
      firx% = 0: firy% = 0: rand% = 300: level& = 0
      CLS
   END IF
   IF CHR$(placeon%) = "+" THEN xlen% = 3: xplace% = xpos% - 1
   IF CHR$(placeon%) = "#" THEN xlen% = 5: xplace% = xpos% - 2
   IF CHR$(placeon%) = "&" THEN xlen% = 5: xplace% = xpos% - 2
   IF CHR$(placeon%) = "$" THEN xlen% = 7: xplace% = xpos% - 3
   IF CHR$(placeon%) = "þ" THEN xlen% = 7: xplace% = xpos% - 3
   IF xplace% < 1 THEN xplace% = 1
   IF xplace% + xlen% > 41 THEN xplace% = 41 - xlen%
   IF CHR$(placeon%) = "+" THEN sc& = sc& + 50: SOUND 262, 1: COLOR 30, 6: LOCATE 6, xplace%: PRINT "5 0"
   IF CHR$(placeon%) = "#" THEN sc& = sc& + 100: SOUND 330, 1: COLOR 29, 5: LOCATE 6, xplace%: PRINT "1 0 0"
   IF CHR$(placeon%) = "&" THEN sc& = sc& + 500: SOUND 392, 1: COLOR 25, 1: LOCATE 6, xplace%: PRINT "5 0 0"
   IF CHR$(placeon%) = "$" THEN sc& = sc& + 1000: SOUND 523, 1: COLOR 26, 2: LOCATE 6, xplace%: PRINT "1 0 0 0"
   IF CHR$(placeon%) = "þ" THEN lives% = lives% + 1: SOUND 1047, 1: COLOR 27, 3: LOCATE 6, xplace%: PRINT "L I F E"
   sc& = sc& + 1: LOCATE 4, 19: COLOR 13, 0: PRINT LTRIM$(RTRIM$(STR$(sc& + level& * 16000)));
   LOCATE 1, bord% + 1: COLOR 11, 0: PRINT STRING$(lives% - 1, 179);
   placeon% = PEEK(718 + level& * 80 + xpos% * 2)
   rand% = rand% - 1
   IF INT(rand% * RND) = 0 THEN COLOR 11, 0: LOCATE 24, INT(((41 - bord% * 2) - 1) * RND) + bord% + 1: PRINT "þ"; : rand% = rand% + (level& * 200) + 200
   COLOR level& + 1, 0
   LOCATE 24, bord%: PRINT "³";
   LOCATE 24, 41 - bord%: PRINT "³";
   IF sc& \ 2000 + 1 > bord% THEN
      IF bord% < 8 THEN
         COLOR level& + 1, 0
         LOCATE 24, bord%: PRINT "À¿";
         LOCATE 24, 40 - bord%: PRINT "ÚÙ";
      END IF
      bord% = bord% + 1
      IF bord% = 9 THEN
         bord% = 1
         sc& = sc& - 16000
         level& = level& + 1
         COLOR level& + 1, 0
         LOCATE 24, 1: PRINT "ÚÄÄÄÄÄÄÙ";
         LOCATE 24, 33: PRINT "ÀÄÄÄÄÄÄ¿";
         LOCATE 24, 15: PRINT "L E V E L "; level& + 1;
      END IF
   END IF
   COLOR 11, 0: IF blink% > 0 THEN COLOR 27, 0
   LOCATE 10 + level&, xpos%: PRINT CHR$(223);
   choices% = (sc& \ 1000) * 2 + 2
   IF choices% > numobj% THEN choices% = numobj%
   FOR z% = speed% TO 16 - speed% STEP speed%
      DO: LOOP WHILE (INP(&H3DA) AND 8) = 0
      OUT &H3D4, &H8: OUT &H3D5, z%
      IF z% = 8 THEN LOCATE 10 + level&, xpos%: PRINT CHR$(219);
      DO: LOOP WHILE (INP(&H3DA) AND 8) <> 0
   NEXT z%
   DO: LOOP WHILE (INP(&H3DA) AND 8) = 0
   OUT &H3D4, &H8: OUT &H3D5, 0
   FOR z% = 0 TO level&
      piece% = INT(choices% * RND)
      place% = INT(((41 - bord% * 2) - LEN(st$(piece%))) * RND) + bord% + 1
      COLOR col%(piece%), 0
      LOCATE 24, place%: PRINT st$(piece%);
   NEXT z%
   LOCATE 25, 40: PRINT
   DO: LOOP WHILE (INP(&H3DA) AND 8) <> 0
LOOP WHILE z$ <> CHR$(27)
OUT &H3D4, &H15: OUT &H3D5, 255
CLS
END

