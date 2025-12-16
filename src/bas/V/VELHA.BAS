DECLARE SUB Intro ()
Intro
CLS
INPUT "Nome do jogador 1 (X): ", jum$
IF jum$ = "" THEN jum$ = "Jogador 1"
INPUT "Nome do jogador 2 (O): ", jdois$
IF jdois$ = "" THEN jdois$ = "Jogador 2"
orjum$ = jum$
orjdois$ = jdois$
CLS
GOTO 55
11 CLS
x$ = jum$
y$ = jdois$
jdois$ = x$
jum$ = y$
x$ = jum$
y$ = jdois$
DO
COLOR 2
LOCATE 10, 30: PRINT "Placar atual:"
COLOR 7
LOCATE 12, 30: PRINT orjum$; ": "; GanhoUm
LOCATE 13, 30: PRINT orjdois$; ": "; GanhoDois
LOCATE 14, 30: PRINT "Velha: "; GanhoVelha
COLOR 4
LOCATE 23, 15: PRINT "Pressione qualquer tecla para voltar ao jogo..."
COLOR 7
LOOP WHILE INKEY$ = ""
CLS
55 a$ = " "
b$ = " "
c$ = " "
d$ = " "
e$ = " "
f$ = " "
g$ = " "
h$ = " "
i$ = " "
1 PRINT "        ษอออออหอออออหอออออป"
PRINT "        บ  A  บ  B  บ  C  บ"
PRINT "        ศอออออสอออออสอออออผ"
PRINT "ษอออออป"
PRINT "บ  1  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  2  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  3  บ       ณ     ณ"
PRINT "ศอออออผ"
LOCATE 11, 1: PRINT jum$; " (X),"
LOCATE 11, LEN(jum$) + 7: INPUT "onde jogar"; pj$
pj$ = UCASE$(pj$)
CLS
SELECT CASE pj$
CASE "A1", "1A": a$ = "X"
CASE "A2", "2A": b$ = "X"
CASE "A3", "3A": c$ = "X"
CASE "B1", "1B": d$ = "X"
CASE "B2", "2B": e$ = "X"
CASE "B3", "3B": f$ = "X"
CASE "C1", "1C": g$ = "X"
CASE "C2", "2C": h$ = "X"
CASE "C3", "3C": i$ = "X"
CASE ELSE: GOTO 1
END SELECT
FOR v = 1 TO 4
2 PRINT "        ษอออออหอออออหอออออป"
PRINT "        บ  A  บ  B  บ  C  บ"
PRINT "        ศอออออสอออออสอออออผ"
PRINT "ษอออออป"
PRINT "บ  1  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  2  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  3  บ       ณ     ณ"
PRINT "ศอออออผ"
IF a$ = "X" THEN COLOR 2
IF a$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 12: PRINT a$
IF b$ = "X" THEN COLOR 2
IF b$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 12: PRINT b$
IF c$ = "X" THEN COLOR 2
IF c$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 12: PRINT c$
IF d$ = "X" THEN COLOR 2
IF d$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 18: PRINT d$
IF e$ = "X" THEN COLOR 2
IF e$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 18: PRINT e$
IF f$ = "X" THEN COLOR 2
IF f$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 18: PRINT f$
IF g$ = "X" THEN COLOR 2
IF g$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 24: PRINT g$
IF h$ = "X" THEN COLOR 2
IF h$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 24: PRINT h$
IF i$ = "X" THEN COLOR 2
IF i$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 24: PRINT i$
COLOR 7
IF a$ = "X" AND b$ = "X" AND c$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 7, 12: PRINT b$
COLOR 18: LOCATE 9, 12: PRINT c$
GOTO 101
END IF
IF d$ = "X" AND e$ = "X" AND f$ = "X" THEN
COLOR 18: LOCATE 5, 18: PRINT d$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 9, 18: PRINT f$
GOTO 101
END IF
IF g$ = "X" AND h$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 5, 24: PRINT g$
COLOR 18: LOCATE 7, 24: PRINT h$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF a$ = "X" AND d$ = "X" AND g$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 5, 18: PRINT d$
COLOR 18: LOCATE 5, 24: PRINT g$
GOTO 101
END IF
IF b$ = "X" AND e$ = "X" AND h$ = "X" THEN
COLOR 18: LOCATE 7, 12: PRINT b$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 7, 24: PRINT h$
GOTO 101
END IF
IF c$ = "X" AND f$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 9, 12: PRINT c$
COLOR 18: LOCATE 9, 18: PRINT f$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF a$ = "X" AND e$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF c$ = "X" AND e$ = "X" AND g$ = "X" THEN
COLOR 18: LOCATE 9, 12: PRINT c$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 5, 24: PRINT g$
GOTO 101
END IF
LOCATE 11 + jadois, 1: PRINT jdois$; " (O),"
LOCATE 11 + jadois, LEN(jdois$) + 7: INPUT "onde jogar"; o$
o$ = UCASE$(o$)
CLS
IF a$ = "X" AND o$ = "A1" OR a$ = "X" AND o$ = "1A" THEN GOTO 21
IF b$ = "X" AND o$ = "A2" OR b$ = "X" AND o$ = "2A" THEN GOTO 21
IF c$ = "X" AND o$ = "A3" OR c$ = "X" AND o$ = "3A" THEN GOTO 21
IF d$ = "X" AND o$ = "B1" OR d$ = "X" AND o$ = "1B" THEN GOTO 21
IF e$ = "X" AND o$ = "B2" OR e$ = "X" AND o$ = "2B" THEN GOTO 21
IF f$ = "X" AND o$ = "B3" OR f$ = "X" AND o$ = "3B" THEN GOTO 21
IF g$ = "X" AND o$ = "C1" OR g$ = "X" AND o$ = "1C" THEN GOTO 21
IF h$ = "X" AND o$ = "C2" OR h$ = "X" AND o$ = "2C" THEN GOTO 21
IF i$ = "X" AND o$ = "C3" OR i$ = "X" AND o$ = "3C" THEN GOTO 21
IF a$ = "O" AND o$ = "A1" OR a$ = "O" AND o$ = "1A" THEN GOTO 22
IF b$ = "O" AND o$ = "A2" OR b$ = "O" AND o$ = "2A" THEN GOTO 22
IF c$ = "O" AND o$ = "A3" OR c$ = "O" AND o$ = "3A" THEN GOTO 22
IF d$ = "O" AND o$ = "B1" OR d$ = "O" AND o$ = "1B" THEN GOTO 22
IF e$ = "O" AND o$ = "B2" OR e$ = "O" AND o$ = "2B" THEN GOTO 22
IF f$ = "O" AND o$ = "B3" OR f$ = "O" AND o$ = "3B" THEN GOTO 22
IF g$ = "O" AND o$ = "C1" OR g$ = "O" AND o$ = "1C" THEN GOTO 22
IF h$ = "O" AND o$ = "C2" OR h$ = "O" AND o$ = "2C" THEN GOTO 22
IF i$ = "O" AND o$ = "C3" OR i$ = "O" AND o$ = "3C" THEN GOTO 22
SELECT CASE o$
CASE "A1", "1A": a$ = "O"
CASE "A2", "2A": b$ = "O"
CASE "A3", "3A": c$ = "O"
CASE "B1", "1B": d$ = "O"
CASE "B2", "2B": e$ = "O"
CASE "B3", "3B": f$ = "O"
CASE "C1", "1C": g$ = "O"
CASE "C2", "2C": h$ = "O"
CASE "C3", "3C": i$ = "O"
CASE ELSE: GOTO 2
END SELECT
jadois = 0
3 PRINT "        ษอออออหอออออหอออออป"
PRINT "        บ  A  บ  B  บ  C  บ"
PRINT "        ศอออออสอออออสอออออผ"
PRINT "ษอออออป"
PRINT "บ  1  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  2  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  3  บ       ณ     ณ"
PRINT "ศอออออผ"
IF a$ = "X" THEN COLOR 2
IF a$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 12: PRINT a$
IF b$ = "X" THEN COLOR 2
IF b$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 12: PRINT b$
IF c$ = "X" THEN COLOR 2
IF c$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 12: PRINT c$
IF d$ = "X" THEN COLOR 2
IF d$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 18: PRINT d$
IF e$ = "X" THEN COLOR 2
IF e$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 18: PRINT e$
IF f$ = "X" THEN COLOR 2
IF f$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 18: PRINT f$
IF g$ = "X" THEN COLOR 2
IF g$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 24: PRINT g$
IF h$ = "X" THEN COLOR 2
IF h$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 24: PRINT h$
IF i$ = "X" THEN COLOR 2
IF i$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 24: PRINT i$
COLOR 7
IF a$ = "O" AND b$ = "O" AND c$ = "O" THEN
COLOR 19: LOCATE 5, 12: PRINT a$
COLOR 19: LOCATE 7, 12: PRINT b$
COLOR 19: LOCATE 9, 12: PRINT c$
GOTO 102
END IF
IF d$ = "O" AND e$ = "O" AND f$ = "O" THEN
COLOR 19: LOCATE 5, 18: PRINT d$
COLOR 19: LOCATE 7, 18: PRINT e$
COLOR 19: LOCATE 9, 18: PRINT f$
GOTO 102
END IF
IF g$ = "O" AND h$ = "O" AND i$ = "O" THEN
COLOR 19: LOCATE 5, 24: PRINT g$
COLOR 19: LOCATE 7, 24: PRINT h$
COLOR 19: LOCATE 9, 24: PRINT i$
GOTO 102
END IF
IF a$ = "O" AND d$ = "O" AND g$ = "O" THEN
COLOR 19: LOCATE 5, 12: PRINT a$
COLOR 19: LOCATE 5, 18: PRINT d$
COLOR 19: LOCATE 5, 24: PRINT g$
GOTO 102
END IF
IF b$ = "O" AND e$ = "O" AND h$ = "O" THEN
COLOR 19: LOCATE 7, 12: PRINT b$
COLOR 19: LOCATE 7, 18: PRINT e$
COLOR 19: LOCATE 7, 24: PRINT h$
GOTO 102
END IF
IF c$ = "O" AND f$ = "O" AND i$ = "O" THEN
COLOR 19: LOCATE 9, 12: PRINT c$
COLOR 19: LOCATE 9, 18: PRINT f$
COLOR 19: LOCATE 9, 24: PRINT i$
GOTO 102
END IF
IF a$ = "O" AND e$ = "O" AND i$ = "O" THEN
COLOR 19: LOCATE 5, 12: PRINT a$
COLOR 19: LOCATE 7, 18: PRINT e$
COLOR 19: LOCATE 9, 24: PRINT i$
GOTO 102
END IF
IF c$ = "O" AND e$ = "O" AND g$ = "O" THEN
COLOR 19: LOCATE 9, 12: PRINT c$
COLOR 19: LOCATE 7, 18: PRINT e$
COLOR 19: LOCATE 5, 24: PRINT g$
GOTO 102
END IF
LOCATE 11 + jaum, 1: PRINT jum$; " (X),"
LOCATE 11 + jaum, LEN(jum$) + 7: INPUT "onde jogar"; u$
u$ = UCASE$(u$)
CLS
IF a$ = "O" AND u$ = "A1" OR a$ = "O" AND u$ = "1A" THEN GOTO 12
IF b$ = "O" AND u$ = "A2" OR b$ = "O" AND u$ = "2A" THEN GOTO 12
IF c$ = "O" AND u$ = "A3" OR c$ = "O" AND u$ = "3A" THEN GOTO 12
IF d$ = "O" AND u$ = "B1" OR d$ = "O" AND u$ = "1B" THEN GOTO 12
IF e$ = "O" AND u$ = "B2" OR e$ = "O" AND u$ = "2B" THEN GOTO 12
IF f$ = "O" AND u$ = "B3" OR f$ = "O" AND u$ = "3B" THEN GOTO 12
IF g$ = "O" AND u$ = "C1" OR g$ = "O" AND u$ = "1C" THEN GOTO 12
IF h$ = "O" AND u$ = "C2" OR h$ = "O" AND u$ = "2C" THEN GOTO 12
IF i$ = "O" AND u$ = "C3" OR i$ = "O" AND u$ = "3C" THEN GOTO 12
IF a$ = "X" AND u$ = "A1" OR a$ = "X" AND u$ = "1A" THEN GOTO 111
IF b$ = "X" AND u$ = "A2" OR b$ = "X" AND u$ = "2A" THEN GOTO 111
IF c$ = "X" AND u$ = "A3" OR c$ = "X" AND u$ = "3A" THEN GOTO 111
IF d$ = "X" AND u$ = "B1" OR d$ = "X" AND u$ = "1B" THEN GOTO 111
IF e$ = "X" AND u$ = "B2" OR e$ = "X" AND u$ = "2B" THEN GOTO 111
IF f$ = "X" AND u$ = "B3" OR f$ = "X" AND u$ = "3B" THEN GOTO 111
IF g$ = "X" AND u$ = "C1" OR g$ = "X" AND u$ = "1C" THEN GOTO 111
IF h$ = "X" AND u$ = "C2" OR h$ = "X" AND u$ = "2C" THEN GOTO 111
IF i$ = "X" AND u$ = "C3" OR i$ = "X" AND u$ = "3C" THEN GOTO 111
SELECT CASE u$
CASE "A1", "1A": a$ = "X"
CASE "A2", "2A": b$ = "X"
CASE "A3", "3A": c$ = "X"
CASE "B1", "1B": d$ = "X"
CASE "B2", "2B": e$ = "X"
CASE "B3", "3B": f$ = "X"
CASE "C1", "1C": g$ = "X"
CASE "C2", "2C": h$ = "X"
CASE "C3", "3C": i$ = "X"
CASE ELSE: GOTO 3
END SELECT
jaum = 0
NEXT v
PRINT "        ษอออออหอออออหอออออป"
PRINT "        บ  A  บ  B  บ  C  บ"
PRINT "        ศอออออสอออออสอออออผ"
PRINT "ษอออออป"
PRINT "บ  1  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  2  บ       ณ     ณ"
PRINT "ฬอออออน  ฤฤฤฤฤลฤฤฤฤฤลฤฤฤฤฤ"
PRINT "บ  3  บ       ณ     ณ"
PRINT "ศอออออผ"
IF a$ = "X" THEN COLOR 2
IF a$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 12: PRINT a$
IF b$ = "X" THEN COLOR 2
IF b$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 12: PRINT b$
IF c$ = "X" THEN COLOR 2
IF c$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 12: PRINT c$
IF d$ = "X" THEN COLOR 2
IF d$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 18: PRINT d$
IF e$ = "X" THEN COLOR 2
IF e$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 18: PRINT e$
IF f$ = "X" THEN COLOR 2
IF f$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 18: PRINT f$
IF g$ = "X" THEN COLOR 2
IF g$ = "O" THEN COLOR 3
LOCATE 5 + jaum + jadois, 24: PRINT g$
IF h$ = "X" THEN COLOR 2
IF h$ = "O" THEN COLOR 3
LOCATE 7 + jaum + jadois, 24: PRINT h$
IF i$ = "X" THEN COLOR 2
IF i$ = "O" THEN COLOR 3
LOCATE 9 + jaum + jadois, 24: PRINT i$
IF a$ = "X" AND b$ = "X" AND c$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 7, 12: PRINT b$
COLOR 18: LOCATE 9, 12: PRINT c$
GOTO 101
END IF
IF d$ = "X" AND e$ = "X" AND f$ = "X" THEN
COLOR 18: LOCATE 5, 18: PRINT d$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 9, 18: PRINT f$
GOTO 101
END IF
IF g$ = "X" AND h$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 5, 24: PRINT g$
COLOR 18: LOCATE 7, 24: PRINT h$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF a$ = "X" AND d$ = "X" AND g$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 5, 18: PRINT d$
COLOR 18: LOCATE 5, 24: PRINT g$
GOTO 101
END IF
IF b$ = "X" AND e$ = "X" AND h$ = "X" THEN
COLOR 18: LOCATE 7, 12: PRINT b$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 7, 24: PRINT h$
GOTO 101
END IF
IF c$ = "X" AND f$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 9, 12: PRINT c$
COLOR 18: LOCATE 9, 18: PRINT f$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF a$ = "X" AND e$ = "X" AND i$ = "X" THEN
COLOR 18: LOCATE 5, 12: PRINT a$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 9, 24: PRINT i$
GOTO 101
END IF
IF c$ = "X" AND e$ = "X" AND g$ = "X" THEN
COLOR 18: LOCATE 9, 12: PRINT c$
COLOR 18: LOCATE 7, 18: PRINT e$
COLOR 18: LOCATE 5, 24: PRINT g$
GOTO 101
END IF
COLOR 15: LOCATE 11, 1: PRINT "Velha..."
COLOR 7
100 GanhoVelha = GanhoVelha + 1
1111 INPUT "Mais uma (S/N)"; maisvelha$
maisvelha$ = UCASE$(maisvelha$)
IF maisvelha$ = "S" THEN GOTO 11
IF maisvelha$ = "N" THEN GOTO 1000
GOTO 1111
101 LOCATE 11, 1: COLOR 15: PRINT jum$; " ganhou!"
COLOR 7
IF orjum$ = jum$ THEN GanhoUm = GanhoUm + 1
IF orjum$ <> jum$ THEN GanhoDois = GanhoDois + 1
1001 INPUT "Mais uma (S/N)"; maisum$
maisum$ = UCASE$(maisum$)
IF maisum$ = "S" THEN GOTO 11
IF maisum$ = "N" THEN GOTO 1000
GOTO 1001
102 LOCATE 11, 1: COLOR 15: PRINT jdois$; " ganhou!"
COLOR 7
IF orjdois$ = jdois$ THEN GanhoDois = GanhoDois + 1
IF orjdois$ <> jdois$ THEN GanhoUm = GanhoUm + 1
1002 INPUT "Mais uma (S/N)"; maisdois$
maisdois$ = UCASE$(maisdois$)
IF maisdois$ = "S" THEN GOTO 11
IF maisdois$ = "N" THEN GOTO 1000
GOTO 1002
111 BEEP
PRINT "Voce ja jogou na casa "; u$
jaum = 1
GOTO 3
12 BEEP
PRINT jdois$; " ja jogou na casa "; u$
jaum = 1
GOTO 3
21 BEEP
PRINT jum$; " ja jogou na casa "; o$
jadois = 1
GOTO 2
22 BEEP
PRINT "Voce ja jogou na casa "; o$
jadois = 1
GOTO 2
1000 CLS
COLOR 2
LOCATE 10, 30: PRINT "Placar final:"
COLOR 7
LOCATE 12, 30: PRINT orjum$; ": "; GanhoUm
LOCATE 13, 30: PRINT orjdois$; ": "; GanhoDois
LOCATE 14, 30: PRINT "Velha: "; GanhoVelha
COLOR 31
IF GanhoUm > GanhoDois THEN LOCATE 15, 30: PRINT orjum$; " ganhou!"
IF GanhoUm < GanhoDois THEN LOCATE 15, 30: PRINT orjdois$; " ganhou!"
IF GanhoUm = 0 AND GanhoDois = 0 AND GanhoVelha > 0 THEN LOCATE 15, 30: PRINT "A velha ganhou..."
IF GanhoUm = GanhoDois AND GanhoUm > 0 AND GanhoDois > 0 THEN LOCATE 15, 30: PRINT "Empate!"
COLOR 4

SUB Intro
CLS
RANDOMIZE TIMER
rox = INT(RND * 2) + 1
rcor = INT(RND * 2) + 1
HorizO$ = " O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O"
HorizX$ = " X   X   X   X   X   X   X   X   X   X   X   X   X   X   X   X   X   X   X   X"
IF rcor = 1 THEN COLOR 18
IF rcor = 2 THEN COLOR 22
IF rox = 1 THEN LOCATE 1, 1: PRINT HorizX$
IF rox = 1 THEN LOCATE 21, 1: PRINT HorizX$
IF rox = 2 THEN LOCATE 1, 1: PRINT HorizO$
IF rox = 2 THEN LOCATE 21, 1: PRINT HorizO$
FOR loca = 3 TO 20 STEP 2
IF rcor = 1 THEN COLOR 22
IF rcor = 2 THEN COLOR 18
IF rox = 1 THEN LOCATE loca, 2: PRINT "O"
IF rox = 2 THEN LOCATE loca, 2: PRINT "X"
IF rox = 1 THEN LOCATE loca, 78: PRINT "O"
IF rox = 2 THEN LOCATE loca, 78: PRINT "X"
NEXT loca
COLOR 15
LOCATE 3, 25: PRINT "JOGO DA VELHA, V2.5"
COLOR 3
LOCATE 6, 9: PRINT "Jogue digitando as coordenadas da casa onde quiser jogar, na ordem"
LOCATE 7, 5: PRINT "<letra><numero> ou <numero><letra>. Exemplo: B2 ou 2B. A cada rodada,"
LOCATE 8, 5: PRINT "a ordem e o simbolo dos jogadores mudam e o placar aumenta a cada"
LOCATE 9, 5: PRINT "vitoria ou quando der velha."
LOCATE 10, 9: PRINT "Se voce tiver alguma critica ou sugestao, ou ainda souber de algum"
LOCATE 11, 5: PRINT "BUG, avise-me."
LOCATE 13, 5: PRINT "OBS: Este jogo so' pode ser jogado por 2 pessoas."
COLOR 15
LOCATE 19, 20: PRINT "Copyright ธ Andre Willik Valenti 1999"
COLOR 4
LOCATE 23, 1: PRINT "Pressione qualquer tecla para iniciar o jogo..."
COLOR 7
DO: LOOP WHILE INKEY$ = ""
END SUB

