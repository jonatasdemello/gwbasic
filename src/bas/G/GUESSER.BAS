RANDOMIZE (VAL(MID$(TIME$, 1, 2)) MOD 8) + VAL(MID$(TIME$, 4, 2)) * 8 + VAL(MID$(TIME$, 7, 2)) * 480
SCREEN 12
DO
   PRINT "GUESS A NUMBER FROM 0 TO 1000, TYPE 0 FOR HELP"
   LINE (50, 100)-(550, 100), 15: LINE -(550, 50), 15: LINE -(550, 150), 15
   LINE (50, 50)-(50, 150), 15
   FOR i = 100 TO 500 STEP 50
      LINE (i, 85)-(i, 115), 15
   NEXT i
   LINE (300, 75)-(300, 125), 15
   c = 0: d = 1000: g = 0
   LOCATE 11, 1: PRINT " 1"; "      ";
   a = INT(1000 * RND) + 1
   DO
      PRINT c; "-"; d;
      LOCATE , 21
      INPUT b
      IF b = 0 THEN b = INT((c + d) / 2): g = g + 1
      e = e + 1
      IF e > 17 AND b <> a THEN
         IF g = 0 THEN PRINT "YOU LOST BECAUSE DIDN'T GUESS IT WITHIN 18 TRIES SO I MUST SAY THIS:"
         IF g > 0 THEN PRINT "WE LOST BECAUSE WE DIDN'T GUESS IT WITHIN THE 18 TRIES SO I MUST SAY THIS:"
         IF e > 14 AND g = 0 THEN PRINT "MY GOD! YOU STINK! ARE YOU RETARDED OR SOMETHING?": SOUND 1550 - e * 83, 10
         IF e > 14 AND g > 0 AND g < e THEN PRINT "ARE YOU TRYING TO MAKE ME LOOK BAD OR SOMETHING?": SOUND 1550 - e * 83, 10
         EXIT DO
      END IF
      IF b < a AND b > c THEN c = b: LINE (51, 90)-(c / 2 + 50, 110), 12, BF
      IF b > a AND b < d THEN d = b: LINE (549, 90)-(d / 2 + 50, 110), 12, BF
      IF b < a THEN PRINT e + 1; " MORE";
      IF b > a THEN PRINT e + 1; " LESS";
   LOOP UNTIL b = a
   IF e <= 17 OR b = a THEN
      IF g = 0 THEN PRINT "YOU ARE AN AWESOME PERSON NOW."
      IF g > 0 AND g < e THEN PRINT "WE ARE AWESOME NOW."
      IF g = e THEN PRINT "I AM AWESOME NOW."
      IF g = 0 THEN PRINT "BECAUSE IT ONLY TOOK YOU"; e; "TRIES."
      IF g > 0 AND g < e THEN PRINT "BECAUSE IT ONLY TOOK US"; e; "TRIES."
      IF g > 0 AND g = e THEN PRINT "BECAUSE IT ONLY TOOK ME"; e; "TRIES."
      IF e < 6 AND g = 0 THEN PRINT "YOU'RE GOOD AT THIS!": SOUND 1550 - e * 83, 10
      IF e < 6 AND g > 0 AND g < e THEN PRINT "WE'RE GOOD AT THIS!": SOUND 1550 - e * 83, 10
      IF e < 6 AND g > 0 AND g = e THEN PRINT "I'M GOOD AT THIS!": SOUND 1550 - e * 83, 10
      IF e > 5 AND e < 10 THEN PRINT "NOT BAD!": SOUND 1550 - e * 83, 10
      IF e > 9 AND e < 15 AND g < e THEN PRINT "COULD DO BETTER.": SOUND 1550 - e * 83, 10
      IF e > 9 AND e < 15 AND g = e THEN PRINT "I COULD DO BETTER. (SEE I'M HONEST)": SOUND 1550 - e * 83, 10
   END IF
   IF g > 0 AND e < 10 THEN PRINT "BECAUSE I PLAYED, OF COURSE."
   PRINT : PRINT "PLAY AGAIN?"
   DO
      h$ = UCASE$(INPUT$(1))
   LOOP UNTIL h$ = "Y" OR h$ = "N"
   IF h$ = "N" THEN END
   CLEAR : CLS
LOOP

