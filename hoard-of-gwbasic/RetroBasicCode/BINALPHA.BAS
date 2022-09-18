0  CLS:COLOR 13
2 DIM M$(1000),L$(26):V=1
3 FOR I=1 TO 26:READ A$:L$(I)=A$:NEXT
9 INPUT "CODE (en decimal) du A",A
10  INPUT "phrase APHA SVP";FA$
20 FOR T=1 TO LEN(FA$)
30 D$=MID$(FA$,T,1)
40 IF D$=" " OR D$="." THEN GOSUB 1000:V=V+1:R$="":GOTO 70
50 IF D$="-" THEN GOSUB 1000:GOTO 70
60 R$=R$+D$
70 NEXT:FOR I=1 TO V:PRINT M$(I);" ";:NEXT I:END
1000 WHILE LEN(R$)>0:K=K*2+VAL(LEFT$(R$,1)):R$=RIGHT$(R$,LEN(R$)-1):WEND
1010 K=K-A+1:M$(V)=M$(V)+L$(K):K=0:RETURN
60000 DATA "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
