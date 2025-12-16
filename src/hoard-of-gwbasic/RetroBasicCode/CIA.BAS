0    KEY OFF:COLOR 3:CLS:DIM OBP$(5,50),OBC$(50)
1 OP=0:P=1:N=4:OC=0
2 OBP$(5,1)="RIE":OBP$(2,1)="BAL"
3 EP$=STRING$(160," ")
1000 REM   BOUCLE D'ENTREE DE L'ORDRE DU HEROS
1010 LOCATE 22,1:PRINT EP$:LOCATE 22,1:INPUT "Que fais-je ? ",A$
1020 OD$ = LEFT$(A$,3)
1022 IF OD$="PRE" THEN AZ=1:GOTO 1060
1024 IF OD$="POS" THEN AZ=2:GOTO 1060
1026 IF OD$="REG" THEN AZ=3:GOTO 1060
1028 IF OD$="I" OR OD$="INV" THEN 60030
1030 IF OD$="EXA" THEN AZ=4:GOTO 1060
1032 IF OD$="N" THEN
1034 IF OD$="S" THEN
1036 IF OD$="O" THEN
1038 IF OD$="E" THEN
1040 IF OD$="VA" THEN AZ=5:GOTO 1060
1050 LOCATE 22:PRINT "DESOLER !!!! Je n'est pas compris (app sur une touche )";
1051 A$=INKEY$:IF A$="" THEN 1051 ELSE 1000
1060 FOR R=1 TO LEN(A$):IF MID$(A$,R,1)=" " THEN 1070 ELSE NEXT
1062 GOTO 1050
1070 OD$=MID$(A$,R+1,3):R1=LEN(A$)-R:OD1$=MID$(A$,R+1,R1)
1080 ON AZ GOTO 1090,1110,1130,1150,1160
1089 '   ****    il veut predre ...... ***      ***        ****           ******
1090 IF OP >= N THEN LOCATE 22:PRINT "impossible vous avez d‚j…";N;"OBJETS (App sur une touche )";:GOTO 1051
1091 IF P<>0 THEN FOR I=1 TO 5 ELSE 1097
1092 IF OBP$(I,P)=OD$ THEN 1093 ELSE NEXT :LOCATE 22,1:PRINT "il n'y a pas cette objet ici (App sur une touche)";:GOTO 1051
1093 LOCATE 22:PRINT "      OK !?  je vais le prendre ...  (APP sur une touche)";
1094  OP=OP+1:OP$(OP)=OD1$:OBP$(I,P)=""
1095 ' ******** NE PAS OUBLIER DE LE RETIRER DE L'ECRANT *********
1096 GOTO 1051
1097 FOR I=1 TO OC
1098 IF LEFT$(OBC$(I),3)=OD$ THEN 1099 ELSE NEXT :LOCATE 22,1:PRINT "il n'y a pas cette objet ici (App sur une touche)";:GOTO 1051
1099 LOCATE 22:PRINT "      OK !?  je vais le prendre ...  (APP sur une touche)";
1100 GOSUB 60050 :OP=OP+1:OP$(OP)=OD1$:GOTO 1051
1109 '   **** IL VEUT POSER UN OBJET *** **** *** *** ** ** * * * * * ** * *  **
1110 OP=OP-1:GOSUB 60000 :IF P<>  0 THEN LOCATE 22,1:PRINT "si VOUS voulez CONSERVER l'objet il faut que vous soyer dans la chamdre debara  or vous ni ˆtes pas  -- Continuer vous O/ou une touche ? -- "; ELSE 1112
1111 A$=INKEY$:IF A$="" THEN 1111 ELSE IF A$<>"o" AND A$ <>"O" THEN 1000 ELSE LOCATE 22:PRINT "           --- VOUS PERDEZ CETTE OBJET ?!!!!????.... ---                        ";:GOSUB 60040:GOTO 1051
1112 LOCATE 22:PRINT EP$:LOCATE 22:PRINT " OK JE POSE ";OD1$;" (app sur une touche)"
1114 OC= OC +1:OBC$(OC)=OD1$:GOSUB 60040:GOTO 1051
60000 '|||||||||||||||| controle de POSSETION DE L'OBJET |||||||||||||||||||||||
60010 FOR I=1 TO N
60020 IF LEFT$(OP$(I),3)=OD$ THEN RETURN ELSE NEXT :LOCATE 22:PRINT " =-= d‚sol‚ vous ne possedez pas cette objet =-= (App sur une touche)":GOTO 1051
60029 '||||||||||||||||||||||||||||||||| I N V E N T A I R E ...................
60030 IF OP$(1)="" THEN LOCATE 22:PRINT " nous avons rien du tout (app sur une touche)":GOTO 1051 ELSE  FOR I=1 TO N:LOCATE 22:PRINT OP$(I);" ,";:NEXT :LOCATE 23:PRINT "app sur une touche ":GOTO 1051
60039 '|||||||||||||||| elimine un objet posseder ||||||||||||||||||||||||||||||
60040 FOR I=1 TO N
60041 IF OD1$=OP$(I) THEN 60042 ELSE NEXT
60042 OP$(I)="":FOR J=I TO N-1
60043 OP$(J)=OP$(J+1):NEXT:RETURN
60049 '|||||||||||||||| elimine un objet CACHE    ||||||||||||||||||||||||||||||
60050 FOR I=1 TO OC
60051 IF OD1$=OBC$(I) THEN 60052 ELSE NEXT
60052 OBC$(I)="":FOR J=I TO OC-1
60053 OBC$(J)=OBC$(J+1):OC=OC-1:NEXT:RETURN
