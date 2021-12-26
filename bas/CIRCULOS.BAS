CONST MudarCor = 20     'Modifique para alterar o numero de trocas de cores

SCREEN 8: CLS : RANDOMIZE TIMER
cordg = INT(RND * 15) + 1
corv = INT(RND * 15) + 1
corh = INT(RND * 15) + 1

DO

 SELECT CASE raiodg
  CASE IS > 797: cddg = -1
  CASE IS < 1: cddg = 1
 END SELECT
 raiodg = raiodg + cddg

 SELECT CASE raiov
  CASE IS > 475: cdv = -1
  CASE IS < 1: cdv = 1
 END SELECT
 raiov = raiov + cdv

 SELECT CASE raioh
  CASE IS > 637: cdh = -1
  CASE IS < 1: cdh = 1
 END SELECT
 raioh = raioh + cdh

 IF raiodg / MudarCor = INT(raiodg / MudarCor) THEN
  DO: cordg = INT(RND * 15) + 1
  LOOP WHILE cordg = cdga
 END IF
 IF raiov / MudarCor = INT(raiov / MudarCor) THEN
  DO: corv = INT(RND * 15) + 1
  LOOP WHILE corv = cva
 END IF
 IF raioh / MudarCor = INT(raioh / MudarCor) THEN
  DO: corh = INT(RND * 15) + 1
  LOOP WHILE corh = cha
 END IF

 cdga = cordg
 cva = corv
 cha = corh

 CIRCLE (1, 0), raiodg, cordg
 CIRCLE (1, 199), raiodg, cordg
 CIRCLE (638, 0), raiodg, cordg
 CIRCLE (638, 199), raiodg, cordg

 CIRCLE (320, 0), raiov, corv
 CIRCLE (320, 199), raiov, corv

 CIRCLE (1, 100), raioh, corh
 CIRCLE (638, 100), raioh, corh

LOOP UNTIL INKEY$ = CHR$(27)

SCREEN 0: END

