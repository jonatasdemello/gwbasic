5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 5"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13)
10 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:COLOR 7,0:KEY OFF
18 COLOR 3,0
20 LOCATE 1,3:PRINT"浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�"
23 PRINT"  �                         YOU CAN PRINT LINES HERE                        �"
24 FOR I = 3 TO 9:LOCATE I,3:PRINT "�":LOCATE I,77:PRINT"�":NEXT
36 LOCATE 10,3:PRINT"藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�"
38 COLOR 7,0:LOCATE 5,23:PRINT"**** See Text in Program listing ***"
40 LOCATE 7,33:PRINT"S T A N D    B Y "
42 ' This can be used to start any program or MERGED into any subroutine.
44 ' The box can be expanded by simply renumbering and typing in a new number
46 ' for range of the PRINT LOOP, and renumbering the locate line for the
48 ' bottom and/or top line to move the box up and down the screen.
52 '* * * * * * * * * * * * * NOTE   NOTE   NOTE * * * * * * * * * * * * * * *
54 ' You may PRINT WITHIN THE BOX by eliminating LOOP LINE 24.  Then inserting
56 ' any number of the lines printed out by line 23. This is a slower listing.
58 ' Or, you may print the box, then words inside by using LOCATE statements.
60 ' The later method would be appropriate if you were programming in color
62 ' and wanted the box and printing to be different colors without too many
64 ' color statements.                           Ver 5.1/160 and Ver 5.2/320
65 '********* <F2> to RUN again ******** <F10> for BLUEMENU  **********
66 FOR I=1 TO 4000:NEXT
68 CLS:LIST 42-65
69 END
200 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
65000 REM ********************* SAVE ROUTINE ********************************
65100 SAVE"B:SHOWBOX.BAS"
