RANDOMIZE TIMER
SCREEN 12
WINDOW (-25, 0)-(131, 125)
DIM a(16, 16), B$(26), c(26), cc$(26), lett$(256)
COLOR 7
pi = 3.141592
DO
   LOCATE 1, 1: PRINT "WHO YOU WANT THE POLICEMAN TO ONLY GO AFTER? ";
   tuer$ = INPUT$(1)
LOOP UNTIL tuer$ = "0" OR (VAL(tuer$) > 0 AND VAL(tuer$) < 10)
tuer = VAL(tuer$)
PRINT tuer$
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
B$(1) = "C 10": B$(2) = "C 50": B$(3) = "C100": B$(4) = "C200"
B$(5) = "W500": B$(6) = "L 50": B$(7) = "L100": B$(8) = "HRSE"
B$(9) = "TREE": B$(10) = "ROCK": B$(11) = "STRE": B$(12) = "RADR"
B$(13) = "DTCR": B$(14) = "GRND": B$(15) = "SHLD": B$(16) = "MONT"
B$(17) = "BLTS": B$(18) = "1GUN": B$(19) = "GOLD": B$(20) = "VLCO"
B$(21) = "FELD": B$(22) = "SHOT": B$(23) = "SUCK": B$(24) = "SECP"
B$(25) = "WALL": B$(26) = "SWRD"
cc$(1) = "COLLECT $10": cc$(2) = "COLLECT $50": cc$(3) = "COLLECT $100"
cc$(4) = "COLLECT $200": cc$(5) = "WIN $500!": cc$(6) = "LOSE $50"
cc$(7) = "LOSE $100": cc$(8) = "HORSE": cc$(9) = "TREE"
cc$(10) = "ROCK": cc$(11) = "STORE": cc$(12) = "RADAR"
cc$(13) = "DETECTOR": cc$(14) = "GRENADE": cc$(15) = "SHIELD"
cc$(16) = "MOUNTAIN": cc$(17) = "BULLETS": cc$(18) = "GUN"
cc$(19) = "GOLD": cc$(20) = "VOLCANO": cc$(21) = "GRASS FIELD"
cc$(22) = "DEAD PERSON": cc$(23) = "SUCKERPIT": cc$(24) = "SECRET PASSAGE"
cc$(25) = "WALL": cc$(26) = "SWORD"
c(1) = 10: c(2) = 8: c(3) = 4: c(4) = 2: c(5) = 1: c(6) = 8: c(7) = 3
c(8) = 5: c(9) = 15: c(10) = 10: c(11) = 40: c(12) = 10: c(13) = 12
c(14) = 3: c(15) = 8: c(16) = 15: c(17) = 3: c(18) = 2: c(19) = 5
c(20) = 2: c(22) = 0: c(23) = 0: c(24) = 15: c(25) = 0: c(26) = 10
FOR z = 1 TO 22
   FOR zz = 1 TO c(z)
      DO
         f = INT(15 * RND) + 1
         g = INT(15 * RND) + 1
         zx = z
         IF zx = 21 THEN zx = 24
         IF zx = 22 THEN zx = 26
      LOOP WHILE (zx = 12 AND f = 15) OR f = 1 OR g = 15 OR g = 1 OR a(f, g) <> 0
      a(f, g) = zx
   NEXT zz
NEXT z
FOR z = 1 TO 15
   FOR zz = 1 TO 15
      IF a(z, zz) = 0 THEN a(z, zz) = 21
   NEXT zz
NEXT z
DO
   LOCATE 3, 1: PRINT "HOW MANY PLAYERS? ";
   pp = VAL(INPUT$(1))
   IF pp < 1 THEN LOCATE 4, 1: PRINT "NOT ENOUGH"
   IF pp > 9 THEN LOCATE 4, 1: PRINT "TOO MANY"
LOOP WHILE pp < 1 OR pp > 9
PRINT pp
DIM p$(9), h(9), i(9), fai(9), m(9), hay(9), hhun(9), mea(9), q(9)
DIM r(9), pz(9), hor(9), bul(9), gun(9), shi(9), gre(9), stu(9), con(9)
DIM det(9), hun(9), swo(9)
FOR z = 1 TO 9
   q(z) = 5
NEXT z
FOR z = 1 TO pp
   LOCATE 3 + z, 1: PRINT "   PLAYER"; RTRIM$(STR$(z)); ": ";
   LINE INPUT p$(z)
   p$(z) = UCASE$(p$(z))
   IF p$(z) <> "" THEN LOCATE 3 + z, 14: PRINT p$(z)
   IF p$(z) = "" THEN p$(z) = "A POLICEMAN": LOCATE 3 + z, 14: PRINT "A POLICEMAN"
   COLOR 7
   IF p$(z) = "WASTER" THEN
      LOCATE 3 + z, 14: PRINT "       "
      COLOR 15
      hor(z) = 1: mea(z) = 1000: gun(z) = 1: swo(z) = 1
      bul(z) = 1000: gre(z) = 1000: shi(z) = 1000
      con(z) = 1000: hay(z) = 1000: det(z) = 1000: p$(z) = ""
      z = z - 1
   END IF
NEXT z
CLS
col = 2
FOR z = 20 TO 95 STEP 5
   PSET (z + 30, 20), col
   LINE -(z + 30, 95), col
   PSET (50, z), col
   LINE -(125, z), col
NEXT z
FOR z = 1 TO 15
   phrase$ = CHR$(80 - z): x = 48: y = z * 5 + 16: size = 3: GOSUB letterprint
   IF z < 10 THEN phrase$ = STR$(z): x = z * 5 + 46: y = 97: size = 3: GOSUB letterprint
   IF z > 9 THEN phrase$ = STR$(z): x = z * 5 + 45.5: y = 97: size = 2.5: GOSUB letterprint
NEXT z
FOR z = 1 TO 9
   phrase$ = STR$(z): x = z * 12 + 5: y = 16: size = 4: col = 7: GOSUB letterprint
   IF z <> 1 THEN LINE (z * 12 + 2, 19)-(z * 12 + 2, 9), col
NEXT z
PSET (14, 15), col
LINE -(125, 15), col
FOR z = 1 TO pp
   f = INT(15 * RND) + 1
   g = INT(15 * RND) + 1
   h(z) = f
   i(z) = g
NEXT z
FOR z = 1 TO pp
   t = z
   col = 15
   GOSUB person
NEXT z
t = 0
FOR z = 1 TO pp
   f = INT(100 * RND) + 100
   m(z) = f
NEXT z
col = 1

mainprogram:
   DO
      IF p$(t) <> "A POLICEMAN" THEN FOR z = 1 TO 5000: NEXT z
      LINE (-25, 125)-(44, 20), 0, BF
      LINE (44, 125)-(131, 100), 0, BF
      LINE (44, 100)-(48, 96), 0, BF
      SOUND 37, .1
      IF hor(t) = 1 AND hhun(t) < 12 THEN ho = ho + 1
      IF ho <> 2 OR p$(t) = "DEAD" THEN
         DO
            t = t + 1: ho = 1
            IF t = pp + 1 THEN t = 1
         LOOP WHILE p$(t) = "DEAD"
      END IF
      FOR z = 1 TO pp
         IF p$(z) <> "DEAD" THEN nd = nd + 1
      NEXT z
      IF nd < 2 THEN GOTO champion
      nd = 0
      IF p$(t) <> "DEAD" AND pz(t) = 1 THEN
         LOCATE 7, 1
         PRINT "("; t; ") "; p$(t); " IS STILL OUT"
         FOR z = 1 TO 2000: NEXT z
         GOTO mainprogram
      END IF
      IF hor(t) = 1 THEN hhun(t) = hhun(t) + 1
      IF hhun(t) > 11 AND hay(t) > 0 THEN
         LOCATE 7, 1: PRINT "("; t; ") "; p$(t); "'S HORSE ATE HAY"
         hay(t) = hay(t) - 1
         hhun(t) = 0
      END IF
      IF hhun(t) > 11 AND hay(t) <= 0 THEN LOCATE 7, 1: PRINT "YOUR HORSE QUIT ON YOU"
      IF stu(t) = 1 AND a(h(t), i(t)) <> 25 THEN stu(t) = 0
      IF stu(t) = 0 AND a(h(t), i(t)) = 25 THEN stu(t) = 1
      IF stu(t) > 0 AND stu(t) < 5 THEN
         stu(t) = stu(t) + 1
         LOCATE 7, 1: PRINT "("; t; ") "; p$(t); " IS STILL STUCK"
         FOR z = 1 TO 3
            SOUND 330, 1
            SOUND 784, 1
         NEXT z
         GOTO mainprogram
      END IF
      IF stu(t) = 5 THEN
         LOCATE 7, 1: PRINT "("; t; ") "; p$(t); " GOT UNSTUCKED"
         stu(t) = 0
         GOSUB newspace
         LINE (i(t) * 5 + 45.25, 95.25 - h(t) * 5)-(i(t) * 5 + 49.75, 99.75 - h(t) * 5), 0, B
         FOR z = 40 TO 2000 STEP 162
            SOUND z, .03
         NEXT z
      END IF
      IF sby = 1 THEN GOSUB sbull: IF sfy = t THEN GOTO mainprogram
      IF p$(t) <> "DEAD" THEN
         GOSUB hunger
         IF hu = 1 THEN
            LOCATE 8, 1: PRINT "("; t; ") "; p$(t); " FAINTED"
            fai(t) = fai(t) + 1
            IF fai(t) > 9 THEN
               LOCATE 8, 1: PRINT "("; t; ") "; p$(t); " DIED OF HUNGER"
               fai(t) = 1000
               LINE (i(t) * 5 + 45.5, 95.5 - h(t) * 5)-(i(t) * 5 + 49.5, 99.5 - h(t) * 5), 0, B
               col = 0
               GOSUB person
               PSET ((i(t) * 5) + 47.5, 97.5 - (h(t) * 5)), col
               col = 3
               GOSUB deadm
               FOR z = 5000 TO 1 STEP -81
                  SOUND z, .03
               NEXT z
               GOSUB urdead
            END IF
         GOTO mainprogram
         END IF
      END IF
      LOCATE 1, 1: PRINT "("; t; ") "; p$(t); "'S TURN "
      LOCATE 2, 1: PRINT "YOU HAVE $"; RTRIM$(LTRIM$(STR$(m(t))));
      IF mea(t) > 0 THEN PRINT ","; mea(t); "MEAL"; : IF mea(t) > 1 THEN PRINT "S";
      IF hor(t) = 1 THEN PRINT ", A HORSE";
      IF hay(t) > 0 THEN PRINT ","; hay(t); "HAY BALE"; : IF hay(t) > 1 THEN PRINT "S";
      IF swo(t) = 1 THEN PRINT ", A SWORD";
      IF gre(t) > 0 THEN PRINT ","; gre(t); "GRENADE"; : IF gre(t) > 1 THEN PRINT "S";
      IF gun(t) = 1 THEN PRINT ", A GUN";
      IF bul(t) > 0 THEN PRINT ","; bul(t); "BULLET"; : IF bul(t) > 1 THEN PRINT "S";
      IF shi(t) > 0 THEN PRINT ","; shi(t); "SHIELD"; : IF shi(t) > 1 THEN PRINT "S";
      IF det(t) = 1 THEN PRINT ", A DETECTOR";
      IF con(t) > 0 THEN PRINT ","; con(t); "CONCRETE BAG"; : IF con(t) > 1 THEN PRINT "S";
      DO
         j$ = ""
         LOCATE 4, 1: PRINT "YOU ARE ON ("; CHR$(64 + h(t)); RTRIM$(STR$(i(t))); ") A "; cc$(a(h(t), i(t))); SPACE$(80 - POS(0))
         IF p$(t) = "A POLICEMAN" THEN GOSUB policeman
         IF p$(t) <> "A POLICEMAN" THEN
            LOCATE 6, 1: PRINT "E X S D P";
            IF gun(t) <> 0 AND bul(t) <> 0 THEN PRINT " F";
            IF gre(t) <> 0 THEN PRINT " G";
            IF swo(t) <> 0 THEN PRINT " W";
            IF det(t) <> 0 THEN PRINT " T";
            IF con(t) <> 0 THEN PRINT " C";
            DO
               j$ = UCASE$(INPUT$(1))
               sdfuk = 0: badmove = 0
               IF j$ = "S" OR j$ = "E" OR j$ = "D" OR j$ = "X" OR j$ = "P" THEN sdfuk = 1
               IF gun(t) <> 0 AND bul(t) <> 0 AND j$ = "F" THEN sdfuk = 1
               IF gre(t) <> 0 AND j$ = "G" THEN sdfuk = 1
               IF swo(t) <> 0 AND j$ = "W" THEN sdfuk = 1
               IF det(t) <> 0 AND j$ = "T" THEN sdfuk = 1
               IF con(t) <> 0 AND j$ = "C" THEN sdfuk = 1
               IF j$ = "S" AND i(t) = 1 THEN badmove = 1
               IF j$ = "D" AND i(t) = 15 THEN badmove = 1
               IF j$ = "X" AND h(t) = 15 THEN badmove = 1
               IF j$ = "E" AND h(t) = 1 THEN badmove = 1
               LOCATE 7, 1: PRINT "            "
               IF badmove = 1 THEN LOCATE 7, 1: PRINT "BAD MOVE"
            LOOP WHILE sdfuk = 0 OR badmove = 1
         END IF
         sdfuk = 0
         IF j$ = "F" AND (gun(t) = 0 OR bul(t) = 0) THEN LOCATE 7, 1: PRINT "CAN'T FIRE": sdfuk = 1
         IF j$ = "T" AND det(t) = 0 THEN LOCATE 7, 1: PRINT "YOU DON'T HAVE A DETECTOR": sdfuk = 1
         IF j$ = "G" AND gre(t) = 0 THEN LOCATE 7, 1: PRINT "YOU DON'T HAVE ANY GRENADES": sdfuk = 1
         IF j$ = "W" AND swo(t) = 0 THEN LOCATE 7, 1: PRINT "YOU DON'T HAVE A SWORD": sdfuk = 1
      LOOP WHILE sdfuk = 1
      IF j$ = "T" THEN
         IF h(t) <> 15 AND h(t) <> 1 AND i(t) <> 15 AND i(t) <> 1 THEN
            LOCATE 8, 1: PRINT "    "; B$(a(h(t) - 1, i(t)))
            LOCATE 9, 1: PRINT B$(a(h(t), i(t) - 1)); "    "; B$(a(h(t), i(t) + 1))
            LOCATE 10, 1: PRINT "    "; B$(a(h(t) + 1, i(t)))
         ELSE
            LOCATE 7, 1: PRINT "CAN'T DO"
         END IF
         FOR z = 1 TO 2000: NEXT z
         GOTO mainprogram
      END IF
      IF j$ = "G" THEN GOSUB shgrenade: GOTO mainprogram
      IF j$ = "C" THEN GOSUB conc: GOTO mainprogram
      IF j$ = "F" THEN GOSUB shooting: GOTO mainprogram
      IF j$ = "W" THEN GOSUB sw: GOTO mainprogram
      DO
         IF j$ = "E" OR j$ = "S" OR j$ = "D" OR j$ = "X" THEN moves = 1
         sdfuk = 0
         IF p$(t) = "A POLICEMAN" THEN
            IF j$ = "S" AND a(h(t), i(t) - 1) = 25 THEN sdfuk = 1
            IF j$ = "D" AND a(h(t), i(t) + 1) = 25 THEN sdfuk = 1
            IF j$ = "X" AND a(h(t) + 1, i(t)) = 25 THEN sdfuk = 1
            IF j$ = "E" AND a(h(t) - 1, i(t)) = 25 THEN sdfuk = 1
         END IF
         IF sdfuk <> 0 THEN
            kkk = INT(4 * RND) + 1
            IF kkk = 1 THEN j$ = "E"
            IF kkk = 2 THEN j$ = "X"
            IF kkk = 3 THEN j$ = "D"
            IF kkk = 4 THEN j$ = "S"
         END IF
      LOOP UNTIL sdfuk = 0
      IF moves = 1 THEN col = 0: GOSUB person
      IF j$ = "E" AND h(t) > 1 THEN h(t) = h(t) - 1
      IF j$ = "S" AND i(t) > 1 THEN i(t) = i(t) - 1
      IF j$ = "D" AND i(t) < 15 THEN i(t) = i(t) + 1
      IF j$ = "X" AND h(t) < 15 THEN h(t) = h(t) + 1
      IF moves = 1 THEN col = 15: GOSUB person
      col = 0
      moves = 0
      LOCATE 4, 1: PRINT "YOU ARE ON ("; CHR$(64 + h(t)); RTRIM$(STR$(i(t))); ") A "; cc$(a(h(t), i(t))); SPACE$(80 - POS(0))
      SELECT CASE a(h(t), i(t))
      CASE 1
         m(t) = m(t) + 10: GOSUB newspace
      CASE 2
         m(t) = m(t) + 50: GOSUB newspace
      CASE 3
         m(t) = m(t) + 100: GOSUB newspace
      CASE 4
         m(t) = m(t) + 200: GOSUB newspace
      CASE 5
         m(t) = m(t) + 500: GOSUB newspace
      CASE 6
         m(t) = m(t) - 50: IF m(t) < 0 THEN m(t) = 0: GOSUB newspace
      CASE 7
         m(t) = m(t) - 100: IF m(t) < 0 THEN m(t) = 0: GOSUB newspace
      CASE 8
         hor(t) = 1: hhun(t) = 0: GOSUB newspace
      CASE 11
         LOCATE 8, 1: PRINT "WHAT DO YOU WANT TO BUY?"
         sal = INT(5 * RND) + 1
         IF sal <> 2 THEN sal = 1
         IF sal = 2 THEN LOCATE 9, 1: PRINT "THERE IS A SALE!!!"
         buy$ = ""
         DO UNTIL buy$ = "G" OR (m(t) < 6) OR (sal = 1 AND m(t) < 12)
            LINE (-25, 88)-(44, 20), 0, BF
            buy$ = ""
            IF p$(t) = "A POLICEMAN" THEN
               IF buy$ = "" AND m(t) >= 20 / sal AND mea(t) < 3 THEN buy$ = "F"
               IF buy$ = "" AND m(t) >= 200 / sal AND hor(t) = 0 THEN buy$ = "C"
               IF buy$ = "" AND m(t) >= 12 / sal AND hor(t) = 1 AND hay(t) < 3 THEN buy$ = "J"
               IF buy$ = "" AND m(t) >= 64 / sal AND swo(t) = 0 THEN buy$ = "I"
               IF buy$ = "" AND m(t) >= 100 / sal AND gun(t) = 0 THEN buy$ = "A"
               IF buy$ = "" AND m(t) >= 50 / sal AND bul(t) < 10 THEN buy$ = "B"
               IF buy$ = "" AND m(t) >= 80 / sal AND con(t) < 3 THEN buy$ = "H"
               IF buy$ = "" AND m(t) >= 50 / sal AND gre(t) < 3 THEN buy$ = "D"
               IF buy$ = "" AND m(t) >= 50 / sal THEN buy$ = "E"
               IF buy$ = "" AND m(t) >= 20 / sal THEN buy$ = "F"
               IF buy$ = "" THEN buy$ = "G"
            ELSE
               LOCATE 11, 1
               IF m(t) >= 200 / sal AND hor(t) <> 1 THEN PRINT "(C) HORSE------$"; 200 / sal
               IF m(t) >= 100 / sal AND gun(t) <> 1 THEN PRINT "(A) GUN--------$"; 100 / sal
               IF m(t) >= 80 / sal THEN PRINT "(H) CONCRETE---$"; 80 / sal
               IF m(t) >= 64 / sal AND swo(t) <> 1 THEN PRINT "(I) SWORD------$"; 64 / sal
               IF m(t) >= 50 / sal THEN
                  PRINT "(B) 5 BULLETS--$"; 50 / sal
                  PRINT "(D) GRENADE----$"; 50 / sal
                  PRINT "(E) SHIELD-----$"; 50 / sal
               END IF
               IF m(t) >= 20 / sal THEN PRINT "(F) MEAL-------$"; 20 / sal
               IF m(t) >= 12 / sal THEN PRINT "(J) HAY BALE---$"; 12 / sal
               PRINT "(G) DONE           "
               LOCATE 10, 1: PRINT "YOU HAVE $"; m(t);
               DO
                  buy$ = UCASE$(INPUT$(1))
                  sdfuk = 0
                  IF m(t) >= 200 / sal AND hor(t) <> 1 AND buy$ = "C" THEN sdfuk = 1
                  IF m(t) >= 100 / sal AND gun(t) <> 1 AND buy$ = "A" THEN sdfuk = 1
                  IF m(t) >= 80 / sal AND buy$ = "H" THEN sdfuk = 1
                  IF m(t) >= 64 / sal AND swo(t) <> 1 AND buy$ = "I" THEN sdfuk = 1
                  IF m(t) >= 50 / sal AND (buy$ = "B" OR buy$ = "D" OR buy$ = "E") THEN sdfuk = 1
                  IF m(t) >= 20 / sal AND buy$ = "F" THEN sdfuk = 1
                  IF m(t) >= 12 / sal AND buy$ = "J" THEN sdfuk = 1
                  IF buy$ = "G" THEN sdfuk = 1
               LOOP WHILE sdfuk = 0
            END IF
            spent = 0
            LOCATE 22, 1: PRINT "YOU BOUGHT ";
            IF buy$ = "A" THEN spent = 100: gun(t) = 1: PRINT "A GUN"
            IF buy$ = "B" THEN spent = 50: bul(t) = bul(t) + 5: PRINT "5 BULLETS"
            IF buy$ = "C" THEN spent = 200: hhun(t) = 0: hor(t) = 1: PRINT "A HORSE"
            IF buy$ = "D" THEN spent = 50: gre(t) = gre(t) + 1: PRINT "A GRENADE"
            IF buy$ = "E" THEN spent = 50: shi(t) = shi(t) + 1: PRINT "A SHIELD"
            IF buy$ = "F" THEN spent = 20: mea(t) = mea(t) + 1: PRINT "A MEAL"
            IF buy$ = "H" THEN spent = 80: con(t) = con(t) + 1: PRINT "A CONCRETE BAG"
            IF buy$ = "I" THEN spent = 64: swo(t) = 1: PRINT "A SWORD"
            IF buy$ = "J" THEN spent = 12: hay(t) = hay(t) + 1: PRINT "A HAY BALE"
            IF buy$ = "G" THEN PRINT "NOTHING ELSE"
            m(t) = m(t) - spent / sal
         LOOP
      CASE 12
         LOCATE 8, 1: PRINT "    "; B$(a(h(t) - 1, i(t)))
         LOCATE 9, 1: PRINT B$(a(h(t), i(t) - 1)); "    "; B$(a(h(t), i(t) + 1))
         LOCATE 10, 1: PRINT "    "; B$(a(h(t) + 1, i(t)))
         FOR z = 1 TO 2000: NEXT z
         GOSUB newspace
      CASE 13
         det(t) = 1: GOSUB newspace
      CASE 14
         gre(t) = gre(t) + 1: GOSUB newspace
      CASE 15
         shi(t) = shi(t) + 1: GOSUB newspace
      CASE 17
         bul(t) = bul(t) + 2: GOSUB newspace
      CASE 18
         gun(t) = 1: GOSUB newspace
      CASE 19
         mm = (INT(3 * RND) + 1) * 100: LOCATE 7, 1: PRINT "COLLECT $"; mm: m(t) = m(t) + mm: GOSUB newspace
      CASE 20
         vol = INT(4 * RND) + 1: IF vol = 2 THEN GOSUB volcano
      CASE 21
         IF hor(t) = 1 THEN hhun(t) = 0: LOCATE 7, 1: PRINT "("; t; ") "; p$(t); "'S HORSE ATE GRASS": GOSUB newspace
      CASE 22
         DO
            FOR z = 1 TO pp
               IF z <> t THEN
                  IF h(t) = h(z) AND i(t) = i(z) AND fai(z) = 1000 THEN qwe = z
               END IF
            NEXT z
            LOCATE 7, 1: PRINT "YOU FOUND PLAYER #"; qwe; "'S POSSESSIONS"
            m(t) = m(t) + m(qwe): shi(t) = shi(t) + shi(qwe)
            mea(t) = mea(t) + mea(qwe): bul(t) = bul(t) + bul(qwe)
            gre(t) = gre(t) + gre(qwe): con(t) = con(t) + con(qwe)
            hay(t) = hay(t) + hay(qwe)
            fai(qwe) = 10
            IF gun(qwe) = 1 THEN gun(t) = 1
            IF det(qwe) = 1 THEN det(t) = 1
            IF hor(qwe) = 1 THEN hor(t) = 1
            IF swo(qwe) = 1 THEN swo(t) = 1
            SOUND 200, 1
            uio = 0
            FOR z = 1 TO 6
               IF z <> t THEN
                  IF fai(z) = 1000 AND h(t) = h(z) AND i(t) = i(z) THEN uio = 1
               END IF
            NEXT z
         LOOP UNTIL uio <> 1
         GOSUB newspace
         PSET ((i(t) * 5) + 47.5, 97.5 - (h(t) * 5)), col
         col = 0
         GOSUB deadm
      CASE 23
         SOUND 50, 1
         gotit = 0: ghn = 0
         DO
            ghj = INT(9 * RND) + 1
            ghn = ghn + 1
            IF ghj = 1 AND gun(t) = 1 THEN gun(t) = 0: LOCATE 7, 1: PRINT "YOU LOST YOUR GUN": gotit = 1
            IF ghj = 2 AND det(t) = 1 THEN det(t) = 0: LOCATE 7, 1: PRINT "YOU LOST YOUR DETECTOR": gotit = 1
            IF ghj = 3 AND hor(t) = 1 THEN hor(t) = 0: LOCATE 7, 1: PRINT "YOU LOST YOUR HORSE": gotit = 1
            IF ghj = 4 AND bul(t) > 0 THEN bul(t) = 0: LOCATE 7, 1: PRINT "YOU LOST ALL YOUR BULLETS": gotit = 1
            IF ghj = 5 AND gre(t) > 0 THEN gre(t) = 0: LOCATE 7, 1: PRINT "YOU LOST ALL YOUR GRENADES": gotit = 1
            IF ghj = 6 AND mea(t) > 0 THEN mea(t) = 0: LOCATE 7, 1: PRINT "YOU LOST ALL YOUR MEALS": gotit = 1
            IF ghj = 7 AND m(t) > 0 THEN m(t) = 0: LOCATE 7, 1: PRINT "YOU LOST ALL YOUR MONEY": gotit = 1
            IF ghj = 8 AND shi(t) > 0 THEN shi(t) = 0: LOCATE 7, 1: PRINT "YOU LOST ALL YOUR SHIELDS": gotit = 1
            IF ghj = 9 AND swo(t) = 1 THEN swo(t) = 0: LOCATE 7, 1: PRINT "YOU LOST YOUR SWORD": gotit = 1
         LOOP WHILE gotit = 0 AND ghn < 2
         IF gotit = 0 THEN LOCATE 7, 1: PRINT "YOU DIDN'T LOSE ANYTHING!!!"
         IF gotit = 1 THEN
            GOSUB newspace
            LINE (i(t) * 5 + 45.5, 95.5 - h(t) * 5)-(i(t) * 5 + 49.5, 99.5 - h(t) * 5), 0, B
            GOSUB sbull: IF sfy = t THEN GOTO mainprogram
         END IF
      CASE 24
         col = 0: GOSUB person
         LOCATE 6, 1: PRINT "YOU'RE GOING THROUGH"
         LOCATE 7, 1: PRINT "A SECRET PASSAGE"
         DO
            h(t) = INT(15 * RND) + 1
            i(t) = INT(15 * RND) + 1
         LOOP WHILE a(h(t), i(t)) = 25
         LOCATE 8, 1: PRINT p$(t); "IS NOW AT ("; CHR$(h(t) + 64); LTRIM$(RTRIM$(STR$(i(t)))); ")"
         LOCATE 9, 1: PRINT "A "; cc$(a(h(t), i(t)))
         col = 15: GOSUB person
         FOR z = 1 TO 30
            SOUND 50, .03
            SOUND 5000, .03
         NEXT z
      CASE 25
         col = 0: GOSUB person
         IF j$ = "E" THEN h(t) = h(t) + 1
         IF j$ = "X" THEN h(t) = h(t) - 1
         IF j$ = "S" THEN i(t) = i(t) + 1
         IF j$ = "D" THEN i(t) = i(t) - 1
         LOCATE 7, 1: PRINT "YOU FELL BACK OFF THE WALL"
         SOUND 500, 1
         col = 15: GOSUB person
      CASE 26
         swo(t) = swo(t) + 1
         GOSUB newspace
      END SELECT
   LOOP

volcano:
   LOCATE 7, 1: PRINT "THE VOLCANO HAS ERUPTED!!!"
   IF det(t) = 1 THEN
      LOCATE 8, 1: PRINT "BUT "; p$(t); " WAS SAVED"
      LOCATE 9, 1: PRINT "BY HIS DETECTOR"
      GOSUB newspace
   ELSE
      LOCATE 8, 1: PRINT p$(t); " WAS BURNT TO A CRISP"
      voca = 1
      GOSUB ko
      col = 0: GOSUB person
      FOR z = 1 TO 30
         SOUND 121, .1: SOUND 283, .1: SOUND 1255, .1
      NEXT z
      GOSUB urdead
   END IF
RETURN

hunger:
   hun(t) = hun(t) + 1
   hu = 0
   IF hun(t) > 9 AND mea(t) > 0 THEN
      LOCATE 7, 1: PRINT "("; t; ") "; p$(t); " ATE ONE MEAL"
      mea(t) = mea(t) - 1
      hun(t) = 0
      fai(t) = 0
   END IF
   IF hun(t) > 10 THEN
      LOCATE 7, 1: PRINT "("; t; ") "; p$(t); " IS HUNGRY"
   END IF
   IF hun(t) < 15 THEN RETURN
   IF hun(t) > 30 THEN hun(t) = 30
   hu = INT((30 - hun(t)) * RND) + 1
RETURN

deadm:
   LINE -STEP(-1, -1), col
   LINE -STEP(0, 2), col
   LINE -STEP(2, 0), col
   LINE -STEP(0, -2), col
   LINE -STEP(-2, 0), col
   LINE -STEP(2, 0), col
   LINE -STEP(-2, 2), col
   LINE -STEP(1, -1), col
   LINE -STEP(1, 1), col
RETURN

shgrenade:
   IF p$(t) = "A POLICEMAN" AND p$(r(t)) = "A POLICEMAN" THEN
      phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      r(r(t)) = t
      q(r(t)) = 0
      phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
   END IF
   gre(t) = gre(t) - 1
   IF p$(t) = "A POLICEMAN" THEN
      IF h(r(t)) = h(t) + 1 THEN gr$ = "X"
      IF h(r(t)) = h(t) - 1 THEN gr$ = "E"
      IF i(r(t)) = i(t) + 1 THEN gr$ = "D"
      IF i(r(t)) = i(t) - 1 THEN gr$ = "S"
      IF gr$ = "" AND a(h(t) + 1, i(t)) = 25 THEN gr$ = "X"
      IF gr$ = "" AND a(h(t) - 1, i(t)) = 25 THEN gr$ = "E"
      IF gr$ = "" AND a(h(t), i(t) + 1) = 25 THEN gr$ = "D"
      IF gr$ = "" AND a(h(t), i(t) - 1) = 25 THEN gr$ = "S"
      IF gr$ = "" THEN
         z = INT(4 * RND) + 1
         IF z = 1 THEN gr$ = "X"
         IF z = 2 THEN gr$ = "E"
         IF z = 3 THEN gr$ = "D"
         IF z = 4 THEN gr$ = "S"
      END IF
   END IF
   IF p$(t) <> "A POLICEMAN" THEN
      LOCATE 6, 1: PRINT "GRENADE E X S D"
      DO
         gr$ = UCASE$(INPUT$(1))
      LOOP UNTIL gr$ = "E" OR gr$ = "X" OR gr$ = "S" OR gr$ = "D"
   END IF
   GOSUB ko
   IF gr$ = "E" THEN gran = h(t) - 1: grand = i(t)
   IF gr$ = "X" THEN gran = h(t) + 1: grand = i(t)
   IF gr$ = "S" THEN gran = h(t): grand = i(t) - 1
   IF gr$ = "D" THEN gran = h(t): grand = i(t) + 1
   IF gran = 0 OR gran = 16 OR grand = 0 OR grand = 16 THEN
      LOCATE 7, 1: PRINT "CAN'T DO"
      grand = 0: gran = 0: gros = 0: RETURN
   END IF
   gros = 0
   FOR z = 1 TO pp
      IF p$(z) <> "DEAD" AND gran = h(z) AND grand = i(z) THEN gros = z
   NEXT z
   IF gros = 0 THEN
      IF a(gran, grand) <> 23 AND a(gran, grand) <> 25 THEN grand = 0: gran = 0: gros = 0: RETURN
      wart = h(t): fart = i(t): h(t) = gran: i(t) = grand
      GOSUB newspace
      h(t) = wart: i(t) = fart: wart = 0: fart = 0
      LINE (grand * 5 + 45.25, 95.25 - gran * 5)-(grand * 5 + 49.75, 99.75 - gran * 5), 0, B
      LINE (grand * 5 + 45.5, 95.5 - gran * 5)-(grand * 5 + 49.5, 99.5 - gran * 5), 0, B
      FOR z = 40 TO 2000 STEP 162
         SOUND z, .03
      NEXT z
      grand = 0: gran = 0: gros = 0: RETURN
      END IF
      grop = INT(3 * RND) + 1
      IF grop = 2 THEN
         IF pz(gros) <> 1 THEN
            py = py + 1
            pz(gros) = 1
            LOCATE 7, 1: PRINT "("; gros; ") "; p$(gros); " IS KNOCKED OUT"
            FOR z = 5000 TO 2000 STEP -161
               SOUND z, .03
            NEXT z
         END IF
         RETURN
      END IF
      IF grop = 1 AND shi(gros) > 1 THEN
         LOCATE 7, 1: PRINT "("; gros; ") "; p$(gros); " LOST 2 SHIELDS"
         shi(gros) = shi(gros) - 2
         FOR z = 1 TO 40
            SOUND 50, .03
            SOUND 280, .03
         NEXT z
         RETURN
      END IF
      LOCATE 7, 1: PRINT "("; gros; ") "; p$(gros); " BLEW UP"
      p$(gros) = "DEAD"
      IF pz(gros) = 1 THEN pz(gros) = 0: py = py - 1
      phrase$ = STR$(r(gros)): x = gros * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      phrase$ = "X": x = gros * 12 + 9: y = 9: size = 4: col = 3: GOSUB letterprint
      tt = t: t = gros
      col = 0: GOSUB person
      t = tt
      tt = 0
      FOR z = 40 TO 2000 STEP 162
         SOUND z, .03
      NEXT z
      FOR z = 2000 TO 40 STEP -162
         SOUND z, .03
      NEXT z
      SOUND 1000, 3

newspace:
   DO
      rand = INT(22 * RND) + 1
      IF rand = 22 THEN rand = 24
   LOOP WHILE rand = 12 AND (h(t) = 1 OR h(t) = 15 OR i(t) = 1 OR i(t) = 15)
   a(h(t), i(t)) = rand
RETURN

shooting:
   LOCATE 6, 1: PRINT "SHOOT WHICH DIRECTION? E S D X"
      IF p$(t) = "A POLICEMAN" AND p$(r(t)) = "A POLICEMAN" THEN
         phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
         r(r(t)) = t
         q(r(t)) = 0
         phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
      END IF
      IF p$(t) = "A POLICEMAN" THEN
         IF h(r(t)) > h(t) THEN z$ = "X"
         IF h(r(t)) < h(t) THEN z$ = "E"
         IF i(r(t)) > i(t) THEN z$ = "D"
         IF i(r(t)) < i(t) THEN z$ = "S"
      ELSE
         LOCATE 6, 1: PRINT "E X S D"
         DO
            z$ = UCASE$(INPUT$(1))
         LOOP UNTIL z$ = "E" OR z$ = "S" OR z$ = "D" OR z$ = "X"
      END IF
      GOSUB ko
      ilof = 0
      getout = 0
      ii = h(t)
      jj = i(t)
      FOR z = 1 TO 10
         IF z <> 1 AND ilof = 0 AND a(ii, jj) <> 22 THEN col = 0: GOSUB shot
         FOR zz = 1 TO pp
            IF a(ii, jj) = 25 THEN getout = 1
            IF getout = 0 AND zz <> t AND ilof = 0 AND (h(zz) = ii AND i(zz) = jj AND p$(zz) <> "DEAD") THEN ilof = zz
         NEXT zz
         IF getout = 0 AND ilof = 0 THEN
            IF z$ = "E" THEN ii = ii - 1: IF ii < 1 THEN ii = 1
            IF z$ = "X" THEN ii = ii + 1: IF ii > 15 THEN ii = 15
            IF z$ = "S" THEN jj = jj - 1: IF jj < 1 THEN jj = 1
            IF z$ = "D" THEN jj = jj + 1: IF jj > 15 THEN jj = 15
            IF a(ii, jj) <> 22 THEN col = 5: GOSUB shot
         END IF
      NEXT z
      col = 0
      GOSUB shot
      bul(t) = bul(t) - 1
      IF a(ii, jj) = 25 THEN
         LOCATE 7, 1: PRINT "YOUR BULLET HIT A WALL"
         FOR z = 1 TO 10
            SOUND 121, .05
            SOUND 40, .05
         NEXT z
         RETURN
      END IF
      IF ilof = 0 THEN LOCATE 7, 1: PRINT "YOU WEREN'T SHOOTING AT ANYONE": RETURN
      phrase$ = STR$(ilof): x = i(ilof) * 5 + 45.5: y = 96 - h(ilof) * 5: size = 4: col = hor(ilof) * 8 + 7: GOSUB letterprint
      x = 2: xx = 0: xxx = 0: xxxx = 0
      IF (a(h(ilof), i(ilof)) > 7 AND a(h(ilof), i(ilof)) < 12) OR a(h(ilof), i(ilof)) = 16 OR a(h(ilof), i(ilof)) = 20 THEN x = x * 2: xx = 1
      IF shi(ilof) > 0 THEN x = x * shi(ilof): xxx = 1
      IF hor(ilof) = 1 THEN x = x * 2: xxxx = 1
      IF a(h(t), i(t)) = 16 THEN x = INT(x / 2)
      des = INT(x * RND) + 1
      IF des <> x THEN
         IF des < x / 2 AND xx = 1 AND a(h(ilof), i(ilof)) = 16 THEN
            LOCATE 7, 1: PRINT "("; t; ") "; p$(t); " SHOT A VOLCANO"
            t = ilof
            GOSUB volcano
            RETURN
         END IF
         IF des < x / 2 AND xx = 1 THEN
            LOCATE 7, 1: PRINT "A "; cc$(a(h(ilof), i(ilof))); " BLEW UP"
            a(h(ilof), i(ilof)) = INT(21 * RND) + 1
            xx = 0: xxxx = 0: xxx = 0: RETURN
         END IF
         IF des < x / 2 AND xxx = 1 THEN
            GOSUB blowshield
            RETURN
         END IF
         IF des < x / 2 AND xxxx = 1 THEN
            GOSUB deadhorse
            RETURN
         END IF
         IF des < x * (3 / 4) AND xxx = 1 THEN GOSUB blowshield: RETURN
         IF des < x * (7 / 8) AND xxxx = 1 THEN GOSUB deadhorse: RETURN
         IF pz(ilof) <> 1 OR des >= x * (15 / 16) THEN
            IF des < x * (15 / 16) THEN pz(ilof) = 1: py = py + 1
            LOCATE 7, 1: PRINT "("; ilof; ") "; p$(ilof); " IS KNOCKED OUT"
            FOR z = 5000 TO 2000 STEP -162
               SOUND z, .03
            NEXT z
            xx = 0: xxxx = 0: xxx = 0: RETURN
         END IF
         bul(ilof) = bul(ilof) + 1
         LOCATE 7, 1: PRINT "("; ilof; ") "; p$(ilof); " CAUGHT A BULLET"
         SOUND 688, 1: SOUND 850, 1: SOUND 1012, 1: SOUND 850, 1
         SOUND 1012, 1: SOUND 1336, 1: SOUND 1660, 1
         SOUND 1984, 1: SOUND 2632, 1
         RETURN
      END IF
      xx = 0: xxx = 0: xxxx = 0
      SOUND 1000, 3
      tt = t: t = ilof
      col = 0: GOSUB person
      t = tt: tt = 0
      LOCATE 7, 1: PRINT p$(ilof); " IS DEAD"
      p$(ilof) = "DEAD"
      IF pz(ilof) = 1 THEN pz(ilof) = 0: py = py - 1
      a(h(ilof), i(ilof)) = 22
      fai(ilof) = 1000
      LINE (i(ilof) * 5 + 45.5, 95.5 - h(ilof) * 5)-(i(ilof) * 5 + 49.5, 99.5 - h(ilof) * 5), 0, B
      PSET ((i(ilof) * 5) + 47.5, 97.5 - (h(ilof) * 5)), col
      col = 3
      GOSUB deadm
      phrase$ = STR$(r(ilof)): x = ilof * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      phrase$ = "X": x = ilof * 12 + 9: y = 9: size = 4: col = 3: GOSUB letterprint
      RETURN

champion:
   FOR z = 1 TO pp
      IF p$(z) <> "DEAD" THEN t = z
   NEXT z
   LOCATE 8, 1: PRINT p$(t); " KILLED EVERYONE"
   LOCATE 9, 1: PRINT "AND IS THE CHAMPION"
   LOCATE 10, 1: PRINT "BUT NOW "; p$(t); " HAS"
   LOCATE 11, 1: PRINT "TO ESCAPE THE POLICEMAN"
   SOUND 262, 2: SOUND 330, 2: SOUND 392, 2: SOUND 523, 3
   SOUND 392, 1: SOUND 523, 4
   phrase$ = STR$(r(t)): x = t * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
   FOR z = 1 TO 9
      phrase$ = "X": x = z * 12 + 9: y = 9: size = 4: col = 0: GOSUB letterprint
   NEXT z
   col = 0: GOSUB person
   FOR z = 1 TO 9
      IF fai(z) = 1000 THEN
         PSET ((i(z) * 5) + 47.5, 97.5 - (h(z) * 5)), 0
         GOSUB deadm
         a(h(z), i(z)) = 23
         LINE (i(z) * 5 + 45.5, 95.5 - h(z) * 5)-(i(z) * 5 + 49.5, 99.5 - h(z) * 5), 5, B
         fai(z) = 10
      END IF
   NEXT z
   p$(1) = p$(t): mea(1) = mea(t): r(1) = 0: gun(1) = gun(t)
   det(1) = det(t): pz(1) = pz(t): fai(1) = fai(t): swo(1) = swo(t)
   bul(1) = bul(t): hor(1) = hor(t): stu(1) = stu(t): gre(1) = gre(t)
   hhun(1) = hhun(t): hay(1) = hay(t): con(1) = con(t): shi(1) = shi(t)
   hun(1) = hun(t): m(1) = m(t): h(1) = h(t): i(1) = i(t): t = 1
   col = 15: GOSUB person
   FOR z = 2 TO 9
      p$(z) = "A POLICEMAN": bul(z) = (INT(3 * RND) + 1) * 5: gun(z) = 1
      r(z) = 0: mea(z) = INT(3 * RND): pz(z) = 0: hay(z) = 0
      hhun(z) = 0: fai(z) = 0: stu(z) = 0: swo(z) = 1 - SGN(INT(10 * RND))
      det(z) = 0: con(z) = 0: hor(z) = 1 - SGN(INT(20 * RND)): m(z) = INT(200 * RND) + 125
      shi(z) = INT(5 * RND): gre(z) = INT(4 * RND): hun(z) = 0
      h(z) = INT(15 * RND) + 1: i(z) = INT(15 * RND) + 1
      t = z
      col = 15: GOSUB person
   NEXT z
   t = 9: ho = 0: pp = 9
   GOTO mainprogram

blowshield:
   shi(ilof) = shi(ilof) - 1
   LOCATE 7, 1: PRINT "("; ilof; ") "; p$(ilof); " LOST A SHIELD"
   FOR z = 1 TO 20
      SOUND 50, .03: SOUND 280, .03
   NEXT z
   xx = 0: xxxx = 0: xxx = 0
   IF p$(ilof) = "A POLICEMAN" THEN
      phrase$ = STR$(r(ilof)): x = ilof * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      r(ilof) = t
      q(ilof) = 0
      phrase$ = STR$(r(ilof)): x = ilof * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
   END IF
RETURN

deadhorse:
   hor(ilof) = 0
   LOCATE 7, 1: PRINT "("; ilof; ") "; p$(ilof); "'S HORSE BLEW UP!"
   SOUND 2500, 2
   xx = 0: xxxx = 0: xxx = 0
   IF p$(ilof) = "A POLICEMAN" THEN
      phrase$ = STR$(r(ilof)): x = ilof * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      r(ilof) = t
      q(ilof) = 0
      phrase$ = STR$(r(ilof)): x = ilof * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
   END IF
   phrase$ = STR$(ilof): x = i(ilof) * 5 + 45.5: y = 96 - h(ilof) * 5: size = 4: col = 7: GOSUB letterprint
RETURN

policeman:
   IF INKEY$ = CHR$(27) THEN END
   olof = 0
   q(t) = q(t) + 1
   IF r(t) = 0 OR p$(r(t)) = "DEAD" OR q(t) >= 6 THEN
      phrase$ = STR$(r(t)): x = t * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      DO
         DO
            r(t) = INT(9 * RND) + 1
            IF tuer <> 0 AND p$(tuer) <> "DEAD" AND tuer <> t THEN r(t) = tuer
         LOOP WHILE r(t) > pp
         q(t) = 0
         bj = bj + 1
         IF bj = 100 THEN EXIT DO
      LOOP WHILE r(t) = t OR p$(r(t)) = "DEAD"
      IF bj = 20 THEN bj = 0
      IF bj = 0 THEN GOTO champion
      bj = 0
      phrase$ = STR$(r(t)): x = t * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
   END IF
   ilof = 3
   IF h(t) = h(r(t)) OR i(t) = i(r(t)) THEN ilof = 2
   IF ABS(h(t) - h(r(t))) + ABS(i(t) - i(r(t))) = 1 THEN ilof = 1
   IF h(t) = h(r(t)) AND i(t) = i(r(t)) THEN ilof = 0
   sp = a(h(t), i(t))
   IF swo(t) = 1 AND ilof = 0 THEN j$ = "W": RETURN
   IF con(t) > 0 AND ilof = 1 THEN
      IF a(h(r(t)), i(r(t))) <> 25 THEN j$ = "C": RETURN
   END IF
   IF gre(t) > 0 AND ilof = 1 THEN j$ = "G": RETURN
   IF gun(t) = 1 AND bul(t) > 0 AND ilof = 2 AND ABS(h(t) - h(r(t))) + ABS(i(t) - i(r(t))) < 11 THEN
      z = 0
      IF h(t) > h(r(t)) THEN
         FOR zz = r(t) TO h(r(t))
            IF a(zz, i(t)) = 25 THEN z = 1
         NEXT zz
      ELSEIF h(t) < h(r(t)) THEN
         FOR zz = h(t) TO h(r(t))
            IF a(zz, i(t)) = 25 THEN z = 1
         NEXT zz
      ELSEIF i(t) > i(r(t)) THEN
         FOR zz = i(r(t)) TO i(t)
            IF a(h(t), zz) = 25 THEN z = 1
         NEXT zz
      ELSEIF i(t) < i(r(t)) THEN
         FOR zz = i(t) TO i(r(t))
            IF a(h(t), zz) = 25 THEN z = 1
         NEXT zz
      END IF
      IF z = 0 THEN j$ = "F": RETURN
   END IF
   IF con(t) > 0 AND ilof = 2 AND gun(r(t)) = 1 AND bul(r(t)) > 0 AND (gun(t) = 0 OR bul(t) < 1) AND ilof = 2 THEN j$ = "C": RETURN
   IF sp < 6 OR sp = 14 OR sp = 15 OR sp = 17 OR sp = 19 OR sp > 21 AND sp <> 24 AND sp <> 25 THEN j$ = "P": RETURN
   IF sp = 8 AND hor(t) = 0 THEN j$ = "P": RETURN
   IF sp = 18 AND gun(t) = 0 THEN j$ = "P": RETURN
   IF sp = 11 THEN
      IF m(t) >= 200 AND hor(t) = 0 THEN j$ = "P": RETURN
      IF m(t) >= 100 AND gun(t) = 0 THEN j$ = "P": RETURN
      IF m(t) >= 80 AND con(t) < 3 THEN j$ = "P": RETURN
      IF m(t) >= 64 AND swo(t) = 0 THEN j$ = "P": RETURN
      IF m(t) >= 50 AND gun(t) = 1 AND bul(t) < 10 THEN j$ = "P": RETURN
      IF m(t) >= 50 AND shi(t) < 3 THEN j$ = "P": RETURN
      IF m(t) >= 50 AND gre(t) < 3 THEN j$ = "P": RETURN
      IF m(t) >= 20 AND mea(t) < 3 THEN j$ = "P": RETURN
      IF m(t) >= 12 AND hor(t) = 1 AND hay(t) < 3 THEN j$ = "P": RETURN
   END IF
   IF (a(h(t), i(t) + 1) = 25 OR i(t) = 15) THEN
      IF (a(h(t), i(t) - 1) = 25 OR i(t) = 1) THEN
         IF (a(h(t) + 1, i(t)) = 25 OR h(t) = 15) THEN
            IF (a(h(t) - 1, i(t)) = 25 OR h(t) = 1) THEN j$ = "P": RETURN
         END IF
      END IF
   END IF
   IF a(h(t) + 1, i(t)) = 22 THEN j$ = "X": RETURN
   IF a(h(t) - 1, i(t)) = 22 THEN j$ = "E": RETURN
   IF a(h(t), i(t) + 1) = 22 THEN j$ = "D": RETURN
   IF a(h(t), i(t) - 1) = 22 THEN j$ = "S": RETURN
   fr = INT(2 * RND) + 1
   IF fr = 1 AND h(r(t)) = h(t) THEN fr = 2
   IF fr = 2 AND i(r(t)) = i(t) THEN fr = 1
   IF fr = 1 THEN
      IF h(r(t)) > h(t) AND a(h(t) + 1, i(t)) <> 25 THEN j$ = "X": RETURN
      IF h(r(t)) > h(t) AND a(h(t) + 1, i(t)) = 25 AND gre(t) > 0 THEN j$ = "G": RETURN
      IF h(r(t)) < h(t) AND a(h(t) - 1, i(t)) <> 25 THEN j$ = "E": RETURN
      IF h(r(t)) < h(t) AND a(h(t) - 1, i(t)) = 25 AND gre(t) > 0 THEN j$ = "G": RETURN
   END IF
   IF fr = 2 THEN
      IF i(r(t)) > i(t) AND a(h(t), i(t) + 1) <> 25 THEN j$ = "D": RETURN
      IF i(r(t)) > i(t) AND a(h(t), i(t) + 1) = 25 AND gre(t) > 0 THEN j$ = "G": RETURN
      IF i(r(t)) < i(t) AND a(h(t), i(t) - 1) <> 25 THEN j$ = "S": RETURN
      IF i(r(t)) < i(t) AND a(h(t), i(t) - 1) = 25 AND gre(t) > 0 THEN j$ = "G": RETURN
   END IF
   IF j$ = "" THEN j$ = "P"
RETURN

urdead:
   SOUND 1000, 3
   p$(t) = "DEAD"
   IF pz(t) = 1 THEN
      pz(t) = 0
      py = py - 1
   END IF
   phrase$ = STR$(r(t)): x = t * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
   phrase$ = "X": x = t * 12 + 9: y = 9: size = 4: col = 3: GOSUB letterprint
   GOSUB newspace
RETURN

sbull:
   IF sby = 0 THEN iky = t: GOSUB shh: sby = 1: sdy = h(t): sdz = i(t): scy = 14
   scy = scy - 1
   IF scy < 0 THEN scy = 0
   col = 0
   LINE (sdz * 5 + 47, 97 - sdy * 5)-(sdz * 5 + 48, 98 - sdy * 5), col, B
   IF scy < 1 THEN sby = 0: RETURN
   si = INT(2 * RND) + 1
   IF si = 1 AND h(sj) = sdy THEN si = 2
   IF si = 2 AND i(sj) = sdz THEN si = 1
   IF si = 1 THEN
      IF h(sj) > sdy THEN sey = 2
      IF h(sj) < sdy THEN sey = 1
   END IF
   IF si = 2 THEN
      IF i(sj) > sdz THEN sey = 4
      IF i(sj) < sdz THEN sey = 3
   END IF
   FOR z = 1 TO 9
      IF z <> iky THEN
         IF h(z) = sdy AND i(z) = sdz + 1 AND p$(z) <> "DEAD" THEN sey = 4
         IF h(z) = sdy AND i(z) = sdz - 1 AND p$(z) <> "DEAD" THEN sey = 3
         IF h(z) = sdy + 1 AND i(z) = sdz AND p$(z) <> "DEAD" THEN sey = 2
         IF h(z) = sdy - 1 AND i(z) = sdz AND p$(z) <> "DEAD" THEN sey = 1
      END IF
   NEXT z
   IF sey = 1 THEN sdy = sdy - 1
   IF sey = 2 THEN sdy = sdy + 1
   IF sey = 3 THEN sdz = sdz - 1
   IF sey = 4 THEN sdz = sdz + 1
   sey = 0
   LOCATE 7, 1: PRINT "THE BULLET HAS"; scy; "MORE MOVES"
   IF a(sdy, sdz) = 25 THEN
      sdyy = h(t): sdzz = i(t): h(t) = sdy: i(t) = sdz
      GOSUB newspace
      h(t) = sdyy: i(t) = sdzz: sdyy = 0: sdzz = 0
      LOCATE 7, 1: PRINT "THE BULLET HIT A WALL!!!"
      LOCATE 8, 1: PRINT sj; " SURVIVED!!!"
      LINE (sdz * 5 + 45.25, 95.25 - sdy * 5)-(sdz * 5 + 49.75, 99.75 - sdy * 5), 0, B
      sby = 0: col = 0
      LINE (sdz * 5 + 47, 97 - sdy * 5)-(sdz * 5 + 48, 98 - sdy * 5), col, B
      GOSUB mus
      RETURN
   END IF
   FOR sfy = 1 TO 9
      IF sdy = h(sfy) AND sdz = i(sfy) AND p$(sfy) <> "DEAD" THEN
         col = 0
         LINE (sdz * 5 + 47, 97 - sdy * 5)-(sdz * 5 + 48, 98 - sdy * 5), col, B
         SOUND 1000, 3
         tt = t: t = sfy
         col = 0: GOSUB person
         t = tt: tt = 0
         phrase$ = STR$(r(sfy)): x = sfy * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
         phrase$ = "X": x = sfy * 12 + 9: y = 9: size = 4: col = 3: GOSUB letterprint
         LOCATE 7, 1: PRINT "THE BULLET KILLED ("; sfy; "); "; p$(sfy);
         p$(sfy) = "DEAD"
         IF pz(sfy) = 1 THEN pz(sfy) = 0: py = py - 1
         sby = 0
         IF sfy = t THEN RETURN
      END IF
   NEXT sfy
   IF sby <> 0 THEN col = 1: LINE (sdz * 5 + 47, 97 - sdy * 5)-(sdz * 5 + 48, 98 - sdy * 5), col, B
RETURN

shh:
   sjq = 0
   FOR z = 1 TO 9
      IF p$(z) <> "DEAD" THEN sjq = sjq + 1
   NEXT z
   IF sjq < 2 THEN GOTO champion
   DO
      sj = INT(9 * RND) + 1
   LOOP WHILE p$(sj) = "DEAD" OR sj = iky
RETURN

mus:
   SOUND 364, 1: SOUND 364, 1: SOUND 364, 1: SOUND 445, 1: SOUND 526, 1
   SOUND 445, 1: SOUND 526, 1: SOUND 445, 1: SOUND 364, 1
RETURN

conc:
   con(t) = con(t) - 1
   LOCATE 6, 1: PRINT "WALL WHICH DIRECTION?"
   cek$ = ""
   LOCATE 7, 1
   IF p$(t) <> "A POLICEMAN" THEN
      IF h(t) <> 1 THEN PRINT "E ";
      IF h(t) <> 15 THEN PRINT "X ";
      IF i(t) <> 1 THEN PRINT "S ";
      IF i(t) <> 15 THEN PRINT "D ";
      DO
         cek$ = UCASE$(INPUT$(1))
      LOOP UNTIL cek$ = "E" OR cek$ = "X" OR cek$ = "S" OR cek$ = "D"
   END IF
   IF p$(t) = "A POLICEMAN" THEN
      IF h(r(t)) > h(t) THEN cek$ = "X"
      IF h(r(t)) < h(t) THEN cek$ = "E"
      IF i(r(t)) > i(t) THEN cek$ = "D"
      IF i(r(t)) < i(t) THEN cek$ = "S"
      IF h(r(t)) = h(t) AND i(r(t)) = i(t) THEN cek$ = "E"
   END IF
   IF cek$ = "E" THEN a(h(t) - 1, i(t)) = 25
   IF cek$ = "X" THEN a(h(t) + 1, i(t)) = 25
   IF cek$ = "S" THEN a(h(t), i(t) - 1) = 25
   IF cek$ = "D" THEN a(h(t), i(t) + 1) = 25
   yyy = h(t)
   zzz = i(t)
   IF cek$ = "E" THEN yyy = yyy - 1
   IF cek$ = "X" THEN yyy = yyy + 1
   IF cek$ = "S" THEN zzz = zzz - 1
   IF cek$ = "D" THEN zzz = zzz + 1
   FOR z = 1 TO pp
      IF h(z) = yyy AND i(z) = zzz THEN stu(z) = 1
   NEXT z
   LINE (zzz * 5 + 45.25, 95.25 - yyy * 5)-(zzz * 5 + 49.75, 99.75 - yyy * 5), 3, B
   PSET (zzz * 5 + 47.5, 97.5 - yyy * 5), col
   col = 0
   GOSUB deadm
RETURN

ko:
   gonethrough = 0
   IF py = 0 THEN RETURN
   DO
      IF gonethrough = 1 THEN fty = 0
      ft = 0
      FOR z = 1 TO 9
         IF ft <> 0 THEN fty = 1
         IF voca = 1 AND pz(z) = 1 THEN ft = z
         IF ABS(h(z) - h(t)) < 4 AND ABS(i(z) - i(t)) < 4 AND pz(z) = 1 THEN ft = z
      NEXT z
      IF ft = 0 THEN EXIT DO
      LOCATE 7, 1: PRINT "("; ft; ") "; p$(ft); " WOKE UP"
      FOR z = 2000 TO 5000 STEP 161
         SOUND z, .03
      NEXT z
      pz(ft) = 0
      py = py - 1
      IF fty = 1 THEN fty = 0
      gonethrough = 1
   LOOP WHILE fty = 1
   voca = 0
RETURN

sw:
   IF p$(t) = "A POLICEMAN" AND p$(r(t)) = "A POLICEMAN" THEN
      phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
      r(r(t)) = t
      q(r(t)) = 0
      phrase$ = STR$(r(r(t))): x = r(t) * 12 + 6: y = 9: size = 4: col = 3: GOSUB letterprint
   END IF
   piru = 0
   FOR z = 1 TO 9
      IF p$(z) <> "DEAD" AND z <> t THEN IF h(z) = h(t) AND i(z) = i(t) THEN piru = z
   NEXT z
   IF piru = 0 THEN
      LOCATE 7, 1: PRINT "THERE'S NO ONE ON YOUR SPACE"
      RETURN
   END IF
   FOR z = 1 TO 20
      eq = INT(2000 * RND) + 2000
      SOUND eq, .03
   NEXT z
   pirv = INT(4 * RND) + 1
   IF pirv = 3 AND pz(piru) <> 1 THEN
      LOCATE 7, 1: PRINT "("; piru; ") "; p$(piru); " IS KNOCKED OUT"
      FOR z = 5000 TO 2000 STEP -162
         SOUND z, .03
      NEXT z
      pz(piru) = 1
      py = py + 1
      RETURN
   END IF
   IF pirv = 1 AND hor(piru) <> 1 THEN
      LOCATE 7, 1: PRINT "("; piru; ") "; p$(piru); "'S HORSE DIED"
      SOUND 2500, 2
      hor(piru) = 0
      RETURN
   END IF
   IF pirv = 2 AND shi(piru) >= 2 THEN
      LOCATE 7, 1: PRINT "("; piru; ") "; p$(piru); " LOST 2 SHIELDS"
      FOR z = 1 TO 40
         SOUND 50, .03
         SOUND 280, .03
      NEXT z
      shi(piru) = shi(piru) - 2
      RETURN
   END IF
   tt = t: t = piru
   col = 0: GOSUB person
   t = tt: tt = 0: col = 3
   PSET ((i(t) * 5) + 47.5, 97.5 - (h(t) * 5)), col
   GOSUB deadm
   a(h(t), i(t)) = 22
   SOUND 1000, 3
   LOCATE 7, 1: PRINT "("; piru; ") "; p$(piru); " DIED"
   p$(piru) = "DEAD"
   fai(piru) = 1000
   IF pz(piru) = 1 THEN pz(piru) = 0: py = py - 1
   phrase$ = STR$(r(piru)): x = piru * 12 + 6: y = 9: size = 4: col = 0: GOSUB letterprint
   phrase$ = "X": x = piru * 12 + 9: y = 9: size = 4: col = 3: GOSUB letterprint
RETURN

person:
   IF col = 15 THEN col = hor(t) * 8 + 7
   phrase$ = STR$(t): x = i(t) * 5 + 45.5: y = 96 - h(t) * 5: size = 4: GOSUB letterprint
   IF col = 0 THEN
      FOR z = 1 TO 9
         IF p$(z) <> "DEAD" AND h(z) = h(t) AND i(z) = i(t) AND z <> t THEN phrase$ = STR$(z): x = i(z) * 5 + 45.5: y = 96 - h(z) * 5: size = 4: col = hor(t) * 8 + 7: GOSUB letterprint
      NEXT z
   END IF
RETURN

shot:
   LINE (jj * 5 + 46.5, 97.5 - ii * 5)-(jj * 5 + 48.5, 97.5 - ii * 5), col
   LINE (jj * 5 + 47.5, 96.5 - ii * 5)-(jj * 5 + 47.5, 98.5 - ii * 5), col
   LINE (jj * 5 + 46.5, 96.5 - ii * 5)-(jj * 5 + 48.5, 98.5 - ii * 5), col
   LINE (jj * 5 + 46.5, 98.5 - ii * 5)-(jj * 5 + 48.5, 96.5 - ii * 5), col
RETURN

letterprint:
   size = size / 5
   FOR zx = 1 TO LEN(phrase$)
      lt = ASC(MID$(phrase$, zx, 1))
      FOR zz = 1 TO LEN(lett$(lt)) STEP 4
          z1 = ASC(MID$(lett$(lt), zz, 1)) - 48
          z2 = ASC(MID$(lett$(lt), zz + 1, 1)) - 48
          z3 = ASC(MID$(lett$(lt), zz + 2, 1)) - 48
          z4 = ASC(MID$(lett$(lt), zz + 3, 1)) - 48
          IF z1 < 5 THEN z2 = 4 - z2: z4 = 4 - z4
          IF z1 > 4 THEN z4 = 4 - z4
          IF z1 < 5 THEN LINE (z1 * size + x - 3.25, z2 * size + y)-(z3 * size + x - 3.25, z4 * size + y), col
          IF z1 > 4 AND z2 = 1 THEN CIRCLE (z3 * size + x - 3.25, z4 * size + y), size * (z1 - 4), col, pi / 2, 3 * pi / 2
          IF z1 > 4 AND z2 = 2 THEN CIRCLE (z3 * size + x - 3.25, z4 * size + y), size * (z1 - 4), col, 3 * pi / 2, pi / 2
          IF z1 > 4 AND z2 = 3 THEN CIRCLE (z3 * size + x - 3.25, z4 * size + y), size * (z1 - 4), col, 0, pi
          IF z1 > 4 AND z2 = 4 THEN CIRCLE (z3 * size + x - 3.25, z4 * size + y), size * (z1 - 4), col, pi, 0
      NEXT zz
      x = x + size * 5
   NEXT zx
RETURN

