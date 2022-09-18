CLS
DEFINT A-Z
YOANN$=chr$(68)+chr$(65)+chr$(82)+chr$(67)+chr$(72)+chr$(69)+" "+CHR$(89)+chr$(111)+chr$(97)+chr$(110)+chr$(110)
DIM BB(40),CC(63),T%(4,4),CT(26,6),TA%(16)
LOCATE 1,1,1,8,8
ON ERROR GOTO TRAITERREUR
CHX%=1
' ------------------------ Chargement des Sub Routines SuplÇmantaires -------

'  $INCLUDE: 'A:CREAPSUP.BAS'

' ----------------------- Chargement des Sub Routine MENUS ------------------

'  $INCLUDE: 'A:MENUTXT.BAS'

' ----------------------- Chargement de la PUBLICITê -----------------------

'  $INCLUDE : 'A:PUB.BAS'

' ---------------------- SÇlection du mode de l'ecran ------------------------
Call Publicite ' áa l'affiche

  DEF SEG = &h40
  TE%=(PEEK(&h10) AND &h30):DEF SEG
  IF TE%=0 THEN PRINT " Programme non utilisable sur cette appareil ! [ECRAN] ":END
  IF TE%=&h30 Then SegEcr%=&hB000 Else SegEcr%=&hB800
  DEF SEG = SEGECR%

' --------------- Constante Provisoire --------------------------------------

CN%=11:FN%=1:CI=14:FI=4  ' Couleurs Normales InversÇs
CND%=14:CID%=110         ' Couleur du TracÇ Normale/InversÇe
CNT%=10:CIT%=110         ' Couleur de Texte Normale/InversÇe
IND%=-1:INE%=-1:A$=CHR$(27):PCOPY 0,3
NOM$="":NOM1$="PASDENOM.PIC":NOM2$=NOM1$ ' Nom par dÇfaut des images

CPA1 = 0:CPA2 = 0 'Protection contre le fait de quitter sans sauvegarde
		    ' Si -1 Changement effectuÇ, Si 0 aucune modif !

IF SEGECR%=&hb000 THEN CN%=7:FN%=0:CI%=0:FI%=7:CND%=15:CID%=7

Ta%(1)=17:Ta%(2)=30:Ta%(3)=254:Ta%(4)=16:Ta%(8)=31:Ta%(12)=254

GOSUB LectData     ' ******       Lit les DATAs       ******
GOSUB Rapp.Config  ' ****** Rappelle la Configuration *****
GOTO Debut

' --------- converstion asc(x)-178 ===> code binaire ------------------------

 DATA 05,13,45,61,60,44,29,21,28,25,57,41,12,03,11,14,07,10,15,39
 DATA 55,19,22,27,30,23,26,31,43,59,46,62,51,35,38,54,63,47,09,06

' ------------- convertion binaire ====> code caractäre CHR$() --------------

 DATA 032,032,032,192,032,179,218,195,032,217,196,193,191,180,194,197
 DATA 032,032,032,200,032,186,201,204,032,188,205,202,187,185,203,206
 DATA 032,032,032,212,032,179,213,198,032,190,205,207,184,181,209,216
 DATA 032,032,032,211,032,186,214,199,032,189,196,208,183,182,210,215

' ------------ DonnÇes pour le choix directe des caractäres -----------------

DATA 253,251,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,252
DATA 130,136,137,138,160,131,132,133,161,140,139,141,162,147,148,149,163,150,129,151,135,128,142,143,134,144,153
DATA 154,152,155,145,146,156,157,158,159,171,172,064,164,165,166,167,168,173,174,175,169,170,019,021,020,015,028
DATA 219,176,177,178,220,223,221,222,022,254,248,249,250,007,008,009,010,001,002,003,004,005,006,011,012,013,014
DATA 218,194,191,201,203,187,214,210,183,213,209,184,205,186,091,024,029,018,030,093,035,036,037,038,045,022,127
DATA 195,197,180,204,206,185,199,215,182,198,216,181,196,179,027,042,026,017,043,016,047,092,060,061,062,063,033
DATA 192,193,217,200,202,188,211,208,189,212,207,190,023,124,040,025,123,125,031,041,094,095,096,039,044,046,059

' ============================== Lecture des datas =========================
LectData :
COLOR 30,1
RESTORE
LOCATE 25,1:PRINT "PATIENTEZ   ";
				FOR I=1 TO 40 :READ BB(I):NEXT I
				FOR I=0 TO 63 :READ CC(I):NEXT I
				FOR J=0 TO 6
				    FOR I=0 TO 26
				    READ CT(I,J)
				    NEXT I
				NEXT J
X=1:Y=1:LOCATE 25,1:PRINT "OK          ";
RETURN

' ============================== Sous prog calcule ==========================

SUB CALCUL(AN,CO,V,D,NO,PR%) STATIC

STATIC S,C

	IF PR% THEN AN= 0+( D AND 16)
	   S =-(AN AND 32)/32
	   C =-(AN AND 16)/16
	   VL=-(NOT(V) AND D)*(C*16+32)-(NOT(V) AND NOT(D) AND C)*48
	   VL=VL+(V AND ((D AND 48)+(S XOR C)*32*((NOT(D))-D)))
	   CO=CO OR VL
	   NO=(AN AND 15) OR (CO)

End Sub

'============================= sOUS PROG VERIFICATION DU POKAGE =============

Sub Verif(AN) STATIC
shared d,BB()
IF AN<179 OR AN>218 THEN AN= 0+( D AND 16) ELSE AN=BB(AN-178)
End Sub


' ==================================== Sous Prog Color ======================
SUB COLORC(CA%,CB%,SS%) STATIC

STATIC COU,B$,K%,V%,KA%,C%
SHARED CN%,FN%,T%()

COU=FNCO%(CN%,FN%)

IF SS%<>0 THEN
	  IF CA%>=128 THEN CA%=CA%-128:KA%=128 ELSE KA%=0
	  CB%=INT(cA%/16):CA%=(CA%-CB%*16)
	  ELSE
	  IF CA%>=32 THEN CA%=CA-16:ka%=128 ELSE KA%=0
	  END IF

B$=chr$(0):T%(0,0)=CA%:T%(1,0)=CB%:for i=0 to 2:T%(i,1)=T%(i,0):next i
CALL FAITUNCADRE(6,6,74,18,CN%,FN%)
LOCATE 7,34:PRINT "LES COULEURS";
locate 9,11:print " Utilisez les fläches pour le choix Æ C Ø clignotant / ou pas "
DE%=1634

'************** Affichages des couleurs actuelles et choisies . ***********

COLOR CA%,CB%
LOCATE 17,19:PRINT "Ancienne Couleur"
LOCATE 17,45:PRINT "Nouvelle Couleur"
CY%=0:CX%=CA%

NEWCOLOR :
T%(2,0)=KA%:A$=""

FOR I=0 TO 15
POKE DE%  +2*(3*i-2),219  :POKE DE%+2+2*(3*I-2),219
POKE DE%+1+2*(3*i-2),I+KA%:POKE de%+3+2*(3*I-2),I+KA%
NEXT I
FOR I=0 TO 7
POKE DE%+502+2*(3*i-2),219:POKE DE%+504+2*(3*I-2),219
POKE DE%+503+2*(3*i-2),I  :POKE DE%+505+2*(3*I-2),I
NEXT I
poke DE%+498,222:POKE DE%+499,143:POKE DE%+500,221:POKE DE%+501,143
poke DE%-4,222:POKE DE%-3,143:POKE DE%-2,221:POKE DE%-1,143:K=-4


WHILE NOT(A$=" " or A$=CHR$(13) or A$=chr$(27))
mp=0
     IF A$=B$+"P" or A$="2" Then CY=CY+1:mp=-1
     IF A$=B$+"H" or A$="8" Then CY=CY-1:mp=-1
     IF A$=b$+"M" or A$="6" Then CX=CX+1
     If A$=B$+"K" or A$="4" Then CX=CX-1
     IF A$="C"    or A$="c" Then
			    IF KA%=128 THEN KA%=0 ELSE KA%=128
			    GOTO NEWCOLOR
     End if
     IF cy=1   THEN MCX=7 ELSE MCX=15
     IF Cy<0   THEN CY=1
     IF CY>1   THEN CY=0
     IF MP THEN CX=T%(CY,0)
     IF CX<0   THEN CX=MCX
     IF CX>MCX THEN CX=0

     c=2*(3*CX-2)+502*cy:T%(CY,0)=CX

POKE K+DE%-162,000:POKE K+DE%-160,000:POKE K+DE%-158,000:POKE K+DE%-156,000
POKE K+DE%-002,000                                      :POKE K+DE%+004,000
POKE K+de%+158,000:POKE K+DE%+160,000:POKE K+DE%+162,000:POKE K+DE%+164,000
POKE C+DE%-162,218:POKE C+DE%-160,196:POKE C+DE%-158,196:POKE C+DE%-156,191
POKE C+DE%-002,179                                      :POKE C+DE%+004,179
POKE C+de%+158,192:POKE C+DE%+160,196:POKE C+DE%+162,196:POKE C+DE%+164,217
COP%=FNCO%(T%(0,0),T%(1,0)):FOR I=2649 TO 2681 STEP 2:POKE I,COP%+KA%:NEXT I
K=C:A$="": WHILE A$="":A$=INKEY$:WEND
wend

IF A$=chr$(27) then
		   CA%=T%(0,1):CB%=T%(1,1):KA%=T%(2,1)
	       ELSE
		   CA%=T%(0,0):CB%=T%(1,0):KA%=T%(2,0)
	       END IF


IF SS%<>0 THEN
	      CA%=CB%*16+CA%+KA%
	  ELSE
	   IF KA%<>0 then CA%=CA%+16
END IF

if a$=chr$(27) then ss%=-1  else ss%=0

END SUB

'=============================== CHOIX CARACTERE ==========================
SUB CHXCAR(C%) static

SHARED CN%,FN%,CI%,FI%,CT()
STATIC DE%,B$,CX,CY

CALL FaitUnCAdre(10,2,68,19,CN%,FN%)
LOCATE 18,12:PRINT " Utilisez les fläches, <ENTER> pour valider, <ESC> FIN "
DE%=502:B$=chr$(0):a$=""
FOR I=0 TO 26:FOR j=0 TO 6:PO%=DE%+I*4+J*320:POKE PO%,CT(I,J):NEXT j:NEXT I

WHILE NOT(A$=" " or A$=CHR$(13) or A$=chr$(27))

     IF A$=B$+"P" or A$="2" Then Cy=CY+1
     IF A$=B$+"H" or A$="8" Then CY=CY-1
     IF A$=b$+"M" or A$="6" Then Cx=Cx+1
     If A$=B$+"K" or A$="4" Then Cx=Cx-1
     IF Cy<0  THEN CY=6
     IF CY>6  THEN CY=0
     IF CX<0  THEN CX=26
     IF CX>26 THEN CX=0

 V=DE%+CX*4+CY*320

      POKE K-162,000:POKE K-160,000:POKE K-158,000
      POKE K-002,000:               POKE K+002,000
      POKE K+158,000:POKE K+160,000:POKE K+162,000
      POKE V-162,218:POKE V-160,196:POKE V-158,191

POKE V-002,179:               POKE V+002,179
      POKE V+158,192:POKE V+160,196:POKE V+162,217

      K=V:a$="":While a$="":A$=INKEY$:Wend
 WEND

 C%=CT(CX,CY)
 if a$=chr$(27) then C%=-1

end sub

'=================== Menu de saisi d'un caractäre spÇcifique ================

SUB CHOIXCAR(C%) STATIC

SHARED CN%,FN%,CI%,FI%
STATIC MENU$,CHY%,A$,b$,kl,re$
A$="":kl=0:re$="":C%=0

debutc :
	CHY% = 3
MENU$="entrÇe au Clavier   code Ascii     choix Pratique         Fin       "
	CALL MENU(MENU$,17,15,10,CN%,FN%,CI%,FI%,0,CHY%,-1)
	if CHY% = -1 then c%=-1:goto finch
	ON CHY% gosub CH1,CH2,CH3,FINCH1
	if c%=-1 then goto debutc
	goto finch

CH1 :
CALL FAITUNCADRE(13,11,55,12,CN%,FN%)
COLOR CN%,FN%:LOCATE 12,14:PRINT "Entrez au Clavier votre caractäre : ";
a$=""
WHile A$<>CHR$(13) and a$<>chr$(27)
      Locate 12,50:pRINT A$:C$=A$:a$=""
      While A$="":a$=inkey$:wend
wend
c%=asc(c$)
if a$=chr$(27) then c%=-1:return
gosub testbid
if a$="N" or a$="n" then goto CH1
return

ch2 :

CALL FAITUNCADRE(13,11,55,12,CN%,FN%)
COLOR CN%,FN%:LOCATE 12,14:PRINT "Entrez le code ASCII du caractäre : ";
a$="":B$=CHR$(0):re$="":kl=0
While (a$<>chr$(27) AND a$<>chr$(13))
      A$=""
      while a$="" : a$=inkey$ : wend: a= asc(a$)
      if a>47 and a<57 and kl<3 then
			  kl=kl+1:locate 12,49+kl:print a$
			  re$=re$+a$
			  end if

      if (a$=b$+"K" or a$=b$+"S" or A$=CHR$(8)) and kL>0 then
			  locate 12,49+kl:print " "
			  kl=kl-1:re$=left$(re$,kl)
			  end if
wend
IF A$=CHR$(27) then c%=-1:return
c%=val(re$)
gosub testbid
if a$="n" or a$="N" then goto CH2
return

ch3:
CALL CHXCAR(C%)
IF c%=-1 then return
gosub testbid
if a$="N" or a$="n" then goto ch3
return

Testbid : '++++++++ test ok oui/non !!!! ++++++++++++++

	 CALL FAITUNCADRE(12,9,49,10,CN%,FN%)
	 LOCATE 10,12:PRINT "Caractäre choisi  :       OK? Oui/Non"
	 if c%<>0 then POKE 1506,C%:poke 1507,ci%+fi%*16
	 color ci%,fi%
	 if c%=32 then locate 10,32:print "<SPC>"
	 if c%=0  then locate 10,32:print "<NUL>"
	 A$=input$(1):return

finch1 :
	c%=-1
Finch:
END SUB

'==============================================================================
'||                   Saisi d'un nom de Fichier avec MÇga Controle           ||
'==============================================================================
sub DonneNom(N$,PH$) STATIC

SHARED CN%,FN%,CI%,FI%,NOM$
STATIC C$,U$,FIC$,OK%

IF NOM$=""    THEN FIC$="PASDENOM.PIC":CHY%=3 ELSE FIC$=NOM$:CHY%=4
IF len(U$)<>2 THEN U$="A:":C$="\":FIC$="PASDENOM.PIC":CHY%=3 ELSE CHY%=4

CALL FAITunCADRE(5,2,76,6,CN%,FN%)
COLOR CN%,FN%
LOCATE 3,INT((80-LEN(PH$))/2):PRINT PH$
LOCATE 4,5 :PRINT " UnitÇ disque(tte). : "
LOCATE 5,5 :PRINT " Chemin d'accäs ... : "
LOCATE 6,5 :PRINT " Nom du fichier ... : "


AFFICHERESULTAT :
FOR I=4 TO 6 :LOCATE I,27:PRINT SPACE$(50);:NEXT I
COLOR CI%,FI%
LOCATE 4,27:PRINT U$
LOCATE 5,27:PRINT C$
LOCATE 6,27:PRINT FIC$

CHY%=3
MM$="UnitÇ de disquette    RÇpertoire      Nom du Fichier      Validation         Quitter      "
CALL MENU(MM$,18,31,10,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
IF CHY%=-1 or CHY%=5 THEN PH$="E" : GOTO FICFIN
PH$=""
ON CHY% GOTO UNITE,REPTOIRE,NONFIC,FICFIN

REPTOIRE :

    INV$="CHEMIN ( REPETOIRE ) :"
    OK%=0:M$=C$
    CALL SAISI(10,10,CN%,FN%,INV$,M$,15,50)
    IF M$="Ì" then goto afficheresultat
    CALL ANTIBUG(M$,"/*Êú|#[],;:=+<>&?^",OK%):IF OK% THEN GOTO reptoire
    C$=M$
    GOTO AFFICHERESULTAT

UNITE :

CHY% = INSTR("ABCDEF",LEFT$(U$,1)):IF CHY%=0 THEN CHY%=7
CALL MENU(" A:  B:  C:  D:  E:  F:  ?? ",4,33,10,CN%,FN%,CI%,FI%,0,CHY%,-1)
IF CHY%=-1 THEN GOTO AFFICHERESULTAT
IF CHY%<>7 THEN
	   U$=MID$("A:B:C:D:E:F:",(CHY%-1)*2+1,2):GOTO AFFICHERESULTAT
	   ELSE

CALL FAITUNCADRE(13,11,50,12,CN%,FN%)
COLOR CN%,FN%:LOCATE 12,14:PRINT "Entrez l'UnitÇ  au Clavier  : ";
a$=""
WHile A$<>CHR$(13) and a$<>chr$(27)
      IF A$=>"a" and A$<="z" then A$=chr$(ASC(A$) and 95)
      IF A$=>"A" and A$<="Z" then K$=A$:Locate 12,46:PRINT A$+":"
      A$=""
      While A$="":a$=inkey$:wend
wend
IF A$<>CHR$(27) THEN U$=K$+":"
GOTO AFFICHERESULTAT
	 END IF

NONFIC :
    INV$="Nom du fichier :"
    OK%=0:M$=FIC$
    CALL SAISI(20,15,CN%,FN%,INV$,M$,12,12)
    IF M$="Ì" then goto afficheresultat
    CALL ANTIBUG(M$,"\/*Êú|#[],;:=+<>&?^",OK%):IF OK% THEN GOTO NONFIC
    FIC$=M$:NOM$=FIC$
    GOTO AFFICHERESULTAT

FICFIN :

IF RIGHT$(C$,1)<>"\" then sup$="\" else sup$=""
N$=U$+C$+SUP$+FIC$

end sub

' ---------------------------------------------------------------------------
' ProcÇdure qui contrìle si une chaine de caractäre est valide pour des
' accäs disque NOM = 8 car, EXT = 3 car, pas de car. interdit etc ....
' *********** DE DARCHE Yoann 26/01/91 **************************************
' ---------------------------------------------------------------------------
SUB ANTIBUG(C$,B$,OK%) static

SHARED CN%,FN%

IF INSTR(B$,"\") = 0 THEN
			 IF MID$(C$,1,1)<>"\" then C$="\"+C$
			 CPT%=1
		     ELSE
			 CPT%=0
		     END IF

PT%=0:MAX%=8:CPT$="Chaine trop longue pour un Nom !"

For I = 1 To Len(C$)
    A$=MID$(C$,I,1)
    IF INSTR(B$,A$)<>0 THEN M$="Caractäre invalide : "+a$+" !":goto erreur
    IF A$="\" Then
		  IF PT%<>0 AND CPT%=0 THEN BEEP:M$="Recontre d'un Æ . Ø sans dÇfinition d'une extension":GOTO ERREUR
		  IF CPT%=0 THEN M$="Rencontre de deux antislash !! Æ \ Ø sans dÇfinition entre !":GOTO ERREUR
		  CPT%=0:PT%=0:MAX%=8:CPT$="Chaine trop longue pour un Nom !":GOTO SCH
    END IF
    IF A$="." Then
		   IF PT%<>0 THEN BEEP:M$="Erreur deux points recontrÇs !":Goto Erreur
		   IF CPT%=0 THEN BEEP:M$="DÇfinition d'une extention sans Nom !":goto Erreur
		   PT%=1:CPT%=0:MAX%=3:CPT$="Chaine trop longue pour une extention !"
		   Goto SCH
    END IF

    CPT%=CPT%+1
    IF CPT% > MAX% THEN M$=CPT$:GOTO ERREUR
    SCH :
next I:M$=""

ERREUR :
    IF M$<>"" THEN
	      L=LEN(M$):L=L+4:X1%=INT((80-L)/2)
	      CALL FAITUNCADRE(X1%,8,X1%+L,9,31,4)
	      LOCATE 9,X1%+2:PRINT M$
	      OK%=-1:A$=INPUT$(1)
    END IF
COLOR CN%,FN%

END SUB

'================================ Sous Programme Qui affiche le rÇpetoire ===

CATALOGUE :

IF CATAC$="" THEN CATAC$="A:\*.PIC"
M$=CATAC$
COLOR CN,FN
IDEM :
    INV$="CHEMIN ( REPETOIRE ) :"
	OK%=0:
    CALL SAISI(10,10,CN%,FN%,INV$,M$,15,50)
	IF M$="Ì" then goto FinCata
	CALL ANTIBUG(M$,"Êú|#[]/,;=+<>&^",OK%):IF OK% THEN GOTO IDEM
	m$=right$(m$,len(m$)-1)
	CATAC$=M$
CLS:FILES M$:A$=INPUT$(1)

CALL MENU(" ENCORE   FIN   ",8,33,10,CN%,FN%,CI%,FI%,0,CHY%,0)
IF CHY%=1 THEN GOTO IDEM

FINCata :
PCOPY 1,0:RETURN

' ==================== CLS PARTICULIER ======================================

CLS.SPEC :

IF COL%=0 THEN COL%=7
CALL PFENETRE(FX1%,FY1%,FX2%,FY2%,3)
CALL CHOIXCAR(CAR%):DF%=1
IF CAR%=-1 THEN RETURN
CALL COLORC(COL%,0,df%)
IF DF%=-1 THEN RETURN
CALL SCLS(FX1%,FY1%,FX2%,FY2%,CAR%,COL%):RETURN

' ========================= Routine Cls =====================================
SUB SCLS(A%,B%,C%,D%,E%,F%) STATIC

SHARED CI%,FI%

	PCOPY 3,0
		For i=A% TO C%:FOR J=B% TO D%
		CUR=J*160+I*2:POKE CUR,E%:POKE CUR+1,F%
		Next j:Next I
		LOCATE 25,10:COLOR CI,FI:PRINT " ETES - VOUS SURE DE VOILOIRE EFFACER CETTE PORTION [O/N] ";
		XDF=0:While XDF=0
			A$=INPUT$(1)
			IF A$="O" OR A$="o" THEN PCOPY 0,3:PCOPY 0,1:XDF=10
			IF A$="N" OR A$="n" THEN XDF=10
		WEND
	PCOPY 0,3
	PCOPY 0,1
END SUB

' ====================== dÇfinie une fenàtre ================================

SUB PFENETRE(X1%,Y1%,X2%,Y2%,PAG%) STATIC

Shared Ta%(),CN%,FN%,CI%,FI%

MM$="Tout l'Ecran   Fenàtre  ":CHY%=2
CALL MENU(MM$,12,20,12,CN%,FN%,CI%,FI%,0,CHY%,-1)
IF CHY%=-1 THEN a$=chr$(27) else A$=""
IF CHY%=1  THEN A$=Chr$(13):XA=0:YA=0:YB=23:XB=79 else ya=12:XA=39:XB=39:YB=12

pcopy PAG%,0

 CU2=4006:AU2=CU2:CU1=4006:AU1=CU1:Y2=YB:X2=XB:X1=XA:Y1=YA
 CO%=CN%+16*FN%
 IF CN%>15 THEN CO%=CO%+112

While A$<>chr$(13) AND A$<>chr$(27)

	V=(XA=XB)*-2+(YA=YB)*-1
	W=(XA=XB)*-8+(YA=YB)*-4
	V= ((V=0) AND 217) + ((V<>0) AND Ta%(V))
	W= ((W=0) AND 218) + ((W<>0) AND Ta%(W))

	CU1=XA*2+160*YA:CU2=XB*2+YB*160
	POKE AU1,VA1:POKE AU1+1,VB1
	POKE AU2,VA2:POKE AU2+1,VB2
	VA1=PEEK(CU1):VA2=PEEK(CU2):VB1=PEEK(CU1+1):VB2=PEEK(CU2+1)
	POKE CU1,W:POKE CU2,V:POKE CU1+1,CO:POKE CU2+1,CO
	AU1=CU1:AU2=CU2


       A$=""
       While a$="" :A$=INKEY$:WEND

		IF A$="8" AND Y1>0  THEN Y1=Y1-1:GOTO 150
		IF A$="2" AND Y1<23 THEN Y1=Y1+1:GOTO 150
		IF A$="4" AND X1>0  THEN X1=X1-1:GOTO 150
		IF A$="6" AND X1<79 THEN X1=X1+1:GOTO 150
		IF A$=CHR$(0)+"K" AND X2>0 THEN X2=X2-1:GOTO 150
		IF A$=CHR$(0)+"M" AND X2<79 THEN X2=X2+1:GOTO 150
		IF A$=CHR$(0)+"H" AND Y2>0 THEN Y2=Y2-1
		IF A$=CHR$(0)+"P" AND Y2<24 THEN Y2=Y2+1
	150:    IF X1>X2 THEN XA=X2:XB=X1 ELSE XA=X1:XB=X2
		IF Y1>Y2 THEN YA=Y2:YB=Y1 ELSE YA=Y1:YB=Y2


Wend

X1=XA:Y1=YA:X2=XB:Y2=YB

IF A$=CHR$(27) Then X1%=-1

PCOPY PAG%,0
End sub

' ========================== Sous prog de Copie =============================

sub COPYPA(XA%,YA%,XB%,YB%,DECA%) Static

SHARED CN%,FN%
COU%=FNCO%(CN%,FN%):DEB%=-1
'IF PAGE%=2 THEN DECA%=8192 ELSE DECA%=12288
'---------------------------- Calcule interne ----------
CY%=YA%:CX%=XA%:A$="":b$=chr$(0)
DIX%=XB%-XA%:DIY%=YB%-YA%
APOS1%=1:APOS2%=1:CA1%=PEEK(APOS1%):ACO1%=PEEK(APOS1%+1):CA2%=CA1%:ACO2%=ACO1%
car1%=218:car2%=217
IF DIX%=0 THEN CAR1%=31:CAR2%=30
IF DIY%=0 THEN
	  IF DIX%=0 THEN CAR1%=254:CAR2%=254 ELSE CAR1%=16:CAR2%=17
	  END IF
'-------------------------------------------------------

While A$<>chr$(13) and a$<>chr$(27)

'------ Calcule des positions curseurs (le 2Çme) -------
AX%=CX%:AY%=CY%:BX%=CX%+DIX%:BY%=CY%+DIY%
IF DEB% THEN
	    IF AX%<0  THEN AX%=80+AX%:CX%=AX%
	    IF AY%<0  THEN AY%=24+AY%:CY%=AY%
	    IF BX%>79 THEN BX%=BX%-80
	    IF BY%>23 THEN BY%=BY%-24
	ELSE
	    IF AX%<0  THEN AX%=0
	    IF AY%<0  THEN AY%=0
	    IF BX%>79 THEN BX%=79
	    IF BY%>23 THEN BY%=23
	    IF BX%<0  THEN BX%=79:AX%=79-DIX%:CX%=AX%
	    IF BY%<0  THEN BY%=23:AY%=23-DIY%:CY%=AY%
	    IF AX%>79 THEN AX%=0 :BX%=DIX%   :CX%=AX%
	    IF AY%>23 THEN AY%=0 :BY%=DIY%   :CY%=AY%
	END IF

'-------- Affichage des curseurs sur l'Çcran -----------
 POKE APOS1%,CA1%:POKE APOS2%,CA2%:POKE APOS1%+1,ACO1%:POKE APOS2%+1,ACO2%
 POSI1%=AX%*2+AY%*160:APOS1%=POSI1%:POSI2%=BX%*2+BY%*160:APOS2%=POSI2%
 ACO1%=PEEK(POSI1%+1):ACO2%=PEEK(POSI2%+1):CA1%=PEEk(POSI1%):CA2%=PEEK(POSI2%)
 POKE POSI1%,CAR1%:POKE POSI2%,CAR2%:POKE POSI1%+1,COU%:POKE POSI2%+1,COU%

     A$=FNTOUCHE$

     IF A$=B$+"P" or A$="2" Then CY%=CY%+1
     IF A$=B$+"H" or A$="8" Then CY%=CY%-1
     IF A$=b$+"M" or A$="6" Then CX%=CX%+1
     If A$=B$+"K" or A$="4" Then CX%=CX%-1
     If A$="D"    or A$="d" Then DEB%=NOT(DEB%)
     If CX%< -DIX%          THEN CX%=79
     If CX%>79              Then CX%=0
     If CY%< -DIY%          Then CY%=23
     If CY%>23              Then CY%=0

WEND
PCOPY 3,0

FOR I=0 TO DIX%
	FOR J=0 TO DIY%
		VX%=AX%+I:VY%=AY%+J
		IF ( VX%>BX% OR VY%>BY% ) AND NOT(DEB%) THEN VX%=0:VY%=24
		IF DEB% THEN
			    VX%= (VX% + (VX%>79)*80)
			    VY%= (VY% + (VY%>23)*24)
			END IF

		POSR%=VX%*2+VY%*160
		POSS%=DECA%+(XA%+I)*2+(YA%+J)*160
		POKE POSR%,PEEK(POSS%):POKE POSR%+1,PEEK(POSS%+1)
	NEXT J
NEXT I
OK%=-1
COLOR CN%,FN%:LOCATE 25,1:PRINT "                  VOULEZ-VOUS CONSERVER CETTE TRANSFORMATION                    ";
While OK%
	A$=FNTOUCHE$
	IF A$="O" or A$="o" then PCOPY 0,3:pcopy 0,1:OK%=0
	IF A$="N" or A$="n" then PCOPY 3,0:pcopy 0,1:OK%=0
Wend
END SUB
' ========================== Sous prog de SAISI =============================

DESSIN :

A$=""

While (A$<>chr$(27))

     A$="":WHILE A$="":A$=INKEY$:WEND
     B$=CHR$(0):P2=P1:CM1=0:CM2=0

     GOSUB GESTION.TOUCHE

     P1=(X-1)*2+(Y-1)*160
	 AN=PEEK(P2):CALL VERIF(AN):CO=(CM2 OR CR1) :CALL CALCUL(AN,CO,V,D,NO,PRD%)
     POKE P2+1,CND%:POKE P2,CC(NO)
	 AN=PEEK(P1):CALL VERIF(AN):CO=CM1          :CALL CALCUL(An,CO,V,D,NO,PRD%)
     POKE P1+1,CID%:POKE P1,CC(NO):CR1=CM1

Wend:POKE P1+1,CND%:pcopy 0,3:RETURN

'---------------------------------------------------------------------------

GESTION.TOUCHE :

      IF A$=B$+"M" OR A$="6" THEN X=X+1:V=0 :CM2=2:CM1=8
      IF A$=B$+"K" OR A$="4" THEN X=X-1:V=0 :CM2=8:CM1=2
      IF A$=B$+"H" OR A$="8" THEN Y=Y-1:V=-1:CM2=1:CM1=4
      IF A$=B$+"P" OR A$="2" THEN Y=Y+1:V=-1:CM2=4:CM1=1
      IF A$=CHR$(27)         THEN IND%=-1
      IF A$=B$+";"           THEN MEN%=-1:A$=CHR$(27)
      IF A$="D"    OR A$="d" THEN D=-1
      IF A$="S"    OR A$="s" THEN D=0
      IF A$="X"    OR A$="x" THEN CPA1%=NOT(CPA1%)

      IF Y<1  THEN Y=24
      IF X<1  THEN X=80
      IF X>80 THEN X=1
      IF Y>24 THEN Y=1

RETURN


'======================== OPTION du MODE TRACE ==============================

SUB SAUV(NOI$,PAG%) STATIC

SHARED NOM$,CPA1%,CPA2%

	NOM$=NOI$:N$="":PH$="NON DU FICHIER A ENREGISTRER"
	CALL DonneNom(N$,PH$)
	PCOPY PAG%,0
	IF PH$="E" THEN PCOPY 3,0:EXIT Sub
	BSAVE N$,0,4000
	PCOPY 3,0
	IF PAG%=2 THEN CPA2%=0 ELSE CPA1%=0
	NOI$=NOM$

END SUB

'================= Sub de Chargement ========================================

SUB RAPP(NOI$,PAG%) STATIC

SHARED NOM$,CPA1%,CPA2%,CN%,FN%,CI%,FI%

IF PAG%=2 THEN DECA%=8192:NP%=2 ELSE DECA%=12288:NP%=1
CALL VERIPAGE(PAG%):IF PAG%=-1 THEN EXIT SUB
NOM$=NOI$:N$="":PH$="NON DU FICHIER A CHARGER"
CALL DonneNom(N$,PH$)
IF PH$="E" THEN EXIT Sub
BLOAD N$,DECA%
PCOPY 3,0:PCOPY 0,1
End Sub

'================== Sub de VÇrification de sauvegarde d'une page avant Cls ===
SUB VeriPage(N%) Static
	SHARED CPA1%,CPA2%,NOM1$,NOM2$
	S%=0
	IF CPA1% AND N%=3 THEN CALL INTEROGE(NOM1$,N%,S%)
	IF CPA2% AND N%=2 THEN CALL INTEROGE(NOM2$,N%,S%)
	IF S%=-1 THEN N%=-1
END SUB

SUB INTEROGE(No$,NN%,S%) Static

SHARED CN%,FN%,CI%,FI%

	IF NN%=0 OR NN%=1 OR NN%=3 THEN NP%=1 ELSE NP%=2
	CALL FaitUnCADRE(30,5,50,17,15,4)
	COLOR 15,4
	LOCATE 7,32:PRINT "La Page N¯";NP%;" est"
	LOCATE 9,33:PRINT "NON SAUVEGARDêE":CPY%=1
	Reprend :

	CALL MENU("Sauver pageAnnuler CMD  Ignorer  ",11,34,11,CN%,FN%,CI%,FI%,0,CPY%,-1)
	IF CPY%=-1 THEN Beep:Goto Reprend
	IF CPY%=1  THEN Call SAUV(No$,NN%):S%=0
	IF CPY%=2  THEN S%=-1
	IF CPY%=3  THEN S%=0

END SUB
'========================== DÇbut du programme Enfin !!! =====================
debut :

B$=chr$(0)

      A$=FNTOUCHE$
      GOSUB GESTION.TOUCHE

      P1=(X-1)*2+(Y-1)*160
      POKE P2+1,CMC%:CMC%=PEEK(P1+1):POKE P1+1,CID%:P2=P1
      IF A$=CHR$(27) THEN MEN%=-1 ELSE MEN%=0

	   ' Aiguillage des activitÇe des sous gros programmes !!

	   IF NOT(IND%) THEN GOSUB DESSIN :POKE P1+1,CND%  :GOSUB Affiche.Ligne
	   IF MEN%      THEN GOSUB DEBUTAZ:PCOPY 3,0:MEN%=0:GOSUB Affiche.Ligne

GOTO Debut

DEBUTAZ :

	GOSUB Affiche.Ligne
	MM$="UtilitÇsFichiers Texte   Dessin  Config Quitter "
	CALL MENUB(MM$,8,1,CN%,FN%,CI%,FI%,CHX%,-1)
	IF CHX%=-1           THEN RETURN
	PCOPY 0,1
	IF CHX%=6            THEN GOTO FINPROG
	ON CHX% GOSUB MENU1,MENU2,MENU3,MENU4,MENU5
	IF CHY%=-3 OR CHY%=3 THEN CHx%=CHx%+1
	IF CHY%=-2 OR CHY%=2 THEN CHX%=CHX%-1
	PCOPY 1,0
a$="":Goto DEBUTAZ

TRAITERREUR :
PCOPY 3,0
CALL FAITUNCADRE(29,10,51,14,15,4)
LOCATE 11,32:PRINT "Une ERREUR s'est"
LOCATE 12,36:PRINT "produite"
LOCATE 13,31:PRINT "N¯ d'Erreur : ";:PRINT USING "###";ERR
LOCATE 14,29:PRINT "Appuyez sur une touche"
A$=input$(1)
PCOPY 3,0
RESUME debut

MENU1 :

cm$=cHR$(26)
MM$=" cls Total cls fEnetrecls SpÇcial Copie 1"+CM$+"1  cOpie 2"+CM$+"1 Filtres <F>"
CHY%=6
CALL MENU(MM$,11,3,3,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
IF CHY%=-1 OR CHY%=0 THEN Return
ON CHY% GOSUB Cls.T,CFLS,CLS.SPEC,COPIE11,COPIE21,FIS
RETURN

MENU2 :
CHY%=5
MM$="  Sauve 1   sAuve 2 Rappelle 1raPpelle 2Catalogue "
CALL MENU(MM$,10,18,3,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
ON CHY% GOSUB SAUV1,SAUV2,RAPP1,RAPP2,CATALOGUE
RETURN

MENU3 :
CHY%=3
mm$="marge Ö Droite   marge Ö Gauche   couleurs Texte   couleurs cUrseur Centre   <C>     PrioritÇ <P>     Çcriture   ActiveÇcriture Inactive"
CALL MENU(MM$,17,31,3,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
RETURN

MENU4 :
CHY%=1
mm$="couleurs TracÇcouleurs Cur. Simple   <S>  Double   <D>  PrioritÇ      iMage1/image2 tracÇ   Actif tracÇ Inactif "
CALL MENU(MM$,14,41,3,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
IF CHY%=-1 OR CHY%=0 THEN Return
ON CHY% GOSUB Couleur.Trace,Couleur.Cur,Simple,Double,Priorite.Trace,ImageI,Trace.A,Trace.I
IF CHY%=-1 THEN RETURN
GOSUB Affiche.Ligne
goto Menu4

MENU5 :
CHY%=3
MM$="Couleur         Monochrome <M>  couleur Normale couleur InversÇeSauve config    ligne d'Çtat Ac.ligne d'Çtat in."
CALL MENU(MM$,16,51,3,CN%,FN%,CI%,FI%,chx%,CHY%,-1)
IF CHY%=-1 OR CHY%=0 THEN Return
ON CHY% GOSUB Couleur.E,Monochrome,Couleur.text,Couleur.Curs,Sauve.Config,Ligne.A,Ligne.I
IF CHY%=-1 THEN RETURN
GOSUB Affiche.Ligne
Goto Menu5

'=======
IN :
CALL FAITUNCADRE(20,11,60,12,CI%,FI%):LOCATE 12,25:PRINT " PAS ENCORE DISPONIBLE !!!!!! "
a$=input$(1)
RETURN

'================== Option Menu1 ===========================================
MM$=" cls Total cls fEnetrecls SpÇcial Copie 1"+CM$+"1  cOpie 2"+CM$+"1 Filtres <F>"
Cls.T         : COLOR 7,0:CLS:PCOPY 0,3:PCOPY 0,1:CHY%=-1:RETURN
CFLS          : Call Pfenetre(X1%,Y1%,X2%,Y2%,3)
		Call SCLS(X1%,Y1%,X2%,Y2%,32,7)
		RETURN
FIS           : CALL Pfenetre(X1,Y1,X2,Y2,3)
		IF X1=-1 THEN RETURN
		B$=CHR$(26)
		MM$="CAR "+B$+" COUCOU "+B$+" CARCOU "+B$+" COUCAR "+B$+" CAR QUITTER "
		CHY%=5
		CALL MENU(MM$,9,28,8,CN%,FN%,CI,FI,0,CHY%,0)
		IF CHY%=5 or CHY%=-1 THEN RETURN
		F1%=0:F2%=0:s%=1:nc%=0:rc%=0
		IF CHY%=1 THEN F1%=-1
		IF CHY%=2 THEN F2%=-1
		IF CHY%=4 THEN F1%=-1:F2%=-1
		IF F1% THEN Call ChoixCar(RC%) ELSE Call Colorc(RC%,N,S%)
		IF RC%=-1 or s%=-1 Then return
		s%=1
		IF F2% THEN Call ChoixCar(NC%) ELSE Call Colorc(NC%,N,S%)
		IF NC%=-1 or s%=-1 Then return
		PCOPY 3,0:CALL FILTRES(RC%,NC%,F1%,F2%,X1%,Y1%,X2%,Y2%)
		PCOPY 0,1:RETURN
COPIE11       : PCOPY 3,0:COLOR CN%,FN%
		LOCATE 25,23:PRINT " SÇlectionnez la partie Ö copier ";
		CALL PFENETRE(FX1%,FY1%,FX2%,FY2%,3)
		LOCATE 25,23:PRINT "   Positionnez la partie copier  ";
		CALL   COPYPA(FX1%,FY1%,FX2%,FY2%,12288):RETURN
COPIE21       : PCOPY 2,0:COLOR CN%,FN%
		LOCATE 25,23:PRINT " SÇlectionnez la partie Ö copier ";
		CALL PFENETRE(FX1%,FY1%,FX2%,FY2%,2)
		PCOPY 3,0:LOCATE 25,23:PRINT "   Positionnez la partie copier  ";
		CALL   COPYPA(FX1%,FY1%,FX2%,FY2%,8192):RETURN
'================== Option Menu2 ===========================================
SAUV1         : CALL SAUV(NOM1$,3)   :RETURN
SAUV2         : PCOPY 2,0:CALL SAUV(NOM2$,2):RETURN
RAPP1         : CALL RAPP(NOM1$,3)   :RETURN
RAPP2         : CALL RAPP(NOM2$,2)   :RETURN
'================== Option Menu3 ===========================================
' Quedal !!!
'================== Option Menu4 ===========================================
Couleur.Trace : CALL COLORC(CND%,0,1):RETURN
Couleur.Cur   : CALL COLORC(CID%,0,1):RETURN
Simple        : D= 0:RETURN
Double        : D=-1:RETURN
Priorite.Trace: PRD%=NOT(PRD%):RETURN
ImageI        : SWAP NOM1$,NOM2$:SWAP CPA1%,CPA2%:Pcopy 2,0:PCOPY 3,2:pcopy 0,3:PCOPY 0,1:CHY%=-1:RETURN
Trace.A       : IND=0:RETURN
Trace.I       : Ind=-1:RETURN
'==================== Option Menu5 =========================================
Monochrome    : CN%=7 :FN%=0:CI%=0 :FI%=7:CHY%=-1:RETURN
Couleur.E     : CN%=11:FN%=1:CI%=14:FI%=4:CHY%=-1:RETURN
Couleur.TEXT  : CALL COLORC(CN%,FN%,0):RETURN
Couleur.Curs  : CALL COLORC(CI%,FI%,0):RETURN
Ligne.A       : LIN%=0 :RETURN
Ligne.I       : LIN%=-1:RETURN

'================== Affiche la Ligne d'Çtat ================================
Affiche.Ligne :
Color CN%,FN%:LOCATE 25,1:PRINT SPACE$(78);
IF LIN THEN RETURN
Locate 25,1:PRINT "Ecriture ";
Locate 25,31:PRINT "Dessin ";
Locate 25,10
IF INE% THEN PRINT "INACTIVE"; ELSE PRINT " ACTIVE ";
IF PRE% THEN Locate 25,19:PRINT "PRIORITAIRE";
Locate 25,38
IF IND% THEN PRINT "INACTIF"; ELSE PRINT " ACTIF ";
IF PRD% THEN LOCATE 25,46:PRINT "PRIORITAIRE";
Locate 25,58
IF D THEN PRINT "DOUBLE"; ELSE PRINT "SIMPLE";
POKE 3994,42:POKE 3995,CNT%:POKE 3998,42:POKE 3999,CND%
RETURN

'================================ FIN =======================================
FINPROG :
COLOR 7,0
IF NOT(CPA1%) AND NOT(CPA2%) THEN CLS:PRINT "Vous avez le bonjour de "+Yoann$:END

PCOPY 1,0
A$=input$(1)
PCOPY 2,0
A$=input$(1)
PCOPY 3,0
A$=input$(1)
END

'================================= SAUVE Les configurations =================
SAUVE.CONFIG :
OPEN "O",#1,"CREAPAGE.CFG"
WRITE #1,CN%,FN%,CI%,FI%,LIN%
Close:RETURN
'================================= RAPPELLE Configurations ==================
RAPP.CONFIG :
OPEN "I",#1,"CREAPAGE.CFG":INPUT #1,A$,B$,c$,d$,e$:CLOSE
CN%=VAL(A$):FN%=VAL(B$):CI%=val(C$):FI%=VAL(D$):LIN%=VAL(E$):RETURN



