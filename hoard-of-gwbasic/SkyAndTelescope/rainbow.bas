10 REM     RAINBOW SIMULATION
20 REM
25 R0=180/3.14159
30 REM     RANDOM IMPACT PARAMETER
35 X=-1+2*RND(1)
40 Y=-1+2*RND(1)
45 B=SQR(X*X+Y*Y)
50 IF B>=1 THEN 30
55 REM     COLOR & INDEX OF REFR.
60 C=1+INT(3*RND(1))
65 N=1.33+.01*(C-1)
70 REM     COMPUTE ANGLES
75 I=ATN(B/SQR(1-B*B))
80 R=ATN(B/SQR(N*N-B*B))
85 T1=(4*R-2*I)*R0
90 T2=(6*R-2*I)*R0-180
95 REM     INTENSITY FACTORS
100 RS=(SIN(I-R)/SIN(I+R))^2
105 RP=(TAN(I-R)/TAN(I+R))^2
110 RB=(1-RP)*(1-RP)
115 RC=(1-RS)*(1-RS)
120 I1=(RS*RC+RP*RB)/2
125 I2=(RS*RS*RC+RP*RP*RB)/2
130 IF I1<.04*RND(1) THEN 140
135 TH=T1:  GOSUB 180
140 IF I2<.02*RND(1) THEN 150
145 TH=T2:  GOSUB 180
150 GOTO 30
155 REM     COLORS & SCREEN
160 SCREEN 9:  CLS:  KEY OFF:  NP=0
165 PALETTE 1,4:  PALETTE 2,2
170 PALETTE 3,9
175 RETURN
180 REM     PLOT ON SCREEN
185 TH=ABS(TH)
190 IF TH>60 THEN RETURN
195 XP=320+320*(TH/60)*(X/B)
200 YP=325-300*(TH/60)*ABS(Y/B)
205 PSET(XP,YP),C:  NP=NP+1
210 LOCATE 1,1:  PRINT NP:  RETURN
215 REM VTAB23:  PRINT NP: RETURN
220 REM     FOR APPLE II COMPUTERS
225 REM     COLORS & SCREEN 
230 REM HGR:  HOME:  NP=0
235 REM CC(1)=5: CC(2)=1: CC(3)=6
240 REM RETURN
245 REM     PLOT ON SCREEN
250 REM TH=ABS(TH)
255 REM IF TH>60 THEN RETURN
260 REM XP=139+139*(TH/60)*(X/B)
265 REM YP=159-159*(TH/60)*ABS(Y/B)
270 REM HCOLOR=CC(C):  NP=NP+1
275 REM HPLOT XP,YP TO XP+1,YP
280 REM **************************************
285 REM   APPEARED IN ASTRONOMICAL COMPUTING
290 REM   SKY & TELESCOPE, FEBRUARY 1991 ISSUE
300 REM **************************************