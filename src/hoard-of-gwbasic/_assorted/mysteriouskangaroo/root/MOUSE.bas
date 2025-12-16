'QBASIC Mouse demo                                    
'Author : Dan Maxwell                      
'Here is the routine that will add MOUSE functions to 
'your QBasic 1.0 that comes with MS-DOS 5.0           
'(Works with Qbasic 1.1 too. - Adam)



DECLARE SUB Pause ()
DECLARE SUB MouseStatus (lb%, rb%, xMouse%, yMouse%)
DECLARE SUB MouseRange (x1%, y1%, x2%, y2%)
DECLARE SUB MousePut (x%, y%)
DECLARE SUB MouseHide ()
DECLARE SUB MouseDriver (ax%, bx%, cx%, dx%)
DECLARE SUB MouseShow ()
DECLARE FUNCTION MouseInit% ()

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
DATA 8B,5E,06,89,17,5D,CA,08,00                       
CLS
ms% = MouseInit%
IF NOT ms% THEN
  PRINT "Mouse not found"
  END
END IF
PRINT "Mouse found and initialized"
PRINT : PRINT "Show mouse cursor: MouseShow"
MouseShow
Pause
MouseHide
PRINT "Hide mouse cursor: MouseHide"
Pause
CLS
PRINT "Mouse Status: MouseStatus lb%, rb%, x%, y%"
PRINT : PRINT "LEFT BUTTON", "RIGHT BUTTON", "X-AXIS", "Y-AXIS"
LOCATE 8, 1
PRINT "Press any key to continue..."
MouseShow
WHILE INKEY$ = ""
  MouseStatus lb%, rb%, x%, y%

  LOCATE 5, 1
  PRINT lb%, rb%, x%, y%
WEND
MouseHide
LOCATE 11, 1
PRINT "Set Mouse Range: Mouserange x1%, y1%, x2%, y2%"
PRINT "  Set x1%, y1% to first coordinate set"
PRINT "  Set x2%, y2% to second coordinate set"
FOR i% = 15 TO 20
  LOCATE i%, 21
  PRINT STRING$(40, 176);
NEXT i%
PRINT : PRINT
MouseRange 8 * (21 - 1), 8 * (15 - 1), 8 * (60 - 1), 8 * (20 - 1)
MouseShow
Pause
MouseHide
MouseRange 0, 0, 79 * 8, 24 * 8
 
CLS
PRINT "Put mouse cursor: MousePut x%, y%"
PRINT "  x% = x cooridinate, y% = y coordinate"
PRINT : PRINT "Press any key to continue..."
MouseShow
DO WHILE INKEY$ = ""
  col% = INT(RND(1) * 80) + 1
  row% = INT(RND(1) * 25) + 1
  x% = (col% - 1) * 8
  y% = (row% - 1) * 8
  MousePut x%, y%
LOOP
MouseHide
END

SUB MouseDriver (ax%, bx%, cx%, dx%)
  DEF SEG = VARSEG(Mouse$)
  Mouse% = SADD(Mouse$)
  CALL Absolute(ax%, bx%, cx%, dx%, Mouse%)
END SUB

SUB MouseHide
 ax% = 2
 MouseDriver ax%, 0, 0, 0
END SUB

FUNCTION MouseInit%
  ax% = 0
  MouseDriver ax%, 0, 0, 0
  MouseInit% = ax%
END FUNCTION

SUB MousePut (x%, y%)
  ax% = 4
  cx% = x%
  dx% = y%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseRange (x1%, y1%, x2%, y2%)
  ax% = 7
  cx% = x1%
  dx% = x2%
  MouseDriver ax%, 0, cx%, dx%
  ax% = 8
  cx% = y1%
  dx% = y2%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseShow
  ax% = 1
  MouseDriver ax%, 0, 0, 0
END SUB

SUB MouseStatus (lb%, rb%, xMouse%, yMouse%)
  ax% = 3
  MouseDriver ax%, bx%, cx%, dx%
  lb% = ((bx% AND 1) <> 0)
  rb% = ((bx% AND 2) <> 0)
  xMouse% = cx%
  yMouse% = dx%
END SUB

SUB Pause
  'This sub used for demo, not needed for mouse calls  
  PRINT "Press any key to continue..."
  G$ = INPUT$(1)
  PRINT
END SUB

