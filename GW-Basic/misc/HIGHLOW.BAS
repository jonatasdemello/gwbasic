' This is the Server (Host) version of Higher / Lower '
' Version 1.0 by Michael Sao Pedro '
' This game is for use ONLY with the Chatline or COMline systems '
SCREEN 1: SCREEN 0
COLOR 4
CLS

Intro:
 
  PRINT "ษออออออออออออออออออออออออออออออออออออออป"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "บ                                      บ"
  PRINT "ศออออออออออออออออออออออออออออออออออออออผ"

  LOCATE 3, 9, 0: COLOR 9: PRINT "H i g h e r  /  L o w e r"
  LOCATE 9, 11: COLOR 14: PRINT "V e r s i o n    1.0"
  LOCATE 14, 13: COLOR 10: PRINT "ฤฤฤ H o s t ฤฤฤ"
  LOCATE 21, 2: COLOR 15: PRINT "B y: M i c h a e l   S a o   P e d r o"
  PLAY "MF P1P1"

Variables:
  Y = 1
  DIM cards(20)
  FOR Z = 1 TO 20
  RANDOMIZE TIMER
  ZZ = INT(RND * 9)
  cards(Y) = ZZ
  Y = Y + 1
  NEXT Z

