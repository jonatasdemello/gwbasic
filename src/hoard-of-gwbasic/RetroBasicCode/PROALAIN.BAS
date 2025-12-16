'***************************************************************************
'****     PROGRAMME A MANGER ( Classification de recettes et gestion )  ****
'****                                                                   ****
'****              UNIQUEMENT UTILISABLE AVEC QUICK-BASIC               ****
'****                                                                   ****
'****         CGA Couleur  Version 1.1   DE DARCHE Yoann 09/90          ****
'****                                                                   ****
'***************************************************************************

DEF SEG = &HB800:OPTION BASE 1:CLS
DEFINT X,Y,I,J,K,D,C,F
DE=4096

DIM D(20,4)      '*** Coordonn‚es des tableaux ( voir les datas ) ***
GOSUB LECTURETAB

c=15:f=04: XTAB = 1 : XTABM = 1
CI=11:FI=1
Chemin$="B:\"
TG$="   SYSTEME       CREATIONS    MODIFICATIONS    RECHERCHE  "

for x=0 to 79:for y=0 to 24:poke x*2+y*160+1,Y+1+60:poke x*2+y*160,177:next y:next x

'**********************$ OUVERTURE DES FICHIERS A ACCES SEQUENTIEL **********
'KIll Chemin$+"TypeAlim.DAT"

OPEN Chemin$+"TypeAlim.DAT" AS #1 len = 20
OPEN Chemin$+"SortAlim.DAT" AS #2 len = 19
OPEN CHEMIN$+"Config  .FIC" AS #3 len = 4

FIELD #1,19 AS TYPE$,1 AS NC$
FIELD #2,19 AS SORT$
FIELD #3,4  AS HE$

LT=LOF(1)/20
LS=LOF(2)/19

GET #3,1: H$=HE$

'*********************** Affichage de l'‚tat actuelle des fichiers **********

X1=19:X2=60:Y1=9:Y2=17:GOSUB OuvreFenetre

 Locate 12,24:PRINT USING "#####";lt
 Locate 12,30:PRINT "TYPES  D'ALIMENTS DEFINIES"
 Locate 14,24:PRINT USING "#####";LS
 Locate 14,30:PRINT "SORTES D'ALIMENTS DEFINIES"
 Locate 16,22:PRINT "Appuyer sur une touche pour Continuer"

Gosub HexaCode

A$=input$(1):Gosub Fermefenetre

'************************ Affichage du menu pricipal ************************

LOCATE 1,6:color c,f:print " "+tg$+" "

Deb1 :
gosub affichetab

	  color c,f  :locate 1,7+15*(xtabm-1):print mid$(tg$,15*(xtabm-1)+1,13)
	  color ci,fi:locate 1,7+15*(xtab-1):print mid$(tg$,15*(xtab-1)+1,13)
	  xtabm=xtab

Prendcar :
A$=INkey$

	If A$="" then Color c,f:LOCATE 1,70:PRINT TIME$: Goto Prendcar

	if A$="4" and XTAB > 1  THEN  gosub fermefenetre:XTAB=XTAB-1:goto Deb1
	if A$="6" and XTAB < 4  THEN  gosub fermefenetre:XTAB=XTAB+1:goto deb1
	if A$="2" and YTAB < NT THEN  YTAB=YTAB+1: gosub afficheCUR
	if A$="8" and YTAB > 1  THEN  YTAB=YTAB-1: gosub afficheCUR
	IF a$=chr$(27) then Goto FinProg
	If A$=" " or  A$=CHR$(13) THEN GOSUB AIGUILLAGE


Goto prendcar


'============================================================================
ouvrefenetre :  ' *********** Cr‚ation du cadre et sauvegarde ‚cran ********

PCOPY 0,1:COLOR C,F

ouvrefenetre2 :

 P1 = X1*2+Y1*160 : P2 = X2*2+160*Y1 : P3 =X1*2+160*Y2 : P4=X2*2+160*Y2
 PY = P3-P1 :PX= P2-P1:K=-1

 FOR I=P1 TO P3 STEP 160
     POKE I+1,C:POKE I+1+PX,C:POKE I,186:POKE I+PX,186
     K=K+1:LOCATE Y1+1+K,X1+2:PRINT STRING$(X2-X1-1,32);
 NEXT I

 FOR I=P1 TO P2 STEP 2:POKE I+1,C:POKE I,205:POKE I+1+PY,C:POKE I+PY,205
 NEXT I

 POKE P1,201:POKE P2,187:POKE P3,200:POKE P4,188

RETURN

'============================================================================
fermefenetre : ' ***** Restution de l'‚cran 0 … partir de l'‚cran 1 *****

 PX=X1:MY=Y2:PY=Y1:MX=X2:IF X2-X1 > Y2-Y1 THEN K=Y2-Y1 ELSE K=X2-X1

 FOR J=MY TO PY STEP -1
 D= J*160+PX*2:POKE D,PEEK(D+DE):POKE D+1,PEEK(D+DE+1):NEXT J

 FOR I=1 TO INT(K/2+1)
    FOR J=PX TO MX
    D=PY*160+ J*2:POKE D,PEEK(D+DE):POKE D+1,PEEK(D+DE+1):NEXT J:PX=PX+1
    FOR J=PY TO MY
    D= J*160+MX*2:POKE D,PEEK(D+DE):POKE D+1,PEEK(D+DE+1):NEXT J:PY=PY+1
    FOR J=MX TO PX STEP -1
    D=MY*160+ J*2:POKE D,PEEK(D+DE):POKE D+1,PEEK(D+DE+1):NEXT J:MX=MX-1
    FOR J=MY TO PY STEP -1
    D= J*160+PX*2:POKE D,PEEK(D+DE):POKE D+1,PEEK(D+DE+1):NEXT J:MY=MY-1
 NEXT I
 RETURN

'============================================================================
AfficheTAB :  '************ Choix de la fenˆtre ***************************

  YTAB=1:YTABM=1
  On XTAB GOSUB TAB1,TAB2,TAB3,TAB4

  x1=d(xtab,1):y1=d(xtab,2):x2=d(XTAB,3):y2=d(XTAB,4)
  gosub ouvrefenetre
  DLX = x1+2 : DLY = y1+2
  FOR I=1 TO NT
    LOCATE DLY+I,DLX+1:PRINT MID$(t$,(I-1)*(LX+1)+1,LX)
  NEXT I
  GOSUB afficheCUR
  return

TAB1 : '*** SYSTEME ***
    T$="CONFIG  .SAV-CONF.RAP-CONF.QUITTER "
    LX=8:NT=4
    RETURN

TAB2 : '*** CREATION ***
    T$="ALIMENT    .SORTE ALIM..RECETTE    "
    LX=11:NT=3
    RETURN

TAB3 : '*** MODIFICATION ***
    T$="ALIMENT    .SORTE ALIM..RECETTE    "
    LX=11:NT=3
    RETURN

TAB4 : ' ****** RECHERCHE *****
    T$="RECETTE  ==> ALIMENTS.ALIMENTS ==> RECETTES"
    LX=21:NT=2
    RETURN

AfficheCUR : '************ Affiche le Curseur dans la fenˆtre **************

	    Color C,F
	    LOCATE DLY+YTABM,DLX+1:PRINT MID$(t$,(YTABM-1)*(LX+1)+1,LX)
	    Color CI,FI
	    LOCATE DLY+YTAB ,DLX+1:PRINT MID$(t$,(YTAB -1)*(LX+1)+1,LX)
	    YTABM=YTAB
Return

Aiguillage : '************ COMMENCE LE DEBUT DU PROGRAMMME CHOISIE *********

     ON XTAB Goto GTAB1,gTAB2,gTAB3

     FinAi :
     RETURN

  gTAB1 :
	  ON YTAB GOTO LePlusBeau,FinAi,FinAi,FinProg

  gTAB2 :
	  ON YTAB GOTO FinAi,FinAi,FinAi

  gTAB3 :
	  ON YTAB GOTO CreaType,FinAi,FinAi

  gTAB4 :
	  ON YTAB GOTO FinAi,FinAi

LectureTAB : '************ Lit le tableau de coordonn‚es *******************

 I=0
   DEBL :
   I=I+1
   READ K
	  IF K>0 THEN Read D(I,2),D(I,3),D(I,4):d(I,1)=k else return
   goto DEBL



CooTableau : '***********$ DATA TABLEAUX X1,Y1,X2,Y2 ***********************

 DATA 1,3,12,10
 data 11,3,25,9
 DATA 23,13,37,19
 DATA 40,10,64,15
 DATA -1,-1        '****** FIN

LectCara :'*********** Dans MAXC nombre max de caractŠres Retour dans p$ ***
	  '                        DXLC,DYLC = d‚calage d'impression

If fx=0 and cx=0 then cx=c:fx=f
p$=""

B$=chr$(0):LOCATE DYLC,DXLC:PRINT chr$(17)
  Delc :
       A$=INKEY$
       If A$="" then Color c,f:LOCATE 1,70:PRINT TIME$: Goto Delc
       Color cx,fx
       IF A$=CHR$(13) THEN cx=0:fx=0:RETURN
       IF A$=B$+CHR$(75) OR A$=CHR$(8) OR A$=B$+Chr$(83) THEN goto EFFACE1
       IF LEN(P$)=MAXC THEN BEEP:GOTO Delc

    A=ASC(A$)
       IF A=32 OR A=40 or a=41 or a=39 GOTO Suite
       IF (A>=48 AND A<=57) or (A>=128 AND A=<154) then goto Suite
       IF (A>=128 or a<=64) goto delc
       A = A and 95
       IF not ( A>=65 and A<=90 ) then beep:goto Delc
       a$=chr$(a)

    Suite :
    LOCATE DYLC,DXLC+LEN(P$):PRINT A$+CHR$(17)
    P$=P$+A$
    GOTO Delc

EFFACE1 :


    If len(p$)=0 then beep:goto delc

    LOCATE DYLC,DXLC+LEN(P$)-1:PRINT CHR$(17)+" "
    p$=MID$(p$,1,LEN(p$)-1)
    Goto Delc



FinProg : '****************** FIN DU PROGRAMME *****************************

    CLOSE
    CLS
    PRINT " SALUT il est ";TIME$
    END


CODEBIN : '****************** Traduit un code en Binaire ********************

bin$=""
       While Casc! <> 0
		 R! = (Casc! mod 2) : Casc! = fix( Casc!/2 )
		 bin$=right$(str$(R!),1)+bin$
       Wend
Return

BINCODE : '****************** Traduit un code Binaire en Decimal ************

Casc!=0:J=0
For i=len(Bin$) TO 1 STEP -1
    If mid$(Bin$,i,1)="1" then Casc!=Casc!+2^(j)
    j=j+1
Next i
Return

HEXACODE : '**************** Traduit un cod hexa en d‚cimal *****************

HD=0
    for I=1 TO LEN(H$)

    K$=MID$(h$,i,1)
    K=val(K$)
    if Val(k$)=0 and k$<>"0" then K=asc(K$)-55
    HD=HD+k*(16^(4-i))

Next I
RETURN

AfficheList : '************* Affiche une liste de chaines de 19 car chacune **
	      ' Maxlist = nombre de chaine a afficher
	      ' Canal   = Canal de lecture disque
	      ' Retour le choix dans Chx ( Si Chx=-1 alors <ESC> )

NP=int(MaxList/80)+sgn(maxlist mod 80)
PR=1:pcopy 0,3

 COLOR C,F:cls

 FOR I=1 to 4
    FOR J=1 to 20
       get #1,(i-1)*20+j+(pr-1)*80
       LOCATE j+2,(I-1)*20+1
       PRINT TYPE$
       IF (I-1)*20+J+(PR-1)*80 > MAXLIST THEN GOTO FINIAFF
    NEXT j
 NEXT i

 FINIAFF:

COLOR CI,FI:LOCATE 25,1
print "      PAGE ";:PRINT USING " ##";PR;:print " /";:print using " ##";NP;
PRINT "     page avant (9), page aprŠs (3)  et  ESC pour fin        ";
locate 1,1

 A$=input$(1)
 pcopy 3,0


return

'****************************************************************************
'***                      PROGRAMME PRINCIPAL                             ***
'****************************************************************************

LEPLUSBEAU:

CreaType :

 Gosub FermeFenetre

IF LT=0 THEN X1=28:X2=53:Y1=9:Y2=11:Gosub OuvreFenetre:LOCATE 11,32:PRINT " AUCUN TYPE DEFINI !":beep:a$=input$(1):gosub fermefenetre
IF LT>0 THEN maxlist = lt:canal=1:GOSUB AfficheList

CREAT:

  X1=25:X2=51:y1=5:y2=17:gosub ouvrefenetre
  Locate  8,30:print " Vous devez entrer"
  Locate 10,35:print "le nouveau"
  Locate 12,30:print " Type d'Aliment :"
  X1=27:X2=49:y1=13:y2=15:color ci,fi:gosub ouvrefenetre2
  DYLC=15:DXLC=30:MAXC=19:cx=ci:fx=fi:Gosub LectCara
  X1=25:X2=51:y1=5:y2=17:gosub fermefenetre
  If p$="" Then Goto Deb1

  Color c,f
  X1=11:X2=66:Y1=10:y2=12:gosub ouvrefenetre
  Locate 12,14:PRINT "PATIENTEZ, Je regarde s'il n'est pas d‚j… enregistr‚"
  Flag = 0

  If len(p$) < 19 THEN p$=p$+space$(19-LEN(p$))

  For I = 1 TO LT
      GET #1,I
      IF TYPE$=p$ Then FLAG=-1
  NEXT I

  Gosub FermeFenetre

IF FLAG THEN

	    X1=10:X2=68:Y1=6:Y2=16:Gosub ouvrefenetre:beep
	    COLOR 30,0
 LOCATE  9,14:PRINT "      Ü                                              "
 LOCATE 10,14:PRINT "     ÛÛÛ              Vous avez d‚j… d‚finie         "
 LOCATE 11,14:PRINT "    ÛÝ ÞÛ                                            "
 LOCATE 12,14:PRINT "   ÛÝ ³ ÞÛ               Ce type Aliment             "
 LOCATE 13,14:PRINT "  ÛÝ  ³  ÞÛ                                          "
 LOCATE 14,14:PRINT " ÛÝ   þ   ÞÛ    Je dois annuler cette enregistrement "
 LOCATE 15,14:PRINT " ßßßßßßßßßßß                                         "
 Color c,f
 a$=INPUT$(1):GOSUB Fermefenetre

	 ELSE
	   LT=LT+1:GET #1,LT  :LSET TYPE$=P$:lset NC$=chr$(0):PUT #1,LT
		   GET #3,LT+1:LSET HE$=HEX$(HD):             PUT #3,LT+1

END IF

  X1=11:X2=66:Y1=10:y2=12:gosub ouvrefenetre
  Locate 12,14:PRINT "  Voulez - vous r‚aliser un nouvelle enregistrement";
  a$=input$(1):a$=chr$(asc(a$) and 95)
  If a$="O" then Gosub fermefenetre:goto creat
  Gosub fermefenetre
  Goto Deb1

