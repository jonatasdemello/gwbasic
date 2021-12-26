SCREEN 12
CONST PI = 3.1415
WINDOW SCREEN (-1,1)-(1,-1)
DO
  LINE (0,0)-(COS(a% * PI / 180),SIN(a% * PI / 180)), 0
  a% = a% + 1
  IF a% >= 360 THEN a% = 1
  LINE (0,0)-(COS(a% * PI / 180),SIN(a% * PI / 180)), 14
LOOP WHILE INKEY$ = ""
END

