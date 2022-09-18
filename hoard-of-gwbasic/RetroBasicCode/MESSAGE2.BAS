
REM ***********************

DIM CH$(4)
' Constante
cls
DEF SEG = &hB000 ' Il faudra mettre 1hB000

OPEN "ñMEGñññ.ÿÿÿ" as #1 len = 128
FIELD #1,32 as L1$,32 as L2$,32 as L3$,32 as L4$
NT = LOF(1)/128

MenuPrincipal :

Color 7,0
CLS : Menu$="Menu Principal : ":GOSUB FaitCadre
Locate  7,20:Print " -1- Enregistrer un Message "
Locate  9,20:Print " -2- Lire un ou des message(s) "
'Locate 11,20:Print " -3- Speciale Special "
Locate 13,20:PRINT " -Q- Fin "
Locate 16,20:Print " <ESC> pour fin "

prendCaracter :
A$=input$(1):If a$=chr$(27) or a$="q" or a$="Q" then Goto Fin

If a$="1" or a$="&" THEN Goto ENREGISTRE
If a$="2" or a$="‚" Then Goto LIT
'If a$="3" or a=chr$(34) ' Then Goto Speciale
Beep:goto prendCaracter

'**************************************************************************
ENREGISTRE :
CLS
IF NT>=40 THEN NA=1 else na=nt+1
GET #1,na
menu$=" Enregistrement nø"+str$(na):Gosub Faitcadre
Gosub FaitPage
POKE (x+DX)*2+(y+DY)*160+1,112
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
 POKE M,7:POKE (x+DX)*2+(y+DY)*160+1,112  :m=(x+DX)*2+(y+DY)*160+1

       A = INSTR(M$,A$):IF a=0 Then beep:goto PrendSaTouche

 MID$(CH$(Y),X,1)=A$
 POKE (x+DX)*2+(y+DY)*160,asc(A$)
 POKE M,7:X=X+1:IF X=>33 THEN X=1:Y=Y+1:IF Y>=5 THEN Y=1
 POKE (x+DX)*2+(y+DY)*160+1,112:m=(x+DX)*2+(y+DY)*160+1
 GOTO PrendsaTouche

ENSUITE :
LSET  L1$=CH$(1)
LSET  L2$=CH$(2)
LSET  L3$=CH$(3)
LSET  L4$=CH$(4)
PUT #1,na
NT=NT+1
Goto menuPrincipal

'***************************************************************************
LIT :
IF NT>40 then nt=40
Cls:Menu$="Lecture des messages :":Gosub faitCadre
Locate 10,20:PRINT "-1- En entrant le num‚ro de la fiche "
Locate 12,20:Print "-2- Tous ( d‚filement avec les flŠche ! ) "
Locate 14,20:PRINT "-Q- Pour se barrer et revenir au Menu"
Locate 20,20:PRINT "       <ESC> pour Fin "

prendCaracte2 :
A$=input$(1):If a$=chr$(27) then Goto Fin

If a$="1" or a$="&" THEN Goto LectPart
If a$="2" or a$="‚" Then Goto LITOUT
If a$="Q" or a$="q" Then Goto MenuPrincipal
Beep:goto prendCaracte2

LectPart : '++++++++++++++++++
Cls:Menu$="Lecture des messages :":Gosub faitCadre
Gosub FaitPage
Numero :
Locate 5,20:INPUT " Numero : ",NP
If Np>NT or Np<0 Then Beep :goto numero
If Np=0 then goto Lit

Get #1,np
Locate 12,26:Print L1$
Locate 13,26:Print L2$
Locate 14,26:Print L3$
Locate 15,26:Print L4$
A$=input$(1):goto numero

LITOUT :
Cls:Menu$="Lecture des messages :":Gosub faitCadre
Gosub FaitPage
Locate 6,10:PRINT " FlŠche haut et bas pour changer ! "
Locate 20,20:Print " <ESC> Fin "
CN=1

LitAff :
GET #1,CN
Locate 12,26:Print L1$
Locate 13,26:Print L2$
Locate 14,26:Print L3$
Locate 15,26:Print L4$
Color 0,7
Locate 10,31:PRINt "Num‚ro du message =";CN:COLOR 7,0
pt :
A$=inkey$:if a$="" then goto pt
if a$=chr$(0)+"H" and cn>1  then cn=cn-1:goto LITAFF
if a$=chr$(0)+"P" and cn<Nt then cn=cn+1:goto LITAFF
If a$=chr$(27) Then goto LIT
beep:Goto pt

end
'**************************************************************************

FaitCadre :
L=int((80-len(menu$))/2):LOCATE 2,L:PRINT MEnu$
POKE 0,201:FOR K=2 TO 156 STEP 2:POKE K,205:POKE K+320,205
POKE K+3680,205:NEXT K:POKE 158,187:POKE 160,186:POKE 318,186:POKE 320,204
POKE 478,185:POKE 3680,200:POKE 3838,188:FOR K=480 TO 3520 STEP 160
POKE K,186:POKE K+158,186:NEXT:RETURN

FaitPage :
DX=24:DY=10
For K=1 to 32
POKE DY*160+(DX+K)*2,205:POKE DY*160+(DX+K)*2+1,7
POKE (DY+5)*160+(DX+K)*2,205:POKE (DY+5)*160+(DX+K)*2+1,7
For I=1 to 4:POKE (DY+I)*160+(DX+K)*2,176:POKE (DY+I)*160+(DX+K)*2+1,7
NEXT I:NEXT K
For i=1 To 4
POKE (DY+I)*160+DX*2,186:POKE (DY+I)*160+DX*2+1,7
POKE (DY+I)*160+(DX+33)*2,186:POKE (DY+I)*160+(DX+33)*2+1,7
NEXT I:POKE DY*160+DX*2+1,7:POKE DY*160+DX*2,201
POKE (DY+5)*160+DX*2+1,7:POKE (DY+5)*160+DX*2,200
POKE DY*160+(DX+33)*2+1,7:POKE DY*160+(DX+33)*2,187
POKE (DY+5)*160+(DX+33)*2+1,7:POKE (DY+5)*160+(DX+33)*2,188
FOR i=1 to 4:CH$(I)=space$(32):Next i
X=1:Y=1:RETURN
fin :
Color 7,0
Cls
Print " Contant que mon programme est eu un utilisateur … bientot j'espere"
Print "Le meilleur de la table du Lyc‚e Technique DORIAN !!!! ( Z comme .... )"
Print:print "Appuyez sur une touche !"
A$=input$(1):CLOSE:END

