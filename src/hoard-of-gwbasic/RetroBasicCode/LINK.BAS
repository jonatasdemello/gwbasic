' LINKER SpeciAle YOANN DARCHE

ON ERROR GOTO Erreur

de = 0: j = 0:

DIM n$(100)
CLS : COLOR 12,0
INPUT " Directorie de lecture : ",DIR$
CLS:COLOR 13,0
FILES DIR$+"\*.*"
COLOR 11,1
LOCATE 25,1:PRINT "  =====-===== Le linker methode DARCHE Yoann =====-===== ";
LOCATE 10,1:COLOR 12,0
INPUT " Nom du fichier de destination : ",ND$
OPEN ND$ AS #2 len = 8
FIELD #2,8 as LF$

n$(0)=ND$

      PIMAGE :
K=K+1
PRINT " Non de l'image nø";K;" : ";
INPUT "",N$(K)
IF N$(K)="FIN" OR N$=chr$(13) THEN K=K-1:GOTO Suite

Goto Pimage

Suite :

FOR I=0 TO K:PRINT N$(I):NEXT I

FOR J=1 TO K

	    OPEN DIR$+"\"+N$(J) AS #1 len = 8
	    FIELD #1,8 as L$


PRINT " THE Linkage du fichier ";N$(J);" dans ";N$(0)
Print string$(79,"-")

For I=2 TO 501
	      get #1,I
KL=I+(J-1)*500-1
GET #2,KL
p$=mid$(l$,2,1)+mid$(l$,1,1)+mid$(l$,4,1)+mid$(l$,3,1)+mid$(l$,6,1)
p$=p$+mid$(l$,5,1)+mid$(l$,8,1)+mid$(l$,7,1)
Lset LF$=p$
p$=""
PUT #2,KL
NEXt I
CLOSE 1
NEXT J

CLS:PRINT " ----- J'ai Fini le boulot bonhomme -------- "
PRINT " Appuyer sur une touche pour finir et retour au DOS ..."
A$=input$(1)
CLOSE
END

Erreur :
	Print "Une erreur fatal c'est produite ..... "
	IF err=64 then print N$(j);" N'est pas un nom de fichier valide"
	IF err=53 then print n$(j);" est introuvable .. "
	PRINT " Donc punition oblige retour direct au dos "
	end

