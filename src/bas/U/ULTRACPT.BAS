DEFLNG A-Z
ON ERROR GOTO Erro
CLS

DO
  bpl = bpl + 1024
1 t1$ = STRING$(bpl + 2048, " "): t2$ = t1$
LOOP

2 PRINT "Choose an option:"
PRINT
PRINT "1)Crypt"
PRINT "2)Decrypt"
PRINT "3)Quit"
DO: opc = VAL(INKEY$): LOOP UNTIL opc >= 1 AND opc <= 3

SELECT CASE opc

 CASE 1
  PRINT
  GOSUB Arq

3 tp! = TIMER
  RANDOMIZE TIMER
  DO
   coef = INT(RND * 31) + 30
   np1$ = LEFT$(LTRIM$(STR$(coef)), 1)
   np2$ = RIGHT$(LTRIM$(STR$(coef)), 1)
  LOOP WHILE np1$ = np2$

  OPEN arqa$ FOR BINARY ACCESS READ AS #1
  OPEN arqs$ FOR BINARY ACCESS WRITE AS #2
  l = LOF(1)
  IF l = 0 THEN ERROR 101
  IF l < bpl THEN ls = l ELSE ls = bpl
  di = l \ bpl
  rl = l MOD bpl

  FOR v = 1 TO di
   bytes$ = ""
   c$ = STRING$(ls, " ")
   GET #1, bpl * p + 1, c$
   FOR vcod = 1 TO bpl
    cod = ASC(MID$(c$, vcod, 1)) + coef + 71
    IF cod > 255 THEN cod = cod - 256
    bytes$ = bytes$ + CHR$(cod)
   NEXT
   PUT #2, bpl * p + 1, bytes$
   GOSUB Comum
  NEXT
 
  bytes$ = ""
  c$ = STRING$(rl, " ")
  GET #1, ls * p + 1, c$
  FOR vcod = 1 TO rl
   cod = ASC(MID$(c$, vcod, 1)) + coef + 71
   IF cod > 255 THEN cod = cod - 256
   bytes$ = bytes$ + CHR$(cod)
  NEXT
  PUT #2, ls * p + 1, bytes$

  PUT #2, l + 1, np2$
  PUT #2, l + 2, np1$
 
  CLOSE


 CASE 2
  PRINT
  GOSUB Arq

4 tp! = TIMER
  OPEN arqa$ FOR BINARY ACCESS READ AS #1
  OPEN arqs$ FOR BINARY ACCESS WRITE AS #2
 
  l = LOF(1) - 2
  IF l < 1 THEN ERROR 102
  IF l < bpl THEN ls = l ELSE ls = bpl
  c$ = STRING$(ls, " ")
  di = l \ bpl
  rl = l MOD bpl

  np1$ = " ": np2$ = " "
  GET #1, l + 2, np1$
  GET #1, l + 1, np2$
  coef = VAL(np1$ + np2$)
  IF coef < 30 OR coef > 60 THEN ERROR 102
  np1$ = "": np2$ = ""

  FOR v = 1 TO di
   GET #1, bpl * p + 1, c$
   bytes$ = ""
   FOR vcod = 1 TO bpl
    cod = ASC(MID$(c$, vcod, 1)) - coef - 71
    IF cod < 0 THEN cod = cod + 256
    bytes$ = bytes$ + CHR$(cod)
   NEXT
   PUT #2, bpl * p + 1, bytes$
   GOSUB Comum
  NEXT

  c$ = STRING$(rl, " ")
  GET #1, ls * p + 1, c$
  bytes$ = ""
  FOR vcod = 1 TO rl
   cod = ASC(MID$(c$, vcod, 1)) - coef - 71
   IF cod < 0 THEN cod = cod + 256
   bytes$ = bytes$ + CHR$(cod)
  NEXT
  PUT #2, ls * p + 1, bytes$
  CLOSE
  IF arqig THEN
   KILL arqa$
   NAME arqs$ AS arqso$
   arqs$ = arqso$
  END IF

 CASE 3: END

END SELECT

LOCATE , 1: PRINT "100% finished": PRINT

PRINT "File "; : COLOR 15: PRINT CHR$(34); UCASE$(arqa$); CHR$(34); : COLOR 7: PRINT " has been ";
IF opc = 2 THEN PRINT "de";
PRINT "crypted"
PRINT "and written to "; : COLOR 15: PRINT CHR$(34); UCASE$(arqs$); CHR$(34); : COLOR 7: PRINT "!"

s! = TIMER - tp!
min = s! \ 60
s! = s! - min * 60
IF min = 0 THEN
 IF s! < .1 THEN s! = 0
 s$ = LTRIM$(STR$(s!))
 IF s! <> INT(s!) THEN s$ = LEFT$(s$, INSTR(s$, ".") + 1)
 ELSE s$ = LTRIM$(STR$(CINT(s!)))
END IF
IF LEFT$(s$, 1) = "." THEN s$ = "0" + s$

PRINT : PRINT "This procedure has taken";
IF min > 0 THEN PRINT min; "minute(s) and";
PRINT " "; s$; " second(s)."
END


Arq:
  LOCATE , 1: PRINT SPACE$(80); : LOCATE , 1
  PRINT "File to be ";
  IF opc = 2 THEN PRINT "de";
  LINE INPUT ; "crypted: ", arqa$: arqa$ = UCASE$(arqa$)
  IF arqa$ = "" THEN PRINT : ERROR 103
5 OPEN arqa$ FOR INPUT AS #3: CLOSE
  PRINT

  lin = CSRLIN
6 LOCATE lin, 1
  FOR v = 1 TO 4: PRINT SPACE$(80): NEXT
  LOCATE lin
  LINE INPUT "Save to file: ", arqs$: arqs$ = UCASE$(arqs$)
  IF arqs$ = "" OR arqs$ = arqa$ THEN
   PRINT "Overwrite file "; : COLOR 15: PRINT CHR$(34); arqa$; CHR$(34); : COLOR 7: PRINT " (Y/N)? ";
   DO: i$ = UCASE$(INKEY$): LOOP UNTIL i$ = "Y" OR i$ = "N"
   IF i$ = "N" THEN GOTO 6
   PRINT "Y"
   arqs$ = arqa$
   SHELL "ATTRIB -R " + arqs$
   GOTO R
  END IF
7 OPEN arqs$ FOR INPUT AS #4: CLOSE
  PRINT "File "; : COLOR 15: PRINT CHR$(34); arqs$; CHR$(34); : COLOR 7: PRINT " already exists. Overwrite it (Y/N)? ";
  DO: i$ = UCASE$(INKEY$): LOOP UNTIL i$ = "Y" OR i$ = "N"
  IF i$ = "N" THEN GOTO 6
  PRINT "Y"
  SHELL "ATTRIB -R " + arqs$
  KILL arqs$

R: IF opc = 2 AND arqs$ = arqa$ THEN
 arqig = -1
 arqso$ = arqs$
 IF arqs$ = "RENOM.UC1" THEN arqs$ = "RENOM.UC2" ELSE arqs$ = "RENOM.UC1"
END IF
PRINT
IF opc = 1 THEN PRINT "C";  ELSE PRINT "Dec";
PRINT "rypting..."
PRINT "0% finished";
RETURN

Comum:
 pat = pag
 pag = INT((LOC(1) / l) * 100)
 IF pag > pat THEN LOCATE , 1: PRINT LTRIM$(STR$(pag)); "% finished";
 p = p + 1
RETURN

Erro:
 IF ERR > 100 THEN
  SELECT CASE ERR
   CASE 101
    PRINT : PRINT : PRINT "File ";
    COLOR 15: PRINT CHR$(34); UCASE$(arqa$); CHR$(34);
    COLOR 7: PRINT " is empty!"
    CLOSE : IF arqa$ <> arqs$ THEN KILL arqs$
   CASE 102
    PRINT : PRINT : PRINT "File ";
    COLOR 15: PRINT CHR$(34); UCASE$(arqa$); CHR$(34);
    COLOR 7: PRINT " is not crypted or is damaged!"
    CLOSE : IF arqa$ <> arqs$ THEN KILL arqs$
  END SELECT
  END
 END IF

 SELECT CASE ERL
  CASE 1
   IF ERR = 14 THEN
    t1$ = "": t2$ = ""
    RESUME 2
   END IF
  CASE 5: RESUME Arq
  CASE 7: IF ERR = 53 THEN RESUME R ELSE IF ERR <> 0 THEN RESUME 6
 END SELECT
 
 PRINT : PRINT "Unexpected error! ERR Code:"; ERR
END

