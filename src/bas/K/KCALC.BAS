DEFDBL A-Z
DECLARE FUNCTION fixsigns$ (zx$)
DECLARE SUB expand (a$)

CONST MAXTERMS = 1024
DIM SHARED st$(MAXTERMS), mulcon(MAXTERMS), numterms
DIM SHARED sort$(MAXTERMS)

SCREEN 0: WIDTH 80, 50: CLS : INPUT a$
'a$ = LCASE$(COMMAND$)

IF a$ = "" THEN
   PRINT "Calc [math expression]                          programmed by Kenneth Silverman"
   PRINT "   Calc expands mathematical expressions into simplified terms."
   PRINT "   Supported symbols: Variables, Numbers, +, -, *, (), ^, ~, ý"
   PRINT "* Since DOS doesn't allow ^ in the command line, I chose ~ as a replacement."
   PRINT "Example expressions: 2~10, (a+b)(a-b), (a+b)ý, -(-a-b)~4, (-a(b-c~3(d+e)ý-f))"
   END
END IF

CALL expand(a$)
  
'COLOR 4, 0
IF numterms = 0 THEN PRINT "0"
FOR z = 0 TO numterms - 1
   IF mulcon(z) < 0 THEN PRINT "-";  ELSE PRINT "+";
   PRINT st$(z);
   IF ABS(mulcon(z)) <> 1 AND st$(z) <> "" THEN PRINT "*";
   IF ABS(mulcon(z)) <> 1 OR st$(z) = "" THEN PRINT LTRIM$(STR$(ABS(mulcon(z))));
   IF z < numterms - 1 THEN PRINT
NEXT z

SUB expand (a$)
      'Suck out spaces
   FOR z = LEN(a$) TO 1 STEP -1
      IF MID$(a$, z, 1) = " " THEN a$ = LEFT$(a$, z - 1) + RIGHT$(a$, LEN(a$) - z)
   NEXT z

      'Expand ^
   z = LEN(a$)
   DO WHILE z > 1      'I included ~ because ^ doesn't work on command line
      IF MID$(a$, z, 1) = "^" OR MID$(a$, z, 1) = "~" OR MID$(a$, z, 1) = "ý" THEN
        
         IF MID$(a$, z, 1) = "ý" THEN
            pow = 2
            r = z + 1
         ELSE
            pow = 0: r = z + 1    'Get power number (must be integer)
            DO WHILE ASC(MID$(a$, r, 1)) >= 48 AND ASC(MID$(a$, r, 1)) <= 57 AND r <= LEN(a$)
               pow = (pow * 10) + ASC(MID$(a$, r, 1)) - 48
               r = r + 1: IF r > LEN(a$) THEN EXIT DO
            LOOP
         END IF
        
         IF MID$(a$, z - 1, 1) = ")" THEN
               'Find length of () before ^
            inpar = 0
            FOR l = z - 1 TO 1 STEP -1
               IF MID$(a$, l, 1) = ")" THEN inpar = inpar + 1
               IF MID$(a$, l, 1) = "(" THEN inpar = inpar - 1
               IF inpar <= 0 THEN EXIT FOR
            NEXT l
           
            oa$ = a$
            a$ = LEFT$(oa$, l - 1)
            FOR zz = 1 TO pow: a$ = a$ + MID$(oa$, l, z - l): NEXT zz
            a$ = a$ + RIGHT$(oa$, LEN(oa$) - r + 1)
         ELSE
               'Find length of single sub-term before ^
            FOR l = z - 1 TO 1 STEP -1
               ch = ASC(MID$(a$, l, 1))
               IF (ch < 48 OR ch > 57) AND (ch < 65 OR ch > 90) AND (ch < 65 + 32 OR ch > 90 + 32) AND ch <> ASC(".") THEN EXIT FOR
            NEXT l
            l = l + 1
        
            oa$ = a$
            a$ = LEFT$(oa$, l - 1)
            FOR zz = 1 TO pow: a$ = a$ + "(" + MID$(oa$, l, z - l) + ")": NEXT zz
            a$ = a$ + RIGHT$(oa$, LEN(oa$) - r + 1)
         END IF

         z = LEN(a$)
      END IF
      z = z - 1
   LOOP

   a$ = "(" + a$ + ")"    'Must insert () around string for it to work

      'Insert * for implied cases
   z = 2: inpar = 0
   DO WHILE z < LEN(a$)
      IF MID$(a$, z, 1) = "(" THEN
         inpar = inpar + 1
         ch = ASC(MID$(a$, z - 1, 1))
         IF (ch >= 48 AND ch <= 57) OR (ch >= 65 AND ch <= 90) OR (ch >= 65 + 32 AND ch <= 90 + 32) OR ch = ASC(".") THEN
            a$ = LEFT$(a$, z - 1) + "*" + RIGHT$(a$, LEN(a$) - z + 1)
            z = z + 1
         END IF
      END IF
      IF MID$(a$, z, 1) = ")" THEN
         inpar = inpar - 1
         ch = ASC(MID$(a$, z + 1, 1))
         IF (ch >= 48 AND ch <= 57) OR (ch >= 65 AND ch <= 90) OR (ch >= 65 + 32 AND ch <= 90 + 32) OR ch = ASC(".") OR ch = ASC("(") THEN
            a$ = LEFT$(a$, z) + "*" + RIGHT$(a$, LEN(a$) - z)
         END IF
      END IF
      z = z + 1
   LOOP
   IF inpar > 0 THEN PRINT "Not enough )": END
   IF inpar < 0 THEN PRINT "Too many )": END
     
      'Insert + for implied cases
   z = 2
   DO WHILE z < LEN(a$)
      ch = ASC(MID$(a$, z, 1))
      IF (ch >= 48 AND ch <= 57) OR (ch >= 65 AND ch <= 90) OR (ch >= 65 + 32 AND ch <= 90 + 32) OR ch = ASC(".") THEN
         chl = ASC(MID$(a$, z - 1, 1))
         IF (chl < 48 OR chl > 57) AND (chl < 65 OR chl > 90) AND (chl < 65 + 32 OR chl > 90 + 32) AND chl <> ASC(".") THEN
            IF MID$(a$, z - 1, 1) <> "+" AND MID$(a$, z - 1, 1) <> "-" THEN
               a$ = LEFT$(a$, z - 1) + "+" + RIGHT$(a$, LEN(a$) - z + 1)
            END IF
         END IF
      END IF
      z = z + 1
   LOOP
  
   'PRINT a$    'Show initial parsing (after + and * and ^ are expanded)

      'Process ()
   st$(0) = fixsigns(a$): numterms = 1
   t = 0
   DO WHILE t < numterms
      z = 1
      DO WHILE z <= LEN(st$(t))
         IF MID$(st$(t), z, 1) = "(" THEN
           
               'zzz = end ) of entire ()
            inpar = 1
            FOR zzz = z + 1 TO LEN(st$(t))
               IF MID$(st$(t), zzz, 1) = "(" THEN inpar = inpar + 1
               IF MID$(st$(t), zzz, 1) = ")" THEN inpar = inpar - 1
               IF inpar <= 0 THEN EXIT FOR
            NEXT zzz

               'zz = end of 1st term inside ()
            inpar = 0: inmul = 0
            FOR zz = z + 1 TO LEN(st$(t))
               IF MID$(st$(t), zz, 1) = "(" THEN inpar = inpar + 1
               IF MID$(st$(t), zz, 1) = ")" THEN inpar = inpar - 1: IF inpar < 0 THEN EXIT FOR
               IF MID$(st$(t), zz, 1) = "*" THEN inmul = 1
               IF zz <> z + 1 THEN
                  IF inpar = 0 AND inmul = 0 AND (MID$(st$(t), zz, 1) = "+" OR MID$(st$(t), zz, 1) = "-") THEN EXIT FOR
               END IF
               IF MID$(st$(t), zz, 1) = "+" OR MID$(st$(t), zz, 1) = "-" THEN inmul = 0
            NEXT zz
           
               'If inpar < 0 then only 1 term
               '1st term is:  MID$(st$(t), z + 1, zz - z - 1)
            IF inpar >= 0 THEN
               st$(numterms) = LEFT$(st$(t), z) + RIGHT$(st$(t), LEN(st$(t)) - zz + 1)
               st$(numterms) = fixsigns(st$(numterms))
               numterms = numterms + 1
            END IF
            st$(t) = LEFT$(st$(t), z - 1) + MID$(st$(t), z + 1, zz - z - 1) + RIGHT$(st$(t), LEN(st$(t)) - zzz)
            st$(t) = fixsigns(st$(t))
            z = 0
         END IF
         z = z + 1
      LOOP
      t = t + 1
   LOOP

      'Sort sub-terms and mix constants and signs into mulcon array
   FOR z = 0 TO numterms - 1
         'Create sort list of sub-terms
      mulcon(z) = 1: snum = 0
      FOR zz = 1 TO LEN(st$(z))
         IF MID$(st$(z), zz, 1) = "-" OR MID$(st$(z), zz, 1) = "+" OR MID$(st$(z), zz, 1) = "*" THEN
            IF MID$(st$(z), zz, 1) = "-" THEN mulcon(z) = -mulcon(z)
            IF snum = 0 THEN
               sort$(snum) = "": snum = snum + 1
            ELSEIF sort$(snum - 1) <> "" THEN
               sort$(snum) = "": snum = snum + 1
            END IF
         ELSE
            sort$(snum - 1) = sort$(snum - 1) + MID$(st$(z), zz, 1)
         END IF
      NEXT zz

         'Move any numbers into mulcon
      FOR zz = snum - 1 TO 0 STEP -1
         FOR zzz = LEN(sort$(zz)) TO 1 STEP -1
            IF (ASC(MID$(sort$(zz), zzz, 1)) < 48 OR ASC(MID$(sort$(zz), zzz, 1)) > 57) AND MID$(sort$(zz), zzz, 1) <> "." THEN EXIT FOR
         NEXT zzz
         IF zzz = 0 THEN   'sort$(zz) is a number
            mulcon(z) = mulcon(z) * VAL(sort$(zz))
            snum = snum - 1: sort$(zz) = sort$(snum)
         END IF
      NEXT zz

         'Sort out sub-terms
      FOR zz = 1 TO snum - 1
         FOR zzz = 0 TO zz - 1
            IF sort$(zz) < sort$(zzz) THEN SWAP sort$(zz), sort$(zzz)
         NEXT zzz
      NEXT zz
     
      st$(z) = ""
      FOR zz = 0 TO snum - 1
         st$(z) = st$(z) + sort$(zz)
         IF zz < snum - 1 THEN st$(z) = st$(z) + "*"
      NEXT zz
   NEXT z
     
      'Delete terms with mulcon = 0
   FOR z = numterms - 1 TO 0 STEP -1
      IF mulcon(z) = 0 THEN
         numterms = numterms - 1
         st$(z) = st$(numterms)
         mulcon(z) = mulcon(numterms)
      END IF
   NEXT z

      'Sort out terms
   FOR z = 1 TO numterms - 1
      FOR zz = 0 TO z - 1
         IF st$(z) < st$(zz) THEN SWAP st$(z), st$(zz): SWAP mulcon(z), mulcon(zz)
      NEXT zz
   NEXT z
  
      'Cancel / combine common terms
   z = numterms - 1
   DO WHILE z > 0
      IF st$(z) = st$(z - 1) THEN
         mulcon(z - 1) = mulcon(z - 1) + mulcon(z)
         IF mulcon(z - 1) = 0 THEN
            numterms = numterms - 2
            FOR zz = z - 1 TO numterms - 1
               st$(zz) = st$(zz + 2): mulcon(zz) = mulcon(zz + 2)
            NEXT zz
         ELSE
            numterms = numterms - 1
            FOR zz = z TO numterms - 1
               st$(zz) = st$(zz + 1): mulcon(zz) = mulcon(zz + 1)
            NEXT zz
         END IF
      END IF
      z = z - 1
   LOOP
END SUB

FUNCTION fixsigns$ (zx$)
   z$ = zx$
   DO
      hit = 0
      p = INSTR(z$, "--")
      IF p > 0 THEN hit = 1: z$ = LEFT$(z$, p - 1) + "+" + RIGHT$(z$, LEN(z$) - p - 1)
      p = INSTR(z$, "++")
      IF p > 0 THEN hit = 1: z$ = LEFT$(z$, p - 1) + "+" + RIGHT$(z$, LEN(z$) - p - 1)
      p = INSTR(z$, "+-")
      IF p > 0 THEN hit = 1: z$ = LEFT$(z$, p - 1) + "-" + RIGHT$(z$, LEN(z$) - p - 1)
      p = INSTR(z$, "-+")
      IF p > 0 THEN hit = 1: z$ = LEFT$(z$, p - 1) + "-" + RIGHT$(z$, LEN(z$) - p - 1)
   LOOP WHILE hit <> 0
   fixsigns$ = z$
END FUNCTION

