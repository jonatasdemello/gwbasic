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
