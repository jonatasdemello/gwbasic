900  ' THIS PROGRAM CAN BE FOUND IN THE OCT.'82 ISSUE OF CREATIVE COMPUTING.
910  '
1000 ' GPRINT - Graphics Dump Program for the IBM Personal Computer
1010 ' Will Fastie -- Original version Feb 82, revised June 82
1020 '
1030 ' This priogram transfers the contents of the Color/Graphics Adapter
1040 ' memory to a GRAFTRAX-80 or GRAFTRAX-Plus equipped IBM 80 CPS or
1050 ' EPSON MX-80 printer, to an EPSON MX-100 printer, or to a new
1060 ' generation EPSON MX-80 OR 100 printer (for which GRAFTRAX-Plus is a
1070 ' standard feature).  Medium resolution images (200 x 320) are
1080 ' converted, whether in black and white or in color.  Color
1090 ' images, which can be displayed using a 4 color set, are printed
1100 ' in black and white.
1110 '
1120 ' The program assumes that the program is executed on a machine
1130 ' equipped with the Color/Graphics Adapter only.  If both
1140 ' display adapters are present, switch to the Color/Graphics
1150 ' adapter first, then run this program.
1160 '
1170 ' -- GLOBAL program declarations
1190 DIM PIN.MASKS(8)
1200 FOR PIN = 0 TO 7
1210   PIN.MASKS(PIN) = 2^(7-PIN)
1220 NEXT PIN
1230 ESC = 27
1240 CR =13
1250 '
1260 ' This section should be written to suit you particular needs.  For
1270 ' demonstration purposes, it loads a previously stored image form the
1280 ' disk into memory of the Color/Graphics Adapter.  You could
1290 ' generate the image here instead.
1300 '
1310 KEY OFF: CLS
1320 INPUT "Enter filename of image:  ",F$
1330 SCREEN 1,0                    'Medium resolution, color enabled
1340 DEF SEG = &HB800              'Base address of CG/A memory
1350 BLOAD F$, 0
1360 '
1370 ' This section converts the image in memory to a numeric array
1380 ' containing the information required for the printer
1390 '
1400 ' -- Declar an array to hold the data
1410 NR.ROWS = 200:  NR.COLS = 320
1420 ROWS.PER.PRINTED.LINE = 8
1430 NR.LINES = NR.ROWS/ROWS.PER.PRINTED.LINE
1440 DIM LINES(NR.LINES, NR.COLS)
1450 '
1460  ' -- Initialize the array to 0
1470 FOR L = 0 TO NR.LINES-1
1480   FOR COL = 0 TO NR.COLS-1
1490     LINES(L, COL) = 0
1500   NEXT COL
1510 NEXT L
1520 '
1530 ' This section reads each point form the video memory, translates
1540 ' the points to a black and white representaion, and builds
1550 ' the data for the printer.
1560 ' The ROW and COL variables are used to calculate the position in
1570 ' which the point value should be placed.  The positions 0 through 7
1580 ' represent the printer's print head pins, from top to bottom.  The
1590 ' value in each position in the array corresponds to these pin
1600 ' positions.                       1610 '
1620 FOR ROW = 0 TO NR.ROWS-1
1630   L = ROW\ROWS.PER.PRINTED.LINE
1640   FOR COL = 0 TO NR.COLS-1
1650     IF POINT(COL, ROW) = 0 THEN GOTO 1670
1660       LINES(L, COL) = LINES(L, COL) OR PIN.MASKS(ROW MOD 8)
1670   NEXT COL
1680   BEEP
1690 NEXT ROW
1700 '
1710 ' This section prints the data by line to the printer.  No assumption
1720 ' is made about the position of the paper.
1730 '
1740 GOSUB 2110
1750 FOR L = 0 TO NR.LINES-1                   'establish line spacing
1760   N = NR.COLS:  GOSUB 2170                'put printer in graphics mode
1770   FOR COL = 0 TO NR.COLS-1
1780     C = LINES(L, COL): GOSUB 2000
1790   NEXT COL
1800   C = CR: GOSUB 2000                      'advance the paper
1810 NEXT L
1820 LPRINT: LPRINT                            'space between this and next
1830 '
1840 END
1850 '
1860 ' This routine transmits the  value in C to the printer.
1870 ' A routine like this is necessary because PRINT in BASIC interprets
1880 ' some characters, and therefore connot transmit arbitrary values.
1890 '
1900 ' This program uses the Printer Port on the IBM Monochrome Display
1910 ' and Parallel Printer Adapter.  If you just have the Printer Adapter,
1920 ' you must change the port values in this routine according to this table.
1930 '
1940 '    Port Name            MD & PPA            Just PPA
1950 '    ---------            --------            --------
1960 '    DATA in/out          &H3BC               &H378
1970 '    Printer Latch        &H3BE               &H37A
1980 '    Status Register      &H3BD               &H379
1990 '
2000 OUT &H3BE, &H6
2010 IF INP(&H3BD) <> &HDF THEN 2010
2020 OUT &H3BC, C
2030 OUT &H3BE, &H3F
2040 IF INP(&H3BD) <> &HDF THEN 2040
2050 RETURN
2060 '
2070 ' Subroutine to set line spacing to 8/72 of and inch.  Subsequent
2080 ' to this command, the printer moves the paper by this amount
2090 ' whenever a Carriage Return (13) is received.
2100 '
2110 C = ESC: GOSUB 2000: C = ASC("A"): GOSUB 2000: C = 8: GOSUB 2000
2120 RETURN
2130 '
2140 ' Subroutine to command the printer to consider the next N characters
2150 ' as Bit Image Graphics data.
2160 '
2170 C = ESC: GOSUB 2000: C = ASC("K"): GOSUB 2000
2180 IF N > 255 THEN C = N-256: GOSUB 2000: C = 1: GOSUB 2000                                   ELSE C = N:     GOSUB 2000: C = 0: GOSUB 2000
2190 RETURN
