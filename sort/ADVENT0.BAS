1 RANDOMIZE VAL(RIGHT$(TIME$, 2))
5 KEY OFF: CLS : SCREEN 0, 1
10 LOCATE 10, 10: PRINT "Quer instrucoes? (S/N)"
15 LOCATE 20, 20: PRINT "Certifique-se de que a tecla CAPS LOCK esta pressionada"
20 A$ = -INKEY$: IF A$ = "" THEN 20
30 IF A$ = "S" THEN GOSUB 6000
40 CLS
100 '
110 ' RESPOSTAS
115 '
120 DIM R$(19), R(19)
130 FOR K = 1 TO 19: READ R$(K), R(K): NEXT
140 DATA NADAR,5,ABRIR,6,ACENDER,7,DESISTIR,8,LISTAR,9,MATAR,10,ATIRAR,10,AJUDAR,11
145 DATA PEGAR,2,APANHAR,2,CARREGAR,2,COLOCAR,3,DEIXAR,3,LARGAR,3,PUXAR,4
150 DATA NORTE,1,SUL,1,LESTE,1,OESTE,1
155 '
160 ' OBJETOS
165 '
170 READ NB
180 DIM OB(NB), OB$(NB), SI$(NB)
190 FOR I = 1 TO NB: READ OB(I), OB$(I), SI$(I): NEXT
200 DATA 7,0,OLHO,Ha um olho aqui
210 DATA 22,LANTERNA,Ha uma lanterna aqui
220 DATA 14,TIJOLO,Ha um tijolo no chao
230 DATA 0,BUMERANGUE,Ha um bumerangue no chao
240 DATA 4,ALAVANCA,Existe um alavanca aqui
250 DATA 24,CAIXA,Ha uma pequena caixa aqui
260 DATA 0,CAVEIRA,De repente surge uma caveira
270 '  posicao inicial
275 '
280 L = 15
290 GOTO 330
291 '
300 '   ACHAR LOCAL
305 '
310 CLS
320 IF INT(RND(1) * 15 + 1) = 1 AND TA = 0 THEN OB(7) = L: TA = 1
330 IF L < 11 THEN ON L GOSUB 0, 0, 0, 5020, 0, 0, 5050, 5080, 0, 5110: GOTO 370
340 IF L < 21 THEN ON L - 10 GOSUB 5140, 0, 0, 5180, 5210, 5240, 5270, 5300, 0, 0: GOTO 370
350 IF L < 26 THEN ON L - 20 GOSUB 0, 5330, 0, 5360
355 '
360 '   COLOCA OBJETO NO LUGAR
365 '
370 FOR I = 1 TO NB: IF OB(I) = L THEN PRINT SI$(I)
380 NEXT
385 '
390 '     INDICA DIRECOES
395 '
400 IF L <> 11 OR (LA = 1 AND OB(2) = -1) THEN PRINT : PRINT "Pode seguir ";  ELSE 460
410 IF N > 0 THEN PRINT TAB(13); "NORTE"
420 IF E > 0 THEN PRINT TAB(13); "LESTE"
430 IF S > 0 THEN PRINT TAB(13); "SUL"
440 IF W > 0 THEN PRINT TAB(13); "OESTE"
445 '
450 '   INSTRUCOES
455 '
460 PRINT : PRINT "Para onde "; : INPUT I$
470 GOSUB 3010
480 IF OB(7) = L AND I <> 10 THEN 1590
490 '
500 '    OPCAO
504 '
505 IF I = 0 THEN GOTO 520
510 ON I GOTO 1010, 1150, 1240, 1310, 1410, 1460, 1500, 1360, 1080, 1550, 3110
520 PRINT : PRINT " - EU SOU BURRO, NAO ENTENDO "; V$; " - ": GOTO 370
530 '
1000 '     MOVIMENTO
1001 '
1010 IF I$ = "N" AND N > 0 THEN L = L - 6: GOTO 310
1020 IF I$ = "L" AND L > 0 THEN L = L + 1: GOTO 310
1030 IF I$ = "S" AND S > 0 THEN L = L + 6: GOTO 310
1040 IF I$ = "O" AND W > 0 THEN L = L - 1: GOTO 310
1045 '
1050 '  CAMINHO ERRADO
1055 '
1060 PRINT : PRINT " - SEU BURRO, ESTE CAMINHO NAO EXISTE. NAO ESTA VENDO ??? - ": GOTO 330
1065 '
1070 '   LISTAR
1075 '
1080 PRINT "Voce tem "; : IN = 0
1090 FOR G = 1 TO NB
1100 IF OB(G) = -1 THEN PRINT TAB(10); OB$(G): IN = IN + 1
1110 NEXT
1120 IF IN = 0 THEN PRINT " - N A D A - "
1130 GOTO 330
1135 '
1140 '   PEGAR
1145 '
1150 FOR G = 1 TO NB
1160 IF INSTR(OB$(G), N$) = 1 THEN GOTO 1190
1170 NEXT
1180  PRINT N$; " ??? ": GOTO 330
1190 IF OB(G) = -1 THEN PRINT "Ta' na mao, chefia!": GOTO 330
1200 IF OB(G) <> L THEN PRINT "Nao esta' aqui, SEU CEGO ": GOTO 330
1210 PRINT "OK": OB(G) = -1
1220 GOTO 330
1225 '
1230 '   DEIXAR
1235 '
1240 FOR G = 1 TO NB
1250 IF INSTR(OB(G), N$) = 1 THEN 1270
1260 NEXT: PRINT " ??? ": GOTO 330
1270 IF OB(G) <> -1 THEN PRINT "Voce e' BURRO? Voce nao pode "; V$; " o que nao tem": GOTO 330
1280 PRINT "OK"; OB(G) = L
1290 GOTO 330
1295 '
1300 '   PUXAR
1305 '
1310 IN = INSTR("ALAVANCA", N$): IF IN = 1 AND L <> 4 THEN PRINT "Nada acontece": GOTO 400
1320 IF IN <> 1 THEN PRINT "Voce nao pode puxar isso!": GOTO 400
1330 IF OB(1) <> -1 THEN PRINT "A alavanca abriu um buraco no chao e voce caiu dentro dele.  Voce ja' era, cara!": GOTO 1360
1340 '      FIM
1345 '
1350 PRINT " P A R A B E N S - Voce completou sua missao"
1360 PRINT : PRINT "Quer jogar novamente? (S/N)"
1365 BEEP
1370 A$ = INKEY$: IF A$ = "" THEN 1370
1380 IF A$ = "S" THEN RUN
1390 END
1395 '
1400 '      NADAR
1405 '
1410 IF L <> 7 THEN PRINT "Para onde? ": GOTO 330
1420 IF OB(3) = -1 THEN PRINT "Voce esta andando no pantano quando comeca a afundar. Voce nao sabe que tijolos sao muito pesados para um fracote como voce? Voce afundou ... e MORREU!!!": GOTO 1360
1430 IF OB(4) > -1 THEN PRINT "Voce achou um bumerangue": OB(4) = -1: GOTO 330
1440 PRINT "Voce esta todo molhado, cuidado para nao derreter florzinha...": GOTO 330
1445 '
1450 '        ABRIR
1455 '
1460 IN = INSTR("CAIXA", N$): IF IN <> 1 THEN PRINT "Isto nao pode ser esvaziado": GOTO 330
1470 IF OB(6) <> -1 THEN G = 1: GOTO 1270
1480 PRINT "Dentro da caixa ha um olho de diamantes": OB(1) = L: GOTO 370
1485 '
1490 '           ACENDER
1495 '
1500 IN = INSTR("LANTERNA", N$): IF IN <> 1 THEN PRINT "Nao pode ser feito": GOTO 330
1510 IF OB(2) <> -1 THEN G = 6: GOTO 1270
1520 IF LA = 1 THEN PRINT "Ja' esta' acesa": GOTO 330
1530 LA = 1: PRINT "OK": GOTO 330
1535 '
1540 '           MATAR
1545 '
1550 IF OB(4) <> -1 THEN PRINT "Com o que?": GOTO 320
1560 IF OB(7) <> L THEN PRINT "Quem?": GOTO 320
1570 PRINT "Voce acada de matar a "; OB$(7): OB(7) = 0: GOTO 330
1575 '
1580 '           CAVEIRA
1585 '
1590 IN = 0: OB(7) = 0
1600 FOR K = 1 TO NB
1610 IF OB(K) = -1 THEN IN = IN + 1
1620 NEXT
1630 IF IN = 0 THEN PRINT "Como voce nao tem nada util, a caveira o prende nos calaboucos da masmorra para voce fazer compania aos mortos e, logo, juntar-se a eles...": GOTO 1360
1640 K = INT(RND(1) * NB + 1): IF OB(K) <> -1 THEN 1640
1650 PRINT "Ela toma o "; OB$(K); " de voce ": OB(K) = 0: GOTO 330
1660 '
3000 '           VERIFICACAO
3001 '
3010 N$ = "": I = INSTR(I$, " ")
3020 IF I = 0 THEN V$ = I$: GOTO 3050
3030 V$ = LEFT$(I$, I - 1)
3040 N$ = MID$(I$, I + 1)
3050 I = 0
3060 FOR K = 1 TO 19
3070 IF INSTR(R$(K), V$) = 1 THEN I = R(K): I$ = LEFT$(V$, 1)
3080 NEXT
3090 RETURN
3095 '
3100 '           AJUDAR
3105 '
3110 PRINT "Os verbos possiveis sao:": PRINT
3111 PRINT "NADAR,    ABRIR,    ACENDER, DESISTIR,"
3112 PRINT "LISTAR,   MATAR,    ATIRAR,  PEGAR,"
3113 PRINT "APANHAR,  CARREGAR, COLOCAR, DEIXAR,"
3114 PRINT "LARGAR,   PUXAR"
3120 GOTO 330
3130 '
5000 '           LOCAIS
5005 '
5010 '           4
5015 '
5020 PRINT "Voce esta na masmorra da cidadela. Velhos esqueletos estao acorrentados na parede"
5030 N = 0: E = 0: S = 1: W = O: RETURN
5035 '
5040 '           7
5045 '
5050 PRINT "Voce penetrou numa densa floresta. Ha' um rio aqui"
5060 N = 0: E = 1: S = 0: W = 0: RETURN
5065 '
5070 '           8
5075 '
5080 PRINT "Voce esta' na beira de um pantano borbulhante"
5090 N = O: E = O: S = 1: W = 1: RETURN
5095 '
5100 '           10
5105 '
5110 PRINT "Voce esta' na Fornalha dos Espiritos. Um cheiro demoniaco esta' no ar"
5120 N = 1: E = 1: S = 1: W = 0: RETURN
5125 '
5130 '           11
5135 '
5140 PRINT "Voce esta' em um quarto escuro."
5150 IF OB(2) <> -1 OR LA <> 1 THEN N = 0: E = 0: S = 0: W = 0: PRINT "Esta' muito escuro para ver as saidas. Voce ficara preso aqui pelo resto de sua vida...": RETURN
5155 '
5160 N = 0: E = 0: S = 1: W = 1: RETURN
5165 '
5170 '           14
5175 '
5180 PRINT "Voce esta' em um atalho enlameado"
5190 N = 1: E = 1: S = 0: W = 0: RETURN
5195 '
5200 '           15
5205 '
5210 PRINT "Voce esta na entrada da cidade oculta"
5220 N = 0: E = 1: S = 0: W = 1: RETURN
5225 '
5230 '           16
5235 '
5240 PRINT "Voce esta' em um grande patio"
5250 N = 1: E = 1: S = 1: W = 1: RETURN
5255 '
5260 '           17
5265 '
5270 PRINT "Voce esta' nos esgotos da cidade"
5280 N = 1: E = 1: S = 0: W = 1: RETURN
5285 '
5295 '
5300 PRINT "Voce entrou nos subterraneos da cidade"
5310 N = 0: E = 0: S = 1: W = 1: RETURN
5315 '
5320 '           22
5325 '
5330 PRINT "Voce desceu ate' os calaboucos. Restos mortais estao espalhados pelo chao"
5340 N = 1: E = 0: S = 0: W = 0: RETURN
5345 '
5350 '           24
5355 '
5360 PRINT "Voce esta' nas catacumbas. Sepulturas (nao o grupo de rock) e tumbas estao      espalhadas pelo chao"
5370 N = 1: E = 0: S = 0: W = 0: RETURN
6000 '
6005 '           INSTRUCOES
6010 '
6020 CLS : COLOR 7, 14: LOCATE 1, 25: PRINT "A BUSCA DO OLHO ENCANTADO": COLOR 7, 0
6030 LOCATE 5, 5: PRINT " Voce e' um aventureiro que procura muitos tesouros. Voce e' meio burro mas faz  o que pode para ganhar a vida."
6040 PRINT " Voce decidiu ir para o Castelo da Morte para enfrentar o desconhecido.";
6050 PRINT " Mas parece que voce vai acabar encontrando muitos problemas..."
6060 PRINT : INPUT "TECLE [ENTER] PARA CONTINUAR"; SPA$
6070 RETURN

