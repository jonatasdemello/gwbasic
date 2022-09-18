1 ' ************************************************************************
2 '      Programme de gestion d'espace imprimable pseudo intelligent
3 ' a partir d'un texte stok‚ dans TEXT$, pouvant contenir le code de
4 ' controle suivant : 13 ( retour chario ), le programme le met en forme
5 ' de tel maniŠre … ce qu'il tienne dans une colone d'espace caractŠre
6 ' d‚finie par LCOL%. Le programme effectura des coupure de mot lorsqu'il
7 ' y a r‚p‚tition d'une lettre ou pas ( Fix‚e par COUPE% -1 avec 0 sans
8 '  ============ Programation et id‚e de DARCHE Yoann (C) 1991 ARTECHNYD ==
9 '**************************************************************************
10 KEY OFF
20 CLS
30 PRINT " Introduisez le Texte ( maxi 255 car ) puis le nobre de caractŠre "
40 PRINT " Maxi par ligne le Programme vous le mettra en forme "
50 PRINT " Si vous voulez que le programme face des copures qu'il poura d‚tecter"
60 PRINT " Introdusez … la question Coupure : -1 sinon introduisez 0 "
70 PRINT:PRINT " Programme et Id‚e de DARCHE Yoann (C) 1991 ARTECHNYD <<<<-----"
80 PRINT:PRINT
90 INPUT " TEXTE ( maxi 255 car ) : ",TEXTE$
100 INPUT " Nb de caractŠre par ligne ( 20-80 ) ",LCOL%
101 IF LCOL%>80 OR LCOL%<20 THEN BEEP:PRINT " Idiot !!":GOTO 100
110 INPUT " Coupure ? ( -1 = Oui, 0 = Non ) ",COUPE%
111 IF COUPE%<>-1 AND COUPE%<>0 THEN 110
197 '***************************************************************************
198 '**           DEBUT DU PROGRAMME COUPE INTELLIGENTE (C) ARTECHNYD         **
199 '***************************************************************************
200 DIM LI$(25): REM TABLEAU QUI VA PERMETTRE DE STOCKER LES LIGNES
204 MI%=0:I%=0:M$="":PI%=0:LI%=0:LI$=""
205 DIM M$(10): REM mot par ligne
210 FOR I%=1 TO LEN(TEXTE$)
220     PI%=PI%+1
230     IF PI% > LCOL% THEN 270
240         L$=MID$(TEXTE$,I%,1)
250         IF L$<>" " THEN M$=M$+L$:GOTO  340
260         MI%=MI%+1:M$(MI%)=M$:M$="":GOTO 340
265 '
270         IF M$="" THEN REM ligne supp.
280         IF MID$(M$,LEN(M$)-1,1)=RIGHT$(M$,1) THEN MET UN TIRET
290         FOR J%=1 TO LEN(M$)-1
300            IF MID$(M$,J%,1)=MID$(M$,J%+1,1) THEN COUPE ICI
310         NEXT J%
320        ' il n'y a plus rien a faire
330        GOTO 350
340 NEXT I%
341 ' il n'y a plus rien … faire !!!!
350 LI%=LI%+1
360 FOR M%=1 TO MI%:LON%=LEN(M$(M%))+LON%:NEXT M%
370 NESPA%=LCOL%-LON%:NPESP%=INT(NESPA%/(MI%-1)):NDER%=NESPA%-NPESP%*(MI%-1)
380 FOR M%=2 TO MI%-1:LI$=LI$+SPACE$(NPESP%)+M$(M%):NEXT M%
390 LI$=LI$+SPACE$(NDER%+1)+M$(MI%):LI$=M$(1)+LI$
400 PRINT LI$
380 FOR M%=2 TO MI%-1:LI$=LI$+SPACE$(NPESP%)+M$(M%):NEXT M%
390 LI$=LI$+SPACE$(NDER%+1)+M$(MI%):LI$=M$(