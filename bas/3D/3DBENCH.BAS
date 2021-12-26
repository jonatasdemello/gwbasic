'''Benchmarking both the 12 and 9 mul rotations
'''This test takes about 30 seconds.
'''SetvideoSeg by Plasma357
'''Rel.betterwebber.com

DECLARE SUB RotateAndProject9 (Model() AS ANY, AngleX%, AngleY%, AngleZ%)
DECLARE SUB LoadSpace (Model() AS ANY, radius%, Numstars%)
DECLARE SUB LoadCubeSolid (Model() AS ANY, xmax%, ymax%, zMax%, Scale!)
DECLARE SUB DrawModel (Model() AS ANY, clr%)
DECLARE SUB SetVideoSeg (Segment%)
DECLARE SUB LoadPlaneSolid (Model() AS ANY, xmax%, ymax%, Scale!)
DECLARE SUB RotateAndProject12 (Model() AS ANY, AngleX%, AngleY%, AngleZ%)

DEFINT A-Z
REM $DYNAMIC



TYPE Point3d
        x       AS SINGLE                   'Normal 3d coords
        y       AS SINGLE
        z       AS SINGLE
        xr      AS SINGLE                   'Rotated  3d coords
        yr      AS SINGLE
        zr      AS SINGLE
        scrx    AS INTEGER                  'Translated and projected
        scry    AS INTEGER                  '2d Coords
        cull    AS INTEGER                  'visibility check
END TYPE

CONST FALSE = 0, TRUE = NOT FALSE

CONST LENS = 256                            'Z
CONST XCENTER = 160                         '??
CONST YCENTER = 100                         '??

CONST PI = 3.14151693#

REDIM SHARED Vpage(32009)  AS INTEGER           'our Video buffer

'Polyhedra stuff
REDIM SHARED Model(1) AS Point3d               '3d  Coords
DIM SHARED Thetax, Thetay, Thetaz              'Angle of rotation
DIM SHARED camx%, camy%, camz%                 'camera


CLS
SCREEN 0
WIDTH 80



LOCATE 1, 1
PRINT "Choose Model:"
PRINT "1. Solid Cube"
PRINT "2. PlaneSolid"
PRINT "3. Space"
DO
    K$ = INKEY$
LOOP UNTIL K$ <> ""

'Initialize 3d Models

SELECT CASE ASC(K$)
        CASE 49                 '1
            LoadCubeSolid Model(), 16, 16, 16, 8
        CASE 50                 '2
            LoadPlaneSolid Model(), 56, 56, 3
        CASE 51                 '3
            LoadSpace Model(), 64, 4000
        CASE ELSE
            LoadCubeSolid Model(), 16, 16, 16, 8
END SELECT


CLS
SCREEN 13
RANDOMIZE TIMER

camx% = 0
camy% = 0
camz% = 0

Thetax = INT(RND * 360)
Thetay = INT(RND * 360)
Thetaz = INT(RND * 360)

Vpage(6) = 2560                 'GET/PUT stuuff
Vpage(7) = 200
Layer = VARSEG(Vpage(0)) + 1    'Easy buffer reference
SetVideoSeg Layer               'Set Draw to buffer

'///=========12 mul test
T# = TIMER
F& = 0
DO

     F& = F& + 1
     Thetax = (Thetax + 1) MOD 360          'rotate our angles
     Thetay = (Thetay + 1) MOD 360
     Thetaz = (Thetaz + 1) MOD 360
     RotateAndProject12 Model(), Thetax, Thetay, Thetaz  '12 muls
     SetVideoSeg Layer              'set draw to Buffer
     LINE (0, 0)-(319, 199), 0, BF  'CLS
     DrawModel Model(), 12          'Draw 3d model
     SetVideoSeg &HA000             'Set Draw to buffer
     WAIT &H3DA, 8                  'Vsynch
     PUT (0, 0), Vpage(6), PSET     'Blit

LOOP UNTIL INKEY$ <> "" OR (TIMER - T#) > 15

Normal! = F& / (TIMER - T#)

'///=========9 mul test
T# = TIMER      'restore timer and counter
F& = 0
DO

     F& = F& + 1
     Thetax = (Thetax + 1) MOD 360          'rotate our angles
     Thetay = (Thetay + 1) MOD 360
     Thetaz = (Thetaz + 1) MOD 360
     RotateAndProject9 Model(), Thetax, Thetay, Thetaz  '12 muls
     SetVideoSeg Layer              'set draw to Buffer
     LINE (0, 0)-(319, 199), 0, BF  'CLS
     DrawModel Model(), 12          'Draw 3d model
     SetVideoSeg &HA000             'Set Draw to buffer
     WAIT &H3DA, 8                  'Vsynch
     PUT (0, 0), Vpage(6), PSET     'Blit

LOOP UNTIL INKEY$ <> "" OR (TIMER - T#) > 15

Matrix! = F& / (TIMER - T#)


CLS
SCREEN 0
WIDTH 80

PRINT "12 mul rotation ="; Normal!; "FPS"
PRINT "9 mul rotation ="; Matrix!; "FPS"



END

REM $STATIC
SUB DrawModel (Model() AS Point3d, clr%) STATIC

'Draws the 3dmodel in color clr

FOR i = 0 TO UBOUND(Model)
    x% = INT(Model(i).scrx)             'get projected coords
    y% = INT(Model(i).scry)
    IF NOT Model(i).cull THEN           'if visible then plot
        PSET (x%, y%), clr%
    END IF
NEXT i

END SUB

SUB LoadCubeSolid (Model() AS Point3d, xmax, ymax, zMax, Scale!)
'Loads a cobe using the cartesian coordinate system
'Parameters:
'Model() = the 3d Model
'xmax = x distance
'ymax = y distance
'zmax =huh?
'Scale!=how big or small the size of the model is. :*)


xm = xmax \ 2           'Center our cube at origin(0,0,0)
ym = ymax \ 2
zm = zMax \ 2
REDIM Model((xmax * ymax * zMax) - 1) AS Point3d    'make it big enough
FOR x = -xm TO xm - 1                   'loop sequentiealy
    FOR y = -ym TO ym - 1
        FOR z = -zm TO zm - 1
            Model(i).x = x * Scale!     'scale it according to
            Model(i).y = y * Scale!     'the parameter
            Model(i).z = z * Scale!
            i = i + 1
        NEXT z
    NEXT y
NEXT x

END SUB

SUB LoadPlaneSolid (Model() AS Point3d, xmax, ymax, Scale!)

'Parameters:
'Model() = the 3d Model
'xmax = x distance
'ymax = y distance
'Scale!=how big or small the size of the model is. :*)

                 
REDIM Model((xmax * ymax))  AS Point3d

xm = xmax \ 2
ym = ymax \ 2
i = 0
FOR x = -xm TO xm - 1
    FOR y = -ym TO ym - 1
        Model(i).x = x * Scale!
        Model(i).y = y * Scale!
        Model(i).z = 0
        i = i + 1
    NEXT y
NEXT x

END SUB

SUB LoadSpace (Model() AS Point3d, radius, Numstars)
'Model() = the 3d Model
'radius the distance of each star from the origin
'Numstars = number of stars

'////Initialize the starting values of our stars
REDIM Model(Numstars) AS Point3d
FOR i = 0 TO UBOUND(Model)
    ax = RND * 360
    ay = RND * 360
    az = RND * 360
    Model(i).x = radius * SIN(ay * PI / 180)
    Model(i).y = radius * COS(ax * PI / 180)
    Model(i).z = radius * SIN(az * PI / 180)
NEXT i

END SUB

SUB RotateAndProject12 (Model() AS Point3d, AngleX, AngleY, AngleZ) STATIC

''Right handed system
''when camera components increase:
''x=goes left
''y=goes down
''z=goes into the screen

' so when increased:
'x =right
'y=up
'z=into you

'          y
'         |
'         |
'         |
'         0-- -- -- 
'        /        x
'      /
'    /  z
'  \/

'''rotation: counter-clockwise of each axis
''ie.  make yourself perpendicular to the axis
''wave your hand from the center of your body to the left.
''That's how it rotates. ;*)

'convert degrees to radians
ax! = AngleX * PI / 180
ay! = AngleY * PI / 180
az! = AngleZ * PI / 180


'Precalculate the SIN and COS of each angle
cx! = COS(ax!)
sx! = SIN(ax!)
cy! = COS(ay!)
sy! = SIN(ay!)
cz! = COS(az!)
sz! = SIN(az!)

FOR i = 0 TO UBOUND(Model)

        x! = Model(i).x
        y! = Model(i).y
        z! = Model(i).z

        NewY! = (y! * cx!) - (z! * sx!)         'X
        NewZ! = (z! * cx!) + (y! * sx!)
        y! = NewY!
        z! = NewZ!

        NewZ! = (z! * cy!) - (x! * sy!)         'Y
        NewX! = (x! * cy!) + (z! * sy!)
        x! = NewX!

        NewX! = (x! * cz!) - (y! * sz!)         'Z
        NewY! = (y! * cz!) + (x! * sz!)

        rx! = NewX! - camx%
        ry! = NewY! - camy%
        rz! = NewZ! - camz%

        Model(i).xr = rx!
        Model(i).yr = ry!
        Model(i).zr = rz!
        Model(i).cull = FALSE       'set it to visible


        'Project
        Distance% = (LENS - rz!)
        IF Distance% > 0 THEN
            Model(i).scrx = (LENS * rx! / Distance%) + XCENTER
            Model(i).scry = -(LENS * ry! / Distance%) + YCENTER
        ELSE
            Model(i).cull = TRUE        'not visible
        END IF
NEXT i

END SUB

SUB RotateAndProject9 (Model() AS Point3d, AngleX, AngleY, AngleZ) STATIC
''Right handed system
''when camera components increase:
''x=goes left
''y=goes down
''z=goes into the screen

' so when increased:
'x =right
'y=up
'z=into you

'          y
'         |
'         |
'         |
'         0-- -- -- 
'        /        x
'      /
'    /  z
'  \/

'''rotation: counter-clockwise of each axis
''ie.  make yourself perpendicular to the axis
''wave your hand from the center of your body to the left.
''That's how it rotates. ;*)


'convert degrees to radians
ax! = AngleX * PI / 180
ay! = AngleY * PI / 180
az! = AngleZ * PI / 180

'Precalculate the SIN and COS of each angle
cx! = COS(ax!)
sx! = SIN(ax!)
cy! = COS(ay!)
sy! = SIN(ay!)
cz! = COS(az!)
sz! = SIN(az!)

'''Heres the 3*3 matrix derived from our 12 mul rotation
'''

xx! = cy! * cz!
xy! = sx! * sy! * cz! - cx! * sz!
xz! = cx! * sy! * cz! + sx! * sz!

yx! = cy! * sz!
yy! = cx! * cz! + sx! * sy! * sz!
yz! = -sx! * cz! + cx! * sy! * sz!

zx! = -sy!
zy! = sx! * cy!
zz! = cx! * cy!

FOR i = 0 TO UBOUND(Model)

        x! = Model(i).x
        y! = Model(i).y
        z! = Model(i).z

        RotX! = (x! * xx! + y! * xy! + z! * xz!) - camx%
        RotY! = (x! * yx! + y! * yy! + z! * yz!) - camy%
        RotZ! = (x! * zx! + y! * zy! + z! * zz!) - camz%

        Model(i).xr = RotX!
        Model(i).yr = RotY!
        Model(i).zr = RotZ!
        Model(i).cull = FALSE

        'Project
        Distance% = (LENS - RotZ!)
        IF Distance% > 0 THEN
            Model(i).scrx = (LENS * RotX! / Distance%) + XCENTER
            Model(i).scry = -(LENS * RotY! / Distance%) + YCENTER
        ELSE
            Model(i).cull = TRUE
        END IF
NEXT i

END SUB

SUB SetVideoSeg (Segment) STATIC
'By Plasma 357 (Jon Petrosky)

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

