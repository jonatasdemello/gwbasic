DECLARE SUB programenter ()
DECLARE SUB loadpage (filename$)
DECLARE SUB savepage (filename$)
DECLARE SUB forward (distance)
DECLARE SUB commandread (word$)
DECLARE SUB commandenter (cmnd$)
DECLARE SUB selectfile ()
COMMON SHARED x, y, angle, col, mode, comm, prognum, allprognum
COMMON SHARED program, cmnd$, commhi
DIM SHARED commands$(0 TO 99), allprogram$(2000)
DIM SHARED progname$(100), progplace(100), filelist$(100)
DIM SHARED picture1(25000) AS INTEGER
DIM SHARED picture2(25000) AS INTEGER
DIM SHARED picture3(25000) AS INTEGER

x = 320: y = 240: angle = 270: col = 15: mode = 0: comm = 0: commhi = 0
prognum = 0: program = 0: cmnd$ = ""
SCREEN 0: CLS
CALL selectfile
SCREEN 12
VIEW (0, 0)-(639, 414), , 15
WINDOW SCREEN (0, 0)-(639, 414)
VIEW PRINT 27 TO 30
DO
   CALL commandenter(cmnd$)
LOOP

SUB commandenter (cmnd$)
   IF comm = commhi AND comm > 98 THEN commands$((commhi + 2) MOD 100) = ""
   CLS 2
   FOR z = 27 TO 30
      LOCATE z, 1
      PRINT commands$((comm + z + 72) MOD 100);
   NEXT z
   IF mode < 2 THEN PSET (x, y), 15 - POINT(x, y)
   cmnd$ = commands$((comm + z + 70) MOD 100)
   LOCATE 29, LEN(cmnd$) + 1: PRINT " ";
   DO
      DO
         z$ = INKEY$
         junk = junk + 1
         IF junk = 1 THEN LOCATE 29, LEN(cmnd$) + 1: PRINT "_";
         IF junk = 500 THEN LOCATE 29, LEN(cmnd$) + 1: PRINT " ";
         IF junk = 1000 THEN junk = 0
      LOOP WHILE z$ = ""
      IF LEN(z$) = 1 AND ASC(z$) > 31 THEN
         cmnd$ = cmnd$ + z$
         LOCATE 29, LEN(cmnd$)
         PRINT RIGHT$(cmnd$, 1);
      END IF
      IF ASC(z$) = 8 AND cmnd$ <> "" THEN
         cmnd$ = LEFT$(cmnd$, LEN(cmnd$) - 1)
         LOCATE 29, LEN(cmnd$) + 1
         PRINT "  ";
      END IF
      IF LEN(z$) = 2 AND (ASC(RIGHT$(z$, 1)) = 72 OR ASC(RIGHT$(z$, 1)) = 80 OR ASC(RIGHT$(z$, 1)) = 33) THEN
         LOCATE 29, LEN(cmnd$) + 1: PRINT " ";
         IF ASC(RIGHT$(z$, 1)) = 33 THEN CALL programenter
         IF ASC(RIGHT$(z$, 1)) = 72 AND comm > 0 THEN comm = comm - 1
         IF ASC(RIGHT$(z$, 1)) = 80 THEN comm = comm + 1
         IF comm > commhi THEN commhi = comm
         IF comm = commhi AND comm > 98 THEN commands$((commhi + 2) MOD 100) = ""
         CLS 2
         FOR z = 27 TO 30
            LOCATE z, 1
            PRINT commands$((comm + z + 72) MOD 100);
         NEXT z
         cmnd$ = commands$((comm + z + 70) MOD 100)
      END IF
   LOOP WHILE z$ <> CHR$(13) AND z$ <> CHR$(27)
   IF z$ = CHR$(27) AND cmnd$ = "" THEN cmnd$ = "escape"
   LOCATE 29, LEN(cmnd$) + 1: PRINT " ";
   comm = comm + 1
   IF comm > commhi THEN commhi = comm
   commands$(comm MOD 100) = cmnd$
   IF mode < 2 THEN PSET (x, y), 15 - POINT(x, y)
   IF cmnd$ <> "escape" THEN CALL commandread(cmnd$)
   IF cmnd$ = "escape" THEN
      x = 320: y = 240: angle = 270: col = 15: mode = 0: comm = 0: commhi = 0
      prognum = 0: program = 0: cmnd$ = ""
      FOR z = 1 TO allprognum
         allprogram$(z) = ""
      NEXT z
      FOR z = 0 TO 99
         commands$(z) = ""
      NEXT z
      SCREEN 0
      CALL selectfile
      SCREEN 12
      VIEW (0, 0)-(639, 414), , 15
      WINDOW SCREEN (0, 0)-(639, 414)
      VIEW PRINT 27 TO 30
   END IF
END SUB

SUB commandread (z$)
   IF program = 1 THEN
      allprognum = allprognum + 1
      allprogram$(allprognum) = z$
   END IF
  
   z$ = LTRIM$(RTRIM$(LCASE$(z$)))
   wordlen = -1
   FOR zz = 1 TO LEN(z$)
      IF ASC(MID$(z$, zz, 1)) < 97 AND wordlen = -1 THEN wordlen = zz - 1
   NEXT zz
   IF wordlen = -1 THEN wordlen = LEN(z$)
   typein$ = LEFT$(z$, wordlen)
  
   IF typein$ = "newpage" OR typein$ = "new" THEN
      CALL commandread("cls")
      prognum = 0
      program = 0
      FOR z = 1 TO allprognum
         allprogram$(z) = ""
      NEXT z
      allprognum = 0
   END IF
   IF typein$ = "load" THEN CALL loadpage(LTRIM$(RIGHT$(z$, LEN(z$) - 4)))
   IF typein$ = "save" THEN CALL savepage(LTRIM$(RIGHT$(z$, LEN(z$) - 4)))
   FOR zz = 1 TO prognum
      IF progname$(zz) = typein$ THEN
         zzz = progplace(zz) + 1
         DO
            CALL commandread(allprogram$(zzz))
            zzz = zzz + 1
         LOOP WHILE LEFT$(LTRIM$(LCASE$(allprogram$(zzz))), 3) <> "end"
      END IF
   NEXT zz
   IF typein$ = "setpos" THEN
      zz = 8
      DO
         zz = zz + 1
      LOOP WHILE MID$(z$, zz, 1) <> ","
      x = VAL(MID$(z$, 7, zz - 7))
      y = VAL(RIGHT$(z$, LEN(z$) - zz))
   END IF
   IF typein$ = "tone" THEN
      zz = 6
      DO
         zz = zz + 1
      LOOP WHILE MID$(z$, zz, 1) <> ","
      freq = VAL(MID$(z$, 5, zz - 5))
      leng = VAL(RIGHT$(z$, LEN(z$) - zz))
      SOUND freq, leng
   END IF
   IF typein$ = "pd" AND (mode = 1 OR mode = 3) THEN mode = mode - 1
   IF typein$ = "pu" AND (mode = 0 OR mode = 2) THEN mode = mode + 1
   IF typein$ = "ht" AND mode < 2 THEN mode = mode + 2
   IF typein$ = "st" AND mode > 1 THEN mode = mode - 2
   IF typein$ = "setc" THEN col = VAL(RIGHT$(z$, LEN(z$) - 5))
   IF typein$ = "seth" THEN angle = VAL(RIGHT$(z$, LEN(z$) - 5)) + 270
   IF typein$ = "home" THEN x = 320: y = 240: angle = 270
   IF typein$ = "cc" THEN
      CLS 2
      comm = 0
      commhi = 0
      FOR z = 0 TO 99
         commands$(z) = ""
      NEXT z
   END IF
   IF typein$ = "cg" THEN CLS
   IF typein$ = "rg" THEN CLS : x = 320: y = 240: angle = 270: col = 15: mode = 0
   IF typein$ = "cls" THEN
      CLS
      CLS 2
      x = 320
      y = 240
      angle = 270
      col = 15
      mode = 0
      comm = 0
      commhi = 0
      FOR z = 0 TO 99
         commands$(z) = ""
      NEXT z
   END IF
   IF typein$ = "fd" THEN
         CALL forward(VAL(RIGHT$(z$, LEN(z$) - 3)))
   END IF
   IF typein$ = "bk" THEN
      angle = angle - 180
      CALL forward(VAL(RIGHT$(z$, LEN(z$) - 3)))
      angle = angle + 180
   END IF
   IF typein$ = "rt" THEN angle = angle + VAL(RIGHT$(z$, LEN(z$) - 3))
   IF typein$ = "lt" THEN angle = angle - VAL(RIGHT$(z$, LEN(z$) - 3))
   IF typein$ = "repeat" THEN
      bracket = 0
      DO
         bracket = bracket + 1
      LOOP WHILE MID$(z$, bracket, 1) <> "["
      times = VAL(MID$(z$, 7, bracket - 7))
      FOR counter = 1 TO times
         word$ = ""
         place = bracket
         brack = 1
         DO
            place = place + 1
            ascval = ASC(MID$(z$, place, 1))
            oldletter = letter
            IF ascval < 97 OR ascval > 122 THEN letter = 0
            IF ascval > 96 AND ascval < 123 THEN letter = 1
            IF ((oldletter = 0 AND letter = 1) OR ascval = 93) AND brack < 2 AND LEN(word$) > 0 THEN
               CALL commandread(word$)
               word$ = ""
            END IF
            IF ascval = 91 THEN brack = brack + 1
            IF ascval = 93 THEN brack = brack - 1
            word$ = word$ + MID$(z$, place, 1)
         LOOP WHILE place < LEN(z$)
      NEXT counter
   END IF
END SUB

SUB forward (distance)
   CONST PI = 3.141592653589#
   IF mode = 0 OR mode = 2 THEN PSET (x, y), col
      oldx = x: oldy = y
      x = x + distance * COS(angle / 180 * PI)
      y = y + distance * SIN(angle / 180 * PI)
      WHILE x < 0 OR y < 0 OR x >= 640 OR y >= 414
         IF x < 0 THEN
            IF (oldy - y) * -x / (oldx - x) + y >= 0 AND (oldy - y) * -x / (oldx - x) + y < 414 THEN
               newpointy = (oldy - y) * -x / (oldx - x) + y
               IF mode = 0 OR mode = 2 THEN LINE -(0, newpointy), col
               x = x + 640
               IF mode = 0 OR mode = 2 THEN PSET (640, newpointy), col
               oldx = 640: oldy = newpointy
            END IF
         END IF
         IF y < 0 THEN
            IF (oldx - x) * -y / (oldy - y) + x >= 0 AND (oldx - x) * -y / (oldy - y) + x < 640 THEN
               newpointx = (oldx - x) * -y / (oldy - y) + x
               IF mode = 0 OR mode = 2 THEN LINE -(newpointx, 0), col
               y = y + 414
               IF mode = 0 OR mode = 2 THEN PSET (newpointx, 414), col
               oldx = newpointx: oldy = 414
            END IF
         END IF
         IF x >= 640 THEN
            IF (oldy - y) * (639 - x) / (oldx - x) + y >= 0 AND (oldy - y) * (639 - x) / (oldx - x) + y < 414 THEN
               newpointy = (oldy - y) * (639 - x) / (oldx - x) + y
               IF mode = 0 OR mode = 2 THEN LINE -(639, newpointy), col
               x = x - 640
               IF mode = 0 OR mode = 2 THEN PSET (0, newpointy), col
               oldx = 0: oldy = newpointy
            END IF
         END IF
         IF y >= 414 THEN
            IF (oldx - x) * (414 - y) / (oldy - y) + x >= 0 AND (oldx - x) * (414 - y) / (oldy - y) + x < 640 THEN
               newpointx = (oldx - x) * (414 - y) / (oldy - y) + x
               IF mode = 0 OR mode = 2 THEN LINE -(newpointx, 414), col
               y = y - 414
               IF mode = 0 OR mode = 2 THEN PSET (newpointx, 0), col
               oldx = newpointx: oldy = 0
            END IF
         END IF
      WEND
      IF mode = 0 OR mode = 2 THEN LINE -(x, y), col
END SUB

SUB loadpage (filename$)
   FOR z = 1 TO allprognum
      allprogram$(z) = ""
   NEXT z
   prognum = 0
   allprognum = 0
   OPEN filename$ + ".lgo" FOR INPUT AS #1
      DO
         allprognum = allprognum + 1
         LINE INPUT #1, z$
         allprogram$(allprognum) = z$
         IF LCASE$(LEFT$(z$, 2)) = "to" THEN
            prognum = prognum + 1
            progname$(prognum) = LTRIM$(RIGHT$(z$, LEN(z$) - 3))
            progplace(prognum) = allprognum
         END IF
      LOOP WHILE EOF(1) = 0
   CLOSE #1
END SUB

SUB programenter
   GET (0, 0)-(200, 414), picture1
   GET (201, 0)-(440, 414), picture2
   GET (441, 0)-(639, 414), picture3
   SCREEN 0
   LOCATE 1, 1: PRINT "ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ";
   FOR z = 1 TO 23
      LOCATE z + 1, 1
      PRINT "Û " + allprogram$(z) + SPACE$(77 - LEN(allprogram$(z))) + "Û";
   NEXT z
   LOCATE 25, 1: PRINT "ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß";
   c = 1: d = 1: dd = 1
   DO
      DO
         z$ = INKEY$
         junk = junk + 1
         IF junk = 1 THEN LOCATE dd + d, c + 2: PRINT "_";
         IF junk = 500 AND c <= LEN(allprogram$(d)) THEN LOCATE dd + d, c + 2: PRINT MID$(allprogram$(d), c, 1);
         IF junk = 500 AND c > LEN(allprogram$(d)) THEN LOCATE dd + d, c + 2: PRINT " ";
         IF junk = 1000 THEN junk = 0
      LOOP WHILE z$ = ""
      LOCATE dd + d, c + 2: PRINT " ";
      LOCATE dd + d, c + 2: PRINT MID$(allprogram$(d), c, 1);
      IF LEN(z$) = 1 AND ASC(z$) > 31 THEN
         allprogram$(d) = LEFT$(allprogram$(d), c - 1) + z$ + RIGHT$(allprogram$(d), LEN(allprogram$(d)) - c + 1)
         LOCATE dd + d, 3
         PRINT allprogram$(d) + SPACE$(77 - LEN(allprogram$(d)));
         c = c + 1
      END IF
      IF ASC(z$) = 13 AND d >= allprognum THEN
         d = d + 1
         c = 1
         allprognum = d
         IF dd + d > 24 THEN
            dd = dd - 1
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
      END IF
      IF ASC(z$) = 13 AND d < allprognum THEN
         allprognum = allprognum + 1
         FOR z = allprognum TO d + 2 STEP -1
            allprogram$(z) = allprogram$(z - 1)
         NEXT z
         allprogram$(d + 1) = RIGHT$(allprogram$(d), LEN(allprogram$(d)) - c + 1)
         allprogram$(d) = LEFT$(allprogram$(d), c - 1)
         d = d + 1: c = 1
         FOR z = 1 TO 23
            LOCATE z + 1, 1
            PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
         NEXT z
      END IF
      IF ASC(z$) = 8 AND c > 1 THEN
         allprogram$(d) = LEFT$(allprogram$(d), c - 2) + RIGHT$(allprogram$(d), LEN(allprogram$(d)) - c + 1)
         LOCATE dd + d, 3
         PRINT allprogram$(d) + SPACE$(77 - LEN(allprogram$(d)));
         c = c - 1
         z$ = " "
      END IF
      IF ASC(z$) = 8 AND c = 1 AND d > 1 THEN
         d = d - 1
         c = LEN(allprogram$(d)) + 1
         allprogram$(d) = allprogram$(d) + allprogram$(d + 1)
         FOR z = d + 1 TO allprognum - 1
            allprogram$(z) = allprogram$(z + 1)
         NEXT z
         allprogram$(allprognum) = ""
         allprognum = allprognum - 1
         FOR z = 1 TO 23
            LOCATE z + 1, 1
            PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
         NEXT z
      END IF
      IF LEN(z$) = 2 THEN
         IF ASC(RIGHT$(z$, 1)) = 83 AND c <= LEN(allprogram$(d)) THEN
            allprogram$(d) = LEFT$(allprogram$(d), c - 1) + RIGHT$(allprogram$(d), LEN(allprogram$(d)) - c)
            LOCATE dd + d, 3
            PRINT allprogram$(d) + SPACE$(77 - LEN(allprogram$(d)));
            z$ = " "
         END IF
         IF ASC(RIGHT$(z$, 1)) = 83 AND c > LEN(allprogram$(d)) AND d < allprognum THEN
            allprogram$(d) = allprogram$(d) + SPACE$(c - LEN(allprogram$(d)) - 1) + allprogram$(d + 1)
            FOR z = d + 1 TO allprognum - 1
               allprogram$(z) = allprogram$(z + 1)
            NEXT z
            allprogram$(allprognum) = ""
            allprognum = allprognum - 1
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
         IF ASC(RIGHT$(z$, 1)) = 71 THEN c = 1
         IF ASC(RIGHT$(z$, 1)) = 79 THEN c = LEN(allprogram$(d)) + 1
         IF ASC(RIGHT$(z$, 1)) = 72 AND d > 1 THEN
            d = d - 1
            IF dd + d < 2 THEN
               dd = dd + 1
               FOR z = 1 TO 23
                  LOCATE z + 1, 1
                  PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
               NEXT z
            END IF
         END IF
         IF ASC(RIGHT$(z$, 1)) = 75 AND c > 1 THEN c = c - 1
         IF ASC(RIGHT$(z$, 1)) = 77 AND c < 78 THEN c = c + 1
         IF ASC(RIGHT$(z$, 1)) = 80 AND d < allprognum THEN
            d = d + 1
            IF dd + d > 24 THEN
               dd = dd - 1
               FOR z = 1 TO 23
                  LOCATE z + 1, 1
                  PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
               NEXT z
            END IF
         END IF
         IF ASC(RIGHT$(z$, 1)) = 73 AND dd < 1 THEN
            dd = dd + 23: IF dd > 1 THEN dd = 1
            d = d - 23: IF d < 1 THEN d = 1
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
         IF ASC(RIGHT$(z$, 1)) = 81 AND dd > 24 - allprognum THEN
            dd = dd - 23: IF dd < 24 - allprognum THEN dd = 24 - allprognum
            d = d + 23: IF d > allprognum THEN d = allprognum
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
         IF ASC(RIGHT$(z$, 1)) = 119 THEN
            dd = 1
            d = 1
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
         IF ASC(RIGHT$(z$, 1)) = 117 THEN
            IF dd > 24 - allprognum THEN dd = 24 - allprognum
            d = allprognum
            FOR z = 1 TO 23
               LOCATE z + 1, 1
               PRINT "Û " + allprogram$(z + 1 - dd) + SPACE$(77 - LEN(allprogram$(z + 1 - dd))) + "Û";
            NEXT z
         END IF
      END IF
   LOOP WHILE LEN(z$) <> 2 OR ASC(RIGHT$(z$, 1)) <> 33
   prognum = 0
   FOR z = 1 TO allprognum
      IF LEFT$(LCASE$(LTRIM$(allprogram$(z))), 2) = "to" THEN
         prognum = prognum + 1
         progname$(prognum) = LCASE$(RTRIM$(LTRIM$(RIGHT$(allprogram$(z), LEN(allprogram$(z)) - 2))))
         progplace(prognum) = z
      END IF
   NEXT z
   SCREEN 12
   VIEW (0, 0)-(639, 414), , 15
   WINDOW SCREEN (0, 0)-(639, 414)
   VIEW PRINT 27 TO 30
   PUT (0, 0), picture1
   PUT (201, 0), picture2
   PUT (441, 0), picture3
END SUB

SUB savepage (filename$)
   OPEN filename$ + ".lgo" FOR OUTPUT AS #1
      FOR z = 1 TO allprognum
         PRINT #1, allprogram$(z)
      NEXT z
   CLOSE #1
END SUB

SUB selectfile
   SHELL "dir *.lgo > logo.dir"
   numfiles = 0
   OPEN "logo.dir" FOR INPUT AS #1
      DO
         INPUT #1, z$
         IF MID$(z$, 10, 3) = "LGO" THEN numfiles = numfiles + 1: filelist$(numfiles) = LCASE$(LEFT$(z$, 8))
      LOOP WHILE EOF(1) = 0
   CLOSE #1
   LOCATE 1, 1: COLOR 0, 7: PRINT "newpage": COLOR 7, 0
   FOR z = 1 TO numfiles
      LOCATE ((z + 1) MOD 25) + 1, INT((z + 1) / 25) * 15 + 1
      PRINT filelist$(z);
   NEXT
   place = 1
   DO
      DO
         z$ = INKEY$
      LOOP WHILE z$ = ""
      IF z$ = CHR$(27) THEN END
      COLOR 7, 0
      LOCATE ((place - 1) MOD 25) + 1, INT((place + 1) / 25) * 15 + 1
      IF place = 1 THEN PRINT "newpage"
      IF place > 2 THEN PRINT filelist$(place - 2)
      IF ASC(RIGHT$(z$, 1)) = 72 AND place > 1 THEN place = place - 1: IF place = 2 THEN place = 1
      IF ASC(RIGHT$(z$, 1)) = 75 AND place > 23 THEN place = place - 23: IF place = 2 THEN place = 1
      IF ASC(RIGHT$(z$, 1)) = 77 AND place < numfiles - 23 THEN place = place + 23
      IF ASC(RIGHT$(z$, 1)) = 80 AND place < numfiles + 2 THEN place = place + 1: IF place = 2 THEN place = 3
      COLOR 0, 7
      LOCATE ((place - 1) MOD 25) + 1, INT((place + 1) / 25) * 15 + 1
      IF place = 1 THEN PRINT "newpage"
      IF place > 2 THEN PRINT filelist$(place - 2)
   LOOP WHILE z$ <> CHR$(13)
   IF place > 2 THEN CALL loadpage(filelist$(place - 2))
END SUB

