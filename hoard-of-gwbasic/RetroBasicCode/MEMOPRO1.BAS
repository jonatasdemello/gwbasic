'***************************************************************************
'**

def seg=&hb800   ' ****$ &hB000 pour un HERCULE **********
CY%=1:CX%=1
DIM CARTE%(16,4),C1%(32),C2%(32),C3%(32),C4%(32),C%(8)
randomize timer

FOR I=1 TO 32:READ C1%(I),C2%(I),C3%(I),C4%(I):NEXT I ' READ LES DATAS !!!

' constante MONOCHROME :  ( eh oui !! il en faut je me passerai bien ! )

C%(1)=219  :  C%(5)=233
C%(2)=254  :  C%(6)=240
C%(3)=079  :  C%(7)=042
C%(4)=120  :  C%(8)=004

' encore et toujours des constantes !!! (video en plus) ====================

F1$=CHR$(24):F2$=CHR$(25):F3$=CHR$(27):F4$=CHR$(26)

REM Vives les datas tralala !!!! ********* CONSTANTE : FORMES/COULEUR ******
    ' 1,2,3,4,5,6,7,8 = couleurs (caractŠres pour mono )
    ' un type de carte est form‚ de 4 couleurs/formes

formesC :

 DATA 1,1,1,1 ,2,2,2,2 ,3,3,3,3 ,4,4,4,4 ,5,5,5,5 ,6,6,6,6 ,7,7,7,7 ,8,8,8,8
 DATA 1,2,1,2 ,2,1,2,1 ,3,2,3,2 ,8,2,8,2 ,8,6,8,6 ,8,5,8,5 ,7,1,7,1 ,1,7,1,7
 DATA 4,2,2,4 ,1,3,3,1 ,8,1,1,8 ,6,3,3,6 ,1,1,2,2 ,5,5,4,4 ,5,5,7,7 ,6,6,8,8
 DATA 4,5,5,4 ,3,6,6,3 ,2,7,7,2 ,2,6,6,2 ,6,2,2,6 ,5,7,7,5 ,8,5,5,8 ,2,5,2,5

'===========================================================================
'      PROGRAMME PRINCIPAL AL AL ALLEEEE !!!!!
'===========================================================================

SCREEN 2:SCREEN 0
COLOR 7:MENU$="INITIALISATION ECRAN":gosub faitcadre
locate 10,20:PRINT "-1- Pour ‚cran CGA couleur "
locate 12,20:PRINT "-2- Pour ‚cran CGA monochrome / CGA Plasma "
locate 14,20:PRINT "-3- Pour ‚cran HERCULE "
Locate 16,20:PRINT "-Q- Pour fin ( ou <ESC> … tout moment du jeu )"

PrendReponse :

  R$=INPUT$(1):if R$=chr$(27) or r$="q" or R$="Q" then goto FINPROG

 IF R$="1" or R$="&"      THEN MONO%=0 :DEF SEG = &HB800:GOTO JEU
 IF R$="2" OR R$="‚"      THEN MONO%=-1:DEF SEG = &HB800:GOTO JEU
 IF R$="3" OR R$=CHR$(34) THEN MONO%=-1:DEF SEG = &HB000:GOTO JEU

  BEEP:GOTO PrendReponse

Jeu : ' ah ‡a va enfin p‚ter dans l'‚cran !!!! (pas trop ouffff !!)

CLS:COLOR 7,0:MENU$="MEMO LE JEU DE MEMOIR":gosub faitcadre

Locate 5,20:PRINT " Choisisez le niveau de difficulter !! "
Locate 7,10:Print " Attention ne pas se surestimer sinon c'est la gamelle !!! HiHi !!"

Locate 12,20:PRINT "-1- Tr‚s facile (L'ordinateur est nul !!)"
Locate 14,20:PRINT "-2- Moyen       (Il faut une meilleure m‚moire)"
Locate 16,20:PRINT "-3- Tr‚s D–re   (alors il faut ˆtre un pro !! )"
Locate 18,20:PRINT "-Q- Salut !!! … la prochaine ( == <ESC> ) "

PrendrEponse1 :

  R$=INPUT$(1):if R$=chr$(27) or r$="q" or R$="Q" then goto FINPROG

 IF R$="1" or R$="&"      THEN GOSUB Faitpage:GOTO JEU1
 IF R$="2" OR R$="‚"      THEN GOSUB Faitpage:GOTO JEU2
 IF R$="3" OR R$=CHR$(34) THEN GOSUB Faitpage:GOTO JEU3

  BEEP:GOTO PrendReponse1

JEU1:
GOSUB PREMIERE:LOCATE 24,70:PRINT "FACILE !";

Gosub ChoixDeLui:k=0
joue :

X1=0:Y1=0:X2=0:Y2=0

While (carte%(X1,Y1)=0)
     X1=INT(RND(1)*16)+1:Y1=INT(RND(1)*4)+1
Wend

While (CARTE%(X2,Y2)=0 or (X1=X2 AND Y1=Y2))
      X2=INT(RND(1)*16)+1:Y2=INT(RND(1)*4)+1
Wend

x=x1:y=y1:gosub AfficheCarte   'Montre les cartes
x=x2:y=y2:gosub AfficheCarte

IF CARTE%(X1,Y1)=CARTE%(X2,Y2) THEN CARTE%(X1,Y1)=0:CARTE%(X2,Y2)=0:m$=" Je les gagne ":m=1 else m$=" J'ai perdu ..":m=0

COLOR 28,0
LOCATE 22,30:PRINT M$;:IF MONO THEN COLOR 15,0 ELSE COLOR 11,1

if m=0 THEN
	   x=x1:y=y1:gosub cadrerenverser
	   x=x2:y=y2:gosub cadrerenverser
       ELSE
	   k=k+1
       END IF

IF K=>32 THEN END

GOTO JOUE:
CHOIXDELUI:
RETURN
JEU2:
JEU3:
END
'===========================================================================
'   LES DIVERSES SOUS PROCEDURES DE TOUT TYPE COUCOU c'est Yoyo !!!
'===========================================================================
faitpage :   ' *************************************** INITIALISATION ******

CLS
For X=1 to 16
    For Y=1 to 4
	gosub cadrerenverser
    next Y
next X

 For I=1 TO 32

    For J=1 to 2

    X=INT(RND(1)*16)+1:Y=INT(RND(1)*4)+1

    IF carte%(X,Y)=0 then carte%(x,y)=i:goto nf

    For x=1 to 16
       For y=1 to 4
       IF carte%(x,y)=0 then carte%(x,y)=i :goto nf

       NEXT y
    NEXT x

nf :

  Next J:NEXT I

RETURN


cadrerenverser :  ' FAIT UNE CARTE RENVERSE A LA POSITION X,Y  **************
	     ' Chouette des peek des pook des peek, pook, popekopoke !!!!
 xr%=(x-1)*10
 yr%=(y-1)*800
 CT%=480+yr%+xr%

POKE XR%+YR%  ,201 :POKE CT%  ,200 :POKE XR%+YR%+160,186 :POKE XR%+YR%+162,176
POKE XR%+YR%+2,205 :POKE CT%+2,205 :POKE XR%+YR%+320,186 :POKE XR%+YR%+164,176
POKE XR%+YR%+4,205 :POKE CT%+4,205 :POKE XR%+YR%+166,186 :POKE XR%+YR%+324,176
POKE XR%+YR%+6,187 :POKE CT%+6,188 :POKE XR%+YR%+326,186 :POKE XR%+YR%+322,176

 FOR M%=YR% TO YR%+480 step 160
 FOR K%=XR%+1 TO XR%+7 step 2 : POKE K%+M%,4 :NEXT K%
 NEXT M%

RETURN

AfficheCarte :


   XR%=(X-1)*10
   YR%=(Y-1)*800
   N=CARTE%(X,Y)

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

RETURN

REM Cn%(N) revoit º pour un ecran monochrome le code caractŠre
REM               º pour un ‚cran couleur    la couleur


FaitCadre : ' CELA FAIT UN CADRE A L'ECRAN !!!

POKE 0,201:FOR K=2 TO 156 STEP 2:POKE K,205:POKE K+320,205
POKE K+3680,205:NEXT K:POKE 158,187:POKE 160,186:POKE 318,186:POKE 320,204
POKE 478,185:POKE 3680,200:POKE 3838,188:FOR K=480 TO 3520 STEP 160
POKE K,186:POKE K+158,186:NEXT
LX=int((80-len(menu$))/2):locate 2,lx:print menu$:return

PREMIERE : '****************************************************************

IF NOT MONO% THEN COLOR 14,4 ELSE COLOR 0,7
LOCATE 25,1
PRINT "  <ESC> Fin  /  (8) ";F1$;" / (2) ";F2$;" / (4) ";F3$;" / (6) ";F4$;"  /   <SPC> ou <ENTER> pour choix  ";

IF MONO% THEN COLOR 15,0 ELSE COLOR 13,1
LOCATE 24,60 :PRINT " NIVEAU : ";


RETURN

FINPROG : ' D‚j… !!! oh! non non non c'‚tait trop bien pourquoi finir ???!!

 CLS:PRINT " UN GRAND OU PETIT BONJOUR DE DARCHE Yoann .. ":END

' et c'est d‚j… fini .....

