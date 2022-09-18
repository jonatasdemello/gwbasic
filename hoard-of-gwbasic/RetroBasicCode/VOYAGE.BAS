0 DIM T1(1225),T2(400),T3(1225),T4(286),P(10)
1 REM ||||||||||||||||||   UN VOYAGE DE L'ICONUE |||||||||||||||||||||||||||||||
2 SCREEN 8:GOSUB 60000:GOTO 64:SCREEN 2:SCREEN 0:COLOR 13,0,0:CLS:KEY OFF:LOCATE ,,7,0,7:PRINT:PRINT
3 PRINT  "              B O N J O U R  !!!!!! "
4 PRINT :PRINT  " Avez - vous charchez kick/M O ou N ":PRINT :COLOR 20
5 A$=INKEY$:IF A$="" THEN 5 ELSE IF A$= "o" OR A$="O" THEN 6 ELSE 7
6 PRINT  " VOUS DEVEZ RELANCEZ LE SYSTEME << CTRL - ALT - DELETE >> ": STOP
7 REM
8 REM
9 REM
10 COLOR 3:PRINT :PRINT
15 PRINT :PRINT " V O U L E Z - V O U S  L E S  E X P L I C A T I O N S  O / N "
16 A$=INKEY$:IF A$="" THEN 16 ELSE IF A$= "o" OR A$="O" THEN 20 ELSE 30
20 COLOR 9:CLS:PRINT :PRINT :PRINT  "              U N   V O Y A G E   D E   L ' I N C O N U E "
21 COLOR 2:PRINT :PRINT " Ceci est un jeu qui se passe dans une ville I N C A ,nous sommes en 2548        vous poss‚dez d'une corde ,d'un cadrant solair ,d'une lampe de poche ,un peu    d'argent : 2000 Frs "
22 COLOR 3:PRINT :PRINT " Tout au long de cette aventure vous pourez trouver des objets, de l'argent ,    des parchemins , des indices etc... "
23 COLOR 4:PRINT:PRINT  " L'ecrant sera diviser en deux partie : partie TEXTE ,partie GRAPHISME.          Pour vous deplacer ,vous utiliserez les chiffres,pour realiser  des actions     vous utiliserez les lettre qui seront indiqu‚es (ex A pour prendr"
24 PRINT     "clef ect.)":PRINT
25 COLOR 20:PRINT " Pour sortir du jeux : ";:COLOR 5:PRINT " 0 ":PRINT
26 PRINT  " App Sur une touche pour commencer Bonne Chance "
27 A$=INKEY$:IF A$="" THEN 27 ELSE IF A$="0" OR A$="…" THEN SYSTEM
30 SCREEN 6:CLS:COLOR 2
31 PRINT :PRINT " Ce matin - la vous ˆtes … Paris ,vous avez d‚j… pris votre petit d‚jeuner ...   Quand soudain sous votre porte une lettre si glissa . "
32 PRINT :PRINT  " -A- pour ouvrir la porte et regarder qui a gliss‚ cette lettre "
33 PRINT  " -B- pour ouvrir la lettre et la lire  "
34 PALETTE 1,6:PALETTE 2,3
35 LINE (1,100)-(639,199),1,B:LINE (2,101)-(229,139),2,BF:LINE (411,101)-(638,139),2,BF
36 LINE (229,101)-(411,159),1,BF:LINE (2,159)-(639,199),2,BF:LINE (250,159)-(240,179):LINE -(320,179):LINE -(330,159):LINE -(250,159):PAINT (301,161),3:LINE (250,159)-(320,179),0:LINE (330,159)-(240,179),0
37 GOSUB 9000
38 IF A$="A" THEN 39 ELSE IF A$="B" THEN 40 ELSE GOTO 37
39 CLS:LOCATE 11,1:PRINT  "   Vous ouvrez la porte d'un geste rapide et sec , mais  Helas ...               Vous regarder les  portes de l'ascenseur qui se ferment d'un air d‚sesp‚r‚ ..   Vous ouvrez l'enveloppe et ..... ":PLAY "P1P1P1P1":GOTO 40
40 COLOR 1,15:PALETTE 1,0:PALETTE 3,13
41 CLS:PRINT :PRINT "                          B O N J O U R .... " :PRINT
42 PRINT  "     Je vous derange peut ˆtre ,M A I S ce que j'ai a vous dire est plus         I M P O R T A N T que le reste : effet je vous engage a rechercher … TILKA      une statuette d'une  grande importance car en effet celle - ci pourrait  "
43 PRINT  " sauver la vie hummaine du monde en entier ":PRINT :PRINT "     A T T E N T I O N  cette mission est tres dangereuse car la ville inca      possŠde de nombreux pieges : il faudra trouvez 7 clefs qui serons cacher dans   la ville ":PRINT
44 PRINT  "    Dans cette lettre vous trouverez un billet d'avion pour 9h00 … ORLY                                     d‚p‚chez-vous !!! ":PRINT
45 PRINT "     AH ,j'oubliait nous n'avons pas pu se procurer un plan ,et vous disposer de     2000 frs":PRINT :PRINT "                       C O N S E I L S"
46 PRINT :PRINT "        I pour inventŠre  "
47 PRINT "        S pour somme d'argent possed‚e "
48 S=2000:PRINT :PRINT  "APP sur une Touche ... ":GOSUB 9000
50 COLOR ,0:PALETTE 1,6:PALETTE 2,5:PALETTE 3,14
51 CLS :PRINT
52 PRINT  "  Comme la lettre vous la conseill‚ vous vous d‚pechez pour sauter dans l'avion  9h00 pour Tilka . ":PLAY "p4":PRINT
53 PRINT "  Vous ˆtes maintenant dans le taxi , votre coeur bat de plus en plus fort car   cela faisait longtemps que vous n'avier pas fais de mission de ce genre ":PLAY "p4":PRINT
54 PRINT "  Voila vous ˆtes … Orly ,vous courez le plus possible parce qu il est 8h40  ":PLAY "p4":PRINT :PRINT  "  Enfin dans l'avion quel soulagement Vous ne l'avez pas ratter ... "
55 PRINT:PRINT :PLAY "p2":PRINT  " 10 h sont pass‚es ,vous ˆtes … Tilka ,vous descendez de l'avion puis            puis vous apercevez une voiture qui vous attend . Personne au alentour !?.      Le pillote de l'avion dit << Cette voiture je l'ai amm‚"
56 PRINT " ici car dans ce coin  il y a personne … 200 KM … la ronde ...>> ,puis il parti  ":PRINT "   vous p‚n‚trez dans la voiture ... une lettre blanche attir vos yeux , vous    la prenez  puis vous la lisez ...."
57 COLOR 3:PRINT :PRINT " app sur une touche  ....":GOSUB 9000
58 CLS:COLOR 1,15:PALETTE 1,0:PRINT :PRINT  "                           B O N S O I R ! ! ! ":PRINT
59 PRINT "   M E R C I d'avoir accept‚ cette mission . Cette voiture contient de la        nouriture pour un moi,4 bidons d'essence,5 bouteilles de gaz pour rechaud, des  ustensiles pour la cuisine ,une radio qui se connect sur satelite,sa frequence"
60 PRINT " est de 50 Mhz .Dans le coffre arriŠre il a y une tente et deux duvets ":PRINT :PRINT "                             signer l ' X
61 LINE (1,90)-(640,200),1,BF
62 PLAY "p1p1p1p1p1p1p1p1":COLOR 2,0:LOCATE 12:PRINT "   Vous repliez la lettre et vous commencez … vous instaler prŠs d'un abre       Puis aprŠs avoir lu le compliqu‚ mode d'emplois vous instalez la radio ":PLAY "p2"
63 PRINT "  Apres avoir cuisin‚ un bon petit plat ,vous le mangez car vous avez            enorm‚ment faim .En suite vous vous couchez tranquillemant ....":PLAY "p1p2":PRINT " app sur une touche pour vous reveillez !!!! ":GOSUB 9000
64 CLS:PALETTE 1,6:PALETTE 2,14:PALETTE 3,2
65 PRINT :PRINT  "   Le landemain matin vous vous reveiller tr‚s t“t car vous savez que vous avez  du pain la planche,vous d‚jeunez tr‚s vite et vous contempler le paysage pour   savoir par o— vous allez commencer : "
66 PRINT  "choisissez le numero correspondant a ce que vous voulez voir : "
67 LINE (1,50)-(639,199),1,B
68 LINE (1,100)-(200,100),1:LINE -(300,150),1:LINE -(639,150),1:PAINT (320,175),3,1
69 PUT (50,70),T1:PUT (400,130),T2:PUT (520,120),T3:PUT (400,170),T4
70 LOCATE 14,7:PRINT "1":LOCATE 20,52:PRINT "2":LOCATE 20,66:PRINT "3":LOCATE 24,52:PRINT "4";:LOCATE 5
71 GOSUB 9000
72 IF A$="1" OR A$="&" THEN 80
73 'IF A$="2" OR A$="‚" OR A$="`" THEN '"???"
74 'IF A$="3" THEN '"???"
75 'IF A$="'" OR A$="|" OR A$="4" THEN '"???"
76 GOTO 71
80 CLS::PALETTE 3,6:PALETTE 1,13:COLOR 1:PRINT :PRINT
81 PRINT  " Apres un bon bout de marche  vous arrivez avotre but.Vous contemplez le temple  avec stuppeur .Il est gigantesque ... Vous avez face a vous un grand escalier   sur les deux cot‚s il y a rien : Qu'allez-vous faire ?"
82 PRINT  " ( 1 pour monter les esc. 2 pour rebrousser le chemin ) "
83 LINE (1,50)-(639,199),1,B:LINE (120,150)-(540,199),3,BF:LINE (170,100)-(470,150),2,BF:LINE (220,50)-(420,100),1,BF:LINE (270,70)-(370,100),0,BF:LINE (270,100)-(170,199),1:LINE -(470,199),1:LINE -(370,100),1:LINE -(270,100),1:PAINT (275,120),1
84 GOSUB 9000
85 IF A$="1" OR A$="&" THEN 90
86 IF A$="2" OR A$="‚" OR A$="`" THEN 88
87 GOTO 84
88 CLS:PALETTE 1,6:PALETTE 2,14:PALETTE 3,2
89 PRINT "  Reflexion faite ce lieu vous parrait banal alors vous partez vers le camp ":GOTO 66
90 CLS:PALETTE 1,8:PALETTE 3,4:COLOR 3
91 PRINT " Vous ˆtes dans une piece sombre . 1 pour analyser les murs 2 pour retourner au  camp";:IF C(4)=0 THEN PRINT "3 pour prendre la clef "
92 LINE (1,50)-(639,199),1,B:LINE (70,80)-(560,169),1,BF:LINE (1,50)-(70,80),1:LINE (639,199)-(560,169),1:LINE (70,169)-(1,199),1:LINE (560,80)-(639,50),1:PAINT (25,70),1:PAINT (600,80),1:LINE (290,110)-(330,169),0,B,15:LINE (70,80)-(560,169),0,B
93 GOSUB 9000
94 IF A$="2" OR A$="`" OR A$="‚" THEN 88
95 IF A$="&" OR A$="1" THEN 98
96 'IF A$="3" AND C(4)=0 THEN  '"???"
98 CLS:PRINT " VOUS analysez les murs minussiosement quand soudin vous declanchez un systeme   qui ouvre une porte. 1 pour y entrer 2 pour la refermer "
99 LINE (215,20)-(435,199),1,B:LINE (290,80)-(360,139),1,B:LINE (215,20)-(290,80),1:LINE(435,199)-(360,139),1:LINE (215,199)-(290,139),1:LINE (435,20)-(360,80),1:LINE (1,20)-(215,199),1,BF:LINE (435,20)-(639,199),1,BF
100 GOSUB 9000
101 IF A$= "&" OR A$= "1" THEN  goto 105
102 IF A$= "`" OR A$= "‚" OR A$="2" THEN goto 98
103 GOTO 100
104 ' ***                                                                    ***
105 '
9000 REM |||||||||||||||||||| I T E R S E C T I O N ||||||||||||||||||||||||||||
9001 A$=INKEY$ ':IF A$="" THEN 9001 ELSE IF A$="0" OR A$="…" THEN 'SAVE "voyage":SYSTEM
9002 'IF A$="i" OR A$="I" THEN
9003 IF A$="s" OR A$="S" THEN PRINT " Somme d'argent = ";S:PLAY "p2":PRINT "votre choix ":GOTO 9001
9090 RETURN
60000 CLS:LOCATE 10
60010 LINE (1,15)-(1,20),1:LINE -(20,20),1:LINE -(20,14),1:LINE (2,12)-(2,15),1:LINE (3,12)-(3,5),1:LINE (4,5)-(4,2),1:LINE -(9,2),1:LINE -(9,5),1:LINE (10,5)-(10,8),1:LINE -(12,8),1:LINE (6,10)-(14,10),1:LINE (14,9)-(17,9),1:LINE (19,10)-(19,14),1
60011 LINE (5,11)-(5,15),1:LINE -(14,15),1:LINE -(14,10),1:PSET (6,2),1:PSET(7,2),1:PSET (17,8),1:PSET(11,9),1:PSET (18,10),1:PSET (9,11),1:PSET (10,11),1:PSET(13,11),1:PSET (20,11),1:PSET (4,11),1:PSET (2,13),1:PSET (6,13),1:PSET (13,13),1:PSET(9,14)
60020 PAINT (7,7),1:PAINT (13,17),1:PAINT (9,13),0
60030 GET (1,1)-(20,20),T2
60040 CLS:LOCATE 10:LINE (24,5)-(27,13),3,BF:LINE (7,9)-(10,12),3,BF:LINE(6,12)-(11,19),2,BF:LINE (3,19)-(14,24),2,BF:LINE (1,24)-(16,30),1,BF:LINE (22,13)-(29,24),2,BF :LINE (19,24)-(30,30),1,BF
60050 GET (1,1)-(30,30),T3
60060 CLS:LOCATE 10:LINE (7,9)-(10,12),2,BF:LINE(6,12)-(11,19),2,BF:LINE (3,19)-(14,24),2,BF:LINE (1,24)-(16,30),2,BF:LINE (16,25)-(30,30),2:LINE -(16,30),2:PAINT (20,28),1,2
60070 GET (1,1)-(30,30),T1
60074 CLS:LOCATE 10:LINE (3,19)-(14,24),2,BF:LINE (1,24)-(16,30),2,BF
60075 GET (1,19)-(16,30),T4
60080 RETURN
