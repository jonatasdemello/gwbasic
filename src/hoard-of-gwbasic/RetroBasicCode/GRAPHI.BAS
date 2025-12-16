10 ' Enchainement d'images graphiques en gwbasic.
20 ' basic /M:&HE000
120 SCREEN 1: KEY OFF : GOSUB 540
130 LOCATE 12,4 : PRINT "Cr‚ation de deux fichiers images "
135 GOSUB 500
136 CLS
140 '
150 FOR I%=1 TO 100
160   COULEUR%=1+(2*RND) : X%=639*RND : Y%=199*RND : RAYON%=200*RND
170   CIRCLE(X%,Y%),RAYON%,COULEUR%
180 NEXT
190 '
200 DEF SEG=&HB800 : BSAVE "IMAGE1.BLD", 0, &H4000
210 LINE (0,0)-(639,199),3,BF
220 '
230 FOR I%=1 TO 100
240    COULEUR%=(2*RND) : X1%=639*RND : Y1%=199*RND : X2%=639*RND : Y2%=199*RND
250    LINE (X1%,Y1%)-(X2%,Y2%),COULEUR%,B
260 NEXT
270 '
280 BSAVE "IMAGE2.BLD", 0, &H4000
290 '
300 DEF SEG : CLS : LOCATE 12,4 : PRINT "Reprise et affichage des fichiers "
310 '
320 DIM IMG1%(&H2000),IMG2%(&H2000)
330 '
340 ADRESSE1%=VARPTR(IMG1%(0)) : BLOAD "IMAGE1.BLD", ADRESSE1%
360 ADRESSE2%=VARPTR(IMG2%(0)) : BLOAD "IMAGE2.BLD", ADRESSE2%
380 '
390 WHILE INKEY$=""
400   CALLS TRANS(IMG1%(0)) : GOSUB 500
420   CALLS TRANS(IMG2%(0)) : GOSUB 500
440 WEND
460 '-------------------------------------------------------------------------
470         SCREEN 0 : WIDTH 80 : END
480 '-------------------------------------------------------------------------
490 '  attente
500   FOR I%=1 TO 5000 : NEXT
510 RETURN
515 '
520 ' enlever les deux ligne de v‚rification si tout fonctionne bien
530 '
540  FOR I=0 TO 122 : READ X : VERIF = VERIF+X : NEXT
550 IF VERIF <> 14655 THEN PRINT "ERREUR DE SAISIE DANS LES DATA ":END
555 '
560 ' POKage de RCLS :
570 TRANS = &HE000 : RESTORE 630 : DEF SEG
580 FOR I=0 TO 122 : READ X : POKE TRANS+I, X : NEXT
590 RETURN
600 '------------------------------------------------------------------------
610 '          roUtine    ASSEMBLEUR .
620 '------------------------------------------------------------------------
630 DATA  85 , 139 , 236 ,  30 ,   6 , 197 , 118 ,   6 , 139
640 DATA 198 , 139 , 232 ,  51 , 192 , 205 ,  26 , 184 ,   1
650 DATA   0 ,  11 , 208 , 129 , 250 , 160 ,  15 , 118 ,   6
660 DATA 129 , 234 , 160 ,  15 , 235 , 244 ,  82 , 139 , 194
670 DATA  51 , 210 , 185 ,   5 ,   0 , 247 , 241 , 131 , 250
680 DATA   0 ,  90 , 116 , 219 , 209 , 226 , 205 ,  17 , 169
690 DATA  48 ,   0 , 117 ,   5 , 184 ,   0 , 176 , 235 ,   3
700 DATA 184 ,   0 , 184 , 142 , 192 ,  51 , 255 , 185 , 160
710 DATA  15 , 139 ,   4 ,  38 , 137 ,   5 , 139 , 132 ,   0
720 DATA  32 ,  38 , 137 , 133 ,   0 ,  32 ,   3 , 250 , 129
730 DATA 255 ,  62 ,  31 , 118 ,   4 , 129 , 239 ,  64 ,  31
740 DATA 139 , 199 , 139 , 240 , 139 , 197 ,   3 , 245 ,  81
750 DATA 185 , 100 ,   0 , 144 , 226 , 253 ,  89 , 226 , 212
760 DATA   7 ,  31 ,  93 , 202 ,   4 ,   0
770 '
780 ' pour routine inline TB, enlever Les 3 dernier codes.
