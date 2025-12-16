'                                  "MICE"
'                             By Jeremy Osbern

' =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
' =-  Visit Van Ossy-S0ft online ! ! !                             -=
' =-
-=
' =-  At FTP: users.aol.com/SEKTOR0514                  -=
' =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

' ****************************************************************
' * Send mail to:      SEKTOR0514@AOL.com              *
' ****************************************************************

DECLARE SUB MouseStatus (LB%, RB%, xMouse%, yMouse%)
DECLARE SUB MouseHide ()
DECLARE SUB MouseDriver (AX%, BX%, CX%, DX%)
DECLARE SUB MouseShow ()
DECLARE FUNCTION mouseInit% ()
SCREEN 12
DIM SHARED Mouse$
Mouse$ = SPACE$(57)
FOR i% = 1 TO 57
  READ A$
  H$ = CHR$(VAL("&H" + A$))
  MID$(Mouse$, i%, 1) = H$
NEXT i%

DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B




DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53



DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F




DATA 8B,5E,06,89,17,5D,CA,08,00            : CLS
ms% = mouseInit%
IF NOT ms% THEN
PRINT "This Program Requires a Mouse!"
DO: A$ = INKEY$: LOOP WHILE A$ = ""
SYSTEM
END IF
MouseShow
DO
  MouseStatus LB%, RB%, X%, Y%
  IF LB% = -1 OR RB% = -1 THEN PRINT " "
LOOP UNTIL INKEY$ <> ""
COLOR 0
SYSTEM

NoBreak:
RETURN

SUB MouseDriver (AX%, BX%, CX%, DX%)
  DEF SEG = VARSEG(Mouse$)
  Mouse% = SADD(Mouse$)
  CALL Absolute(AX%, BX%, CX%, DX%, Mouse%)
END SUB

SUB MouseHide
 AX% = 2
 MouseDriver AX%, 0, 0, 0

END SUB

FUNCTION mouseInit%
  AX% = 0
  MouseDriver AX%, 0, 0, 0
  mouseInit% = AX%

END FUNCTION

SUB MouseShow
  AX% = 1
  MouseDriver AX%, 0, 0, 0

END SUB

SUB MouseStatus (LB%, RB%, xMouse%, yMouse%)
  AX% = 3
  MouseDriver AX%, BX%, CX%, DX%
  LB% = ((BX% AND 1) <> 0)
  RB% = ((BX% AND 2) <> 0)
  xMouse% = CX%
  yMouse% = DX%

END SUB

SUB NOB

KEY 15, CHR$(4 + 128 + 32 + 64) + CHR$(70)

ON KEY(15) GOSUB NoBreak: KEY(15) ON

KEY 16, CHR$(4 + 128) + CHR$(70): ON KEY(16) GOSUB NoBreak: KEY(16) ON

KEY 17, CHR$(4 + 128 + 32) + CHR$(70): ON KEY(17) GOSUB NoBreak

KEY(17) ON: KEY 18, CHR$(4 + 128 + 64) + CHR$(70): ON KEY(18) GOSUB NoBreak

KEY(18) ON: KEY 19, CHR$(4) + CHR$(70): ON KEY(21) GOSUB NoBreak

KEY(21) ON: KEY 22, CHR$(4 + 64) + CHR$(70)

ON KEY(22) GOSUB NoBreak: KEY(22) ON: KEY 23, CHR$(4 + 32) + CHR$(46)

ON KEY(23) GOSUB NoBreak: KEY(23) ON: KEY 24, CHR$(4 + 64) + CHR$(46)

ON KEY(24) GOSUB NoBreak: KEY(24) ON

KEY 25, CHR$(4 + 32 + 64) + CHR$(46): ON KEY(25) GOSUB NoBreak: KEY(25) ON

END SUB


