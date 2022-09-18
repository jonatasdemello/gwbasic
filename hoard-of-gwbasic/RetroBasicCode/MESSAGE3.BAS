DEFINT A-Z
'****************************************************************************
'**         Retourne dans la variable entre parenthŠse au moment de        **
'**                l'appel le segment d'adressage Vid‚o                    **
'**  Syntaxe : CALL ChercheSegment(ADR%) ==> LE SEGMENT sera mit dans ADR% **
'****************************************************************************
Sub ChercheSegment(SegEcr%) Static

  DEF SEG = &h40
  TE%=(PEEK(&h10) AND &h30):DEF SEG
  IF TE%=0 THEN PRINT " Programme non utilisable sur cette appareille ! [ECRAN] ":END
  IF TE%=&h30 Then SegEcr%=&hB000 Else SegEcr%=&hB800

End Sub

'----------------------------------------------------------------------------
'   Affiche un memu + un curseur et retourne le choix
'   Syntaxe CALL MENU(MENU$,LM%,X1%,Y1%,CN%,FN%,CI%,FI%,Chx%,MH%)
'
'  Menu$ = l'expression du menu      ex: "--FIN--**FIN**//FIN//"
'  LM%   = longueur d'un choix menu ici:  LM%=7
'  X1%,Y1% position du menu en caractŠre Attention au erreur ( Hors ‚cran )
'  CN%,FN% d‚ffinisse la couleur normal
'  CI%,FI% ""      "" "" ""   "" inverse
'  Chx%    est le retour du choix -1 quand c'est <ESC>
'  MH%=0 quand <- et -> non autoris‚s =-1 quand elles sont OK
'         dans ce cas Chx%  retourne    -> ===> -3
'                                       <- ===> -2
'                                    <ESC> ===> -1
'Cette Sub-routine Utilise ® SUb FAITUNCADRE() ¯ et conseill‚ ® CherSegment ¯
'----------------------------------------------------------------------------
Sub MENU(MENU$,L%,X1%,Y1%,CN%,FN%,CI%,FI%,Chx%,MH%,XT%,MXT%) Static

STATIC NT%,YT%,YTM%

NT%=INT(LEN(MENU$)/L%)
X2%=X1%+L%:Y2%=Y1%+NT%
If chx%<=0 then chx%=1

Call FaitUnCadre(X1%,Y1%,X2%,Y2%,CN%,FN%):COLOR CN%,FN%

    FOR I=1 TO NT
       Locate Y1%+I,X1%:PRINT MID$(MENU$,(I-1)*L%+1,L%)
    NEXT I

YT%=Chx%:YTM%=YT%:B$=chr$(0):T=0:A$="d"

   While T=0
	While A$="":A$=INKEY$:Wend

IF (A$="4" or A$=B$+"K") And XT% > 1    And MH% Then Chx%=-2:T=1
IF (A$="6" or A$=B$+"M") And XT% < MXT% And MH% Then Chx%=-3:T=1
IF (A$="2" or A$=B$+"P")                        Then YT%=YT%+1
IF (A$="8" or A$=B$+"H")                        Then YT%=YT%-1
IF A$=CHR$(27)                                  Then CHX%=-1 :T=1
IF A$=CHR$(13) or a$=" "                        Then CHX%=YT%:T=1
IF YT%>NT% THEN YT%=1
IF YT%<1 THEN YT%=NT%

	     Color CN%,FN%
	     Locate Y1%+YTM%,X1%:PRINT MID$(MENU$,(YTM%-1)*L%+1,L%)
	     Color CI%,FI%
	     Locate Y1%+YT% ,X1%:PRINT MID$(MENU$,(YT%-1)*L%+1,L%)
	     YTM%=YT%:Color CN%,FN%
	     A$=""
    Wend:End Sub

SUB FaitUnCadre(X1%,Y1%,X2%,Y2%,CN%,FN%) Static
Color CN%,FN%
SHARED SEGEC%
def seg = SegEC%
STATIC P1,P2,P3,P4,PX,PY,K%,CO%,I
 X1%=X1%-3:Y1%=Y1%-1
 P1=X1%*2+Y1%*160 : P2 =X2%*2+160*Y1% : P3 =X1%*2+160*Y2% : P4=X2%*2+160*Y2%
 PY = P3-P1 :PX= P2-P1:K%=-1:CO%=CN%+16*FN%

 FOR I=P1 TO P3 STEP 160
     POKE I+1,CO:POKE I+1+PX,CO:POKE I,186:POKE I+PX,186
     K%=K%+1:LOCATE Y1%+1+K%,X1%+2:PRINT STRING$(X2%-X1%-1,32);
 NEXT I

 FOR I=P1 TO P2 STEP 2:POKE I+1,CO:POKE I,205:POKE I+1+PY,CO:POKE I+PY,205
 NEXT I

 POKE P1,201:POKE P2,187:POKE P3,200:POKE P4,188:X1%=X1%+3:Y1%=Y1%+1

 FOR I=P2+160 TO P4+160 STEP 160:POKE I+3,7:NEXT I
 FOR I=P3+162 TO P4+160 STEP 2  :POKE I+1,7:NEXT I

End Sub


REM *********************** CONSTANTES et TABleau ***************************

DIM CH$(4)

'************************** OVERTURE DU FICHIER *****************************

OPEN "ñMEGñññ.ÿÿÿ" as #1 len = 128
FIELD #1,32 as L1$,32 as L2$,32 as L3$,32 as L4$
GET #1,1
NT = val(L1$)

'---------------------- D‚but du programme
'---------------------- Cherche le segment ----------------------------------
CALL ChercheSegment(SegEc)
IF SEGEC=&hB800 THEN CN=11:FN=1:CI=14:FI=4 else CN=15:FN=0:CI=0:FI=7
COUN=CN+16*FN:COUI=CI+16*FI

'----------------------- MENU PRINCIPAL -------------------------------------
MenuPrincipal :

DEF seg = SEGEC
FOR Y=0 TO 24:FOR X=0 TO 79:K=Y*160+X*2:POKE K,176:POKE K+1,X+24:NEXT X:NEXT Y
MENU$="ENREGISTRER UN  MESSAGELIRE UN OU DES MESSAGES     -- EFFACER --          **** FIN ****     "
Chx=4
CALL MENU(MENU$,23,23,10,CN,FN,CI,FI,Chx,0,0,0)
IF CHX=-1 or chx=4 then goto FIN

ON CHX GOTO ENREGISTRE,LIT,EFFACER

'------------------------- ENREGISTREMENT -----------------------------------
ENREGISTRE :
COLOR CN,FN:CLS
IF NT>=40 THEN NA=1 else na=nt+1
GET #1,na+1
kk=-1
menu$=" Enregistrement nø"+str$(na):Gosub Faitcadre
Gosub FaitPage
POKE (x+DX)*2+(y+DY)*160+1,COUI
m=(x+DX)*2+(y+DY)*160+1
Locate 5,10:Print "Enter pour changer de ligne les flŠches pour d‚placer le "
Locate 6,10:Print "Curseur , et pour Valider <ESC>, pour abandonner <ALT-A> "
Locate 18,10:Print "Vous devriez retenir votre pour voir si il y a  une reponse !"
Locate 20,25:Print " <ALT-A> pour se casser ! "

prendsatouche :
B$=chr$(0)
M$="ABCDEFGHIJKLMNOPQR -+=STUVWXYZabcdefghijklmnopqrstuvwxyz1234567890)(‚Š&…‡'!?/:.;,$*æœ%—<>#@\"
A$=inkey$:if a$="" then goto prendsatouche

       If a$=chr$(27) then goto EnSuite
       If a$=b$+""   Then Goto MenuPrincipal
       If a$=b$+"H"   Then y=y-1
       If a$=b$+"P"   Then y=y+1
       If a$=b$+"K"   Then x=x-1
       If a$=b$+"M"   Then x=x+1
       IF a$=chr$(13) Then Y=Y+1:X=1

 If X=>33 then X=1
 If X<=0  then X=32
 If Y=>5  then Y=1
 If Y<=0  then Y=4
 POKE M,COUN:POKE (x+DX)*2+(y+DY)*160+1,COUI  :m=(x+DX)*2+(y+DY)*160+1

       A = INSTR(M$,A$):IF a=0 Then goto PrendSaTouche

 MID$(CH$(Y),X,1)=A$:KK=0
 POKE (x+DX)*2+(y+DY)*160,asc(A$)
 POKE M,COUN:X=X+1:IF X=>33 THEN X=1:Y=Y+1:IF Y>=5 THEN Y=1
 POKE (x+DX)*2+(y+DY)*160+1,COUI:m=(x+DX)*2+(y+DY)*160+1
 GOTO PrendsaTouche

ENSUITE :

IF kk then Goto menuPrincipal
LSET  L1$=CH$(1)
LSET  L2$=CH$(2)
LSET  L3$=CH$(3)
LSET  L4$=CH$(4)
PUT #1,na+1
NT=NT+1
GET #1,1
LSET L1$=STR$(NT)
PUT #1,1

Goto menuPrincipal

'***************************************************************************
LIT :
COLOR CN,FN:CLS
LITT :
IF NT>40 then nt=40
Menu$="Lecture des messages :":Gosub faitCadre:chx=3
MENU$="Un num‚ro pr‚cis      TOUS      revenir au menu "
Locate 20,30:PRINT "<ESC> pour Fin "
CALL MENU(MENU$,16,30,10,CN,FN,CI,FI,Chx,0,0,0)

IF CHX=-1 then Goto FIN
ON CHX GOTO LectPart,Litout,MenuPrincipal

LectPart : '++++++++++++++++++
COLOR CN,FN:Cls:Menu$="Lecture des messages :":Gosub faitCadre:Gosub FaitPage
Numero :
locate 5,20:print space$(60);"º"
Locate 5,20:INPUT " Numero : ",NP
If Np>NT or Np<0 Then goto numero
If Np=0 then goto Litt

Get #1,np+1
Locate 12,26:Print L1$
Locate 13,26:Print L2$
Locate 14,26:Print L3$
Locate 15,26:Print L4$
A$=input$(1):goto numero

LITOUT :
COLOR CN,FN:Cls:Menu$="Lecture des messages :":Gosub faitCadre
Gosub FaitPage
Locate 6,10:PRINT " FlŠche haut et bas pour changer ! "
Locate 20,20:Print " <ESC> Fin "
CNn=1:gosub LitAFF:goto pt

LitAff :
GET #1,CNn+1
Locate 12,26:Print L1$
Locate 13,26:Print L2$
Locate 14,26:Print L3$
Locate 15,26:Print L4$
Color CI,FI
Locate 10,31:PRINt "Num‚ro du message =";CNn:COLOR CN,FN
Return

pt :
A$=inkey$:if a$="" then goto pt
if a$=chr$(0)+"H" and cnn>1  then cnn=cnn-1:gosub LITAFF
if a$=chr$(0)+"P" and cnn<Nt then cnn=cnn+1:gosub LITAFF
If a$=chr$(27) Then goto LITt
Goto pt

end
'**************************************************************************

FaitCadre :
L=int((80-len(menu$))/2):LOCATE 2,L:PRINT MEnu$
POKE 0,201:FOR K=2 TO 156 STEP 2:POKE K,205:POKE K+320,205
POKE K+3680,205:NEXT K:POKE 158,187:POKE 160,186:POKE 318,186:POKE 320,204
POKE 478,185:POKE 3680,200:POKE 3838,188:FOR K=480 TO 3520 STEP 160
POKE K,186:POKE K+158,186:NEXT


FaitPage :
DX=24:DY=10
For K=1 to 32
POKE DY*160+(DX+K)*2,205:POKE DY*160+(DX+K)*2+1,COUN
POKE (DY+5)*160+(DX+K)*2,205:POKE (DY+5)*160+(DX+K)*2+1,COUN
For I=1 to 4:POKE (DY+I)*160+(DX+K)*2,176:POKE (DY+I)*160+(DX+K)*2+1,COUN
NEXT I:NEXT K
For i=1 To 4
POKE (DY+I)*160+DX*2,186:POKE (DY+I)*160+DX*2+1,COUN
POKE (DY+I)*160+(DX+33)*2,186:POKE (DY+I)*160+(DX+33)*2+1,COUN
NEXT I:POKE DY*160+DX*2+1,COUN:POKE DY*160+DX*2,201
POKE (DY+5)*160+DX*2+1,COUN:POKE (DY+5)*160+DX*2,200
POKE DY*160+(DX+33)*2+1,COUN:POKE DY*160+(DX+33)*2,187
POKE (DY+5)*160+(DX+33)*2+1,COUN:POKE (DY+5)*160+(DX+33)*2,188
FOR i=1 to 4:CH$(I)=space$(32):Next i

X=1:Y=1:RETURN
fin :
GET #1,1
LSET L1$=STR$(NT)
PUT #1,1
Color 7,0
Cls
Print " Contant que mon programme est eu un utilisateur … bientot j'espere"
Print "Le meilleur de la table du Lyc‚e Technique DORIAN !!!! ( Z comme .... )"
Print:print "Appuyez sur une touche !"
A$=input$(1):CLOSE:END

EFFACER :
CODE$="ZORKM"
COLOR CN.FN:CLS:COLOR CI,FI:LOCATE 12,20:INPUT " LE CODE ACCES :",N$
IF N$<>CODE$ THEN SOUND 100,1:SOUND 2000,1:SOUND 100,1:GOTO MENUPRINCIPAL

COLOR CN,FN:CLS
MENU$="EFFACEMENT d'UNE ANNONCE":gosub FAITcadre:gosub FaitPAge:CNN=1
locate 18,32:Print "<ESC> pour Sortir"

locate 5,10:print " Utilisez  les  flˆches  pour  choisir  le  message … "
locate 6,10:print " effacer et pressez <ENTER> pour valider et confirmez "
locate 7,10:print "           en r‚pondant par (O)ui (N)on               "

ok :
CNN=1:GOSUB LITAFF

ptO :
A$=inkey$:if a$="" then goto pto
if a$=chr$(0)+"H" and cnn>1  then cnn=cnn-1:gosub LITAFF
if a$=chr$(0)+"P" and cnn<Nt then cnn=cnn+1:gosub LITAFF
If a$=chr$(27) Then goto menuprincipal
If a$=chr$(13) then goto suiteff
Goto pto

SuiteFF :
LOCATE 20,30:COLOR CI+16,FI:PRINT "Etes - vous s–re ? O/N";
A$=input$(1):if a$="n" or a$="N" or a$=chr$(27) then goto menuprincipal
if a$="O" or a$="o" then goto suiteFFF else goto SuiteFF

SuiteFFF :

for i=cnn+1 to nt:get #1,i+1:put #1,i:next i
nt=nt-1
GET #1,1
LSET L1$=STR$(NT)
PUT #1,1

COLOR CN,FN:LOCATE 20,30:print "                        ";
GOTO OK
