DECLARE SUB splboard (a%())
DECLARE FUNCTION simplify% (a%())
DECLARE SUB showboard (a%())
DECLARE SUB printsmall (bx%, y%, c%, nam$)
DEFINT A-Z: SCREEN 12: DIM SHARED pow2long&(32 - 1)
FOR z = 0 TO 30: pow2long&(z) = 2 ^ z: NEXT: pow2long&(31) = &H80000000

   'Inspired from: The Providence Journal, Monday, July 18, 2005, Section E
   '07/18/2005  11:53:52  (boot time according to event viewer system log)
   '07/18/2005  02:59 PM  4,910 SUDOKU.BAS (fully working,optimized,cleaned)

DIM SHARED a(81 - 1)
p = 0
FOR y = 0 TO 9 - 1
   READ st$
   FOR x = 0 TO 9 - 1
      z$ = MID$(st$, x + 1, 1)
      IF z$ = "." THEN a(p) = 511 ELSE a(p) = 2 ^ (VAL(z$) - 1)
      p = p + 1
   NEXT
NEXT

   'Harder/slower puzzle (posted by Tom at http://www.sudoku.com/ forums)
   'His C solver could solve it in 36ms; later 7ms.
'DATA "....1.78."
'DATA "5....9..."
'DATA ".......4."
'DATA ".26......"
'DATA "...6....3"
'DATA ".74.8...."
'DATA ".....3..2"
'DATA ".8..4..1."
'DATA "6..5....."

   '07/21/2005, Difficulty: 1/5 stars
DATA ".....2.6."
DATA "95.17...3"
DATA "4.3.5.8.1"
DATA "2473..1.."
DATA "..9...5.."
DATA "..1..7634"
DATA "6.4.9.7.8"
DATA "8...46.12"
DATA ".7.5....."

   '07/20/2005, Difficulty: 5/5 stars
DATA "...1.8.26"
DATA "1....9..."
DATA "8..7...9."
DATA "3.2....1."
DATA ".6.291.7."
DATA ".7....2.5"
DATA ".4...6..1"
DATA "...5....7"
DATA "51.3.7..."

   '07/19/2005, Difficulty: 4/5 stars
DATA "5.7..6..."
DATA ".4.7.1..."
DATA "...2.87.5"
DATA "3.5....1."
DATA "7...2...9"
DATA ".1....5.7"
DATA "8.65.2..."
DATA "...3.7.6."
DATA "...8..9.1"

   '07/18/2005, Difficulty: 3/5 stars
DATA "9.....426"
DATA ".6.9.4..."
DATA "37......."
DATA "..98.2.3."
DATA "6.......1"
DATA ".3.5.18.."
DATA ".......53"
DATA "...7.5.6."
DATA "895.....4"

CALL showboard(a()): DO: LOOP WHILE INKEY$ = ""
IF simplify(a()) = 0 THEN PRINT "invalid board"
CALL showboard(a()): DO: LOOP WHILE INKEY$ = ""
CALL splboard(a())

DEFDBL A-Z
SUB printsmall (bx%, y%, c%, nam$)
   l% = LEN(nam$): IF l% = 0 THEN EXIT SUB
   x% = bx% - l% - l%: LINE (x% - 1, y% - 3)-STEP(l% * 4, 6), 0, BF
   FOR z% = 1 TO l%  'mask: **** **98 7654 3210 *.-* +*** *FED CBA*
      m& = pow2long&(ASC(MID$(nam$, z%, 1)) AND 31)
      IF (m& AND &H3ED007E) THEN LINE (x%, y% - 2)-STEP(2, 0), c%
      IF (m& AND &H37C2866) THEN
         LINE (x%, y%)-STEP(2, 0), c%
         IF (m& AND &H800) THEN LINE (x% + 1, y% - 1)-STEP(0, 2), c%
      END IF
      IF (m& AND &H36D003C) THEN LINE (x%, y% + 2)-STEP(2, 0), c%
      IF (m& AND &H371007E) THEN LINE (x%, y% - 2)-STEP(0, 2), c%
      IF (m& AND &H145007E) THEN PSET (x%, y% + 1), c%
      IF (m& AND &H39F0016) THEN LINE (x% + 2, y% - 2)-STEP(0, 1), c%
      IF (m& AND &H3FB0016) THEN LINE (x% + 2, y%)-STEP(0, 2), c%
      IF (m& AND &H4000) THEN PSET (x% + 1, y% + 2), c%
      x% = x% + 4
   NEXT z%
END SUB

DEFINT A-Z
SUB showboard (a())
  
   FOR z = 1 TO 8
      LINE (0, z * 32)-(32 * 9, z * 32), 8
      LINE (z * 32, 0)-(z * 32, 32 * 9), 8
   NEXT
   FOR z = 3 TO 6 STEP 3
      LINE (0, z * 32)-(32 * 9, z * 32), 7
      LINE (z * 32, 0)-(z * 32, 32 * 9), 7
   NEXT

   FOR y = 0 TO 9 - 1
      FOR x = 0 TO 9 - 1
         v = a(y * 9 + x)
         FOR yy = 0 TO 3 - 1
            FOR xx = 0 TO 3 - 1
               IF v AND 2 ^ (yy * 3 + xx) THEN c = 15 ELSE c = 8
               CALL printsmall(x * 32 + xx * 8 + 8, y * 32 + (2 - yy) * 8 + 8, c, LTRIM$(STR$(yy * 3 + xx + 1)))
            NEXT
         NEXT
      NEXT
   NEXT

   COLOR 7
   p = 0
   FOR y = 0 TO 9 - 1
      FOR x = 0 TO 9 - 1
         LOCATE y + 13, x * 2 + 40
         IF ((a(p) - 1) AND a(p)) <> 0 THEN
            PRINT "ú";
         ELSE
            PRINT CHR$(CINT(LOG(a(y * 9 + x)) / LOG(2)) + 49);
         END IF
         p = p + 1
      NEXT
   NEXT
   FOR x = 308 TO 452 STEP (452 - 308) / 3
      LINE (x, 191)-(x, 336), 8
   NEXT
   FOR y = 191 TO 336 STEP (336 - 191) / 3
      LINE (307, y)-(452, y), 8
   NEXT
   LINE (307, 191)-(452, 336), 15, B
  

   DIM frq(9)
   FOR z = 1 TO 9: frq(z) = 0: NEXT
   FOR y = 0 TO 9 - 1
      FOR x = 0 TO 9 - 1
         c = 0
         FOR z = 0 TO 8
            IF a(y * 9 + x) AND (2 ^ z) THEN c = c + 1
         NEXT
         frq(c) = frq(c) + 1
      NEXT
   NEXT
   comb# = 1
   FOR z = 1 TO 9
      LOCATE z, 40: PRINT USING "##: ##"; z; frq(z);
      comb# = comb# * (z ^ frq(z))
   NEXT
   LOCATE 11, 40: PRINT STRING$(40, 32);
   LOCATE 11, 40: PRINT "2 ^"; LOG(comb#) / LOG(2); "cases";
   IF comb# = 1 THEN PRINT " :)";

END SUB

FUNCTION simplify (a())
   mx = 0: my = 0
   DO
      g = 0: p = 0
      FOR y = 0 TO 9 - 1
         FOR x = 0 TO 9 - 1
            v = a(p)
            IF ((v - 1) AND v) = 0 THEN
               IF v = 0 THEN simplify = 0: EXIT FUNCTION
               i = y * 9: j = x: k = (y - my) * 9 + (x - mx)
               FOR z = 0 TO 9 - 1
                  IF (a(i) AND v) AND p <> i THEN a(i) = a(i) XOR v: g = 1
                  IF (a(j) AND v) AND p <> j THEN a(j) = a(j) XOR v: g = 1
                  IF (a(k) AND v) AND p <> k THEN a(k) = a(k) XOR v: g = 1
                  i = i + 1: j = j + 9
                  k = k + 1: IF z = 2 OR z = 5 THEN k = k + 6
               NEXT
            END IF
            p = p + 1
            mx = mx + 1: IF mx >= 3 THEN mx = 0
         NEXT
         my = my + 1: IF my >= 3 THEN my = 0
      NEXT
   LOOP WHILE g
   simplify = 1
END FUNCTION

SUB splboard (a())
   DIM n(81 - 1)
   FOR z = 0 TO 81 - 1
      v = a(z)
      IF ((v - 1) AND v) <> 0 THEN
         DO WHILE v
            w = v AND -v
            FOR i = 0 TO 81 - 1: n(i) = a(i): NEXT: n(z) = w
            IF simplify(n()) THEN CALL splboard(n())
            v = v XOR w
         LOOP
         EXIT SUB
      END IF
   NEXT
   CALL showboard(a())
END SUB

