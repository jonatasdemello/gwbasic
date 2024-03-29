100 'METEOR: a character graphics arcade game for the Monochrome display.
105 'Originally by Edward T. Ordman November 1981.
110 'Published in Creative Computing August, 1982.
115 'Implemented and modified by Mike Locker IBM/NAD-Oakland, Ca. July, 1982.
120 M$=CHR$(2):C$=CHR$(219):X$=CHR$(25) ' face, solid square, down arrow
130 C5$=C$+C$+C$+C$+C$:H$="":T=0 'block, latch for face motion, score
140 Y=178:E2$=STRING$(2,Y):E5$=STRING$(5,Y):E8$=STRING$(8,Y) 'shading
150 CLS:KEY OFF:PRINT "Do you want directions (y/n)?":LOCATE 1,31,1
160 R$=INKEY$:IF R$="" THEN 160 ELSE LOCATE 1,31,0:PRINT R$+" ";
165 IF R$="y" OR R$="Y" THEN GOSUB 930:GOTO 180
170 IF R$="n" OR R$="N" OR R$=CHR$(13) THEN 180
175 LOCATE 1,31,1:BEEP:GOTO 160
180 LOCATE 25,1,1:PRINT"How hard (1-9)? ";
190 T=0:RANDOMIZE(VAL(RIGHT$(TIME$,2))) 'reset score and use clock to randomize
200 R$=INKEY$:IF R$="" THEN 200
205 C=ASC(R$+" "):IF C>48 AND C<58 THEN C=C-48:GOTO 230
210 IF C=13 THEN C=5 ELSE PRINT R$+" ";:LOCATE 25,17,1:BEEP:GOTO 200
230 HX=20+INT(40*RND+1):HY=16+INT(8*RND+1) 'position for face
235 LY=25:LX=36
240 CLS:LOCATE 25,1:PRINT"(use Arrows to move)  your SCORE:";
260 GOSUB 840 'put target, player marker
280 Y1=1:Y2=24 'describe Meteor path
290 X1=INT(RND*80+1):X2=INT(RND*80+1) 'each is integer 1-80
310 GOSUB 390:GOTO 290 'plot Meteor path, repeat
330 'plot x$ at y,x checking for scores, face motion
340 K$=INKEY$:IF K$<>"" THEN H$=K$ 'h$ is latch
350 IF LEN(H$)>0 THEN GOSUB 570 'key was struck
360 IF ABS(X-HX)<3 AND ABS(Y-HY)<2 THEN 450 'face hit
370 IF SCREEN(Y,X)=219 THEN C2=-1:SOUND 660,2:GOSUB 740 'target hit
375 IF Y=24 AND X=80 THEN X=79 'writing 24,80 causes scrolling
377 LOCATE LY,LX,0:PRINT X$;:LY=Y:LX=X
380 LOCATE Y,X,0:COLOR 15,0:PRINT X$;:COLOR 7,0:RETURN
390 'draw a line from x1,y1 to x2,y2
400 S0=(X2-X1)/(Y2-Y1):S=X1-S0
410 FOR Y=Y1 TO Y2:S=S+S0:X=INT(.5+S)
420 IF Y>HY+1 THEN RETURN 'give up if below target
430 GOSUB 330:NEXT Y:RETURN
450 'target is hit, position message
460 HX=HX-4:IF HX>72 THEN HX=72
470 IF HX<1 THEN HX=1
480 IF HY=24 THEN HY=23
495 LOCATE HY,HX:PRINT E8$
497 LOCATE LY,LX,0:PRINT X$;:LY=Y:LX=X
500 LOCATE HY+1,HX:PRINT E2$;:COLOR 18,0:PRINT"Bang";:COLOR 7,0:PRINT E2$;
505 LOCATE HY+2,HX:PRINT E8$;:COLOR 7,0
510 IF HY=23 THEN LOCATE 25,35:COLOR 0,7:PRINT T;:COLOR 7,0 'score points
515 LOCATE Y,X,0:COLOR 15,0:PRINT X$;:COLOR 7,0
517 FOR Z=1000 TO 600 STEP -25:SOUND Z,1:NEXT:SOUND 37,15
520 LOCATE 25,43,0:PRINT"Ins = play again, Del = finish       ";
530 H$=INKEY$:IF H$=CHR$(0)+CHR$(83) THEN CLS:KEY ON:END
550 IF H$=CHR$(0)+CHR$(82) THEN CLS:GOTO 180
560 GOTO 530
570 'process keyboard request
580 IF H$=CHR$(32) THEN 760 'pause on space bar
590 IF LEN(H$)=1 THEN H$="":RETURN
600 HH=ASC(RIGHT$(H$,1)):K$=H$:H$="":LOCATE HY,HX:PRINT" ";
630 IF HH=77 THEN HX=HX+1:H$=K$:IF HX>80 THEN HX=1
650 IF HH=75 THEN HX=HX-1:H$=K$:IF HX<1 THEN HX=80
670 IF HH=80 AND HY<24 THEN HY=HY+1:H$=K$
680 IF HH=72 AND HY>1 THEN HY=HY-1:H$=K$
690 IF HX=80 AND HY=24 THEN HY=23
700 IF SCREEN(HY,HX)=219 THEN SOUND 440,1:C2=10:GOSUB 740
710 IF SCREEN(HY,HX)=25 THEN SOUND 420,1:C2=2:GOSUB 740
720 LOCATE HY,HX:PRINT M$;:RETURN
740 T=T+C2:LOCATE 25,35:COLOR 0,7:PRINT T;:COLOR 7,0:RETURN 'score points
760 LOCATE 25,1,0:PRINT SPC(21);
765 LOCATE 25,43,0:PRINT"Ins=continue, Del=stop, Enter=restore";
770 H$=INKEY$:IF H$=CHR$(0)+CHR$(82) THEN 910
790 IF H$=CHR$(13) THEN 840
800 IF H$=CHR$(0)+CHR$(83) THEN CLS:KEY ON:END
810 GOTO 770
840 'put target and face on screen
860 FOR I=12-C TO 24-C
870 LOCATE I,15:PRINT C5$;:LOCATE I,35:PRINT C5$;:LOCATE I,55:PRINT C5$;
900 NEXT I:LOCATE HY,HX:PRINT M$;
910 LOCATE 25,43:PRINT"(Hit space bar to pause)             ";
920 RETURN
930 'Directions
940 LOCATE 3,37,0:COLOR 1,0:PRINT"Meteor":COLOR 7,0:PRINT:PRINT
950 PRINT"A simple arcade game using character graphics.":PRINT
960 PRINT"The cursor control keys start the ";M$;" symbol moving."
970 PRINT"Space bar stops all action temporarily and allows restoring targets"
980 PRINT"Any letter (and some other keys) will stop cursor motion.":PRINT
990 PRINT"See if you can erase the solid blocks before falling meteors hit you"
1000 PRINT"Each ";C$;" you erase scores 10 points, each ";X$;", 2 points."
1010 PRINT"You lose 1 point for each ";C$;" a Meteor hits.":PRINT
1020 PRINT"To hit you, a Meteor needs to get  within the shaded area.":PRINT
1030 PRINT TAB(37);E5$:PRINT TAB(37);E2$+M$+E2$
1050 PRINT TAB(37);E5$:PRINT
1060 PRINT"The higher the difficulty level you select, the closer the targets"
1070 PRINT"will be to the top of the screen, exposing you to the unexpected"
1080 PRINT"falling Meteors.":RETURN
