RANDOMIZE (VAL(MID$(TIME$, 1, 2)) MOD 8) + VAL(MID$(TIME$, 4, 2)) * 8 + VAL(MID$(TIME$, 7, 2)) * 480
OPEN "KENSETUP.DAT" FOR INPUT AS #1
   INPUT #1, pat$
   INPUT #1, pat$
CLOSE #1
SCREEN 12
WINDOW SCREEN (0, 0)-(639, 479)
pi = 3.14159
DIM lett$(256)
DIM word$(1000), def$(1000), temp$(8)
DIM used(1000), got(16), guessed(26)
DIM pic%(5000)
lett$(32) = "": lett$(33) = "20232424": lett$(34) = "10123032"
lett$(35) = "1014303401410343": lett$(36) = "104012320434511152332024"
lett$(37) = "400411113333": lett$(38) = "441111202031310303141432"
lett$(39) = "20212112": lett$(40) = "201111131324": lett$(41) = "203131333324"
lett$(42) = "123211331331": lett$(43) = "21231232": lett$(44) = "32333324"
lett$(45) = "0242": lett$(46) = "2424": lett$(47) = "4004"
lett$(48) = "612262223113": lett$(49) = "112020241434"
lett$(50) = "632242040444": lett$(51) = "52315233003002320434"
lett$(52) = "343030020242": lett$(53) = "52330434023200400002"
lett$(54) = "61225233204024340232": lett$(55) = "004040414104"
lett$(56) = "5111511352315233103012321434": lett$(57) = "62225111102012420424"
lett$(58) = "21212323": lett$(59) = "222323142121"
lett$(60) = "21121223": lett$(61) = "11311232": lett$(62) = "21323224"
lett$(63) = "2424232252212010": lett$(64) = "6122203052313212121111212122"
lett$(65) = "200420441232": lett$(66) = "000400300232043452315233"
lett$(67) = "204024446122": lett$(68) = "0020000404246222"
lett$(69) = "0040044402320004": lett$(70) = "004002320004"
lett$(71) = "2040224261226422": lett$(72) = "000440440242"
lett$(73) = "103014342024": lett$(74) = "103020235413"
lett$(75) = "000402400244": lett$(76) = "00040444"
lett$(77) = "0004404400242440": lett$(78) = "000400444044"
lett$(79) = "61226222": lett$(80) = "0004003002325231"
lett$(81) = "612262223344": lett$(82) = "00040030023222445231"
lett$(83) = "10401232043451115233": lett$(84) = "00402024"
lett$(85) = "000240426422": lett$(86) = "00242440"
lett$(87) = "0014142222343440": lett$(88) = "00444004"
lett$(89) = "002222402224": lett$(90) = "004040040444"
                                               
phrase$ = "HANGMAN!": x = 25: y = 75: size = 16: col = 13: GOSUB letterprint
phrase$ = "LOADING WORDS...": x = 130: y = 400: size = 4: col = 8: GOSUB letterprint
words = 0
score = 0
OPEN pat$ + "hangman.dat" FOR INPUT AS #1
   DO
      words = words + 1
      INPUT #1, z$
      word$(words) = UCASE$(z$)
      INPUT #1, z$
      def$(words) = UCASE$(z$)
   LOOP WHILE EOF(1) = 0
CLOSE #1
CLS
DO
   LINE (478, 80)-(639, 100), 0, BF
   phrase$ = "SCORE: " + STR$(score): x = 478: y = 80: size = 2: col = 5: GOSUB letterprint
   lett = 0
   gott = 0
   dead = 0
   FOR z = 1 TO 15
      got(z) = 0
   NEXT z
   FOR z = 1 TO 26
      guessed(z) = 0
   NEXT z
   DO
      wrd = INT(words * RND) + 1
   LOOP WHILE used(wrd) <> 0
   lett = LEN(word$(wrd))
   FOR z = 1 TO lett
      LINE ((z - 1) * 30, 100)-(25 + (z - 1) * 30, 100), 8
   NEXT z
   LINE (500, 125)-(500, 101), 4
   LINE -(600, 101), 4
   LINE -(600, 300), 4
   LINE -(625, 300), 4
   LINE -(475, 300), 4
   phrase$ = "GUESS A LETTER!": x = 100: y = 0: size = 6: col = 2: GOSUB letterprint
   phrase$ = "LETTERS MISSED:": x = 478: y = 305: size = 2: col = 7: GOSUB letterprint
   DO
      DO
         DO
            z$ = UCASE$(INKEY$)
         LOOP WHILE z$ = ""
         IF z$ = CHR$(27) THEN END
      LOOP UNTIL ASC(z$) > 64 AND ASC(z$) < 91
      IF guessed(ASC(z$) - 64) = 0 THEN
         oldgott = gott
         FOR z = 1 TO lett
            IF z$ = MID$(word$(wrd), z, 1) THEN
               phrase$ = z$: x = 3 + (z - 1) * 30: y = 78: size = 5: col = 7: GOSUB letterprint
               phrase$ = z$: x = 2 + (z - 1) * 30: y = 79: size = 5: col = 7: GOSUB letterprint
               phrase$ = z$: x = 2 + (z - 1) * 30: y = 77: size = 5: col = 7: GOSUB letterprint
               phrase$ = z$: x = 1 + (z - 1) * 30: y = 78: size = 5: col = 7: GOSUB letterprint
               phrase$ = z$: x = 2 + (z - 1) * 30: y = 78: size = 5: col = 3: GOSUB letterprint
               IF got(z) = 0 THEN got(z) = 1: gott = gott + 1: SOUND 262, 1
            END IF
         NEXT z
         IF oldgott = gott THEN
            dead = dead + 1
            phrase$ = z$: x = 478 + (dead - 1) * 20: y = 320: size = 2: col = 15: GOSUB letterprint
            GOSUB drawpart
         END IF
         guessed(ASC(z$) - 64) = 1
      END IF
   LOOP WHILE gott < lett AND dead < 7
   IF gott = lett AND dead < 7 THEN
      LINE (478, 80)-(639, 100), 0, BF
      score = score + (10 - dead) * 10
      phrase$ = "SCORE: " + STR$(score): x = 478: y = 80: size = 2: col = 5: GOSUB letterprint
      PLAY "mb<<l16Gl8Al16Gl8A>c>"
      GET (0, 77)-(lett * 30, 100), pic%
      FOR z = 1 TO 50
         PUT (INT((640 - lett * 30) * RND), INT(325 * RND) + 101), pic%, OR
      NEXT z
   END IF
   LINE (0, 101)-(639, 479), 0, BF
   phrase$ = "WHAT DOES IT MEAN?": x = 0: y = 120: size = 3: col = 7: GOSUB letterprint
   it = INT(8 * RND) + 1
   FOR z = 1 TO 8
      DO
         temp$(z) = def$(INT(words * RND) + 1)
         zz = 0
         IF z > 1 THEN
            FOR zzz = 1 TO z - 1
               IF temp$(z) = temp$(zzz) THEN zz = zz + 1
            NEXT zzz
         END IF
      LOOP WHILE temp$(z) = def$(wrd) OR zz > 0
   NEXT z
   temp$(it) = def$(wrd)
   FOR z = 1 TO 8
      phrase$ = STR$(z) + ". " + temp$(z): x = 25: y = (z - 1) * 25 + 150: size = 2: col = 6: GOSUB letterprint
   NEXT z
   z$ = INKEY$
   tries = 0
   DO
      DO
         z$ = INKEY$
      LOOP WHILE VAL(z$) < 1 OR VAL(z$) > 8
      tries = tries + 1
      IF VAL(z$) = it THEN SOUND 262, 1
      IF VAL(z$) <> it THEN
         FOR z = 1 TO 10
            phrase$ = STR$(VAL(z$)) + ".": x = 25: y = (VAL(z$) - 1) * 25 + 150: size = 2: col = 12: GOSUB letterprint
            SOUND INT(200 * RND) + 40, .5
            phrase$ = STR$(VAL(z$)) + ".": x = 25: y = (VAL(z$) - 1) * 25 + 150: size = 2: col = 6: GOSUB letterprint
         NEXT z
      END IF
   LOOP WHILE VAL(z$) <> it
   phrase$ = STR$(it) + ". " + temp$(it): x = 25: y = (it - 1) * 25 + 150: size = 2: col = 14: GOSUB letterprint
   LINE (478, 80)-(639, 100), 0, BF
   IF tries = 1 THEN score = score + 50
   phrase$ = "SCORE: " + STR$(score): x = 478: y = 80: size = 2: col = 5: GOSUB letterprint
   phrase$ = "PRESS ANY KEY TO PLAY AGAIN OR ESC TO QUIT": x = 100: y = 460: size = 2: col = 7: GOSUB letterprint
   LINE (90, 455)-(530, 475), 7, B
   DO
      z$ = INKEY$
   LOOP WHILE z$ = ""
   CLS
LOOP WHILE z$ <> CHR$(27)
END

drawpart:
   IF dead < 7 THEN
      IF dead = 1 THEN CIRCLE (500, 140), 15, 15
      IF dead = 2 THEN LINE (500, 155)-(500, 175), 15
      IF dead = 3 THEN LINE (500, 175)-(470, 170), 15
      IF dead = 4 THEN LINE (500, 175)-(530, 170), 15
      IF dead = 5 THEN LINE (500, 175)-(500, 200), 15
      IF dead = 6 THEN LINE (500, 200)-(470, 230), 15
      SOUND 60, 1
   END IF
   IF dead = 7 THEN
      LINE (500, 200)-(530, 230), 15
      GET (470, 166)-(530, 230), pic%
      FOR z = 166 TO 299 STEP 6
         PUT (470, z), pic%, PSET
         LINE (470, z - 6)-(530, z - 1), 0, BF
         LINE (470, 294)-(530, 299), 0, BF
         GET (470, z)-(530, 293), pic%
         SOUND 340 - z, 1
      NEXT z
      FOR z = 1 TO lett
         IF got(z) = 0 THEN phrase$ = MID$(word$(wrd), z, 1): x = 2 + (z - 1) * 30: y = 78: size = 5: col = 6: GOSUB letterprint
      NEXT z
   END IF
RETURN

letterprint:
   FOR zx = 1 TO LEN(phrase$)
      lt = ASC(MID$(phrase$, zx, 1))
      FOR zz = 1 TO LEN(lett$(lt)) STEP 4
          z1 = ASC(MID$(lett$(lt), zz, 1)) - 48
          z2 = ASC(MID$(lett$(lt), zz + 1, 1)) - 48
          z3 = ASC(MID$(lett$(lt), zz + 2, 1)) - 48
          z4 = ASC(MID$(lett$(lt), zz + 3, 1)) - 48
          IF z1 < 5 THEN LINE (z1 * size + x, z2 * size + y)-(z3 * size + x, z4 * size + y), col
          IF z1 > 4 AND z2 = 1 THEN CIRCLE (z3 * size + x, z4 * size + y), size * (z1 - 4), col, pi / 2, 3 * pi / 2
          IF z1 > 4 AND z2 = 2 THEN CIRCLE (z3 * size + x, z4 * size + y), size * (z1 - 4), col, 3 * pi / 2, pi / 2
          IF z1 > 4 AND z2 = 3 THEN CIRCLE (z3 * size + x, z4 * size + y), size * (z1 - 4), col, 0, pi
          IF z1 > 4 AND z2 = 4 THEN CIRCLE (z3 * size + x, z4 * size + y), size * (z1 - 4), col, pi, 0
      NEXT zz
      x = x + size * 5
   NEXT zx
RETURN

