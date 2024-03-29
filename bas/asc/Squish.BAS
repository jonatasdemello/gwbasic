1 '           IBM PC BASIC
2 '            'Squish'
3 '  Author: Dave Archibald
4 '  Translation: Alan J. Zett
5 '  Copyright (c) 1982, SoftSide Publications, Inc.
6 '  Squished some bugs 2/5/83: Herb Shear
7 '
9 REM initialize variables, DIMension arrays, DEFine Function I$, and select          run time options.
10 DEF FNI$(A$)=CHR$(ASC(LEFT$(A$,1))+32*(LEFT$(A$,1)>"Z")):DEFINT B-K,S-Z:A=0:AZ=0:A$="":C$="":D=0:DS=100:DT=0:G1=0:G2=0:G3=0:G4=0:G5=0:G6=0:HH=0:I$="":IP$="":J$="":LN=0:L$="":L1$="":N$="":P=0:PJ=0:PP=0:PV=0:Q$="":R=0:RD=0:RE=0:S=0:S1=0
20 SD=0:SQ$="":SV$="":T=0:T1=0:T2=0:V$="":X=0:XC$="":XS$="":XP$="":ZC=0:DIM REF(DS*2),PRO(DS):SCREEN 0,0,0:WIDTH 80:COLOR 11,0:KEY OFF:CLS:LINE INPUT"Enter the name of the program to be Squished: ";SQ$
30 XS$="N":IP$="N":XC$="N":XP$="N":PRINT:LINE INPUT"Enter the name for the final Squished program: ";SV$:PRINT:LINE INPUT"Would you like extra spaces deleted? (Y/N)";XS$:IF XS$="" THEN XS$="N"
40 PRINT:LINE INPUT"Would you like REM statements deleted? (Y/N) ";IP$:IF IP$="" THEN IP$="N"
50 PRINT:LINE INPUT"Would you like to combine lines? (Y/N) ";XC$:IF XC$="" THEN XC$="N"
60 PRINT: LINE INPUT"Would you like to protect any lines? (Y/N) ";XP$:IF XP$="" THEN XP$="N"
69 REM Set error trap and convert INPUT variables.
70 ON ERROR GOTO 560:XS$=FNI$(XS$):IP$=FNI$(IP$):XC$=FNI$(XC$):XP$=FNI$(XP$)
79 REM If nothing is to be done, reRUN the program.
80 IF XS$="N" AND IP$="N" AND XC$="N" AND XP$="N" THEN RUN
89 REM Store user protected lines.
90 IF XP$="Y" THEN INPUT"Enter line number to protect (0 to exit) ";PRO(PV):IF PRO(PV)>0 AND PV<DS THEN PV=PV+1: GOTO 90
99 REM OPEN source file for input.
100 OPEN SQ$ FOR INPUT AS #1
109 REM Check for EndOfFile and PRINT error if current line does not start with         a line number.
110 IF EOF(1) THEN 240
120 LINE INPUT #1,A$:IF ASC(A$)>58 THEN COLOR 12,0:PRINT:PRINT"**** '";SQ$;"' is not an ASCII file ****":PRINT:COLOR 11,0:END
129 REM Search for reserved words that reference other program lines.
130 G1=1:G2=1:G3=1:G4=1:G5=1:G6=1:G7=1:G8=1
140 D=5:T=INSTR(G1,A$,"THEN "):IF T THEN G1=T+D:GOTO 210
150 T=INSTR(G2,A$,"GOTO "):IF T THEN G2=T+D: GOTO 210
160 T=INSTR(G3,A$,"ELSE "):IF T THEN G3=T+D: GOTO 210
170 T=INSTR(G4,A$,"GOSUB "):IF T THEN D=5:G4=T+D:GOTO 210
175 T=INSTR(G7,A$,"RETURN "):IF T THEN D=6:G7=T+D:GOTO 210
180 T=INSTR(G5,A$,"RESUME "):IF T THEN D=6:G5=T+D:GOTO 210
185 T=INSTR(G5,A$,"RESTORE "):IF T THEN D=7:G8=T+D:GOTO 210
190 T=INSTR(G6,A$,"RUN "):IF T THEN D=3:G6=T+D:GOTO 210
200 GOTO 110
209 REM Store all referenced lines into an array.
210 L$=MID$(A$,T-1,1):IF L$=" " OR L$=":" THEN ELSE 140
211 A=VAL(MID$(A$,T+D)):IF A THEN FOR HH=1 TO R:IF REF(HH)<>A THEN NEXT:R=R+1:REF(R)=A
220 IF A>0 THEN T=T+D:D=1:T1=INSTR(T,A$,","):T2=INSTR(T,A$,":"):IF T1>0 AND (T2=0 OR T1<T2) THEN T=T1:GOTO 210
230 GOTO 140
239 REM Sort all referenced and protected lines in ascending order.
240 CLOSE:FOR S=1 TO R:FOR S1=S TO R:IF REF(S)<REF(S1) THEN SWAP REF(S),REF(S1)
250 NEXT S1,S:FOR S=0 TO PV:FOR S1=S TO PV:IF PRO(S)>PRO(S1) THEN SWAP PRO(S),PRO(S1)
259 REM ReOPEN source file for INPUT and OPEN destination for OUTPUT.
260 NEXT S1,S:OPEN SQ$ FOR INPUT AS #1:OPEN SV$ FOR OUTPUT AS #2:CLS
269 REM Get next program line to be processed.
270 IF EOF(1) THEN 380
280 LINE INPUT #1,A$:FOR HH=INSTR(A$," ") TO LEN(A$)-1:IF MID$(A$,HH+1,1)=" " THEN NEXT
289 REM Set up pointer variables and update display.
290 PP=HH:X=PP:LN=VAL(A$):LOCATE 1,1:COLOR 11,0:PRINT"Scanning line:";:COLOR 12,0:PRINT LN:PRINT:PRINT STRING$(255,32):LOCATE 3,1:COLOR 14,0:PRINT A$:LOCATE 8,1:COLOR 11,0:PRINT"Scanning position: ":PRINT
300 PRINT"Number of lines combined:";:COLOR 12,0:PRINT RE:COLOR 11,0:PRINT:PRINT"Number of spaces deleted:";:COLOR 12,0:PRINT SD:COLOR 11,0:PRINT:PRINT"Number of REM statements deleted:";:COLOR 12,0:PRINT RD:COLOR 11,0:GOTO 410
309 REM If combining lines is not allowed, then write new line.
310 IF XC$<>"Y" THEN PRINT #2,A$:GOTO 270
319 REM Set up C$ to start combining lines.
320 IF C$="" THEN C$=A$:GOTO 270
329 REM Checks if current line is referenced.
330 IF R>0 THEN IF LN=REF(R) THEN R=R-1:GOTO 370 ELSE IF LN>REF(R) THEN R=R-1:GOTO 330
339 REM Never combine lines with IF or RETURN statements.
340 IF INSTR(C$,"IF") OR INSTR(C$,"RETURN") THEN 370
349 REM Combine two program lines and go for more.
350 V$=RIGHT$(A$,LEN(A$)-X):IF LEN(C$)+LEN(V$)<=240 THEN C$=C$+":"+V$:RE=RE+1 ELSE 370
360 GOTO 270
369 REM Not enough space in C$ to combine another line so write it out first,           then continue.
370 PRINT #2,C$:C$=A$:GOTO 270
379 REM Write out last program line and update display.
380 PRINT #2,C$:CLOSE:COLOR 12,0:LOCATE 8,1:PRINT SPACE$(21):LOCATE 10,26:PRINT RE:LOCATE 12,26:PRINT SD:LOCATE 14,34:PRINT RD
389 REM Prompt for optional LOADing of Squished program.
390 LOCATE 1,1:PRINT SPACE$(20):LOCATE 3,1:PRINT STRING$(255,32):LOCATE 3,1:COLOR 14,0:PRINT"Press 'L' to load the Squished program":SOUND 1000,6:SOUND 660,5:COLOR 11,0
400 Q$=INKEY$:IF Q$="" THEN 400 ELSE CLS:IF Q$="L" OR Q$="l" THEN LOAD SV$ ELSE END
409 REM Change color of current character being scanned.
410 N$=LEFT$(A$,PP):ZC=160+PP:PP=PP+1:P=0:J$="":DT=0:FOR T=PP TO LEN(A$):L$=MID$(A$,T,1):AZ=INT(ZC/80):LOCATE AZ+1,ZC-AZ*80+1:COLOR 10,0:PRINT MID$(A$,T,1);:ZC=ZC+1:COLOR 12,0:LOCATE 8,19:PRINT T
419 REM Set P equal to 1 on the first quote mark in a PRINT statement, ELSE set     P equal to 0 on second.
420 COLOR 11,0:IF L$=CHR$(34) THEN IF P THEN P=0 ELSE P=1
429 REM If the current scan position if within a set of quote marks, skip all           normal Squish processing.
430 IF P THEN 520
439 REM Branch to line 520 if DATA is found in the current program line.
440 IF MID$(A$,T,4)="DATA" THEN DT=1 ELSE IF L$=":" THEN DT=0
450 IF DT THEN 520
459 REM Remove all spaces when safe to do so and update Spaces Deleted counter.
460 IF L$<>" " OR XS$<>"Y" THEN 500 ELSE IF J$>"" THEN L1$=RIGHT$(J$,1):IF L1$=CHR$(34)OR L1$="^" OR (L1$>="(" AND L1$<"0") OR (L1$>"9" AND L1$<"A") THEN L$=""
470 L1$="X":IF T<LEN(A$) THEN L1$=MID$(A$,T+1,1)
480 IF L1$="^" OR L1$=CHR$(34) OR L1$=" " OR (L1$>="'" AND L1$<"0") OR (L1$>"9" AND L1$<"A") THEN L$=""
490 IF L$="" THEN SD=SD+1
499 REM Check for a user protected line.
500 IF PV>PJ THEN IF LN=PRO(PJ) THEN PJ=PJ+1:GOTO 540 ELSE IF LN>PRO(PJ) THEN PJ=PJ+1:GOTO 500
509 REM Search for REMarks and remove if allowed.
510 IF MID$(A$,T,3)="REM" OR L$="'" THEN IF IP$<>"Y" THEN GOSUB 600:A$=N$+J$+MID$(A$,T):GOTO 540 ELSE RD=RD+1:WHILE LN>REF(R)AND R>0:R=R-1:WEND:IF LN=REF(R) THEN R=R-1:GOSUB 600:WHILE J$="":J$="'":WEND:A$=N$+J$:GOTO 540 ELSE IF J$="" THEN 270 ELSE 530
519 REM Construct a new Squished version of the currect line in J$.  Also add a         trailing quote mark if none found after a PRINT statement.
520 J$=J$+L$:NEXT:IF P THEN J$=J$+CHR$(34)
529 REM Add the current program line number and jump to line 310.
530 GOSUB 600:A$=N$+J$:GOTO 310
539 REM If lines have been combined, then save them.
540 IF C$<>"" THEN PRINT #2,C$:C$=""
549 REM Otherwise write new program line.
550 PRINT #2,A$:GOTO 270
559 REM Error trapping done here.
560 IF ERR=53 THEN PRINT:PRINT SQ$" FILE NOT FOUND":PRINT:FILES LEFT$(SQ$,INSTR(SQ$,":"))+"*.*":PRINT:LINE INPUT "Try again:";SQ$:RESUME: ELSE ON ERROR GOTO 0
599 REM Patch to remove indentation if spaces being deleted.  Add `AND XC$="Y"  to the logic if you want to preserve indentation when not combining.
600 IF XS$="Y"THEN X=INSTR(N$," "):N$=LEFT$(N$,X):SD=SD+PP-X-1
610 RETURN
