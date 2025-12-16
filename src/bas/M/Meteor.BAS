'Code supplement for the projection article at QBCM
'3d projection test
'applied to starfields
'SetVideoSEG by Plasma357
'Relsoft 2004
'rel.betterwebber.com
DECLARE SUB BubbleSort (Model() AS ANY)
DECLARE SUB StretchSprite (px%, py%, NewWid%, NewHei%, Sprite%(), Buffer%())
DECLARE SUB AF.Print (Xpos%, Ypos%, Text$, col%)
DECLARE SUB SetVideoSeg (Segment%)

DEFINT A-Z
REM $DYNAMIC


TYPE Point3d
        x       AS SINGLE           '3d x coord
        y       AS SINGLE           'ditto
        z       AS SINGLE           'ditto
        zvel    AS SINGLE           'ZVelocity
END TYPE


CONST LENS = 256                    'camera lens(FOV)
CONST XCENTER = 160                 'middle coords of screen 13
CONST YCENTER = 100                 'our center of projection
CONST MAXSTARS = 100                'number of stars
CONST MAXVEL = 2                    'Maximum speed of star


RANDOMIZE TIMER
REDIM SHARED Vpage(32009) AS INTEGER            'our buffer

DIM SHARED Stars(MAXSTARS) AS Point3d           'the stars


'$STATIC
DIM SHARED Scanline(199) AS INTEGER             'For our scanline buffer


'////Initialize the starting values of our stars
FOR i = 0 TO UBOUND(Stars)
    Stars(i).x = -160 + INT(RND * 320)           'x
    Stars(i).y = -160 + INT(RND * 320)            'y
    Stars(i).z = -256 + INT(RND * 255)               'z
    Stars(i).zvel = .1 + RND * MAXVEL           'speed of each star
NEXT i


CLS
SCREEN 13

size = ((16 ^ 2) + 4) \ 2               '16*16 sprite
DIM SHARED Ball(size)


'Grey Scale the Palette
FOR i = 0 TO 255
    OUT &H3C8, i
    OUT &H3C9, i \ 4
    OUT &H3C9, i \ 6
    OUT &H3C9, i \ 8
NEXT i

FOR y = -7 TO 8
FOR x = -7 TO 8
    dist! = SQR(x ^ 2 + y ^ 2)
    c% = (7 - dist!) * 32
    IF SQR(x ^ 2 + y ^ 2) < 7 THEN
        PSET (7 + x, 7 + y), c%
    END IF
NEXT x
NEXT y


GET (0, 0)-(15, 15), Ball(0)    'get sprite

Vpage(6) = 2560                      'Width 320*8
Vpage(7) = 200                       'Height
LAYER = VARSEG(Vpage(0)) + 1         'Buffer Seg(Ask Plasma)
SetVideoSeg LAYER                    'Set Draw to Buffer


T# = TIMER
Frame& = 0

DO
        Frame& = Frame& + 1
        SetVideoSeg LAYER                    'Set Draw to Buffer
        LINE (0, 0)-(319, 199), 0, BF       'clear the screen

        '///Move the stars
        '//Z=0 is 256 units away from the screen
        '//Adding values to Z moves the pixel towards us
        '//if Z > 256, the star is over our screen so reinitialize
        '//the stars Z value to 0(256 units away).
        FOR i = 0 TO UBOUND(Stars)
            Stars(i).z = Stars(i).z + Stars(i).zvel     'move it
            IF Stars(i).z > 255 THEN                'check for camera LENS
                Stars(i).z = -256                      'ReInit Z value
            END IF
        NEXT i
        BubbleSort Stars()
        FOR i = 0 TO UBOUND(Stars)
            sx! = Stars(i).x                        'StarX
            sy! = Stars(i).y                        'cleans the projectioon
            sz! = Stars(i).z                        'algo. ;*)
            Distance% = (LENS - sz!)                'get Distance
            IF Distance% > 50 THEN                     'if dist>10 then
                'Projection formula
                x% = XCENTER + (LENS * sx! / Distance%)
                y% = YCENTER - (LENS * sy! / Distance%)
                NewHei% = 16 * LENS / Distance%        'scale sprite
                NewWid% = 16 * LENS / Distance%        'new wid/hei
                StretchSprite x%, y%, NewWid%, NewHei%, Ball(), Vpage()
            ELSE
                                        'do nothing
                                        'you wouldn't wan't to
                                        'divide by 0 would ya? :*)
            END IF
        NEXT i
        SetVideoSeg &HA000              'Set Draw to screen
        WAIT &H3DA, 8                   'Vsynch
        PUT (0, 0), Vpage(6), PSET      'Blit out buffer to screen

LOOP UNTIL INKEY$ <> ""

DEF SEG

CLS
SCREEN 0
WIDTH 80
PRINT Frame& / (TIMER - T#)
c$ = INPUT$(1)


END

SUB AF.Print (Xpos%, Ypos%, Text$, col%)
'Prints the standard 8*8 CGA font
'Paramenters:
'Segment=the Layer to print to
'Xpos,Ypos=the coordinates of the text
'Text$=the string to print
'col= is the color to print(gradient)

x% = Xpos%
y% = Ypos%
Spacing% = 8
  FOR i% = 0 TO LEN(Text$) - 1
    x% = x% + Spacing%
    Offset% = 8 * ASC(MID$(Text$, i% + 1, 1)) + 14
    FOR j% = 0 TO 7
      DEF SEG = &HFFA6
      Bit% = PEEK(Offset% + j%)
      IF Bit% AND 1 THEN PSET (x%, y% + j%), col% + j%
      IF Bit% AND 2 THEN PSET (x% - 1, y% + j%), col% + j%
      IF Bit% AND 4 THEN PSET (x% - 2, y% + j%), col% + j%
      IF Bit% AND 8 THEN PSET (x% - 3, y% + j%), col% + j%
      IF Bit% AND 16 THEN PSET (x% - 4, y% + j%), col% + j%
      IF Bit% AND 32 THEN PSET (x% - 5, y% + j%), col% + j%
      IF Bit% AND 64 THEN PSET (x% - 6, y% + j%), col% + j%
      IF Bit% AND 128 THEN PSET (x% - 7, y% + j%), col% + j%
    NEXT j%
  NEXT i%

END SUB

SUB BubbleSort (Model() AS Point3d)
'Not the best sorting but gets the job done. ;*)
'don't you fret, I will teach you 3 more sorting algos. :*)

min = LBOUND(Model)
max = UBOUND(Model)
FOR i = min TO max      'loop through all the balls
FOR j = i TO max - 1
    IF Model(j).z > Model(j + 1).z THEN  'Swap if not in order
        SWAP Model(j), Model(j + 1)
    END IF
NEXT j
NEXT i

END SUB

SUB SetVideoSeg (Segment) STATIC

DEF SEG

IF VideoAddrOff& = 0 THEN ' First time the sub is called

' We need to find the location of b$AddrC, which holds the graphics
' offset (b$OffC) and segment (b$SegC). Since b$AddrC is in the default
' segment, we can find it by setting it to a certain value, and then
' searching for that value.

SCREEN 13 ' Set b$SegC to A000 (00A0 in memory)
PSET (160, 100), 0 ' Set b$OffC to 7DA0 (not needed in the IDE)

FOR Offset& = 0 TO 32764 ' Search for b$AddrC, which is
IF PEEK(Offset&) = &HA0 THEN ' in the default segment and
IF PEEK(Offset& + 1) = &H7D THEN ' should have a value of
IF PEEK(Offset& + 2) = &H0 THEN ' A0 7D 00 A0.
IF PEEK(Offset& + 3) = &HA0 THEN
VideoAddrOff& = Offset& + 2 ' If we found it, record the
EXIT FOR ' offset of b$SegC and quit
END IF ' looking. (Oddly, changing
END IF ' the b$OffC doesn't seem to
END IF ' do anything, so this is why
END IF ' this sub only changes b$SegC)
NEXT

END IF

' Change b$SegC to the specified Segment

POKE VideoAddrOff&, Segment AND &HFF
POKE VideoAddrOff& + 1, (Segment AND &HFF00&) \ &H100




END SUB

SUB StretchSprite (px%, py%, NewWid%, NewHei%, Sprite(), Buffer())

'px and py are the coordinates of the sprite
'Newwid and Newhei are the new dimensions of the sprite
'Sprite is a GET/PUT array
'Buffer is the virtual page
'uses 8.8 fixed point math for lil speed inside the IDE
'clipping supported
'Uses a Static array called scanline() for speed issues.

wid% = Sprite(0) \ 8
Hei% = Sprite(1)
xstep% = (wid% * 128 \ NewWid%)
ystep% = (Hei% * 128 \ NewHei%)

y% = py%
x% = px%
'Clip/Crop it
IF y% < 0 THEN
        CY = -y%
        NewHei% = NewHei% - CY
        y% = 0
        miny% = CY
ELSEIF y% > 199 THEN
        EXIT SUB
ELSE
        Ndy = y% + NewHei%
        IF Ndy > 199 THEN
                NewHei% = NewHei% - (Ndy - (200))
        END IF
END IF

IF x% < 0 THEN
        cx = -x%
        NewWid% = NewWid% - cx
        x% = 0
        minx% = cx
ELSEIF x% > 319 THEN
        EXIT SUB
ELSE
        Ndx = x% + NewWid%
        IF Ndx > 319 THEN
                NewWid% = NewWid% - (Ndx - 320)
        END IF
END IF

'ax=x
'bx=wid
'cx=y
'dx=hei


Vseg% = VARSEG(Buffer(0))
Voff% = VARPTR(Buffer(8))
SprSeg% = VARSEG(Sprite(0))
SprOff% = VARPTR(Sprite(2))
u& = 0
v& = 0
T20Mw = 320 - NewWid%
di& = Voff% + y% * 320& + x%        'start coords

v& = miny% * ystep%
minxstep& = minx% * xstep%

FOR y% = 0 TO NewHei% - 1
    u& = minxstep&
    ya = v& \ 128
    Temp& = ya * wid% + SprOff%
    Offset& = Temp&
    DEF SEG = SprSeg%
    FOR x% = 0 TO NewWid% - 1
        xa = u& \ 128
        Offset& = Temp& + xa
        Scanline%(x%) = PEEK(Offset&)
        u& = u& + xstep%
    NEXT x%
    DEF SEG = Vseg%
    FOR x% = 0 TO NewWid% - 1
        c% = Scanline(x%)
        IF c% THEN
            POKE di&, c%
        END IF
        di& = di& + 1
    NEXT x%
    v& = v& + ystep%
    di& = di& + T20Mw
NEXT y%

END SUB

