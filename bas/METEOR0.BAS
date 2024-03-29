100 REM meteor, a character graphics arcade game
120 M$=CHR$(2):C$=CHR$(219):X$=CHR$(25):REM face, solid square, down arrow
130 C5$=C$+C$+C$+C$+C$:H$="":T=0:REM block, latch for face motion, score
140 Y=178:E1$=STRING$(1,Y):E3$=STRING$(3,Y):E6$=STRING$(6,Y):REM shading
145 CLS:KEY OFF:WIDTH 80:LOCATE 10,1
150 PRINT "Do you want directions (Y/N)?":R=523:REM random seed
160 R$=INKEY$:IF R$="Y" OR R$="y" THEN GOSUB 740:GOTO 180
170 IF R$="N" OR R$="n" OR R$=CHR$(13) THEN 180 ELSE R=(R+511)MOD 32003:GOTO 160
180 RANDOMIZE R:REM seed based on delay in ansering question
190 PRINT "How hard (1-9)?";
200 R$=INKEY$:C=ASC(R$+" "):IF C>48 AND C<58 THEN C=C-48:GOTO 220
210 IF C=13 THEN C=5 ELSE 200
220 HX=20+INT(40*RND+1):HY=16+INT(8*RND+1):REM position for face
230 CLS:LOCATE 25,1:COLOR 2:PRINT "METEOR! (Cursors move ";;:COLOR 3:PRINT M$;:COLOR 2:PRINT ")";
240 GOSUB 680:REM put targets, player marker
250 Y1=1:Y2=24:REM describe meteor path
260 X1=INT(RND*80+1):X2=INT(RND*80+1):REM each is inter 1-80
270 GOSUB 350:GOTO 260:REM plot meteor path, repeat
280 REM plot x$ at y,x checking for scores, face motion
290 K$=INKEY$:IF K$<>"" THEN H$=K$:REM h$ is latch
300 IF LEN(H$)>0 THEN GOSUB 500:REM key was struck
310 IF ABS(X-HX)<1 AND ABS(Y-HY)<1 THEN 400:REM face hit
320 IF SCREEN(Y,X)=219 THEN C2=-1:SOUND 660,2:GOSUB 620:REM target hit
330 IF Y=24 AND X=80 THEN X=79:REM writing 24,80 causes scrolling
340 LOCATE Y,X:COLOR 4:PRINT X$;:RETURN
350 REM draw a line from x1,y1 to x2,y2
360 S0=(X2-X1)/(Y2-Y1):S=X1-S0
370 FOR Y=Y1 TO Y2:S=S+S0:X=INT(.5+S)
380 IF Y>HY+1 THEN RETURN:REM give up if below target
390 GOSUB 280:NEXT Y:RETURN
400 REM target is hit, position message
410 HX=HX-4:IF HX>72 THEN HX=72
420 IF HX<1 THEN HX=1
430 IF HY=24 THEN HY=23
440 SOUND 400,8:LOCATE HY,HX:COLOR 5:PRINT E1$;:COLOR 6:PRINT "BANG";:COLOR 5:PRINT E1$;:LOCATE HY+1,HX:PRINT E6$;
450 LOCATE 25,35:COLOR 2:PRINT "    DEL = FINISH,  INS = PLAY AGAIN          ";
460 H$=INKEY$:IF H$=CHR$(0)+CHR$(83) THEN CLS:KEY ON:END
470 IF H$=CHR$(0)+CHR$(83) THEN CLS:KEY ON:END
480 IF H$=CHR$(0)+CHR$(82) THEN CLS:RUN
490 GOTO 460
500 REM process keyboard request
510 IF H$=CHR$(32) THEN 630:REM pause on space bar
520 IF LEN(H$)=1 THEN H$="":RETURN
530 HH=ASC(RIGHT$(H$,1)):K$=H$:H$="":LOCATE HY,HX:PRINT " ";
540 IF HH=77 THEN HX=HX+1:H$=K$:IF HX>80 THEN HX=1
550 IF HH=75 THEN HX=HX-1:H$=K$:IF HX<1 THEN HX=80
560 IF HH=80 AND HY<24 THEN HY=HY+1:H$=K$
570 IF HH=72 AND HY>1 THEN HY=HY-1:H$=K$
580 IF HH=80 AND HY=24 THEN HY=23
590 IF SCREEN(HY,HX)=219 THEN SOUND 440,1:C2=10:GOSUB 620
600 IF SCREEN(HY,HX)=25 THEN SOUND 420,1:C2=2:GOSUB 620
610 LOCATE HY,HX:COLOR 3:PRINT M$;:RETURN
620 T=T+C2:LOCATE 25,27:COLOR 1:PRINT T;:RETURN:REM score points
630 LOCATE 25,35:COLOR 2:PRINT "KEYS:  INS=CONTINUE, DEL=STOP, ENTER=RESTORE ";
640 H$=INKEY$:IF H$=CHR$(0)+CHR$(82) THEN 720
650 IF H$=CHR$(13) THEN 680
660 IF H$=CHR$(0)+CHR$(83) THEN CLS:KEY ON:END
670 GOTO 640
680 REM put targets and face on screen
690 FOR I=12-C TO 24-C
700 LOCATE I,15:COLOR 7:PRINT C5$;:LOCATE I,35:PRINT C5$;:LOCATE I,55:PRINT C5$;
710 NEXT I:LOCATE HY,HX:COLOR 3:PRINT M$;
720 LOCATE 25,35:COLOR 2:PRINT "     Hit space bar to pause                  ";
730 RETURN
740 REM directions
750 CLS:PRINT :PRINT TAB(35);"METEOR":PRINT :PRINT
760 PRINT "A simple arcade game using character graphics."
770 PRINT :PRINT "The cursor control keys start the ";:COLOR 3:PRINT M$;:COLOR 1:PRINT " symbol moving."
780 PRINT "The space bar stops all action temporarily, and allows ";
790 PRINT "restoring targets."
800 PRINT "Any letter (and some other keys) will stop cursor motion."
810 PRINT :PRINT "See if you can erase the solid blocks before a falling ";
820 PRINT "meteor hits you."
830 PRINT "Each ";:COLOR 7:PRINT C$;:COLOR 1:PRINT " you erase scores 10 points, each ";:COLOR 4:PRINT X$;:COLOR 1:PRINT " 2 points."
840 PRINT "You lose 1 point for each ";:COLOR 7:PRINT C$;:COLOR 1:PRINT " a meteor hits."
850 PRINT :PRINT "To hit you, a meteor needs to get within the shaded area.";
860 PRINT :COLOR 6:PRINT  TAB(37);E3$:PRINT TAB(37);E1$;:COLOR 3:PRINT M$;:COLOR 6:PRINT E1$
870 PRINT TAB(37);E3$:PRINT:COLOR 1
880 PRINT "Some extra instructions will be on the bottom line.":PRINT :RETURN
