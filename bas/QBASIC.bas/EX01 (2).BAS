
rem PALETTE color, blueValue * 256 ^ 2 + greenValue * 256 + redValue 

SCREEN 12
DO
  FOR i% = 1 TO 63
    PALETTE 0, i% * 256 ^ 2 + i%
  NEXT i%
  FOR i% = 63 TO 1 STEP -1
    PALETTE 0, i% * 256 ^ 2 + i%
  NEXT i%
LOOP WHILE INKEY$ = ""
END  


box$ = "bu5 l5 d10 r10 u10 l5 bd5"

DO
 angle% = angle% + 1
 IF angle% >= 360 THEN angle% = 1
 DRAW "c0 bm320,240 ta" + STR$(angle% - 1) + "X" + VARPTR$(box$)
 DRAW "c1 bm320,240 ta" + STR$(angle%) + "X" + VARPTR$(box$)
LOOP WHILE INKEY$ = ""
END

SCREEN 12
box$ = "bu4 l4 d8 r8 u8 l4 bd4"
FOR s% = 2 TO 200 
  DRAW "c0 bm320,240 s" + STR$(s% - 1) + "X" + VARPTR$(box$)
  DRAW "c2 bm320,240 s" + STR$(s%) + "X" + VARPTR$(box$)
NEXT s%
END

SCREEN 12
box$ = "bu4 l4 d8 r8 u8 l4 bd4"
FOR s% = 2 TO 250
  DRAW "c0 bm320,240 ta" + STR$(a%) + "s" + STR$(s% - 1) + "X" + VARPTR$(box$)
  a% = a% + 1
  IF a% >= 360 THEN a% = 1
  DRAW "c1 bm320,240 ta" + STR$(a%) + "s" + STR$(s%) + "X" + VARPTR$(box$)
NEXT s%
END
