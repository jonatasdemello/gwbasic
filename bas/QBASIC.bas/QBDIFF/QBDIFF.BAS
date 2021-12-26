DEFLNG A-Z
ON ERROR GOTO Erro
CLS

DO
  bpl = bpl + 1024
1 bytesdo1$ = STRING$(bpl + 2048, " "): bytesdo2$ = bytesdo1$
LOOP

2 LOCATE , 1: PRINT SPACE$(80); : LOCATE , 1
LINE INPUT ; "Arquivo #1: ", arq1$
IF arq1$ = "" THEN PRINT : END
3 OPEN arq1$ FOR INPUT AS #3
IF LOF(3) = 0 THEN ERROR 101
CLOSE
PRINT

4 LOCATE , 1: PRINT SPACE$(80); : LOCATE , 1
LINE INPUT ; "Arquivo #2: ", arq2$
IF arq2$ = "" THEN PRINT : END
5 OPEN arq2$ FOR INPUT AS #3
IF LOF(3) = 0 THEN ERROR 102
IF arq2$ = arq1$ THEN ERROR 103
CLOSE
PRINT

6 OPEN arq1$ FOR BINARY ACCESS READ AS #1
OPEN arq2$ FOR BINARY ACCESS READ AS #2

l = LOF(1)
IF l <> LOF(2) THEN PRINT : PRINT "Os arquivos tˆm tamanhos diferentes!": END
IF l < bpl THEN ls = l ELSE ls = bpl
di = l \ bpl
rl = l MOD bpl

PRINT : PRINT "0% conclu¡do";

FOR v = 1 TO di
 GET #1, bpl * p + 1, bytesdo1$
 GET #2, bpl * p + 1, bytesdo2$
 IF bytesdo1$ <> bytesdo2$ THEN dif = -1: GOTO Conc
 pat = pag
 pag = INT((LOC(1) / l) * 100)
 IF pag > pat THEN LOCATE , 1: PRINT LTRIM$(STR$(pag)); "% conclu¡do";
 p = p + 1
NEXT

bytesdo1$ = "": bytesdo2$ = ""
bytesdo1$ = STRING$(rl, " "): bytesdo2$ = bytesdo1$
GET #1, ls * p + 1, bytesdo1$
GET #2, ls * p + 1, bytesdo2$
IF bytesdo1$ <> bytesdo2$ THEN dif = -1

Conc:
LOCATE , 1: PRINT "100% conclu¡do": PRINT
PRINT "Os arquivos sao ";
IF dif THEN
 COLOR 15: PRINT "diferentes"; : COLOR 7: PRINT "!"
 PRINT "Mostrar a(s) posi‡ao(oes) do(s) byte(s) nao-coincidente(s) (S/N)? ";
 DO: i$ = UCASE$(INKEY$): LOOP UNTIL i$ = "S" OR i$ = "N": PRINT i$
 IF i$ = "N" THEN CLOSE : END
 ELSE COLOR 15: PRINT "iguais"; : COLOR 7: PRINT "!": CLOSE : END
END IF

PRINT
bytesdo1$ = "": bytesdo2$ = ""
bytesdo1$ = STRING$(bpl, " "): bytesdo2$ = bytesdo1$
FOR v = v TO di
 IF INKEY$ = CHR$(27) THEN PRINT : END
 GET #1, bpl * p + 1, bytesdo1$
 GET #2, bpl * p + 1, bytesdo2$
 IF bytesdo1$ <> bytesdo2$ THEN
  FOR vcod = 1 TO bpl
   byte1$ = MID$(bytesdo1$, vcod, 1)
   byte2$ = MID$(bytesdo2$, vcod, 1)
   IF byte1$ <> byte2$ THEN PRINT LTRIM$(STR$(bpl * p + vcod)); " "; : bdif = bdif + 1
  NEXT
 END IF
 p = p + 1
NEXT

bytesdo1$ = "": bytesdo2$ = ""
bytesdo1$ = STRING$(rl, " "): bytesdo2$ = bytesdo1$
GET #1, ls * p + 1, bytesdo1$
GET #2, ls * p + 1, bytesdo2$
IF bytesdo1$ <> bytesdo2$ THEN
 FOR vcod = 1 TO ls
  IF INKEY$ = CHR$(27) THEN PRINT : END
  byte1$ = MID$(bytesdo1$, vcod, 1)
  byte2$ = MID$(bytesdo2$, vcod, 1)
  IF byte1$ <> byte2$ THEN PRINT LTRIM$(STR$(bpl * p + vcod)); " "; : bdif = bdif + 1
 NEXT
END IF

pctig = 100 - CINT((bdif / l) * 100)
IF pctig = 100 THEN pctig = 99
PRINT : PRINT
PRINT "Semelhan‡a entre os arquivos:"; STR$(pctig); "%"
END

Erro:

 SELECT CASE ERL
  CASE 1: IF ERR = 14 THEN RESUME 2
  CASE 3
   IF ERR = 101 THEN
    PRINT : PRINT : PRINT "O arquivo ";
    COLOR 15: PRINT CHR$(34); UCASE$(arq1$); CHR$(34);
    COLOR 7: PRINT " est  vazio!"
    CLOSE : END
   ELSE RESUME 2
  END IF
  CASE 5
   IF ERR = 102 THEN
    PRINT : PRINT : PRINT "O arquivo ";
    COLOR 15: PRINT CHR$(34); UCASE$(arq2$); CHR$(34);
    COLOR 7: PRINT " est  vazio!"
    CLOSE : END
    ELSE CLOSE : RESUME 4
   END IF
 END SELECT

 PRINT : PRINT "Erro inesperado! C¢digo:"; ERR
END

