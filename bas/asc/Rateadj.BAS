1 '               DIRECT AND INDIRECT RATE ADJUSTMENT
2 '               Written by Tracy L. Gustafson, M.D.
3 '               Round Rock, Texas. Version 3.0, 1984
4 ON ERROR GOTO 5000:CHAIN MERGE "EPIMRG",5
15 DIM D(1,1),CS(1,1),T(1),N$(1),X(1),X2(1),MD(1),SD(1)
22 DATA "RATE ADJUSTMENTS",29,18
30 LOCATE 5,1:GOSUB 4000
35 PRINT:PRINT TAB(5);:INPUT "Do you want the DIRECT or INDIRECT adjustment method? (D or I)  ",A$:DQ="Enter the SAMPLE NUMBER of the "
40 PRINT:IF A$="I" OR A$="i" THEN 85 ELSE IF A$<>"D" AND A$<>"d" THEN BEEP:GOTO 35
45 AR=CSRLIN:PRINT " ";DQ;"study rates to be adjusted:":AC=61:GOSUB 4200:NS1=NS
50 AR=CSRLIN:PRINT DQ;"standard population figures:":GOSUB 4200:NS2=NS:GOSUB 235
55 PRINT TAB(18);"Rates in ";N$(NS1);:INPUT " are given per what number?  ",RD
60 SR=0:FOR Z=1 TO N:SR=SR+VAL(D(NS1,Z))*VAL(D(NS2,Z)):NEXT
65 SAR=SR/X(NS2):GOSUB 230
70 PRINT TAB(15);"Direct-adjusted rate = ";SAR;"per";RD;TAB(75):COLOR CLR1,CLR2:PRINT
75 PRINT:PRINT "Remember, if the number of cases in any cell is < 5, then";
80 PRINT TAB(30);"indirect rate adjustment may be more appropriate.":GOTO 215
85 DQ="Enter the SAMPLE NUMBER of the ":AR=CSRLIN
90 PRINT " ";DQ;"study population figures:";:AC=60:GOSUB 4200:NS1=NS
95 AR=CSRLIN:PRINT DQ;"standard population rates:";:GOSUB 4200:NS2=NS:GOSUB 235
100 PRINT TAB(15);"Rates in ";N$(NS2);:INPUT" are given per what number?  ",RD
105 E=0:FOR Z=1 TO N:E=E+VAL(D(NS1,Z))*VAL(D(NS2,Z)):NEXT:E=E/RD:PRINT
110 PRINT TAB(20);"How many cases were observed in ";N$(NS1);:INPUT XO
115 PRINT TAB(15);"Expected number of cases in the study group =";INT(E)
120 PRINT:COLOR CLR2,CLR1:PRINT TAB(10);"Adjusted rate = ";XO/E;"* STANDARD POPULATION RATE";TAB(75);:COLOR CLR1,CLR2
125 COLOR 23:PRINT:PRINT:AR=CSRLIN:PRINT TAB(25);"CALCULATING PROBABILITY";
130 AF=0:YO=XO:CE=0:IF E<YO THEN YO=YO-1:AF=1
135 IF XO>1000 THEN 170
140 IF YO=0 THEN SF=1 ELSE SF=E+1
145 F=E:FOR Z=2 TO YO:F=F*E/Z:IF F>1E+22 THEN F=F*1.928752165273146D-22:SF=SF*1.928752165273146D-22:CE=CE+1
150 IF F>=1E-31 THEN SF=SF+F:NEXT Z
155 SL=LOG(SF)-E-CE*50:IF SL>80 THEN P=0 ELSE P=EXP(SL)
160 IF AF=1 THEN P=1-P
165 GOTO 190
170 X=(XO-E)*(XO-E)/E:IF X>31 THEN P=0:GOTO 190
175 R=1.77245374942627#:S=1:I=1:K=((X/2)^(.5)*2)/(EXP(X/2)*R):VC=3
180 I=I*X/VC:S=S+I:VC=VC+2:IF I>9.999999E-31 THEN 180
185 P=1-K*S
190 GOSUB 230:LOCATE AR,1:PRINT TAB(6);"The probability of observing ";XO;" or ";
195 IF AF=1 THEN PRINT "more cases ="; ELSE PRINT "fewer cases =";
200 IF P<=.000001 THEN PRINT " < 10 (-6)"; ELSE IF P>.95 THEN PRINT " > .95"; ELSE PRINT P;
205 PRINT TAB(75):COLOR CLR1,CLR2:PRINT
210 IF NO>100 THEN PRINT:PRINT TAB(5);"Remember, the Poisson calculation of probability":PRINT TAB(20);"may not be applicable when the observed rate is > 5% ."
215 LOCATE 25,5:INPUT;"Do you want another rate adjustment using this DATAFILE?  ",A$:IF A$="y" OR A$="Y" THEN CLS:GOTO 35
220 LOCATE 25,47:INPUT;"a different DATAFILE?  ",A$:IF A$="y" OR A$="Y" THEN 20
225 LOCATE 23,1:END
230 PRINT:PRINT:COLOR CLR2,CLR1:PLAY "MB T160 L32 N8 N12 N15 N20 N24 N27 N32 N36 N39 N44... N27 L5 N8":RETURN
235 IF T(NS1)=T(NS2) THEN N=T(NS1):RETURN ELSE BEEP:PRINT:PRINT "These 2 samples do not have the same number of elements----":PRINT TAB(40);"rate adjustment cannot be performed.":GOTO 215
4025 ERASE D,CS,T,N$,X,X2,MD,SD
4030 DIM D(A,C),CS(A,C),T(A),N$(A),X(A),X2(A),MD(A),SD(A)
5000 BEEP:IF ERR<>53 AND ERR<>71 THEN 5010 ELSE LOCATE 10,10:PRINT "Please place EPISTAT in drive A: (or other default).":PRINT TAB(25);"Press any key to continue:"
5005 A$=INKEY$:IF A$="" THEN 5005 ELSE RESUME
5010 ON ERROR GOTO 0:END
