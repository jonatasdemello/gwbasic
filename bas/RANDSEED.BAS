5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
12 '***************** VARIABLE RANDOM SEED GENERATOR **************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�          USE OF TIME$ TO STIMULATE RANDOM NUMBER GENERATOR              �
20 '�                                                                         �
22 '�    This simple program will do a better job of RANDOMIZING than the old �
24 '� procedure of assigning a random seed number on a prompt.   This pro-    �
26 '� cedure is recommended on page 4-236 of the IMB (c) BASIC (1.1/2.0)      �
28 '� Manual.  This program is but an implementation of the procedure. To use,�
30 '� eliminate the printout & timer loop.  Simply put lines 110 to 130 at    �
31 '� the start of your program. The random 'seed' will change with the TIME$ �
32 '� second advance.   G I N A C O  -- 1983                Ver 5.2/160/320   �
38 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 COLOR 7,0
110 '************************ RANDOMIZE PROCEDURE *****************************
120 NN = VAL(RIGHT$(TIME$,2))
130 RANDOMIZE NN
140 '********** DO NOT USE LINES 140,150,160, OR 170 IN YOUR PROGRAM **********
150 PRINT TIME$,,NN ,,RND
160 FOR I = 1 TO 1000:NEXT
170 GOTO 120
180 END
65000 '*********************** SAVE ROUTINE ***********************************
65100 SAVE"B:RANDSEED.BAS"
