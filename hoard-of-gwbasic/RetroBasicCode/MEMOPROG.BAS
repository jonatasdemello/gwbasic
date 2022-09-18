'****************************************************************************
'***                                                                      ***
'***         Programme Çcrit par DARCHE Yoann EN QUICK-BASIC Ver 2.0      ***
'***                                                                      ***
'***           Programme Ludique : basÇ sur le jeu connu MEMORY           ***
'***                                                                      ***
'***                 Version 1.4 achevÇe le 9/11/1990                     ***
'***                                                                      ***
'***              Compilable En Quick-Basic et Turbo-Basic                ***
'***                                                                      ***
'****************************************************************************

DEFINT A-Z
CLS:SCREEN 2:SCREEN 0:GOSUB PUBLICITE
def seg=&hb800   ' ****$ &hB000 pour un HERCULE **********
CY=1:CX=1:MX=1:MY=1:MAXITI=4
DIM Carte(16,4),C1%(32),C2%(32),C3%(32),C4%(32),C%(8),YM(32),XM(32)

'******** Vives les Scores !!!!! Fichiers !! *******************************

OPEN "SCORES.ÒÒÒ" AS #1 LEN = 18
FIELD #1,10 as NOM$,8 as SC$
IF LOF(1)=0 THEN Gosub Initialise

randomize timer '*************** debut de la fin ***************************

FOR I=1 TO 32:READ C1%(I),C2%(I),C3%(I),C4%(I):NEXT I ' READ LES DATAS !!!

' constante MONOCHROME :  ( eh oui !! il en faut je me passerai bien ! )

C%(1)=219  :  C%(5)=233
C%(2)=254  :  C%(6)=240
C%(3)=079  :  C%(7)=042
C%(4)=120  :  C%(8)=004

' encore et toujours des constantes !!! (video en plus) ====================

F1$=CHR$(24):F2$=CHR$(25):F3$=CHR$(27):F4$=CHR$(26)

REM Vives les datas tralala !!!! ********* CONSTANTE : FORMES/COULEUR ******
    ' 1,2,3,4,5,6,7,8 = couleurs (caractäres pour mono )
    ' un type de Carte est formÇ de 4 couleurs/formes

formesC :

 DATA 1,1,1,1 ,2,2,2,2 ,3,3,3,3 ,4,4,4,4 ,5,5,5,5 ,6,6,6,6 ,7,7,7,7 ,8,8,8,8
 DATA 1,2,1,2 ,2,1,2,1 ,3,2,3,2 ,8,2,8,2 ,8,6,8,6 ,8,5,8,5 ,7,1,7,1 ,1,7,1,7
 DATA 4,2,2,4 ,1,3,3,1 ,8,1,1,8 ,6,3,3,6 ,1,1,2,2 ,5,5,4,4 ,5,5,7,7 ,6,6,8,8
 DATA 4,5,5,4 ,3,6,6,3 ,2,7,7,2 ,2,6,6,2 ,6,2,2,6 ,5,7,7,5 ,8,5,5,8 ,2,5,2,5

'===========================================================================
'      PROGRAMME PRINCIPAL AL AL ALLEEEE !!!!!
'===========================================================================

COLOR 7:CLS:MENU$="INITIALISATION ECRAN":gosub faitcadre
locate 10,20:PRINT "-1- Pour Çcran CGA couleur "
locate 12,20:PRINT "-2- Pour Çcran CGA monochrome / CGA Plasma "
locate 14,20:PRINT "-3- Pour Çcran HERCULE "
Locate 16,20:PRINT "-Q- Pour fin ( ou <ESC> Ö tout moment du jeu )"

PrendReponse :

  R$=INPUT$(1):if R$=chr$(27) or r$="q" or R$="Q" then goto FINPROG

 IF R$="1" or R$="&"      THEN MONO%=0 :DEF SEG = &HB800:GOTO JEU
 IF R$="2" OR R$="Ç"      THEN MONO%=-1:DEF SEG = &HB800:GOTO JEU
 IF R$="3" OR R$=CHR$(34) THEN MONO%=-1:DEF SEG = &HB000:GOTO JEU

  BEEP:GOTO PrendReponse

Jeu : ' ah áa va enfin pÇter dans l'Çcran !!!! (pas trop ouffff !!)

 IF MONO% THEN
	      C1=15:F1=0   ' Couleur JeJoue1ur
	      C2=7 :F2=0   ' Couleur Ordinateur
	      C3=7 :F3=0   ' Couleur Message Normal
	      C4=0 :F4=7   ' Couleur Massage Inverse
	      C5=15        ' Couleur Curseur (SpÇcial POKE !!)
	      C6=143
	  ELSE
	      C1=13:F1=0
	      C2=11:F2=0
	      C3=4 :F3=0
	      C4=14:F4=4
	      C5=15
	      C6=143

	  END IF
OJ=0
Gosub Fichier
Coucou :
COLOR C3,F3:CLS:MENU$="OPTIONS POSSIBLES":Gosub FaitCadre

Locate 08,20:PRINT "-1- Ordinateur Seul              "
Locate 10,20:PRINT "-2- Joueur     Contre Ordinateur "
Locate 12,20:PRINT "-3- Selection du temps de mÇmorisation"
Locate 14,20:PRINT "-4- Pour effacer les Scores ( Option pour les nuls )"
Locate 16,20:PRINT "-Q- Salut !!! Ö la prochaine ( == <ESC> ) "
Locate 18,20:print " <SPC> ou <ENTER> pour Confirmer "
Reaffiche :
Color C3,F3
Locate 23,3:PRINT " Delais de MÇmorisation : ";:COLOR C4,F4:PRINT MAXITI
Color C3,F3
Locate 22,3:PRINT " Option de Jeu          : ";:COLOR C4,F4
IF OJ THEN PRINT "  Joueur   - Ordinateur " ELSE PRINT " Ordinateur -    Seul  "
Color C3,F3

PrendrEponse2 :

  R$=INPUT$(1):if R$=chr$(27) or r$="q" or R$="Q" then goto FINPROG

 IF R$="1" or R$="&"      THEN OJ=00:GOTO Reaffiche
 IF R$="2" OR R$="Ç"      THEN OJ=-1:GOTO Reaffiche
 IF R$="3" OR R$=CHR$(34) THEN Gosub ResetMaxiTI:GOTO Coucou
 IF R$="4" OR R$="'"      THEN Gosub Initialise:GOTO Coucou
 IF R$=CHR$(13) or R$=" " THEN Goto Suivant

  BEEP:GOTO PrendReponse2

Suivant :

CLS:COLOR C3,F3:MENU$="MEMO LE JEU DE MEMOIR":gosub faitcadre

Locate 5,20:PRINT " Choisisez le niveau de difficulter !! "
Locate 7,10:Print " Attention ne pas se surestimer sinon c'est la gamelle !!! HiHi !!"

Locate 12,20:PRINT "-1- TrÇs facile (L'ordinateur est nul !!)"
Locate 14,20:PRINT "-2- Moyen       (Il faut une meilleure mÇmoire)"
Locate 16,20:PRINT "-3- TrÇs Dñre   (alors il faut àtre un pro !! )"
Locate 18,20:PRINT "-Q- Salut !!! Ö la prochaine ( == <ESC> ) "
A$=""

PrendrEponse1 :

  R$=INPUT$(1):if R$=chr$(27) or r$="q" or R$="Q" then goto FINPROG

 IF R$="1" or R$="&"      THEN GOSUB Faitpage:DJ=0:GOTO JEU1
 IF R$="2" OR R$="Ç"      THEN GOSUB Faitpage:DJ=1:GOTO JEU2
 IF R$="3" OR R$=CHR$(34) THEN GOSUB Faitpage:DJ=2:GOTO JEU3

  BEEP:GOTO PrendReponse1

JEU1:'*********************** NIVEAU FADO(REMI) **************************
GOSUB PREMIERE:LOCATE 24,70:PRINT "FACILE !";

IlJoue1 :
IF OJ THEN Gosub ChoixDeLui

JeJoue1 :
X1=0:Y1=0:X2=0:Y2=0

While (Carte(X1,Y1)=0)
     X1=INT(RND(1)*16)+1:Y1=INT(RND(1)*4)+1
Wend

While (Carte(X2,Y2)=0 or (X1=X2 AND Y1=Y2))
      X2=INT(RND(1)*16)+1:Y2=INT(RND(1)*4)+1
Wend

GOSUB ChoixOrdinateur

IF M=1 THEN GOTO JeJoue1 ELSE GOTO IlJoue1

JEU2:' **************************** UN PEU PLUS DIFFICILE SI SI !!! ********
GOSUB PREMIERE:LOCATE 24,70:PRINT "MOYEN  !";
X2=0:Y2=1
X1=0:Y1=0

DebutJeu2 :

 While Carte(x1,y1)=0
 X1=INT(RND(1)*16)+1
 Y1=int(RND(1)*4)+1
 WEND

Incrementation :

     X2=X2+1
     IF X2 => 17 THEN Y2=Y2+1:X2=1
     IF Y2 => 5  THEN Y2=1:X2=1
     IF CARTE(X2,Y2)=0 OR (X1=X2 AND Y1=Y2) THEN Goto Incrementation

Gosub ChoixOrdinateur

IF M=1 THEN  GOTO DebutJeu2

IlJoue2 :
	 M=0
	 IF OJ THEN Gosub ChoixDelui
	 IF CARTE(X1,Y1)=0 THEN Goto DebutJeu2 ELSE Goto Incrementation

JEU3:'************************* DIFFICILE !!!!! **************************$*

For K=1 to 32:YM(K)=0:XM(K)=0:NEXt K ' RÇinitialisation de sa petite mÇmoire
GOSUB PREMIERE:LOCATE 24,70:PRINT "DIFFICILE";

DebutJeu3 :

 X1=0:Y1=0:X2=0:Y2=0
 While Carte(x1,y1)=0
 X1=INT(RND(1)*16)+1
 Y1=int(RND(1)*4)+1
 WEND

Nc=Carte(X1,Y1)
IF XM(Nc)=X1 AND YM(Nc)=Y1 THEN Goto DebutJeu3
IF XM(Nc)=0  THEN Goto Recherche

X2=XM(Nc):Y2=YM(Nc)
If Carte(X2,Y2)=0 THEN XM(Nc)=0:YM(Nc)=0:Goto Recherche 'Une Gourde !!
Gosub ChoixOrdinateur
Goto FinJeu3

Recherche : '****************** Il ne la pas encore en mÇmoire **************
	    '                   Donc il en prend une au hasard (sans tricher)
While (Carte(X2,Y2)=0 or (X1=X2 AND Y1=Y2))
      X2=INT(RND(1)*16)+1
      Y2=INT(RND(1)*4)+1
Wend

IF Carte(X2,Y2)=Nc THEN GOSUB ChoixOrdinateur:Goto FinJeu3

Mc=CARTE(X2,Y2) '************ Il n'a pas trouver la bonne mais il la retient
YM(Mc)=Y2:XM(Mc)=X2
YM(Nc)=Y1:XM(Nc)=X1
Gosub ChoixOrdinateur

FinJeu3 :
IF M=1 THEN  GOTO DebutJeu3
	 IF OJ THEN Gosub ChoixDelui
	 Goto DebutJeu3


END
'===========================================================================
'   LES DIVERSES SOUS PROCEDURES DE TOUT TYPE COUCOU c'est Yoyo !!!
'===========================================================================
faitpage :   ' *************************************** INITIALISATION ******

CLS
For X=1 to 16
    For Y=1 to 4
	Cl=C3
	gosub cadre:gosub remplis
    next Y
next X

 For I=1 TO 32

    For J=1 to 2

    X=INT(RND(1)*16)+1:Y=INT(RND(1)*4)+1

    IF Carte(X,Y)=0 then Carte(x,y)=i:goto nf

    For x=1 to 16
       For y=1 to 4
       IF Carte(x,y)=0 then Carte(x,y)=i :goto nf

       NEXT y
    NEXT x

nf :

  Next J:NEXT I

RETURN


cadre :  ' FAIT UNE Carte RENVERSE A LA POSITION X,Y  **************
	     ' Chouette des peek des pook des peek, pook, popekopoke !!!!
 xr%=(x-1)*10
 yr%=(y-1)*800
 CT%=480+yr%+xr%

POKE XR%+YR%  ,201 :POKE CT%  ,200 :POKE XR%+YR%+160,186
POKE XR%+YR%+2,205 :POKE CT%+2,205 :POKE XR%+YR%+320,186
POKE XR%+YR%+4,205 :POKE CT%+4,205 :POKE XR%+YR%+166,186
POKE XR%+YR%+6,187 :POKE CT%+6,188 :POKE XR%+YR%+326,186
 ' ****************** LES COULEURS NOW !!!!! Eh oui encore des pokes !!! ****
POKE XR%+YR%+1,CL  :POKE CT%+1,CL  :POKE XR%+YR%+161,CL
POKE XR%+YR%+3,CL  :POKE CT%+3,CL  :POKE XR%+YR%+321,CL
POKE XR%+YR%+5,CL  :POKE CT%+5,CL  :POKE XR%+YR%+167,CL
POKE XR%+YR%+7,CL  :POKE CT%+7,CL  :POKE XR%+YR%+327,CL
RETURN

Remplis : ' ************ Fait Quatre petit carrÇ au centre de la Carte *****
CT%=(x-1)*10+(y-1)*800
POKE CT%+162,176:POKE CT%+163,CL
POKE CT%+164,176:POKE CT%+165,CL
POKE CT%+324,176:POKE CT%+325,CL
POKE CT%+322,176:POKE CT%+323,CL
RETURN

AfficheCarte : '******* Affiche les couleurs/formes de la Carte x,y ********

   XR%=(X-1)*10
   YR%=(Y-1)*800
   N=Carte(X,Y)

IF MONO% THEN                ' MONO% =-1 monochromme MONO%=0 couleur !
	      POKE XR%+YR%+162,c%(C1%(N))
	      POKE XR%+YR%+164,C%(C2%(N))
	      POKE XR%+YR%+324,C%(C3%(N))
	      POKE XR%+YR%+322,C%(C4%(N))

	  ELSE
	      POKE XR%+YR%+162,219:POKE XR%+YR%+163,C1%(N)+7
	      POKE XR%+YR%+164,219:POKE XR%+YR%+165,C2%(N)+7
	      POKE XR%+YR%+324,219:POKE XR%+YR%+325,C3%(N)+7
	      POKE XR%+YR%+322,219:POKE XR%+YR%+323,C4%(N)+7
	  END IF
REM Cn%(N) revoit ∫ pour un ecran monochrome le code caractäre
REM               ∫ pour un Çcran couleur    la couleur
RETURN

FaitCadre : ' CELA FAIT UN CADRE A L'ECRAN !!! ******************************

POKE 0,201:FOR K=2 TO 156 STEP 2:POKE K,205:POKE K+320,205
POKE K+3680,205:NEXT K:POKE 158,187:POKE 160,186:POKE 318,186:POKE 320,204
POKE 478,185:POKE 3680,200:POKE 3838,188:FOR K=480 TO 3520 STEP 160
POKE K,186:POKE K+158,186:NEXT
LX=int((80-len(menu$))/2):locate 2,lx:print menu$:return

PREMIERE : '****************************************************************
PJ=0:PO=0:CJ=0:CO=0
LOCATE 25,1:COLOR C4,F4
PRINT "  <ESC> Fin  /  (8) ";F1$;" / (2) ";F2$;" / (4) ";F3$;" / (6) ";F4$;"  /   <SPC> ou <ENTER> pour choix  ";

COLOR C3,F3:LOCATE 24,60 :PRINT " NIVEAU : ";
RETURN

ChoixDeLui : '************** eh si tu veux JeJoue1r laisse cette procedure ! ***

CJ=CJ+1
b$=chr$(0):NN=0:GOTO AGIT

PrendSaTouche :

Gosub AfficheLesResultat

	   a$=""
	   While a$="" : A$=INKEY$ : WEND

	   if A$="q" or a$="Q" or a$=chr$(27) then goto FinProg

	   IF (A$="8" OR A$=B$+"H") AND CY>1  THEN CY=CY-1
	   IF (A$="2" OR A$=B$+"P") AND CY<4  THEN CY=CY+1
	   IF (A$="4" OR A$=B$+"K") AND CX>1  THEN CX=CX-1
	   IF (A$="6" OR A$=B$+"M") AND CX<16 THEN CX=CX+1
	   IF A$=CHR$(13) or A$=" "           THEN Goto VerifieSaDonnee
	   IF A$="A" or A$="a"                THEN Goto Coucou
AGIT :
   IF CX=MCX and CY=MCY THEN GOTO PRENDSATOUCHE
   X=MX:Y=MY:CL=C3:Gosub Cadre
   X=CX:Y=CY:CL=C5:Gosub Cadre
   MX=CX:MY=CY
GOTO PrendSaTouche :

VerifieSaDonnee :

   IF Carte(CX,CY)=0   THEN BEEP:GOTO PrendSaTouche
   IF Cx=MCX and Cy=MCY Then BEEP:GOTO PrendSaTouche

   X=CX:Y=CY:GOSUB AfficheCarte

   IF Nn=0 THEN MCX=CX:MCY=CY:MX=0:MY=0:NN=1:GOTO PrendSaTouche

NN=0
   IF Carte(Mcx,Mcy)=Carte(CX,CY) THEN
			  PJ=PJ+1
			  Carte(Mcx,Mcy)=0:Carte(Cx,CY)=0
			  X=CX:Y=CY:CL=C3:GOSUB Cadre
			  X=MCX:Y=MCY:GOSUB Cadre:mcx=0
			  Locate 23,35:COLOR C1,F1:PRINT " GagnÇ "
			  GOSUB THETIME
			  Goto PrendSaTouche
				    ELSE
			  Locate 23,35:COLOR C1,F1:PRINT " Perdu "
				    END IF

 GOSUB THETIME
 X=CX:Y=CY:CL=C3:Gosub Cadre:GOsub Remplis
 X=MCX:Y=MCY    :Gosub Cadre:Gosub Remplis
 MCX=0:MCY=0

RETURN

AfficheLesResultat : '****************************** COUCOU LES NOTES !! ***

COLOR C1,F1:LOCATE 21,1:PRINT "Vous Avez : ";:Print Using "##";PJ;:PRINT " Pt"
COLOR C2,F2:LOCATE 22,1:PRINT "  J'ai    : ";:Print Using "##";PO;:PRINT " Pt"
COLOR C1,F1:LOCATE 21,20:PRINT "en ";:PRINT USING "####";CJ;:PRINT " Coups"
COLOR C2,F2:LOCATE 22,20:PRINT "en ";:PRINT USING "####";CO;:PRINT " Coups"
COLOR C4,F4:LOCATE 21,60:PRINT "Delais : ";:PRINT USING "##";MAXITI;:Print " Sec."
COLOR C3,F3
LOCATE 23,35:PRINT "             "
IF PJ+PO => 32 THEN
		   COLOR C3,F3:LOCATE 23,35
		   IF PJ > PO THEN PRINT " Vous avez gagnÇ(e)(s) "
		   IF PJ < PO THEN PRINT " Vous avez perdu(e) "
		   IF PJ = PO THEN PRINT "  EgalitÇ "
		   COLOR C4,F4
LOCATE 25,1:PRINT space$(29);"APPUYER SUR UNE TOUCHE";SPACE$(29);:LOCATE 1,1
COLOR C3,F3
		   A$=INPUT$(1)
		   CLS:GOsub GestionScore:Goto Jeu
	       ELSE
		   RETURN
	       END IF

THETIME :'******************************************************************

TI!=INT(TIMER):a$=""
WHILE ABS(TIMER-TI!) < MAXITI+0.1
A$=INKEY$
IF A$<>"" THEN RETURN
WEND
RETURN

ChoixOrdinateur : '********************** Affiche & Bidouille de l'Ordi **
CO=CO+1
If a$=chr$(27) then goto CouCou

x=x1:y=y1:gosub AfficheCarte:Cl=C6:gosub cadre   'Montre les Cartes
x=x2:y=y2:gosub AfficheCarte:Cl=C6:gosub cadre

IF Carte(X1,Y1)=Carte(X2,Y2) THEN
		Carte(X1,Y1)=0:Carte(X2,Y2)=0
		M$=" Je les gagne ":M=1
			       ELSE
		M$=" J'ai perdu ..":M=0
			       END IF

COLOR C2,F2:LOCATE 23,35:PRINT M$;:COLOR C3,F3

GOSUB THETIME

if m=0 THEN
	   x=x1:y=y1:CL=C3:gosub cadre:Gosub Remplis
	   x=x2:y=y2:CL=C3:gosub cadre:Gosub Remplis
       ELSE
	   PO=PO+1
	   X=X1:Y=Y1:Cl=C3:GOSUB CADRE
	   X=X2:Y=Y2:      GOSUB CADRE
END IF

GOSUB AfficheLesResultat:RETURN

ResetMaxiTi :
COLOR C3,F3:CLS:MENU$="Initialise Le Delais":gosub FaitCadre
Locate 11,3:Print " Delais en Seconde [";MaxiTi;"] :";
INPUT "",MA$
If ma$="" then Return
Ma=Val(MA$):If MA<0 Or Ma>10 Then Locate 14,5:print " IIIIdiot !! ":a$=input$(1):goto ResetMaxiTi
Maxiti=Ma:Return

FINPROG : ' DÇjÖ !!! oh! non non non c'Çtait trop bien pourquoi finir ???!!

 CLS:PRINT " UN GRAND OU PETIT BONJOUR DE DARCHE Yoann .. ":END

' et c'est dÇjÖ fini .....

PUBLICITE : '*************** IL en faut pour vivre !!! ***********************
LOCATE 1,1:color 0,15
PRINT "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
PRINT "∞€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€∞€€€€∞∞∞∞€€€€∞€€€€€€∞∞∞∞∞∞"
PRINT "±±±±±±±±±±±±±±±±±±±±€€±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±∞±±€€€∞∞∞±€€€∞±€€€±±€€€∞∞∞∞"
PRINT "∞∞∞∞∞€€∞∞∞∞∞€€€€€€∞±€€∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞±±€€∞∞±€€€∞∞±€€€∞±±±€€€∞∞"
PRINT "∞∞∞∞€€€€∞∞∞±€€±±±€€±€€∞€€€€€€∞∞€€€€∞∞€€∞∞€€∞€€∞∞∞∞€€∞∞∞±±€€∞±€€∞∞∞±€€€∞∞∞±±€€€∞"
PRINT "∞∞∞±€±±€∞∞∞±€€∞∞±€€±€€±€€±±±∞∞€€±±€€±€€∞±€€±€€∞∞∞±€€∞∞∞∞±€€€€€∞∞∞∞±€€€∞∞∞∞±±€€∞"
PRINT "∞∞∞€€∞±€€∞∞±€€∞∞±€€±€€±€€∞∞∞∞±€€∞±±∞±€€∞±€€±€€€€∞±€€∞∞∞∞±±€€€∞∞∞∞∞±€€€∞∞∞∞∞±€€∞"
PRINT "∞∞±€€€€€€∞∞±€€€€€€∞±€€±€€€€∞∞±€€∞∞∞∞±€€€€€€±€€±€€±€€∞∞∞∞∞€€€∞∞∞∞∞∞±€€€∞∞∞∞∞€€€∞"
PRINT "∞∞€€±±±±€€∞±€€±€€∞∞±€€±€€±∞∞∞±€€∞∞∞∞±€€±±€€±€€±±€€€€∞∞∞∞€€€∞∞∞∞∞∞∞±€€€∞∞∞∞€€€∞∞"
PRINT "∞€€∞∞∞∞±±€€±€€±±€€∞±€€±€€∞∞∞∞±€€∞∞€€±€€∞±€€±€€∞±±±€€∞∞∞€€€∞∞∞∞∞∞∞∞±€€€∞∞€€€±∞∞∞"
PRINT "±€€∞∞∞∞∞±€€±€€∞±±€€±€€±€€€€€€±±€€€€∞±€€∞±€€±€€∞∞∞±€€∞∞€€€∞∞∞∞∞∞∞∞∞±€€€€€€±∞∞∞∞∞"
PRINT "±±∞∞∞∞∞∞±±∞±±∞∞∞±±∞±±∞±±±±±±∞∞±±±±∞∞±±∞∞±±∞±±∞∞∞∞±±∞∞±±±∞∞∞∞∞∞∞∞∞∞±±±±±±∞∞∞∞∞∞∞"
PRINT "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
PRINT:color 14,0
PRINT "                    Vous PrÇsente un logiciel ludique                          "
PRINT
PRINT "       …Õª  …Õª  …ÕÕÕÕÕª  …Õª  …Õª …ÕÕÕÕÕÕª …ÕÕÕÕª À     À     …ÕÕÀÕÕª         "
PRINT "       ∫ »ª…º ∫  ∫        ∫ »ª…º ∫ ∫      ∫ ∫    ∫ ∫     ∫        ∫            "
PRINT "       ∫  »º  ∫  ÃÕÕÕÕπ   ∫  »º  ∫ ∫      ∫ ÃÕÕÀÕº »ÕÕÀÕÕº        ∫            "
PRINT "       ∫      ∫  ∫        ∫      ∫ ∫      ∫ ∫  »ª     ∫           ∫            "
PRINT "                 »ÕÕÕÕÕº           »ÕÕÕÕÕÕº     »              »ÕÕ ÕÕº Ver 1.4 "
PRINT "                            de   DARCHE Yoann                                  "
PRINT "                   71 avenue d'OrlÇans   91800 BRUNOY  (FRANCE)                "
PRINT "                             Tel : 69-39-51-26                                 ";
LOCATE 1:A$=input$(1):return

FICHIER : '****************** Gestion des scores !!!! **********************
Color C3,F3:CLS:MENU$="LES SCORES (Hum ! Hum !)"
Gosub FaitCadre

Color C4,F4
Locate 6,10:PRINT "    Träs Facile           MÇdiocre         Träs Difficile  "
FOR I=0 TO 2
    IF I=0 THEN COLOR C3,F3
    IF I=1 THEN COLOR C1,F1
    IF I=2 THEN COLOR C2,F2
    FOR J=1 TO 10
    GET #1,(I*10+J)
    LOCATE J+7,I*20+10:PRINT NOM$;" ";SC$
    NEXT J
NEXT I
Locate 20,10:Print " Appuyez sur une touche pour continuer "
a$=input$(1):return

GESTIONSCORE :
CLS:COLOR C4,F4
LOCATE 12,10:PRINT " Je Regarde Si vous pouvez àtre dans les 10 Meilleurs "
TP!=INT((PJ*CO)/(PO*CJ+1)*(1000/(MaxiTi+1)))

FOR I=1 TO 10
	GET #1,DJ*10+I
	if val(SC$)<TP! THEN Goto SuiteGestion
NEXT I

COLOR 0,0:CLS
LOCATE 11,30:COLOR C3,F3:PRINT " Vous àtes un heureux Perdant !! "
A$=Input$(1)
Return

SuiteGestion : '*********************** *******************************
COLOR 0,0:CLS
LOCATE 11,30:COLOR C3,F3:PRINT " Vous àtes un heureux gagnant !! "
Locate 13,25:PRINT " Votre nom / sigle (10 car. max.) ";
INPUT ":",N$

IF len(n$) > 10 Then
		    BEEP:COLOR C4,F4
		    Locate 15,30:PRINT "Moins DE 10 Caractäres"
		    COLOR C3,F3:A$=input$(1)
		    GOTO SuiteGestion
		 End If

FOR t=10 to i+1 Step -1
		GET #1,DJ*10+T-1
		nom2$=nom$:sc2$=sc$
		GET #1,Dj*10+T
		Lset nom$=nom2$:Lset sc$=sc2$
		PUT #1,Dj*10+T
NEXT T

GET #1,DJ*10+I
LSET SC$=STR$(TP!)
Lset NOM$=N$
PUT #1,DJ*10+I
RETURN

INITIALISE : '*********************************************
FOR I=1 TO 30
GET #1,I
LSET NOM$="MÇmory":Lset SC$="00000000"
PUT #1,I
NEXT I
RETURN
