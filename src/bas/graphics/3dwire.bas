'''Code supplement for the rotation article
'''This is supposed to show you how to use wireframes instead of points
'''The filled cube is far from perfect as it used PAINT so I had to
'''check a lower number for the z component of our projected coord.
'''Pls be sure to check the code out as I will be explaing it in detail
'''in the next issue of QBCM. :*)

'''SetvideoSeg by Plasma357
'''Rel.betterwebber.com


DECLARE SUB DrawModelHIDEFace (Model() AS ANY, Tri() AS ANY)
DECLARE SUB DrawModelFill (Model() AS ANY, Tri() AS ANY)
DECLARE SUB DrawModel (Model() AS ANY, Tri() AS ANY)
DECLARE SUB SetVideoSeg (Segment%)
DECLARE SUB RotateAndProject (Model() AS ANY, AngleX%, AngleY%, AngleZ%)
DECLARE SUB LoadCube (Model() AS ANY, Tri() AS ANY, Scale!)

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
END TYPE

TYPE PolyType
        p1      AS INTEGER                  'vertex 1
        p2      AS INTEGER
        p3      AS INTEGER
        clr     AS INTEGER                  'color
        idx     AS INTEGER                  'index for later use
END TYPE


CONST FALSE = 0, TRUE = NOT FALSE

CONST LENS = 256                            'Z
CONST XCENTER = 160                         '??
CONST YCENTER = 100                         '??

CONST PI = 3.14151693#

REDIM SHARED Vpage(32009)  AS INTEGER           'our Video buffer

'Polyhedra stuff
REDIM SHARED Model(1) AS Point3d               '3d  Coords
REDIM SHARED CubePoly(1) AS PolyType           '12 faces/Polys
DIM SHARED Thetax, Thetay, Thetaz              'Angle of rotation
DIM SHARED camx%, camy%, camz%                 'camera


CLS
SCREEN 0
WIDTH 80


'Initialize 3d model

LoadCube Model(), CubePoly(), 1

RendMode = 0

LOCATE 1, 1
PRINT "Choose Render Type:"
PRINT
PRINT "1. WireFrame"
PRINT "2. WireFrame + BackFace Culling"
PRINT "3. Filled"

K$ = INPUT$(1)
SELECT CASE ASC(K$)
        CASE 49
            RendMode = 0        'Wireframe
        CASE 50
            RendMode = 1        'Back face culled
        CASE 51
            RendMode = 2        'Filled
        CASE ELSE
            RendMode = 0
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
Finished = 0

DO

     K$ = INKEY$
     SELECT CASE UCASE$(K$)             'Camera control
        CASE "A"
            camz% = camz% + 1
        CASE "Z"
            camz% = camz% - 1
        CASE "S"
            camy% = camy% + 1
        CASE "X"
            camy% = camy% - 1
        CASE "D"
            camx% = camx% + 1
        CASE "C"
            camx% = camx% - 1
    END SELECT
            

     Thetax = (Thetax + 1) MOD 360          'rotate our angles
     Thetay = (Thetay + 1) MOD 360
     Thetaz = (Thetaz + 1) MOD 360
     RotateAndProject Model(), Thetax, Thetay, Thetaz  '12 muls
     SetVideoSeg Layer              'set draw to Buffer
     LINE (0, 0)-(319, 199), 0, BF  'CLS
     SELECT CASE RendMode
        CASE 0
            DrawModel Model(), CubePoly()      'WireFrame
        CASE 1
            DrawModelHIDEFace Model(), CubePoly()      'Wire with BF culling
        CASE 2
            DrawModelFill Model(), CubePoly()      'Filled
        CASE ELSE
     END SELECT
     SetVideoSeg &HA000             'Set Draw to buffer
     WAIT &H3DA, 8                  'Vsynch
     PUT (0, 0), Vpage(6), PSET     'Blit

LOOP UNTIL K$ = CHR$(27)


CLS
SCREEN 0
WIDTH 80

END

'vertices of Cube
CUBEDATA:

DATA  50, 50, 50            : 'x,y,z
DATA -50, 50, 50
DATA -50,-50, 50
DATA  50,-50, 50
DATA  50, 50,-50
DATA -50, 50,-50
DATA -50,-50,-50
DATA  50,-50,-50

'Faces/Poly in 4 point form
CUBECONNECT:
DATA 0, 1, 2, 3
DATA 1, 5, 6, 2
DATA 5, 4, 7, 6
DATA 4, 0, 3, 7
DATA 4, 5, 1, 0
DATA 3, 2, 6, 7

REM $STATIC
SUB DrawModel (Model() AS Point3d, Tri() AS PolyType) STATIC

FOR I = 0 TO UBOUND(Tri)
    j = Tri(I).idx
    x1 = Model(Tri(j).p1).scrx       'Get triangles from "projected"
    x2 = Model(Tri(j).p2).scrx       'X and Y coords since Znormal
    X3 = Model(Tri(j).p3).scrx       'Does not require a Z coord
    y1 = Model(Tri(j).p1).scry       'V1= Point1 connected to V2 then
    y2 = Model(Tri(j).p2).scry       'V2 to V3 and so on...
    Y3 = Model(Tri(j).p3).scry

    LINE (x1, y1)-(x2, y2), Tri(j).clr
    LINE -(X3, Y3), Tri(j).clr
    LINE -(x1, y1), Tri(j).clr
NEXT I



END SUB

SUB DrawModelFill (Model() AS Point3d, Tri() AS PolyType) STATIC

''Draws our cube hiding the faces
FOR I = 0 TO UBOUND(Tri)
    j = Tri(I).idx
    x1 = Model(Tri(j).p1).scrx       'Get triangles from "projected"
    x2 = Model(Tri(j).p2).scrx       'X and Y coords since Znormal
    X3 = Model(Tri(j).p3).scrx       'Does not require a Z coord
    y1 = Model(Tri(j).p1).scry       'V1= Point1 connected to V2 then
    y2 = Model(Tri(j).p2).scry       'V2 to V3 and so on...
    Y3 = Model(Tri(j).p3).scry
    Znormal = (x2 - x1) * (y1 - Y3) - (y2 - y1) * (x1 - X3)
    IF (Znormal < -256) THEN              '<-256 so vector facing us
                                        'cuz our z component is not
                                        'normalized and paint would sometimes
                                        'fail ;*)
        LINE (x1, y1)-(x2, y2), Tri(j).clr
        LINE -(X3, Y3), Tri(j).clr
        LINE -(x1, y1), Tri(j).clr
        xcen = (x1 + x2 + X3) \ 3
        ycen = (y1 + y2 + Y3) \ 3
        PAINT (xcen, ycen), Tri(j).clr
    END IF
NEXT I



END SUB

SUB DrawModelHIDEFace (Model() AS Point3d, Tri() AS PolyType) STATIC
''Draws our cube hiding the faces
FOR I = 0 TO UBOUND(Tri)
    j = Tri(I).idx
    x1 = Model(Tri(j).p1).scrx       'Get triangles from "projected"
    x2 = Model(Tri(j).p2).scrx       'X and Y coords since Znormal
    X3 = Model(Tri(j).p3).scrx       'Does not require a Z coord
    y1 = Model(Tri(j).p1).scry       'V1= Point1 connected to V2 then
    y2 = Model(Tri(j).p2).scry       'V2 to V3 and so on...
    Y3 = Model(Tri(j).p3).scry
    Znormal = (x2 - x1) * (y1 - Y3) - (y2 - y1) * (x1 - X3)
    IF (Znormal < 0) THEN               '<0 so vector facing us
        LINE (x1, y1)-(x2, y2), Tri(j).clr
        LINE -(X3, Y3), Tri(j).clr
        LINE -(x1, y1), Tri(j).clr
    END IF
NEXT I




END SUB

SUB LoadCube (Model() AS Point3d, Tri() AS PolyType, Scale!)
REDIM Model(7) AS Point3d   '8 vertices
RESTORE CUBEDATA
FOR I = 0 TO 7
    READ x, y, z
    Model(I).x = x * Scale!     'scale it according to
    Model(I).y = y * Scale!     'the parameter
    Model(I).z = z * Scale!
NEXT I

REDIM Tri(11) AS PolyType
j = 0
FOR I = 0 TO 5
    READ p1, p2, p3, p4
    Tri(j).p1 = p4
    Tri(j).p2 = p2
    Tri(j).p3 = p1
    Tri(j).idx = j
    Tri(j).clr = 20 + INT(RND * 128)
    j = j + 1
    Tri(j).p1 = p4
    Tri(j).p2 = p3
    Tri(j).p3 = p2
    Tri(j).idx = j
    Tri(j).clr = 20 + INT(RND * 128)
    j = j + 1
NEXT I

END SUB

SUB RotateAndProject (Model() AS Point3d, AngleX, AngleY, AngleZ) STATIC
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
''ei.  make yourself perpenicular to the axis
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

'''After2 hours of work, I was able to weed out the constants from
'''Rotate and project N to reduce my muls to 9 instead of 12. woot!!!!

xx! = cy! * cz!
xy! = sx! * sy! * cz! - cx! * sz!
xz! = cx! * sy! * cz! + sx! * sz!

yx! = cy! * sz!
yy! = cx! * cz! + sx! * sy! * sz!
yz! = -sx! * cz! + cx! * sy! * sz!

zx! = -sy!
zy! = sx! * cy!
zz! = cx! * cy!

FOR I = 0 TO UBOUND(Model)

        x! = Model(I).x
        y! = Model(I).y
        z! = Model(I).z

        RotX! = (x! * xx! + y! * xy! + z! * xz!) - camx%
        RotY! = (x! * yx! + y! * yy! + z! * yz!) - camy%
        RotZ! = (x! * zx! + y! * zy! + z! * zz!) - camz%

        Model(I).xr = RotX!
        Model(I).yr = RotY!
        Model(I).zr = RotZ!

        'Project
        Distance% = (LENS - RotZ!)
        IF Distance% > 0 THEN
            Model(I).scrx = (LENS * RotX! / Distance%) + XCENTER
            Model(I).scry = -(LENS * RotY! / Distance%) + YCENTER
        ELSE
        END IF
NEXT I

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

