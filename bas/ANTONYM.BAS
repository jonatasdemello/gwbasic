5 KEY(10) ON:ON KEY(10) GOSUB 600:KEY(9) ON:ON KEY(9) GOSUB 700:DIM P(35):FOR I=1 TO 35:P(I)=I:NEXT I
10 CLS:T=0:N=0:GOSUB 59980:FOR I=1 TO 100:SWAP P(INT(RND*35+1)),P(INT(RND*35+1)):NEXT I
20 CLS:LOCATE 1,34:COLOR 0,15:PRINT" IQ Builder ":COLOR 15,0
30 LOCATE 2,35:PRINT"Antonyms 1":COLOR 7,0
40 LOCATE 4,1:PRINT"Antonyms are words of opposite meaning.":PRINT
50 PRINT"In this lesson, pick the word that means the opposite of the one"
60 PRINT"in the box."
70 XX=1:P=P(XX)
80 IF P>1 THEN FOR J=1 TO P-1:FOR X=1 TO 7:READ A$:NEXT X,J
90 PRINT:PRINT"Problem" P
100 READ A$:PRINT:PRINT"Which word below is most opposite to"
110 PRINT TAB(39-INT(LEN(A$)/2)) "�" STRING$(LEN(A$),"�") "�"
120 PRINT TAB(39-INT(LEN(A$)/2)) "�" A$ "�"
130 PRINT TAB(39-INT(LEN(A$)/2)) "�" STRING$(LEN(A$),"�") "�"
140 FOR X=1 TO 5:READ A$:PRINT"(";:COLOR 15:PRINT X;:COLOR 7:PRINT")  " A$:NEXT X:READ R
150 BEEP:LOCATE 25,1:PRINT "Your choice is - ";
155 GOSUB 59990:IF INSTR("12345",IKEY$)=0 THEN 155 ELSE C=VAL(IKEY$)
160 N=N+1:IF C=R THEN PLAY "mbc16c16c16ge8g":LOCATE 25,1:PRINT SPC(79);:LOCATE 25,1:PRINT"That is correct!";:T=T+1:TIMEOUT=3:GOSUB 59950:LOCATE 25,1:PRINT SPC(79);
170 IF C<>R THEN PLAY "mbn50n25":LOCATE 25,1:PRINT SPC(79);:LOCATE 25,1:PRINT"No!  Try again.";:TIMEOUT=3:GOSUB 59950:LOCATE 25,1:PRINT SPC(79);:GOTO 150
180 XX=XX+1:IF XX<36 THEN P=P(XX):GOSUB 7000:RESTORE:GOTO 80
190 GOSUB 7000:PRINT"Your score is the total number right out of all answers given."
200 PRINT:PRINT"You scored " T " right out of " N ", or " INT(T/N*100+.5) " percent."
210 PRINT:IF T/N>.9000001 THEN PRINT"Excellent job!":GOTO 240
220 IF T/N>.75 THEN PRINT"Good score!":GOTO 240
230 PRINT"Why don't you look at this program again...":TIMEOUT=7:GOSUB 59950:RUN
240 TIMEOUT=7:GOSUB 59950:GOTO 700
600 RUN "iqbuild"
700 CHAIN MERGE "antonym2",5
5500 DATA waste, meet, save, pollute, often, agree, 2
5510 DATA warlike, private, democratic, common, peaceful, empty, 4
5520 DATA wake, warn, freeze, sleep, trap, eat, 3
5530 DATA question, remember, propose, answer, remark, watch, 3
5540 DATA wild, ready, trapped, natural, tame, sick, 4
5550 DATA prove, disprove, approve, reprove, improve, remain, 1
5560 DATA quick, difficult, thin, careless, calm, slow, 5
5570 DATA quit, start, renew, elect, return, use, 1
5580 DATA whole, empty, partial, smooth, mirace, give, 2
5590 DATA punish, educate, reward, accept, fight, flee, 2
5600 DATA wealth, disease, burden, poverty, freedom, worry, 3
5610 DATA change, leave, oversee, visit, shape, remain, 5
5620 DATA identical, uncommon, unknown, unlike, unable, undone, 3
5630 DATA wicked, legal, good, famous, beautiful, strong, 2
5640 DATA abandon, reveal, keep, strict, revolt, furnish, 2
5650 DATA yield, resist, upset, proceed, create, present, 1
5660 DATA tardy, equal, favorable, disloyal, happy, prompt, 5
5670 DATA woeful, content, uneasy, joyful, helpful, useful, 3
5680 DATA hill, cave, hollow, pond, volcano, peak, 2
5690 DATA effect, result, cause, manufacture, award, prove, 2
5700 DATA tired, attired, untried, tireless, retired, contrived, 3
5710 DATA export, deport, import, report, disport, support, 2
5720 DATA melt, gasify, burn, evaporate, freeze, heat, 4
5730 DATA hardship, aid, collapse, improvement, ease, quiet, 4
5740 DATA offend, close, react, please, perfect, clean, 3
5750 DATA hinder, aid, forward, besides, accept, keep, 1
5760 DATA punctual, final, gentle, smooth, sunny, tardy, 5
5770 DATA scold, clean, tear, keep, praise, raise, 4
5780 DATA weep, shine, tickle, mend, fill, rejoice, 5
5790 DATA wreck, drift, inhabit, create, please, smile, 3
5800 DATA unravel, show, express, prove, predict, entangle, 5
5810 DATA accept, give, reject, caution, reward, empty, 2
5820 DATA unreal, ordinary, actual, fold, make, cover, 2
5830 DATA absence, plenty, return, destiny, error, presence, 5
5840 DATA withdraw, advance, divide, restore, elect, allow, 1
7000 FOR Y=4 TO 24:LOCATE Y,1:PRINT SPC(79);:NEXT Y:LOCATE 4,1:RETURN
59950 TIMEOUT$=TIME$:TIME2=VAL(LEFT$(TIMEOUT$,2))*120+VAL(MID$(TIMEOUT$,4,2))*60+VAL(RIGHT$(TIMEOUT$,2))
59960 TIMEOUT$=TIME$:TIME3=VAL(LEFT$(TIMEOUT$,2))*120+VAL(MID$(TIMEOUT$,4,2))*60+VAL(RIGHT$(TIMEOUT$,2))
59970 IF TIMEOUT > TIME3 - TIME2 THEN 59960 ELSE RETURN
59980 RNDTIME$=TIME$:RNDVAL=VAL(LEFT$(RNDTIME$,2))*120+VAL(MID$(RNDTIME$,4,2))*60+VAL(RIGHT$(RNDTIME$,2)):RANDOMIZE RNDVAL:RETURN
59990 IKEY$=INKEY$:IF IKEY$="" THEN 59990 ELSE RETURN
