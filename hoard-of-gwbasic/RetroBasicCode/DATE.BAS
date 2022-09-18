1 REM sous routine de DARCHE Yoann pour coder rapidement une date
2 REM si la date est JJ/MM/AAAA le codage sortira en :
3 REM D1% = JJ + MM*100 et D2% = AAAA
4 REM j'utilise des valeurs entiŠres pour que les testes soient rapides
5 REM ce qui m'interdi d'inclure l'ann‚e dans la mˆme variable
6 REM mais d'autre par cela peut permettre de faire des recherches par
7 REM ann‚e sans perdre du temps innutil a comparer les jours et mois !!!
8 REM      DARCHE Yoann (C) ARTECHNYD Vendredi 29 AOUT 1991
9 REM
100 CLS:PRINT " Sous routine qui permet a partir d'une date de fix‚e deux "
110 PRINT " variables qui pouront etre compar‚e par la suite ( voir listing )"
120 PRINT"vous pouvez entrer la date comme les exenples suivant :"
130 PRINT" 10/05/1991 ou 10 5 91 ou 1.9.1991 ou 05-12-1991 ... "
140 PRINT
150 INPUT " >>> Entrez l… ! >>> :",DA$
160 ' ===================== ROUTINE ===================================
170 V$="":K%=0
180 I%=1:WHILE K%<3
190     WHILE INSTR("/-. ",MID$(DA$,I%,1))=0 AND I%<>LEN(DA$)+1
200          V$=V$+MID$(DA$,I%,1)
210          I%=I%+1
220     WEND
230     K%=K%+1:I%=I%+1
240     S%(K%)=VAL(V$):V$=""
250 WEND
260  D1%=S%(1)+S%(2)*100
270  D2%=S%(3)
280  IF D2%<1000 OR S%(1)<0 OR S%(1) > 31 OR S%(2) >12 OR  S%(2) < 1 THEN PRINT "erreur dans l'entr‚e de la date !!! v‚rifier ... ":GOTO 150
290 PRINT " D1% =";D1%
300 PRINT " D2% =";D2%
310 ' v‚rification
320 PRINT "la date est :";
330 M%=INT(D1%/100)
340 J%=D1%-M%*100
350 PRINT J%;"/";M%;"/";D2%
% =";D2%
310 ' v‚r