10 ' lissa3gw.bas
20 GOTO 50 ' begin
30 SAVE "lissa3gw.bas",A:LIST-50
40 GOTO 230 ' wait for key
50 SCREEN  9:CLS:KEY OFF:DEFSTR Q:Q=MKI$(0):PI=4*ATN(1)
60 WINDOW (-2.4,-1.8)-(2.4,1.8):H=PI/400:AMPL1=1.6:AMPL2=1.2
70 FOR J=1 TO 3
80  IF J=1 THEN M=3:N=4:FASE=0
90  IF J=2 THEN M=8:M=13:FASE=.5
100  IF J=3 THEN M=34:N=55:FASE=.25
110  FREQ=M/N:FASE=FASE*2*PI
120  LOCATE 2,15:PRINT"M = ";M:LOCATE 2,30:PRINT"N = ";N
130  LINE (-1.1*AMPL1,-1.1*AMPL2)-(1.1*AMPL1,1.1*AMPL2),,B
140  PSET (0,AMPL2*SIN(FASE))
150   FOR K=0 TO 800*N:T=K*H
160    X=AMPL1*SIN(FREQ*T):Y=AMPL2*SIN(T+FASE):LINE -(X,Y)
170   NEXT
180  GOSUB 40 ' wait for key
190  IF J<3 THEN CLS
200 NEXT
210 SCREEN 0,0,0:KEY ON:END
220 ' wait for key
230 LSET Q=MKI$(0)
240 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
