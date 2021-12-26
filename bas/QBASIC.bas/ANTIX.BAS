SCREEN 12
CONST xres% = 80, yres% = 60

DIM board%(xres%, yres%), passx%(xres% * yres%), passy%(xres% * yres%)
DIM monstx%(100), monsty%(100), monstxvel%(100), monstyvel%(100)
DIM xfill%(3200), yfill%(3200)

FOR z% = 0 TO xres% - 1
   FOR zz% = 0 TO yres% - 1
      board%(z%, zz%) = 3
      IF z% = 1 OR z% = xres% - 2 OR zz% = 1 OR zz% = yres% - 2 THEN board%(z%, zz%) = 0
      IF z% = 0 OR z% = xres% - 1 OR zz% = 0 OR zz% = yres% - 1 THEN board%(z%, zz%) = 2
      LINE (z% * 8, zz% * 8)-(z% * 8 + 7, zz% * 8 + 7), board%(z%, zz%), BF
   NEXT zz%
NEXT z%

x% = xres% \ 2: y% = 1
xvel% = 0: yvel% = 0
passcnt% = 0
numonsts% = 2
FOR z% = 0 TO numonsts% - 1
   monstx%(z%) = INT((xres% - 4) * RND) + 2
   monsty%(z%) = INT((yres% - 4) * RND) + 2
   monstxvel%(z%) = INT(2 * RND) * 2 - 1
   monstyvel%(z%) = INT(2 * RND) * 2 - 1
NEXT z%
DO
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
  
   FOR z% = 0 TO numonsts% - 1
      LINE (monstx%(z%) * 8, monsty%(z%) * 8)-(monstx%(z%) * 8 + 7, monsty%(z%) * 8 + 7), 3, BF
     
      monstx%(z%) = monstx%(z%) + monstxvel%(z%)
      dat% = board%(monstx%(z%), monsty%(z%))
      IF dat% = 6 THEN GOSUB die
      IF dat% = 0 THEN
         monstxvel%(z%) = -monstxvel%(z%)
         monstx%(z%) = monstx%(z%) + monstxvel%(z%)
      END IF
      IF monstx%(z%) = x% AND monsty%(z%) = y% THEN GOSUB die
     
      monsty%(z%) = monsty%(z%) + monstyvel%(z%)
      dat% = board%(monstx%(z%), monsty%(z%))
      IF dat% = 6 THEN GOSUB die
      IF dat% = 0 THEN
         monstyvel%(z%) = -monstyvel%(z%)
         monsty%(z%) = monsty%(z%) + monstyvel%(z%)
      END IF
      IF monstx%(z%) = x% AND monsty%(z%) = y% THEN GOSUB die
     
      LINE (monstx%(z%) * 8, monsty%(z%) * 8)-(monstx%(z%) * 8 + 7, monsty%(z%) * 8 + 7), 4, BF
   NEXT z%

   z$ = INKEY$
   IF z$ = CHR$(0) + CHR$(75) AND (xvel% = 0 OR board%(x%, y%) = 0) THEN xvel% = -1: yvel% = 0
   IF z$ = CHR$(0) + CHR$(77) AND (xvel% = 0 OR board%(x%, y%) = 0) THEN xvel% = 1: yvel% = 0
   IF z$ = CHR$(0) + CHR$(72) AND (yvel% = 0 OR board%(x%, y%) = 0) THEN xvel% = 0: yvel% = -1
   IF z$ = CHR$(0) + CHR$(80) AND (yvel% = 0 OR board%(x%, y%) = 0) THEN xvel% = 0: yvel% = 1
   IF z$ = " " AND board%(x%, y%) = 0 THEN xvel% = 0: yvel% = 0
   IF board%(x%, y%) = 0 THEN
      LINE (x% * 8, y% * 8)-(x% * 8 + 7, y% * 8 + 7), 0, BF
   ELSE
      LINE (x% * 8, y% * 8)-(x% * 8 + 7, y% * 8 + 7), 6, BF
   END IF
   x% = x% + xvel%
   y% = y% + yvel%
   IF x% < 1 THEN x% = 1: xvel% = 0
   IF x% > xres% - 2 THEN x% = xres% - 2: xvel% = 0
   IF y% < 1 THEN y% = 1: yvel% = 0
   IF y% > yres% - 2 THEN y% = yres% - 2: yvel% = 0
   LINE (x% * 8, y% * 8)-(x% * 8 + 7, y% * 8 + 7), 15, BF
  
   IF board%(x%, y%) = 3 THEN
      board%(x%, y%) = 6
      passx%(passcnt%) = x%
      passy%(passcnt%) = y%
      passcnt% = passcnt% + 1
   ELSE
      IF passcnt% > 0 THEN
         FOR z% = 0 TO passcnt% - 1
            board%(passx%(z%), passy%(z%)) = 0
            IF passx%(z%) <> x% OR passy%(z%) <> y% THEN LINE (passx%(z%) * 8, passy%(z%) * 8)-(passx%(z%) * 8 + 7, passy%(z%) * 8 + 7), 0, BF
         NEXT z%
         FOR z% = 0 TO passcnt% - 1
            IF board%(passx%(z%) - 1, passy%(z%)) = 3 THEN board%(passx%(z%) - 1, passy%(z%)) = 16
            IF board%(passx%(z%) + 1, passy%(z%)) = 3 THEN board%(passx%(z%) + 1, passy%(z%)) = 16
            IF board%(passx%(z%), passy%(z%) - 1) = 3 THEN board%(passx%(z%), passy%(z%) - 1) = 16
            IF board%(passx%(z%), passy%(z%) + 1) = 3 THEN board%(passx%(z%), passy%(z%) + 1) = 16
         NEXT z%
        
         FOR z% = 0 TO xres% - 1
            FOR zz% = 0 TO yres% - 1
               IF board%(z%, zz%) = 16 THEN
                  fillcol% = zz% * yres% + z% + 17
                  fillx% = z%
                  filly% = zz%
                  GOSUB fillit
               END IF
            NEXT zz%
         NEXT z%
        
         FOR zx% = 0 TO numonsts% - 1
            dat% = board%(monstx%(zx%), monsty%(zx%))
            IF dat% >= 16 THEN
               FOR z% = 0 TO xres% - 1
                  FOR zz% = 0 TO yres% - 1
                     IF board%(z%, zz%) = dat% THEN board%(z%, zz%) = 3
                  NEXT zz%
               NEXT z%
            END IF
         NEXT zx%
        
         OUT 67, 182: OUT 66, 255: OUT 66, 255
         FOR z% = 0 TO xres% - 1
            FOR zz% = 0 TO yres% - 1
               IF board%(z%, zz%) >= 16 THEN
                  OUT 97, INP(97) OR 3
                  board%(z%, zz%) = 0
                  LINE (z% * 8, zz% * 8)-(z% * 8 + 7, zz% * 8 + 7), 0, BF
                  OUT 97, INP(97) AND 252
               END IF
            NEXT zz%
         NEXT z%

         xvel% = 0
         yvel% = 0

         passcnt% = 0
      END IF
   END IF
LOOP WHILE z$ <> CHR$(27)
END

die:
   SOUND 37, 1
   IF board%(x%, y%) = 6 THEN
      LINE (x% * 8, y% * 8)-(x% * 8 + 7, y% * 8 + 7), 3, BF
   ELSE
      LINE (x% * 8, y% * 8)-(x% * 8 + 7, y% * 8 + 7), 0, BF
   END IF

   IF passcnt% > 0 THEN
      FOR zx% = 0 TO passcnt% - 1
         board%(passx%(zx%), passy%(zx%)) = 3
         LINE (passx%(zx%) * 8, passy%(zx%) * 8)-(passx%(zx%) * 8 + 7, passy%(zx%) * 8 + 7), 3, BF
      NEXT zx%
      passcnt% = 0
   END IF
   x% = xres% \ 2: y% = 1
   xvel% = 0: yvel% = 0
RETURN

fillit:
   c% = 1: xfill%(c%) = fillx%: yfill%(c%) = filly%: bound% = 0
   WHILE c% > 0
      zx% = xfill%(c%)
      zzx% = yfill%(c%)
      c% = c% - 1
      WHILE board%(zx%, zzx%) <> bound%
         zx% = zx% - 1
      WEND
      zx% = zx% + 1
      leftz% = zx%
      tlast% = 0
      blast% = 0
      WHILE board%(zx%, zzx%) <> bound%
         tstat% = board%(zx%, zzx% - 1)
         IF tstat% <> bound% AND tstat% <> fillcol% THEN
            IF tlast% = 0 THEN
               c% = c% + 1: xfill%(c%) = zx%: yfill%(c%) = zzx% - 1
               tlast% = 1
            END IF
         ELSE
            tlast% = 0
         END IF
         bstat% = board%(zx%, zzx% + 1)
         IF bstat% <> bound% AND bstat% <> fillcol% THEN
            IF blast% = 0 THEN
               c% = c% + 1: xfill%(c%) = zx%: yfill%(c%) = zzx% + 1
               blast% = 1
            END IF
         ELSE
            blast% = 0
         END IF
         zx% = zx% + 1
      WEND
      zx% = zx% - 1
      FOR zzzx% = leftz% TO zx%
         board%(zzzx%, zzx%) = fillcol%
      NEXT zzzx%
   WEND
RETURN

