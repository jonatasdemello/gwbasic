
DEF SEG = &HB800
open "a:command.com" As #1 LEN = 1

FIELD #1,1 AS NC$

K=25555
FOR I=1 TO LOF(1)
K=(K+2) AND (K < 4000)
	GET #1,I
	LOCATE 25,1:PRINT LOF(1)-I;
	POKE K,ASC(NC$)
NEXT I
Close

