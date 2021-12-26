1 D=1
5 COLOR 10,0:CLS
10 PRINT TAB(33);"LUNAR"
20 PRINT TAB(15);"Creative Computing, Morristown, New Jersey"
25 PRINT:PRINT:PRINT
30 PRINT "This is a computer simulation of an Apollo Lunar"
40 PRINT "Landing Capsule.":PRINT:PRINT
50 PRINT "The on-board computer has failed (it was made by"
60 PRINT "XEROX) so you have to land the capsule manually."
70 PRINT:PRINT "Set burn rate of Retro-Rockets to any value between"
80 PRINT "0 (free fall) and 200 (maximum burn) pounds per second."
90 PRINT "Set new burn rate every 10 seconds.":PRINT
100 PRINT "Capsule weight 32,500 lbs; fuel weight 16,500 lbs."
110 PRINT:PRINT:PRINT TAB(20);"Good Luck."
120 L=0
125 A$=INKEY$:IF A$="" THEN 125
130 CLS:PRINT:PRINT " SEC"," MI + FT"," MPH","LB FUEL","BURN RATE"
140 A=120:V=1:M=33000!:N=16500:G=.001:Z=1.8
150 PRINT L,INT(A);INT(5280*(A-INT(A))),3600*V,M-N,:INPUT K:T=10
155 IF K>200 THEN K=200
160 IF M-N<.001 THEN 240
170 IF T<.001 THEN 150
180 S=T:IF M=>N+S*K THEN 200
190 S=(M-N)/K
200 GOSUB 420:IF I<=0 THEN 340
210 IF V<=0 THEN 230
220 IF J<0 THEN 370
230 GOSUB 330:GOTO 160
240 PRINT:PRINT "Fuel out at";L;"seconds.":S=(-V+SQR(V*V+2*A*G))/G
250 V=V+G*S:L=L+S
260 W=3600*V:PRINT:PRINT "On Moon at";L;"seconds - Impact Velocity";W;"MPH"
270 IF ABS(W)<=1.2 THEN PRINT "Perfect Landing!":FOR A=1 TO 3:SOUND 1000*A,1:NEXT:GOTO 440
280 IF ABS(W)<=10 THEN PRINT "Good Landing (could be better).":FOR A=1 TO 3:SOUND 850*A,2:NEXT:GOTO 440
282 IF ABS(W)>60 THEN 300
284 PRINT "Craft Damaged ... You're stranded here until a rescue"
286 PRINT "     party arrives. Hope you have enough oxygen!":SOUND 50,5
288 GOTO 440
300 PRINT "Sorry, there were no survivors.  You blew it!":SOUND 45,5
310 PRINT "In fact, you blasted out a new Lunar crater";W*.277;"feet deep!"
320 GOTO 440
330 L=L+S:T=T-S:M=M-S*K:A=I:V=J:RETURN
340 IF S<5.000001E-03 THEN 260
350 D=V+SQR(V*V+2*A*(G-Z*K/M)):S=2*A/D
360 GOSUB 420:GOSUB 330:GOTO 340
370 W=(1-M*G/(Z*K))/2:S=M*V/(Z*K*(W+SQR(W*W+V/Z)))+.05:GOSUB 420
380 IF I<=0 THEN 340
390 GOSUB 330:IF J>0 THEN 160
400 IF V>0 THEN 370
410 GOTO 160
420 Q=S*K/M:J=V+G*S+Z*(-Q*(1+Q*(1/2+Q*(1/3+Q*(1/4+Q/5)))))
430 I=A-G*S*S/2-V*S+Z*S*(Q/2+Q^2/6+Q^3/12+Q^4/20+Q^5/30):RETURN
440 PRINT:PRINT:PRINT:INPUT "Do you want to try again";TA$
450 IF LEFT$(TA$,1)="y" OR TA$="RUN" THEN 70
