'
' ������    ������   ��      ��    ��       ��        �����
'��    �   ��        ���     ��    ��       ��      ��     ��
'��        ��        �� �    ��    ��       ��     ��       ��
'�������   �����     ��  ��  ��    �����������    ��         ��
'     ��   ��        ��   �  ��    ��       ��    �������������
'�    ��   ��        ��   �� ��    ��       ��    �������������
'������     ������   ��     ���    ��       ��    ��         ��
'
'
'Para saber:
'
'- como jogar................consulte a tela "Instru��es"
'- quem fez este jogo........consulte a tela "Cr�ditos"
'

OPTION BASE 1

COMMON SHARED Enter$, Back$, Esc$
COMMON SHARED j1$, j2$, pj1$, pj2$, pt1, pt2
COMMON SHARED pontos, Saidasub, Reiniciar, l, rt, rods

COMMON SHARED p(), pc(), cp1(), cp2(), cor(), corc()
COMMON SHARED mc(), apf(), o(), cdrsp(), cdrp(), msp()
COMMON SHARED li$(), msg$(), mem$(), mec$(), dt$(), inst$(), mcd$()

DECLARE FUNCTION CCent (cini, cmax, texto$)
DECLARE FUNCTION IPTfix$ (lmax)
DECLARE FUNCTION IPTfixNUM (lmax, nmin, nmax)
DECLARE FUNCTION RD (vmax)
DECLARE SUB Classificar ()
DECLARE SUB CLScima ()
DECLARE SUB CLStempo ()
DECLARE SUB Creditos ()
DECLARE SUB DefinirMatrizes ()
DECLARE SUB DesenharTabuleiro (ct, vtdt)
DECLARE SUB DesenharTela (appt)
DECLARE SUB Destampar ()
DECLARE SUB DoisJog ()
DECLARE SUB Fim2jog ()
DECLARE SUB Instrucoes ()
DECLARE SUB Jogo (doisj)
DECLARE SUB Pause ()
DECLARE SUB PRTcc (linha, texto$)
DECLARE SUB PRTcd (linha, cini, texto$)
DECLARE SUB PRTce (linha, cmax, texto$)
DECLARE SUB Saidojogo ()
DECLARE SUB Tempo (vt)
DECLARE SUB Terminar (ganhou)

Enter$ = CHR$(13)
Back$ = CHR$(8)
Esc$ = CHR$(27)
DefinirMatrizes
RANDOMIZE TIMER
CLS

DO

 Tempo 7
 DesenharTabuleiro 1, 50
 Tempo 4

 snd = 600
 FOR li = 22 TO 4 STEP -2
  snd = snd + 100
  SOUND snd, 2
  FOR coli = 10 TO 16 STEP 2
   COLOR cor(RD(6)): LOCATE li, coli: PRINT "O"
   Tempo 50
  NEXT coli
 NEXT li

 FOR li = 4 TO 22 STEP 2
  snd = snd - 100
  SOUND snd, 2
  FOR coli = 8 TO 2 STEP -2
   COLOR corc(RD(2)): LOCATE li, coli: PRINT "#"
   Tempo 50
  NEXT coli
 NEXT li
 Tempo .8

 COLOR 15
 FOR lc = 5 TO 11
  LOCATE lc, 18: PRINT li$(lc - 4)
  Tempo 30
 NEXT lc
 SOUND 700, 3
 SOUND 550, 2
 SOUND 700, 2
 SOUND 880, 4
 Tempo 1.75

 LOCATE 14, 25: PRINT "Menu de op��es:"
 FOR mmsg = 1 TO 5
  Tempo 15
  LOCATE mmsg + 15, 25: PRINT msg$(mmsg)
 NEXT mmsg

 DO: LOOP UNTIL INKEY$ = ""
 DO: opc = VAL(INKEY$): LOOP UNTIL opc >= 1 AND opc <= 5
 CLStempo

 SELECT CASE opc
  CASE 1
   FOR fpc = 1 TO 4
   pc(fpc) = RD(6)
   NEXT fpc
   Jogo 0
  CASE 2: DoisJog
  CASE 3: Instrucoes
  CASE 4: Creditos
  CASE 5: END
 END SELECT

LOOP

FUNCTION CCent (cini, cmax, texto$)
CCent = INT(cini + cmax / 2 - LEN(texto$) / 2 - (cini - 1) / 2)
END FUNCTION

SUB Classificar

vc1 = RD(4)
DO: vc2 = RD(4): LOOP WHILE vc2 = vc1
DO: vc3 = RD(4): LOOP WHILE vc3 = vc1 OR vc3 = vc2
DO: vc4 = RD(4): LOOP WHILE vc4 = vc1 OR vc4 = vc2 OR vc4 = vc3
c1 = mc(vc1)
c2 = mc(vc2)
c3 = mc(vc3)
c4 = mc(vc4)

PB12 = (p(1) = pc(2) AND p(2) <> pc(2) AND pc(1) <> pc(2))
PB13 = (p(1) = pc(3) AND p(3) <> pc(3) AND pc(1) <> pc(3))
PB14 = (p(1) = pc(4) AND p(4) <> pc(4) AND pc(1) <> pc(4))
PB21 = (p(2) = pc(1) AND p(1) <> pc(1) AND pc(2) <> pc(1))
PB23 = (p(2) = pc(3) AND p(3) <> pc(3) AND pc(2) <> pc(3) AND (p(1) <> pc(3) OR pc(1) = pc(3)))
PB24 = (p(2) = pc(4) AND p(4) <> pc(4) AND pc(2) <> pc(4) AND (p(1) <> pc(4) OR pc(1) = pc(4) OR (p(1) = pc(3) AND p(3) <> pc(3) AND pc(3) = pc(4))))
PB31 = (p(3) = pc(1) AND p(1) <> pc(1) AND pc(3) <> pc(1) AND (p(2) <> pc(1) OR pc(2) = pc(1)))
PB32 = (p(3) = pc(2) AND p(2) <> pc(2) AND pc(3) <> pc(2) AND (p(1) <> pc(2) OR pc(1) = pc(2)))
PB34 = (p(3) = pc(4) AND p(4) <> pc(4) AND pc(3) <> pc(4) AND (p(1) <> pc(4) OR pc(1) = pc(4) OR (p(1) = pc(2) AND p(2) <> pc(2) AND pc(2) = pc(4))) AND (p(2) <> pc(4) OR pc(2) = pc(4) OR (p(2) = pc(1) AND p(1) <> pc(1) AND pc(1) = pc(4))))
PB41 = (p(4) = pc(1) AND p(1) <> pc(1) AND pc(4) <> pc(1) AND (p(2) <> pc(1) OR pc(2) = pc(1)) AND (p(3) <> pc(1) OR pc(3) = pc(1)))
PB42 = (p(4) = pc(2) AND p(2) <> pc(2) AND pc(4) <> pc(2) AND (p(1) <> pc(2) OR pc(1) = pc(2)) AND (p(3) <> pc(2) OR pc(3) = pc(2) OR (p(3) = pc(1) AND p(1) <> pc(1) AND pc(1) = pc(2))))
PB43 = (p(4) = pc(3) AND p(3) <> pc(3) AND pc(4) <> pc(3) AND (p(1) <> pc(3) OR pc(1) = pc(3) OR (p(1) = pc(2) AND p(2) <> pc(2) AND pc(2) = pc(3))) AND (p(2) <> pc(3) OR pc(2) = pc(3) OR (p(2) = pc(1) AND p(1) <> pc(1) AND pc(1) = pc(3))))


COLOR 8
IF p(1) = pc(1) THEN LOCATE l, c1: PRINT "#"
IF p(2) = pc(2) THEN LOCATE l, c2: PRINT "#"
IF p(3) = pc(3) THEN LOCATE l, c3: PRINT "#"
IF p(4) = pc(4) THEN LOCATE l, c4: PRINT "#"

COLOR 15
IF PB12 OR PB13 OR PB14 THEN LOCATE l, c1: PRINT "#"
IF PB21 OR PB23 OR PB24 THEN LOCATE l, c2: PRINT "#"
IF PB31 OR PB32 OR PB34 THEN LOCATE l, c3: PRINT "#"
IF PB41 OR PB42 OR PB43 THEN LOCATE l, c4: PRINT "#"

FOR ver = 1 TO 4
 IF p(ver) <> pc(ver) THEN ng = -1: EXIT FOR
NEXT ver

IF NOT ng THEN
 Terminar -1
 ELSEIF l = 4 THEN Terminar 0
END IF

END SUB

SUB CLScima
LOCATE 23, 1
FOR apagar = 1 TO 23
 PRINT
 Tempo 30
NEXT apagar
CLS
Tempo 5
END SUB

SUB CLStempo
FOR apagar = 1 TO 12
 LOCATE apagar, 1: PRINT SPACE$(80)
 LOCATE 24 - apagar, 1: PRINT SPACE$(80)
 Tempo 30
NEXT apagar
COLOR 7
CLS
END SUB

SUB Creditos
COLOR 11
FOR tmi = 1 TO 13
 PRINT mcd$(tmi)
 Tempo 20
NEXT tmi
COLOR 15
LOCATE 23, 1: PRINT TAB(25); "(Pressione qualquer tecla para voltar ao Menu principal)"
Pause
CLScima
END SUB

SUB DefinirMatrizes
DIM p(4), pc(4)

DIM cp1(41 TO 47), cp2(35 TO 45)
cp1(41) = 1
cp1(43) = 2
cp1(45) = 3
cp1(47) = 4
cp2(35) = 1
cp2(38) = 2
cp2(42) = 3
cp2(45) = 4

DIM cor(6), o(4), mc(4), apf(5), corc(2)
cor(1) = 4
cor(2) = 3
cor(3) = 14
cor(4) = 12
cor(5) = 2
cor(6) = 6

o(1) = 35
o(2) = 38
o(3) = 42
o(4) = 45

mc(1) = 33
mc(2) = 35
mc(3) = 37
mc(4) = 39

apf(1) = 9
apf(2) = 11
apf(3) = 12
apf(4) = 15
apf(5) = 23

corc(1) = 8
corc(2) = 15

DIM cdrsp(4), cdrp(4), msp(4)
cdrsp(1) = 34
cdrsp(2) = 36
cdrsp(3) = 39
cdrsp(4) = 43

cdrp(1) = 35
cdrp(2) = 38
cdrp(3) = 42
cdrp(4) = 45

msp(1) = 1
msp(2) = 2
msp(3) = 3
msp(4) = 2

DIM li$(7), msg$(5)
li$(1) = " ������    ������   ��      ��    ��       ��        �����"
li$(2) = "��    �   ��        ���     ��    ��       ��      ��     ��"
li$(3) = "��        ��        �� �    ��    ��       ��     ��       ��"
li$(4) = "�������   �����     ��  ��  ��    �����������    ��         ��"
li$(5) = "     ��   ��        ��   �  ��    ��       ��    �������������"
li$(6) = "�    ��   ��        ��   �� ��    ��       ��    �������������"
li$(7) = "������     ������   ��     ���    ��       ��    ��         ��"

msg$(1) = "1) Come�ar o jogo com 1 jogador"
msg$(2) = "2) Come�ar o jogo com 2 jogadores"
msg$(3) = "3) Ver instru��es"
msg$(4) = "4) Ver cr�ditos"
msg$(5) = "5) Sair do jogo"

DIM mem$(5), mec$(6)
mem$(1) = "N�meros..colocam pe�as"
mem$(2) = "BACKSP...retira a �ltima pe�a"
mem$(3) = "ESC......retira todas as pe�as"
mem$(4) = "R........reinicia o jogo"
mem$(5) = "S........sai do jogo"

mec$(1) = "1 - vermelha"
mec$(2) = "2 - azul"
mec$(3) = "3 - amarela"
mec$(4) = "4 - rosa"
mec$(5) = "5 - verde"
mec$(6) = "6 - marrom"

DIM dt$(23), inst$(35), mcd$(13)
dt$(1) = "���������������Ŀ"
dt$(2) = "� ������������� �"
dt$(3) = "���������������Ĵ"
dt$(4) = "�       �o o o o�"
dt$(5) = "���������������Ĵ"
dt$(6) = "�       �o o o o�"
dt$(7) = "���������������Ĵ"
dt$(8) = "�       �o o o o�"
dt$(9) = "���������������Ĵ"
dt$(10) = "�       �o o o o�"
dt$(11) = "���������������Ĵ"
dt$(12) = "�       �o o o o�"
dt$(13) = "���������������Ĵ"
dt$(14) = "�       �o o o o�"
dt$(15) = "���������������Ĵ"
dt$(16) = "�       �o o o o�"
dt$(17) = "���������������Ĵ"
dt$(18) = "�       �o o o o�"
dt$(19) = "���������������Ĵ"
dt$(20) = "�       �o o o o�"
dt$(21) = "���������������Ĵ"
dt$(22) = "�       �o o o o�"
dt$(23) = "�����������������"

inst$(1) = SPACE$(30) + "Como funciona o jogo"
inst$(2) = ""
inst$(3) = "      Seu objetivo � adivinhar a senha. Ela consiste de uma sequ�ncia de"
inst$(4) = "4 pe�as, definidas pelo computador ou por um jogador. Para tentar"
inst$(5) = "adivinh�-la, voc� faz " + CHR$(34) + "chutes" + CHR$(34) + ", escolhendo uma sequ�ncia qualquer de pe�as."
inst$(6) = "O computador ent�o classificar� sua sequ�ncia, utilizando um c�digo: cada"
inst$(7) = "marcador (" + CHR$(34) + "#" + CHR$(34) + ") preto indica que voc� acertou a cor e a posi��o de uma das"
inst$(8) = "quatro pe�as, e cada branco indica que voc� acertou a cor de uma delas, mas"
inst$(9) = "errou sua posi��o. Eles s�o colocados no espa�o � esquerda de cada uma de suas"
inst$(10) = "sequ�ncias (chutes), em ordem aleat�ria. Isso significa que as posi��es dos"
inst$(11) = "marcadores e das pe�as n�o necessariamente coincidem. Voc� dever� interpretar"
inst$(12) = "cada marcador cuidadosamente, pois eles s�o a �nica chave para se descobrir"
inst$(13) = "a senha!"
inst$(14) = ""
inst$(15) = "      No modo para 1 jogador, voc� ganha se decifrar a senha do computador"
inst$(16) = "e perde se n�o conseguir em 10 tentativas. J� no modo para 2 jogadores,"
inst$(17) = "ganha quem adivinhar a senha do outro mais vezes em menos tentativas."

inst$(18) = SPACE$(29) + "Como controlar o jogo"
inst$(19) = ""
inst$(20) = "     Para jogar, voc� usa as teclas descritas na tela, que s�o:"
inst$(21) = "<N�MEROS>, BACKSPACE, ESC, R, S e ENTER. Os <N�MEROS> servem para colocar as"
inst$(22) = "pe�as no tabuleiro. BACKSPACE remove a �ltima pe�a colocada, para que ela"
inst$(23) = "seja substitu�da. ESC remove todas as pe�as, para se refazer totalmente"
inst$(24) = "a sequ�ncia. R reinicia o jogo, ou seja, retorna � tela de introdu��o. S sai"
inst$(25) = "do jogo. ENTER serve para confirmar sua sequ�ncia (quando ela j� estiver"
inst$(26) = "feita), permitindo que o computador a classifique."
inst$(27) = ""
inst$(28) = ""
inst$(29) = "Esquema simplificado do tabuleiro:"
inst$(30) = ""
inst$(31) = SPACE$(31) + "���������������Ŀ"
inst$(32) = SPACE$(31) + "� ������������� � --> Lugar onde fica a resposta"
inst$(33) = SPACE$(31) + "���������������Ĵ"
inst$(34) = " Espa�o para os marcadores <-- �       �o o o o� --> Espa�o para suas pe�as"
inst$(35) = SPACE$(31) + "�����������������"

mcd$(1) = SPACE$(36) + "Cr�ditos"
mcd$(2) = ""
mcd$(3) = "      Programa feito em linguagem QBasic, por Andr� Willik Valenti, baseado"
mcd$(4) = "em um jogo de tabuleiro da GROW. Vers�o finalizada em 27/11/2000, com apenas"
mcd$(5) = "os endere�os de e-mail e web site modificados em 19/11/2001."
mcd$(6) = ""
mcd$(7) = "      Achou algum BUG? Tem algo para dizer? Quer dicas de programa��o? Voc�"
mcd$(8) = "pode me enviar um e-mail ou entrar na minha p�gina na Internet dedicada ao"
mcd$(9) = "QBasic! Os endere�os s�o:"
mcd$(10) = ""
mcd$(11) = ""
mcd$(12) = "E-mail  : qbasic@willik.cjb.net"
mcd$(13) = "Web Site: http://www.willik.cjb.net"


END SUB

SUB DesenharTabuleiro (ct, vtdt)
COLOR 7
FOR ldt = 1 TO 12
 LOCATE ldt, ct: PRINT dt$(ldt)
 LOCATE 24 - ldt, ct: PRINT dt$(24 - ldt)
 Tempo vtdt
NEXT ldt
END SUB

SUB DesenharTela (appt)

Tempo 6
DesenharTabuleiro 32, 25

LOCATE 5, 9: PRINT "Teclas:"
Tempo 30

FOR mmem = 1 TO 5
 LOCATE mmem + 7, 1: PRINT mem$(mmem)
 Tempo 15
NEXT mmem

IF appt THEN
 COLOR 15
 LOCATE 14, 53: PRINT "Voc� est� com 10 pontos"
 Tempo 15
END IF
FOR mmec = 6 TO 1 STEP -1
 COLOR cor(mmec)
 LOCATE mmec + 6, 59: PRINT mec$(mmec)
 Tempo 15
NEXT mmec

COLOR 7
END SUB

SUB Destampar

LOCATE 14, 53: PRINT SPACE$(23)
LOCATE 5, 49: PRINT SPACE$(31)
Tempo 5

FOR nt = 1 TO 4
 LOCATE 2, cdrsp(nt)
 FOR csp = 1 TO msp(nt)
  PRINT " ";
  Tempo 30
 NEXT csp
 COLOR cor(pc(nt)): LOCATE 2, cdrp(nt): PRINT "O";
 Tempo 30
NEXT nt
PRINT " "
Tempo 30

END SUB

SUB DoisJog

CLS
PRTcc 2, "OBS: Os nomes dos jogadores n�o podem ser iguais e a"
Tempo 30
PRTcc 3, "quantidade de rodadas deve ser um n�mero par, de 2 a 10."
Tempo 30

LOCATE 10, 17: PRINT "Nome do jogador 1 (padr�o: " + CHR$(34) + "Jogador 1" + CHR$(34) + "): ";
j1$ = LCASE$(IPTfix$(20))
sp = LEN(j1$)
j1$ = LTRIM$(j1$)
IF j1$ = "" THEN j1$ = "Jogador 1"
MID$(j1$, 1) = UCASE$(LEFT$(j1$, 1))
ps = 1
DO
 itr = INSTR(ps, j1$, " ")
 IF itr = 0 THEN EXIT DO
 MID$(j1$, itr + 1, 1) = UCASE$(MID$(j1$, itr + 1, 1))
 ps = itr + 1
LOOP
LOCATE 10, 58: PRINT SPACE$(sp): LOCATE 10, 58: PRINT j1$

LOCATE 12, 17: PRINT "Nome do jogador 2 (padr�o: " + CHR$(34) + "Jogador 2" + CHR$(34) + "): ";
DO
 j2$ = LCASE$(IPTfix$(20))
 sp = LEN(j2$)
 j2$ = LTRIM$(j2$)
 IF j2$ = "" THEN j2$ = "Jogador 2"
 MID$(j2$, 1) = UCASE$(LEFT$(j2$, 1))
 ps = 1
 DO
  itr = INSTR(ps, j2$, " ")
  IF itr = 0 THEN EXIT DO
  MID$(j2$, itr + 1, 1) = UCASE$(MID$(j2$, itr + 1, 1))
  ps = itr + 1
 LOOP
LOOP WHILE j2$ = j1$
LOCATE 12, 58: PRINT SPACE$(sp): LOCATE 12, 58: PRINT j2$

LOCATE 15, 25: PRINT "N�mero de rodadas (padr�o: 2): ";
DO
 rods = IPTfixNUM(2, 0, 10)
 IF rods = 0 THEN rods = 2: PRINT "2"
LOOP UNTIL rods / 2 = INT(rods / 2)
Tempo 10

CLS
pj1$ = j2$
pj2$ = j1$
rt = -1
pt1 = 0
pt2 = 0
pontos = 0
Tempo 2

Rodadas:
 rt = rt + 1
 IF rt / 2 = INT(rt / 2) THEN pt1 = pt1 + pontos ELSE pt2 = pt2 + pontos
 IF rt = rods THEN Fim2jog: EXIT SUB
 SWAP pj1$, pj2$
 COLOR 15
 LOCATE 8, 29: PRINT "Rodadas terminadas:"; rt
 LOCATE 9, 29: PRINT "Rodadas restantes :"; rods - rt
 PRTcc 12, pj1$ + ", pressione qualquer tecla e n�o deixe"
 PRTcc 13, "seu oponente ver a senha que voc� vai criar!"
 Pause
 CLS
 Tempo 8

 DesenharTela 0
 c = 35
 FOR ttpc = 1 TO 13
 Tempo 50
 LOCATE 2, 47 - ttpc: PRINT MID$(" o  o   o  o ", ttpc, 1)
 NEXT ttpc
 

 DO
  IF c = 41 THEN c = 42
  IF c = 48 THEN
   COLOR 15
   LOCATE 14, 1: PRINT "ENTER....aceita sequ�ncia"
  END IF
  COLOR 7
  DO: LOOP UNTIL INKEY$ = ""
  DO: i$ = UCASE$(INKEY$): LOOP WHILE i$ = ""
  i = VAL(i$)

  IF i >= 1 AND i <= 6 AND c < 48 THEN
   pc(cp2(c)) = i
   COLOR cor(i): LOCATE 2, c: PRINT "O"
   c = c + 3
  END IF

  SELECT CASE i$
   CASE "S"
    LOCATE 14, 23: PRINT SPACE$(3)
    COLOR 15
    LOCATE 14, 1: PRINT "Confirmar sa�da (S/N)?"
    COLOR 7
    DO
     SELECT CASE UCASE$(INKEY$)
      CASE "S"
       CLStempo
       END
      CASE "N"
       LOCATE 14, 1: PRINT SPACE$(22)
       EXIT DO
     END SELECT
    LOOP
   CASE "R"
    COLOR 15
    LOCATE 14, 1: PRINT "Confirmar rein�cio (S/N)?"
    COLOR 7
    DO
     SELECT CASE UCASE$(INKEY$)
      CASE "S"
       CLStempo
       EXIT SUB
      CASE "N"
       LOCATE 14, 1: PRINT SPACE$(25)
       EXIT DO
     END SELECT
    LOOP

   CASE Back$
    LOCATE 14, 1: PRINT SPACE$(25)
    IF c > 35 THEN c = c - 3
    IF c = 39 THEN c = 38
    LOCATE 2, c: PRINT "o"
   CASE Esc$
    LOCATE 14, 1: PRINT SPACE$(25)
    FOR ov = 1 TO 4
    LOCATE 2, o(ov): PRINT "o"
    NEXT ov
    c = 35
   CASE Enter$
    IF c = 48 THEN
     FOR ttpc = 1 TO 13
     Tempo 50
     LOCATE 2, 47 - ttpc: PRINT "�"
     NEXT ttpc
     Tempo 8
     LOCATE 14, 1: PRINT SPACE$(25)
     Tempo 10
     COLOR 15
     PRTce 15, 32, pj2$ + ",  "
     PRTce 16, 32, "pressione qualquer tecla..."
     Pause
     LOCATE 15, 1
     PRINT SPACE$(31): PRINT SPACE$(31)
     Tempo 7
     Jogo -1
     IF Reiniciar THEN EXIT SUB
     GOTO Rodadas
    END IF
  END SELECT
 LOOP

END SUB

SUB Fim2jog
CLS

COLOR 3
LOCATE 9, 27: PRINT "Pontua��o final:"
COLOR 7
LOCATE 11, 27
PRINT j1$; ":";
IF pt1 = 0 THEN
 PRINT " (n�o decifrou a senha)"
 ELSE PRINT pt1; "ponto";
 IF pt1 > 1 THEN PRINT "s"
END IF

LOCATE 12, 27
PRINT j2$; ":";
IF pt2 = 0 THEN
 PRINT " (n�o decifrou a senha)"
 ELSE PRINT pt2; "ponto";
 IF pt2 > 1 THEN PRINT "s"
END IF

COLOR 31
LOCATE 15, 27
SELECT CASE pt2
 CASE pt1: PRINT "Empate..."
 CASE IS > pt1: PRINT j2$; " ganhou!"
 CASE IS < pt1: PRINT j1$; " ganhou!"
END SELECT
IF pt1 = pt2 THEN
 SOUND 1050, 4
 SOUND 800, 2
 SOUND 700, 4
 ELSE
  SOUND 700, 3
  SOUND 550, 2
  SOUND 700, 2
  SOUND 880, 4
END IF
COLOR 15
LOCATE 23, 27: PRINT "Pressione qualquer tecla..."
Pause
CLScima

END SUB

SUB Instrucoes
COLOR 11
FOR tmi = 1 TO 17
 PRINT inst$(tmi)
 Tempo 20
NEXT tmi
COLOR 15
LOCATE 23, 1: PRINT TAB(31); "(Pressione qualquer tecla para ir � tela seguinte)"
COLOR 11
Pause
CLScima

FOR tmi = 18 TO 35
 PRINT inst$(tmi)
 Tempo 20
NEXT tmi
COLOR 15
LOCATE 23, 1: PRINT TAB(25); "(Pressione qualquer tecla para voltar ao Menu principal)"
Pause
CLScima
END SUB

FUNCTION IPTfix$ (lmax)
min = POS(0)

DO
 at$ = SPACE$(lmax)
 LOCATE , min: PRINT SPACE$(lmax + 1);
 LOCATE , min: PRINT "_";
 nc = 0

 DO: LOOP UNTIL INKEY$ = ""
 DO
   DO: i$ = INKEY$: LOOP WHILE i$ = ""

  SELECT CASE i$
   CASE "A" TO "Z", "a" TO "z", "0" TO "9", " "
    IF nc < lmax THEN
     LOCATE , min + nc: PRINT i$; "_";
     nc = nc + 1
     MID$(at$, nc) = i$
    END IF
   CASE CHR$(8)
    IF nc > 0 THEN
     LOCATE , min + nc: PRINT " ";
     LOCATE , min + nc - 1: PRINT "_";
     MID$(at$, nc) = " "
     nc = nc - 1
    END IF
   CASE CHR$(13): EXIT DO
  END SELECT

 LOOP
 at$ = RTRIM$(at$)
LOOP UNTIL LEN(at$) <= lmax

LOCATE , min + nc: PRINT " ";
LOCATE , min
IPTfix$ = at$

END FUNCTION

FUNCTION IPTfixNUM (lmax, nmin, nmax)
min = POS(0)

DO
 at$ = SPACE$(lmax)
 LOCATE , min: PRINT SPACE$(lmax + 1);
 LOCATE , min: PRINT "_";
 nc = 0

 DO: LOOP UNTIL INKEY$ = ""
 DO
   DO: i$ = INKEY$: LOOP WHILE i$ = ""

  SELECT CASE i$
   CASE "0" TO "9"
    IF nc < lmax THEN
     LOCATE , min + nc: PRINT i$; "_";
     nc = nc + 1
     MID$(at$, nc) = i$
    END IF
   CASE CHR$(8)
    IF nc > 0 THEN
     LOCATE , min + nc: PRINT " ";
     LOCATE , min + nc - 1: PRINT "_";
     MID$(at$, nc) = " "
     nc = nc - 1
    END IF
   CASE CHR$(13): EXIT DO
  END SELECT

 LOOP
 at$ = RTRIM$(at$)
 vin = VAL(at$)
LOOP WHILE LEN(at$) > lmax OR vin < nmin OR vin > nmax OR LEFT$(at$, 1) = "0"

LOCATE , min + nc: PRINT " ";
LOCATE , min
IPTfixNUM = vin

END FUNCTION

SUB Jogo (doisj)
l = 22
c = 41
Saidasub = 0
Reiniciar = 0

IF doisj THEN
 COLOR 15
 LOCATE 14, 53: PRINT "Voc� est� com 10 pontos"
 PRTcd 5, 49, "Vez de " + pj2$

 ELSE DesenharTela -1
END IF

DO
 pontos = l / 2 - 1
 COLOR 15
 LOCATE 14, 53: PRINT "Voc� est� com"; pontos; "ponto";
 IF pontos > 1 THEN PRINT "s";
 PRINT " "
 
 DO
  IF c = 49 THEN
   COLOR 15
   LOCATE 14, 1: PRINT "ENTER....aceita sequ�ncia"
   END IF
  COLOR 7

  DO: LOOP UNTIL INKEY$ = ""
  DO: i$ = UCASE$(INKEY$): LOOP WHILE i$ = ""
  i = VAL(i$)
  
  IF i >= 1 AND i <= 6 AND c < 49 THEN
   p(cp1(c)) = i
   COLOR cor(i): LOCATE l, c: PRINT "O"
   c = c + 2
  END IF

  SELECT CASE i$
   CASE "S"
    LOCATE 14, 23: PRINT SPACE$(3)
    COLOR 15
    LOCATE 14, 1: PRINT "Confirmar sa�da (S/N)?"
    COLOR 7
    DO
     SELECT CASE UCASE$(INKEY$)
      CASE "S"
       Saidojogo
       END
      CASE "N"
       LOCATE 14, 1: PRINT SPACE$(22)
       EXIT DO
     END SELECT
    LOOP
   CASE "R"
    COLOR 15
    LOCATE 14, 1: PRINT "Confirmar rein�cio (S/N)?"
    COLOR 7
    DO
     SELECT CASE UCASE$(INKEY$)
      CASE "S"
       Saidojogo
       Reiniciar = -1
       EXIT SUB
      CASE "N"
       LOCATE 14, 1: PRINT SPACE$(25)
       EXIT DO
     END SELECT
    LOOP

  CASE Back$
   LOCATE 14, 1: PRINT SPACE$(25)
   IF c > 41 THEN c = c - 2
   LOCATE l, c: PRINT "o"
  CASE Esc$
   LOCATE 14, 1: PRINT SPACE$(25)
   FOR o = 41 TO 47 STEP 2
   LOCATE l, o: PRINT "o"
   NEXT o
   c = 41
  CASE Enter$
   IF c = 49 THEN
    LOCATE 14, 1: PRINT SPACE$(25)
    Classificar
    IF Saidasub THEN EXIT SUB
    l = l - 2
    c = 41
    EXIT DO
   END IF
  END SELECT
 LOOP
LOOP
END SUB

SUB Pause
DO: LOOP UNTIL INKEY$ = ""
DO: LOOP WHILE INKEY$ = ""
END SUB

SUB PRTcc (linha, texto$)
LOCATE linha, INT(41 - LEN(texto$) / 2): PRINT texto$;
END SUB

SUB PRTcd (linha, cini, texto$)
LOCATE linha, CCent(cini, 80, texto$): PRINT texto$;
END SUB

SUB PRTce (linha, cmax, texto$)
LOCATE linha, CCent(1, cmax, texto$): PRINT texto$;
END SUB

FUNCTION RD (vmax)
RD = INT(RND * vmax) + 1
END FUNCTION

SUB Saidojogo
Destampar
LOCATE 14, 1: PRINT SPACE$(25)
Tempo 10
COLOR 15: LOCATE 15, 1: PRINT "Pressione qualquer tecla..."
Pause
CLStempo
END SUB

SUB Tempo (vt)
tp = TIMER
DO: LOOP UNTIL TIMER - tp >= 1 / vt
END SUB

SUB Terminar (ganhou)

Destampar
COLOR 15

IF ganhou THEN
 PRTce 16, 31, "Parab�ns! Voc�"
 PRTce 17, 31, "decifrou a senha!"
 SOUND 700, 2
 SOUND 800, 2
 SOUND 1050, 4
 SOUND 700, 2
 SOUND 800, 2
 SOUND 1050, 4
 SOUND 1400, 4
 Tempo 15
 LOCATE 14, 52: PRINT "Voc� terminou com"; pontos; "ponto";
 IF pontos > 1 THEN PRINT "s"
 LOCATE 16, 52: PRINT "Pressione qualquer tecla..."

 ELSE
  pontos = 0
  PRTce 16, 31, "Voc� perdeu..."
  SOUND 1050, 4
  SOUND 800, 2
  SOUND 700, 4
  PRTcd 16, 49, "Pressione qualquer tecla..."
END IF

Pause
CLStempo
Saidasub = -1

END SUB

