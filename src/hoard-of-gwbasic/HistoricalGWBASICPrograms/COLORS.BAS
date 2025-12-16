10 CLS
20 A=-1
30 A=A+1:IF A=32 THEN PRINT"*** program terminated ***":END
40 COLOR A
45 GOSUB 999
50 PRINT"COLOR ";A;" - ";B$
60 GOTO 30
999 IF A=0 THEN B$="schwarz"
1000 IF A=1 THEN B$="dunkelblau"
1010 IF A=2 THEN B$="grÅn"
1020 IF A=3 THEN B$="hellblau"
1030 IF A=4 THEN B$="rot"
1040 IF A=5 THEN B$="violett"
1050 IF A=6 THEN B$="braun"
1060 IF A=7 THEN B$="wei·"
1070 IF A=8 THEN B$="grau"
1080 IF A=9 THEN B$="blau"
1090 IF A=10 THEN B$="hellgrÅn"
1100 IF A=11 THEN B$="hellblau"
1110 IF A=12 THEN B$="hellrot"
1120 IF A=13 THEN B$="hellviolett"
1130 IF A=14 THEN B$="gelb"
1140 IF A=15 THEN B$="hellwei·"
1150 IF A=16 THEN B$="schwarz [blinkend]"
1160 IF A=17 THEN B$="dunkelblau [blinkend]"
1170 IF A=18 THEN B$="grÅn [blinkend]"
1180 IF A=19 THEN B$="blau [blinkend]"
1190 IF A=20 THEN B$="rot [blinkend]"
1200 IF A=21 THEN B$="violett [blinkend]"
1210 IF A=22 THEN B$="braun [blinkend]"
1220 IF A=23 THEN B$="wei· [blinkend]"
1230 IF A=24 THEN B$="grau [blinkend]"
1240 IF A=25 THEN B$="hellblau [blinkend]"
1250 IF A=26 THEN B$="hellgrÅn [blinkend]"
1260 IF A=27 THEN B$="hellblau [blinkend]"
1270 IF A=28 THEN B$="hellrot [blinkend]"
1280 IF A=29 THEN B$="hellviolett [blinkend]"
1290 IF A=30 THEN B$="gelb [blinkend]"
1300 IF A=31 THEN B$="hellwei· [blinkend]"
10000 RETURN
