DECLARE SUB Ganhou ()
DECLARE SUB PRTcc (linha, texto$)
DECLARE SUB TempoJogo ()
OPTION BASE 1

COMMON SHARED s, min, h, tp, nmin, nh, mov
CONST CorCursor = 1, CorCerta = 11, MaxCertas = 4
ON ERROR GOTO Erro

TYPE COOR
 l AS INTEGER
 c AS INTEGER
END TYPE

'Define as teclas:
 cima$ = CHR$(0) + "H"
baixo$ = CHR$(0) + "P"
  esq$ = CHR$(0) + "K"
  dir$ = CHR$(0) + "M"

CLS
RANDOMIZE TIMER

DIM SHARED letra$(4, 4), posletra(16) AS COOR, Casa(4)  AS COOR
DIM SHARED Cursor AS COOR, CursorAT AS COOR, Vazio AS COOR, v AS COOR

'Define as letras:
FOR dll = 1 TO 4
 FOR dlc = 1 TO 4
  dl = dl + 1
  IF dl >= 11 THEN c = 1          'Exclui o "K" da lista
  letra$(dll, dlc) = CHR$(dl + 64 + c)
 NEXT dlc
NEXT dll
letra$(4, 4) = " "

'Embaralha as letras:
DO
 FOR dn = 1 TO 15
  DO
   posletra(dn).l = INT(RND * 4) + 1
   posletra(dn).c = INT(RND * 4) + 1
   FOR teste = 1 TO dn - 1
    IF posletra(dn).l = posletra(teste).l AND posletra(dn).c = posletra(teste).c THEN
     Repetir = -1: EXIT FOR
     ELSE Repetir = 0
    END IF
   NEXT teste
  LOOP WHILE Repetir OR posletra(dn).l = 1 AND posletra(dn).c = 1
 NEXT dn

 'Testa se mais de (MaxCertas) letras ja' comecaram no lugar certo:
 tt = 0: ltct = 0: passou = 0
 FOR tsl = 1 TO 4
  FOR tsc = 1 TO 4
   IF ltct > MaxCertas THEN passou = -1: EXIT FOR
   tt = tt + 1
   IF posletra(tt).l = tsl AND posletra(tt).c = tsc THEN ltct = ltct + 1
  NEXT tsc
  IF passou THEN EXIT FOR
 NEXT tsl

LOOP WHILE passou  'Se sim, embaralhar de novo
posletra(16).l = 1: posletra(16).c = 1

'Define as linhas e colunas de cada casa, para serem usadas pelos LOCATEs:
FOR cs = 1 TO 4
 Casa(cs).l = 2 * cs + 7
NEXT cs
FOR cs = 1 TO 4
 Casa(cs).c = 4 * cs + 30
NEXT cs

LOCATE 8, 32:  PRINT "ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿"
LOCATE 9, 32:  PRINT "³   ³   ³   ³   ³"
LOCATE 10, 32: PRINT "ÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´"
LOCATE 11, 32: PRINT "³   ³   ³   ³   ³"
LOCATE 12, 32: PRINT "ÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´"
LOCATE 13, 32: PRINT "³   ³   ³   ³   ³"
LOCATE 14, 32: PRINT "ÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´"
LOCATE 15, 32: PRINT "³   ³   ³   ³   ³"
LOCATE 16, 32: PRINT "ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ"

'Coloca as letras na tela:
FOR prl = 1 TO 4
 FOR prc = 1 TO 4
  pr = pr + 1
  LOCATE Casa(posletra(pr).l).l, Casa(posletra(pr).c).c: PRINT letra$(prl, prc)
 NEXT prc
NEXT prl

Vazio.l = 1: Vazio.c = 1  'Define o espaco vazio inicial
Cursor = Vazio            'Coloca o cursor nesse espaco

LOCATE 2, 30: PRINT "N£mero de jogadas: 0"
LOCATE 3, 28: PRINT "Tempo de jogo:"

'Imprime o 1§ cursor
COLOR , CorCursor: LOCATE Casa(1).l, Casa(1).c - 1: PRINT SPACE$(3)

'Linhas para imprimir as primeiras letras em lugar certo de cor diferente:
FOR tsl = 1 TO 4
 FOR tsc = 1 TO 4
  IF CHR$(SCREEN(Casa(tsl).l, Casa(tsc).c)) = letra$(tsl, tsc) THEN
   COLOR CorCerta, 0: LOCATE Casa(tsl).l, Casa(tsc).c: PRINT letra$(tsl, tsc)
  END IF
 NEXT tsc
NEXT tsl


tp = TIMER
DO

 CursorAT = Cursor   'Define a posicao anterior do cursor
 COLOR 7, 0
 TempoJogo

 SELECT CASE INKEY$
  CASE CHR$(27): CLS : END   'Termina o jogo se apertar ESC
  CASE cima$:  IF Cursor.l > 1 THEN Cursor.l = Cursor.l - 1
  CASE baixo$: IF Cursor.l < 4 THEN Cursor.l = Cursor.l + 1
  CASE esq$:   IF Cursor.c > 1 THEN Cursor.c = Cursor.c - 1
  CASE dir$:   IF Cursor.c < 4 THEN Cursor.c = Cursor.c + 1

  CASE " "
   v.l = 0
   SELECT CASE Vazio.l
    CASE Cursor.l - 1: IF Cursor.c = Vazio.c THEN v.l = -1  'Est  abaixo
    CASE Cursor.l + 1: IF Cursor.c = Vazio.c THEN v.l = 1   'Est  acima
   END SELECT
 
   v.c = 0
   SELECT CASE Vazio.c
    CASE Cursor.c - 1: IF Cursor.l = Vazio.l THEN v.c = -1  'Est  … esquerda
    CASE Cursor.c + 1: IF Cursor.l = Vazio.l THEN v.c = 1   'Est  … direita
   END SELECT
  
   'Se foi um movimento valido
   IF v.l <> 0 XOR v.c <> 0 THEN
   
    mov = mov + 1
    LOCATE 2, 48: PRINT mov      'Imprime o numero de jogadas
    IF CHR$(SCREEN(Casa(Cursor.l).l, Casa(Cursor.c).c)) = letra$(Vazio.l, Vazio.c) THEN csu = CorCerta ELSE csu = 7
    COLOR csu, 0
    LOCATE Casa(Vazio.l).l, Casa(Vazio.c).c - 1
    PRINT " "; CHR$(SCREEN(Casa(Cursor.l).l, Casa(Cursor.c).c)); " "
    Vazio = Cursor     ' "Muda" o espaco vazio
    'Apaga a letra da casa antiga
    COLOR , CorCursor: LOCATE Casa(Cursor.l).l, Casa(Cursor.c).c: PRINT " "
     
    'Ve se ganhou:
    saiFOR = 0
    FOR tgl = 1 TO 4
     FOR tgc = 1 TO 4
      IF CHR$(SCREEN(Casa(tgl).l, Casa(tgc).c)) <> letra$(tgl, tgc) THEN saiFOR = -1: EXIT FOR
     NEXT tgc
     IF saiFOR THEN EXIT FOR
    NEXT tgl
    IF NOT saiFOR THEN Ganhou   'Se "passou no teste", o jogador ganhou

   END IF
 
 END SELECT
 
 IF Cursor.l <> CursorAT.l OR Cursor.c <> CursorAT.c THEN 'Se o cursor andou
  IF CHR$(SCREEN(Casa(CursorAT.l).l, Casa(CursorAT.c).c)) = letra$(CursorAT.l, CursorAT.c) THEN csu = CorCerta ELSE csu = 7
  COLOR csu, 0
  LOCATE Casa(CursorAT.l).l, Casa(CursorAT.c).c - 1
  PRINT " "; CHR$(SCREEN(Casa(CursorAT.l).l, Casa(CursorAT.c).c)); " "
  
  IF CHR$(SCREEN(Casa(Cursor.l).l, Casa(Cursor.c).c)) = letra$(Cursor.l, Cursor.c) THEN csu = CorCerta ELSE csu = 15
  COLOR csu, CorCursor
  LOCATE Casa(Cursor.l).l, Casa(Cursor.c).c - 1
  PRINT " "; CHR$(SCREEN(Casa(Cursor.l).l, Casa(Cursor.c).c)); " "
 END IF
  
LOOP


Erro:
 COLOR 15, 0: CLS
 PRTcc 12, "Erro inesperado! C¢digo:" + STR$(ERR)
 COLOR 7
END

SUB Ganhou

COLOR 14, 0
LOCATE 2, 1
PRINT SPACE$(80); SPACE$(80)  'Apaga as mensagens

'Apaga o cursor
LOCATE Casa(Cursor.l).l, Casa(Cursor.c).c - 1: PRINT SPACE$(3)
tp = TIMER
DO: LOOP UNTIL TIMER - tp >= 1 / 2


FOR gl = 1 TO 4
 FOR gc = 1 TO 4
  LOCATE Casa(gl).l, Casa(gc).c: PRINT letra$(gl, gc)
  tp = TIMER
  DO: LOOP UNTIL TIMER - tp >= 1 / 8
 NEXT gc
NEXT gl

COLOR 9
PRTcc 3, "Parab‚ns! Vocˆ conseguiu montar o quebra-cabe‡a!"
PRTcc 5, "Fez" + STR$(mov) + " jogadas e demorou" + STR$(h) + "h" + STR$(min) + "min e" + STR$(s) + "s."
SOUND 700, 2.5
SOUND 950, 2
DO: LOOP UNTIL INKEY$ = ""
DO: LOOP WHILE INKEY$ = ""

COLOR 7
CLS
END

END SUB

SUB PRTcc (linha, texto$)
LOCATE linha, INT(41 - LEN(texto$) / 2): PRINT texto$;
END SUB

SUB TempoJogo

s = INT(TIMER - tp) - nmin * 60
min = min + INT(s / 60) - nh * 60
h = h + INT(min / 60)

IF s >= 60 THEN
 nmin = nmin + 1
 s = s - 60
 LOCATE 3, 42: PRINT SPACE$(30)
END IF

IF min >= 60 THEN
 nh = nh + 1
 min = min - 60
 LOCATE 3, 42: PRINT SPACE$(30)
END IF

LOCATE 3, 42: PRINT STR$(h); "h"; STR$(min); "min"; STR$(s); "s"

END SUB

