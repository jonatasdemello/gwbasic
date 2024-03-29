99  OPTION BASE 1
100 CLS
110 KEY OFF
120 LOCATE 6,10 : PRINT "Welcome to the game of FENCE.  Enter one of the "
130 LOCATE 8,10 : PRINT "numbers below to begin game."
140 LOCATE 10,10: PRINT "      1 = Instructions"
150 LOCATE 12,10: PRINT "      2 = Begin game with skill level of ADVANCED"
160 LOCATE 14,10: PRINT "      3 = Begin game with skill level of INTERMEDIATE"
170 LOCATE 16,10: PRINT "      4 = Begin game with skill level of BEGINNER"
180 LOCATE 18,10: PRINT "      0 = Quit
190 A$=INKEY$:IF A$="" THEN 190
200 IF A$="1" THEN GOSUB 1030 : GOTO 100
210 IF A$="2" THEN SKILL=3 : GOTO 260
220 IF A$="3" THEN SKILL=6 : GOTO 260
230 IF A$="4" THEN SKILL=10: GOTO 260
240 IF A$="0" THEN CLS : END
250 GOTO 110
260 CLS
280 RANDOMIZE(VAL(MID$(TIME$,7,2)))
290 KEY OFF
300 DIM FFFFF$(23)
305 FFFFF$(1)=STRING$(80,220) : PRINT FFFFF$(1)
310 FOR I=2 TO 22
320    FFFFF$(I)=CHR$(221)+STRING$(78," ")+CHR$(222)
322    LOCATE I,1 : PRINT CHR$(221)
325    LOCATE I,80: PRINT CHR$(222)
330 NEXT I
332 FFFFF$(23)=STRING$(80,223)
333 LOCATE 23,1
335 PRINT FFFFF$(23);
336 LOCATE 1,1 : PRINT CHR$(220)
350 TR=2 : TC=2
360 STIME=0
370 CA=1
380 RA=0
390 C=5
400 R=4
410 HUNTER$=CHR$(26)
420 REM -------------->>>  Begin  Hunt
430 GOSUB 820
440 GOSUB 570
450 IF CHR$(219)=A$ THEN 980
455 IF A$="0" THEN 3000
460 IF RA<>0 THEN 520
470 IF (C=79) AND (CA=1) THEN CA=-1 : HUNTER$=CHR$(27)
480 IF (C=2) AND (CA=-1) THEN CA=1 : HUNTER$=CHR$(26)
490 LOCATE R,C : PRINT A$ : LOCATE R,C+CA : PRINT HUNTER$
500 C=C+CA
510 GOTO 420
520 IF (R=2) AND (RA=-1) THEN RA=1 : HUNTER$=CHR$(25)
530 IF (R=22) AND (RA=1) THEN RA=-1: HUNTER$=CHR$(24)
540 LOCATE R+RA,C : PRINT HUNTER$ : LOCATE R,C : PRINT A$
550 R=R+RA
560 GOTO 420
570 REM ===================================================================
580 REM ========  Subroutine to read a char and continue   ================
590 REM ===================================================================
600 A$ = INKEY$
605 IF A$="0" THEN RETURN
610 IF A$="/" OR A$="\" THEN 630
620 A$=MID$(FFFFF$(R),C,1)
630 IF " "=MID$(FFFFF$(R),C,1) THEN MID$(FFFFF$(R),C,1) = A$
640 IF (A$<>"/") AND (A$<>"\") THEN RETURN
650 IF RA=0 THEN IF CA = -1 THEN IF A$="/" THEN 740
660 IF RA=0 THEN IF CA = -1 THEN IF A$="\" THEN 760
670 IF RA=0 THEN IF CA = 1 THEN IF A$="\" THEN 740
680 IF RA=0 THEN IF CA = 1 THEN IF A$="/" THEN 760
690 IF CA=0 THEN IF RA = -1 THEN IF A$="/" THEN 800
700 IF CA=0 THEN IF RA = -1 THEN IF A$="\" THEN 780
710 IF CA=0 THEN IF RA=1 THEN IF A$="/" THEN 780
720 IF CA=0 THEN IF RA=1 THEN IF A$="\" THEN  800
730 RETURN
740 REM   a$="/" , ra=0 , ca = -1  or ra=0,ca=1,a$=\
750 CA=0:RA=1:HUNTER$=CHR$(25):RETURN
760 REM  ra=0,ca=1,/  or ra=0,ca=-1,\
770 CA=0:RA=-1:HUNTER$=CHR$(24):RETURN
780 REM   ca=0,ra=1,/   or   ca=0,ra=-1,\
790 CA=-1:RA=0:HUNTER$=CHR$(27):RETURN
800 REM   ca=0,ra=1,\   or   ca=0,ra=-1,/
810 CA=1:RA=0:HUNTER$=CHR$(26):RETURN
820 REM -------->>>      check time and move target every 10 seconds
830 KK$=TIME$
840 LL=3600*VAL(MID$(KK$,1,2))
850 LL=LL+60*VAL(MID$(KK$,4,2))
860 LL=LL+VAL(MID$(KK$,7,2))
870 IF (LL-STIME)<SKILL  THEN RETURN
880 STIME=LL
890 MID$(FFFFF$(TR),TC,1)=" "
900 LOCATE TR,TC : PRINT " "
910 TR=INT(RND*100)
920 IF (TR<2) OR (TR>22) THEN 910
930 TC=INT(RND*100)
940 IF (TC<2) OR (TC>79) THEN 930
950 MID$(FFFFF$(TR),TC,1)=CHR$(219)
960 LOCATE TR,TC : PRINT CHR$(219)
970 RETURN
980 REM ---------->>>  Hunt is over
990 CLS
1000 LOCATE 10,35 : PRINT " B O O M"
1010 LOCATE 23,27 : COLOR 0,7 : PRINT " Press any key to continue ":COLOR 7,0
1015 ERASE FFFFF$
1020 GOSUB 1260 : GOTO 100
1030 REM -------->>> Instructions
1040 CLS
1050 PRINT
1060 PRINT"  The object of the game of FENCE is to 'KILL' the target.  The"
1070 PRINT"target (shown on the screen as "+CHR$(219)+") will change locations"
1080 PRINT"at regular time intervals depending upon the skill level you"
1090 PRINT"select:"
1100 PRINT"           ADVANCED:     Target will move every 3 seconds"
1110 PRINT"           INTERMEDIATE: Target will move every 6 seconds"
1120 PRINT"           BEGINNER:     Target will move every 10 seconds"
1130 PRINT
1140 PRINT"  The 'hunter' will stalk along at a steady pace.  You can change"
1150 PRINT"the direction of the hunter by putting up a fence (\ or /) which"
1160 PRINT"will change the hunters direction depending upon the direction"
1170 PRINT"he is currently travelling.  For example:"
1180 PRINT
1190 PRINT"    "+STRING$(5,26)+"\            /"+STRING$(5,27)
1200 PRINT"        "+CHR$(25)+"              "+CHR$(25)
1210 PRINT"        "+CHR$(25)+"              "+CHR$(25)
1220 PRINT"        "+CHR$(25)+"              "+CHR$(25)
1222 PRINT
1224 PRINT"     If you want to give up a hunt, just enter 0"
1230 LOCATE 23,20: COLOR 0,7 : PRINT " Press any key to continue " : COLOR 7,0
1240 GOSUB 1260 :RETURN
1250 RETURN
1260 REM -------->>>  wait
1270 A$=INKEY$: IF A$="" THEN 1270
1280 RETURN
3000 REM --------->>>  Give up a hunt
3010 CLS
3020 LOCATE 10,20:COLOR 0,7:PRINT" I knew you could'nt do it ":COLOR 7,0
3030 LOCATE 23,20:PRINT" Press any key to continue ": COLOR 7,0
3040 ERASE FFFFF$ : GOSUB 1260 : GOTO 100
