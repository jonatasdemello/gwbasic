0 REM * * * Adventure * * *
10 CLS : WIDTH 80: SCREEN 0: POKE &HFCAB, 1: KEY OFF: PRINT "Quer instrucoes (S/N)?"
20 A$ = INKEY$: IF A$ = "" THEN 20
30 IF A$ = "S" THEN GOSUB 6000
110 ' ** PREPARAR MATRIZES-RESPOSTAS **
120 DIM R$(19), R(19)
130 FOR K = 1 TO 19: READ R$(K), R(K): NEXT
140 DATA NADAR,5,ESVAZIAR,6,ACENDER,7,DESISTIR,8,LISTAR,9,MATAR,10,ATIRAR,10,AJUDAR,11
145 DATA PEGAR,2,APANHAR,2,CARREGAR,2,COLOCAR,3,DEIXAR,3,LARGAR,3,PUXAR,4
150 DATA NORTE,1,SUL,1,LESTE,1,OESTE,1
160 ' *** MATRIZES DOS OBJETOS ***
170 READ NB
180 DIM OB(NB), OB$(NB), SI$(NB)
190 FOR I = 1 TO NB: READ OB(I), OB$(I), SI$(I): NEXT
200 DATA 7,4,SACO,Ha um saco de bolas de gude aqui
210 DATA 14,TIJOLO,Tem um tijolo no chao
220 DATA 24,CORRENTE,Ha uma corrente pendurada sobre o trono
230 DATA 0,REVOLVER,Tem um revolver no chao
240 DATA 0,OLHO,Um olho cravejado de brilhantes esta no chao
250 DATA 22,LAMPADA,Voce esta diante de uma lampada
260 DATA 0,COLETOR,De repente surge um coletor de impostos
270 ' *** POSICAO INICIAL ***
280 L = 15
290 GOTO 330
300 ' *** ACHAR LOCAL  ***
310 CLS
320 RN = RND(-TIME): IF INT(RND(1) * 15 + 1) = 1 AND TA = 0 THEN OB(7) = L: TA = 1
330 IF L < 11 THEN ON L GOSUB 0, 0, 0, 5020, 0, 0, 5050, 5080, 0, 5110: GOTO 360
340 IF L < 21 THEN ON L - 10 GOSUB 5140, 0, 0, 5180, 5210, 5240, 5270, 5300, 0, 0: GOTO 360
350 IF L < 26 THEN ON L - 20 GOSUB 0, 5330, 0, 5360
360 ' *** COLOCA OBJETOS NO SEU LUGAR
370 FOR I = 1 TO NB: IF OB(I) = L THEN PRINT SI$(I)
380 NEXT
390 ' *** INDICAR DIRECOES ***
400 IF L <> 11 OR (LA = 1 AND OB(6) = -1) THEN PRINT : PRINT "Pode seguir";  ELSE 460
410 IF N > 0 THEN PRINT TAB(13); "NORTE"
420 IF E > 0 THEN PRINT TAB(13); "LESTE"
430 IF S > 0 THEN PRINT TAB(13); "SUL"
440 IF W > 0 THEN PRINT TAB(13); "OESTE"
450 ' *** INSTRUCOES ***
460 I$ = "": PRINT : INPUT "E agora "; I$
470 GOSUB 3010
480 IF OB(7) = L AND I <> 10 THEN 1590
500 ' *** SELECIONA OPCAO ***
505 IF I = 0 THEN GOTO 520
510 ON I GOTO 1010, 1150, 1240, 1310, 1410, 1460, 1500, 1360, 1080, 1550, 3110
520 PRINT : PRINT "Eu nao sei como "; V$: GOTO 330
1000 ' *** ROTINA DE MOVIMENTO ***
1010 IF I$ = "N" AND N > 0 THEN L = L - 6: GOTO 310
1020 IF I$ = "L" AND E > 0 THEN L = L + 1: GOTO 310
1030 IF I$ = "S" AND S > 0 THEN L = L + 6: GOTO 310
1040 IF I$ = "O" AND W > 0 THEN L = L - 1: GOTO 310
1050 ' *** SE NAO HOUVER LOCAL                     NESTA DIRECAO
1060 PRINT : PRINT "Desculpe - Voce nao pode ir por este    caminho.": GOTO 330
1070 ' *** LISTAR ***
1080 PRINT "Voce tem "; : IN = 0
1090 FOR G = 1 TO NB
1100 IF OB(G) = -1 THEN PRINT TAB(10); OB$(G): IN = IN + 1
1110 NEXT
1120 IF IN = 0 THEN PRINT "Nada"
1130 GOTO 330
1140 ' *** PEGAR ***
1150 FOR G = 1 TO NB
1160 IF INSTR(OB$(G), N$) = 1 THEN GOTO 1190
1170 NEXT
1180 PRINT N$; "???": GOTO 330
1190 IF OB(G) = -1 THEN PRINT "Voce pegou": GOTO 330
1200 IF OB(G) <> L THEN PRINT "Nao esta aqui": GOTO 330
1210 PRINT "OK": OB(G) = -1
1220 GOTO 330
1230 ' *** DEIXAR ***
1240 FOR G = 1 TO NB
1250 IF INSTR(OB$(G), N$) = 1 THEN GOTO 1270
1260 NEXT: PRINT N$; "???": GOTO 330
1270 IF OB(G) <> -1 THEN PRINT "Voce nao pode "; V$; " o que nao tem": GOTO 330
1280 PRINT " OK": OB(G) = L
1290 GOTO 330
1300 ' *** PUXAR ***
1310 IN = INSTR("CORRENTE", N$): IF IN = 1 AND L <> 24 THEN PRINT "Nada acontece": GOTO 330
1320 IF IN <> 1 THEN PRINT "Voce nao pode puxar isso!": GOTO 330
1330 IF OB(5) <> -1 THEN PRINT "Voce cai dentro do vaso e vai embora com a descarga": GOTO 1360
1340 ' *** FIM DA AVENTURA ***
1350 PRINT "Parabens! Voce completou a tarefa"
1360 PRINT : PRINT "Quer jogar novamente (S/N)?"
1370 A$ = INKEY$: IF A$ <> "S" AND A$ <> "N" THEN 1370
1380 IF A$ = "S" THEN RUN
1390 POKE &HFCAB, 0: KEY ON: END
1400 ' *** NADAR ***
1410 IF L <> 7 THEN PRINT "Onde ?!!": GOTO 330
1420 IF OB(2) = -1 THEN PRINT "Que vergonha. Voce se afogou!": GOTO 1360
1430 IF OB(4) > -1 THEN PRINT "Voce achou um revolver": OB(4) = -1: GOTO 330
1440 PRINT "Voce se molhou todo": GOTO 330
1450 ' *** ESVAZIAR ***
1460 IN = INSTR("SACO", N$): IF IN <> 1 THEN PRINT "Isto nao pode se esvaziado": GOTO 330
1470 IF OB(1) <> -1 THEN G = 1: GOTO 1270
1480 PRINT "As bolinhas se espalham pelo chao": OB(5) = L: GOTO 370
1490 ' *** ACENDER ***
1500 IN = INSTR("LAMPADA", N$): IF IN <> 1 THEN PRINT "Nao pode ser feito": GOTO 330
1510 IF OB(6) <> -1 THEN G = 6: GOTO 1270
1520 IF LA = 1 THEN PRINT "Ja esta acessa": GOTO 330
1530 LA = 1: PRINT "Ok": GOTO 330
1540 ' *** MATAR ***
1550 IF OB(4) <> -1 THEN PRINT "Com o que ?": GOTO 320
1560 IF OB(7) <> L THEN PRINT V$; " quem ?": GOTO 320
1570 PRINT "Voce matou o "; OB$(7): OB(7) = 0: GOTO 330
1580 ' *** COLETOR DE IMPOSTOS ***
1590 IN = 0: OB(7) = 0
1600 FOR K = 1 TO NB
1610 IF OB(K) = -1 THEN IN = IN + 1
1620 NEXT
1630 IF IN = 0 THEN PRINT "Como voce nao tem nada que possa ser    confiscado, ele o prendeu em uma        masmorra imunda.": GOTO 1360
1640 K = INT(RND(1) * NB + 1): IF OB(K) <> -1 THEN 1640
1650 PRINT "Ele toma o "; OB$(K); " de voce": OB(K) = 0: GOTO 330
3000 ' *** INSTRUCAO DE CHECAGEM ***
3010 N$ = "": I = INSTR(I$, " ")
3020 IF I = 0 THEN V$ = I$: GOTO 3050
3030 V$ = LEFT$(I$, I - 1)
3040 N$ = MID$(I$, I + 1)
3050 I = 0
3060 FOR K = 1 TO 19
3070 IF INSTR(R$(K), V$) = 1 THEN I = R(K): I$ = LEFT$(V$, 1)
3080 NEXT
3090 RETURN
3100 ' *** AJUDAR ***
3110 IF L <> 7 OR OB(2) <> -1 THEN PRINT "Desculpe, nao posso ajudar agora": GOTO 330
3120 PRINT "Tijolos sao muito pesados. Seu braco    deve estar doendo.": GOTO 330
5000 ' Descricao dos locais
5010 ' Local 4
5020 PRINT "Voce esta do lado de fora de uma grande construcao"
5030 N = 0: E = 0: S = 1: W = 0: RETURN
5040 ' LOCAL 7
5050 PRINT "Voce esta a beira de um grande rio"
5060 N = 0: E = 1: S = 0: W = 0: RETURN
5070 ' LOCAL 8
5080 PRINT "Voce esta numa floresta petrificada"
5090 N = 0: E = 0: S = 1: W = 1: RETURN
5100 ' LOCAL 10
5110 PRINT "Voce esta numa sala muito suja"
5120 N = 1: E = 1: S = 1: W = 0: RETURN
5130 ' LOCAL 11
5140 PRINT "Voce esta num quarto escuro"
5150 IF OB(6) <> -1 OR LA <> 1 THEN N = 0: E = 0: S = 0: W = 0: PRINT "Esta muito escuro para ver as saidas": RETURN
5160 N = 0: E = 0: S = 1: W = 1: RETURN
5170 ' LOCAL 14
5180 PRINT "Voce esta num atalho enlameado"
5190 N = 1: E = 1: S = 0: W = 0: RETURN
5200 ' LOCAL 15
5210 PRINT "Voce esta na entrada da cidade oculta"
5220 N = 0: E = 1: S = 0: W = 1: RETURN
5230 ' LOCAL 16
5240 PRINT "Voce esta no hall de entrada"
5250 N = 1: E = 1: S = 1: W = 1: RETURN
5260 ' LOCAL 17
5270 PRINT "Voce esta no patio"
5280 N = 1: E = 1: S = 0: W = 1: RETURN
5290 ' LOCAL 18
5300 PRINT "Voce esta no jardim"
5310 N = 0: E = 0: S = 1: W = 1: RETURN
5320 ' LOCAL 22
5330 PRINT "Voce esta no guarda-loucas"
5340 N = 1: E = 0: S = 0: W = 0: RETURN
5350 ' LOCAL 24
5360 PRINT "Voce esta na sala do trono"
5370 N = 1: E = 0: S = 0: W = 0: RETURN
6000 ' *** INSTRUCOES ***
6010 CLS : PRINT : PRINT "Devido a um colapso financeiro voce deixou o pais."
6020 PRINT : PRINT "Seus problemas vao terminar quando voce encontrar o "
6025 PRINT : PRINT "legendario olho cravejado de brilhantes de um totem inca."
6030 PRINT : PRINT "Depois de encontra-lo  voce precisa achar a saida."
6035 PRINT : PRINT "Cuidado com o coletor de impostos!"
6040 PRINT : PRINT "Aperte qualquer tecla para continuar"
6050 A$ = INKEY$: IF A$ = "" THEN GOTO 6050
6060 CLS : RETURN

