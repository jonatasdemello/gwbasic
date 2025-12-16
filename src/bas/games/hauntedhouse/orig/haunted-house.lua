-- Haunted House Adventure
-- Original BASIC version from the 1983 Usborne computer book
-- Write Your Own Adventure Programs for Your Microcomputer
-- by Jenny Tyler and Les Howarth (ISBN 0-86020-741-2)
-- This version adapted for the Lua programming language (5.1)
-- by Marc Lepage (May 2014)

-- helper function returns a new table filled with zeroes from 0 to n
function DIM(n)
    local t = {}
    for i=0 , n do
        t[i]=0
    end
    return t
end

----- INITIALIZATION -----

-- number of verbs, words, and gettable objects
V=25;W=36;G=18

-- which gettable objects the player is carrying
C = DIM(W)

-- location each gettable object is in
L = { 46,38,35,50,13,18,28,42,10,25,26,4,2,7,47,60,43,32 }

-- verbs (actions)
AS = {
    "HELP","CARRYING","GO","N","S","W","E","U","D","GET","TAKE","OPEN","EXAMINE","READ","SAY",
    "DIG","SWING","CLIMB","LIGHT","UNLIGHT","SPRAY","USE","UNLOCK","LEAVE","SCORE"
}

-- routes the player can take from one location to another
RS = { [0]=
    "SE","WE","WE","SWE","WE","WE","SWE","WS",
    "NS","SE","WE","NW","SE","W","NE","NSW",
    "NS","NS","SE","WE","NWUD","SE","WSUD","NS",
    "N","NS","NSE","WE","WE","NSW","NS","NS",
    "S","NSE","NSW","S","NSUD","N","N","NS",
    "NE","NW","NE","W","NSE","WE","W","NS",
    "SE","NSW","E","WE","NW","S","SW","NW",
    "NE","NWE","WE","WE","WE","NWE","NWE","W"
}

-- descriptions of the locations
DS = { [0]=
    "DARK CORNER","OVERGROWN GARDEN","BY LARGE WOODPILE","YARD BY RUBBISH",
    "WEEDPATCH","FOREST","THICK FOREST","BLASTED TREE",
    "CORNER OF HOUSE","ENTRANCE TO KITCHEN","KITCHEN & GRIMY COOKER","SCULLERY DOOR",
    "ROOM WITH INCHES OF DUST","REAR TURRET ROOM","CLEARING BY HOUSE","PATH",
    "SIDE OF HOUSE","BACK OF HALLWAY","DARK ALCOVE","SMALL DARK ROOM",
    "BOTTOM OF SPIRAL STAIRCASE","WIDE PASSAGE","SLIPPERY STEPS","CLIFFTOP",
    "NEAR CRUMBLING WALL","GLOOMY PASSAGE","POOL OF LIGHT","IMPRESSIVE VAULTED HALLWAY",
    "HALL BY THICK WOODEN DOOR","TROPHY ROOM","CELLAR WITH BARRED WINDOW","CLIFF PATH",
    "CUPBOARD WITH HANGING COAT","FRONT HALL","SITTING ROOM","SECRET ROOM",
    "STEEP MARBLE STAIRS","DINING ROOM","DEEP CELLAR WITIH COFFIN"," CLIFF PATH",
    "CLOSET","FRONT LOBBY","LIBRARY OF EVIL BOOKS","STUDY WITH DESK & HOLE IN WALL",
    "WEIRD COBWEBBY ROOM","VERY COLD CHAMBER","SPOOKY ROOM","CLIFF PATH BY MARSH",
    "RUBBLE-STREWN VERANDAH","FRONT PORCH","FRONT TOWER","SLOPING CORRIDOR",
    "UPPER GALLERY","MARSH BY WALL","MARSH","SOGGY PATH",
    "BY TWISTED RAILING","PATH THROUGH IRON GATE","BY RAILINGS","BENEATH FRONT TOWER",
    "DEBRIS FROM CRUMBLING FACADE","LARGE FALLEN BRICKWORK","ROTTING STONE ARCH","CRUMBLING CLIFFTOP"
}

-- objects and other words
OS = {
    -- gettable objects
    "PAINTING","RING","MAGIC SPELLS","GOBLET","SCROLL","COINS","STATUE","CANDLESTICK",
    "MATCHES","VACUUM","BATTERIES","SHOVEL","AXE","ROPE","BOAT","AEROSOL","CANDLE","KEY",
    -- other words
    "NORTH","SOUTH","WEST","EAST","UP","DOWN",
    "DOOR","BATS","GHOSTS","DRAWER","DESK","COAT","RUBBISH",
    "COFFIN","BOOKS","XZANFAR","WALL","SPELLS"
}

-- flags to record changes that happen during the game
F = DIM(W)
F[18]=1;F[17]=1;F[2]=1;F[26]=1;F[28]=1;F[23]=1

-- LL is the light limit counter
-- RM is the location the player is in
-- M contains messages for the player
LL=60;RM=57 MS="OK"

----- VERB SUBROUTINES -----

function help()
    print "WORDS I KNOW:"
    for I=1 , V do
        io.write(AS[I]..",")
    end
    MS="";print ""
end

function carrying()
    print "YOU ARE CARRYING:"
    for I=1 , G do
        if C[I]==1 then io.write(OS[I]..",") end
    end
    MS="";print ""
end

function go()
    D=0

    -- determine one-word direction
    if OB==0 then D=VB-3 end

    -- determine two-word direction
    if OB==19 then D=1 end
    if OB==20 then D=2 end
    if OB==21 then D=3 end
    if OB==22 then D=4 end
    if OB==23 then D=5 end
    if OB==24 then D=6 end

    -- convert up/down to north/south/west/east
    if RM==20 and D==5 then D=1 end
    if RM==20 and D==6 then D=3 end
    if RM==22 and D==6 then D=2 end
    if RM==22 and D==5 then D=3 end
    if RM==36 and D==6 then D=1 end
    if RM==36 and D==5 then D=2 end

    -- movement override conditions
    if F[14]==1 then MS="CRASH! YOU FELL OUT OF THE TREE!";F[14]=0;return end
    if F[27]==1 and RM==52 then MS="GHOSTS WILL NOT LET YOU MOVE";return end
    if RM==45 and C[1]==1 and F[34]==0 then MS="A MAGICAL BARRIER TO THE WEST";return end
    if (RM==26 and F[0]==0) and (D==1 or D==4) then MS="YOU NEED A LIGHT";return end
    if RM==54 and C[15]~=1 then MS="YOU'RE STUCK!";return end
    if C[15]==1 and not (RM==53 or RM==54 or RM==55 or RM==47) then MS="YOU CAN'T CARRY A BOAT!";return end
    if (RM>26 and RM<30) and F[0]==0 then MS="TOO DARK TO MOVE";return end

    -- check for walls and move if possible
    F[35]=0;RL=string.len(RS[RM])
    for I=1 , RL do
        US=string.sub(RS[RM],I,I)
        if (US=="N" and D==1 and F[35]==0) then RM=RM-8;F[35]=1 end
        if (US=="S" and D==2 and F[35]==0) then RM=RM+8;F[35]=1 end
        if (US=="W" and D==3 and F[35]==0) then RM=RM-1;F[35]=1 end
        if (US=="E" and D==4 and F[35]==0) then RM=RM+1;F[35]=1 end
    end

    MS="OK"
    if F[35]==0 then MS="CAN'T GO THAT WAY!" end
    if D<1 then MS="GO WHERE?" end
    if RM==41 and F[23]==1 then RS[49]="SW";MS="THE DOOR SLAMS SHUT!";F[23]=0 end
end

n=go s=go w=go e=go u=go d=go

function get()
    if OB>G then MS="I CAN'T GET "..WS;return end
    if L[OB]~=RM then MS="IT ISN'T HERE" end
    if F[OB]~=0 then MS="WHAT "..WS.."?" end
    if C[OB]==1 then MS="YOU ALREADY HAVE IT" end
    if OB>0 and L[OB]==RM and F[OB]==0 then C[OB]=1;L[OB]=65;MS="YOU HAVE THE "..WS end
end

take=get

function open()
    if RM==43 and (OB==28 or OB==29) then F[17]=0;MS="DRAWER OPEN" end
    if RM==28 and OB==25 then MS="IT'S LOCKED" end
    if RM==38 and OB==32 then MS="THAT'S CREEPY!";F[2]=0 end
end

function examine()
    if OB==30 then F[18]=0;MS="SOMETHING HERE!" end
    if OB==31 then MS="THAT'S DISGUSTING!" end
    if (OB==28 or OB==29) then MS="THERE IS A DRAWER" end
    if OB==33 or OB==5 then read() end
    if RM==43 and OB==35 then MS="THERE IS SOMETHING BEYOND..." end
    if OB==32 then open() end
end

function read()
    if RM==42 and OB==33 then MS="THEY ARE DEMONIC WORKS" end
    if (OB==3 or OB==36) and C[3]==1 and F[34]==0 then MS="USE THIS WORD WITH CARE 'XZANFAR'" end
    if C[5]==1 and OB==5 then MS="THE SCRIPT IS IN AN ALIEN TONGUE" end
end

function say()
    MS="OK '"..WS.."'"
    if C[3]==1 and OB==34 then MS="*MAGIC OCCURS*";if RM~=45 then RM=math.random(0, 63) end end
    if C[3]==1 and OB==34 and RM==45 then F[34]=1 end
end

function dig()
    if C[12]==1 then MS="YOU MADE A HOLE" end
    if C[12]==1 and RM==30 then MS="DUG THE BARS OUT";DS[RM]="HOLE IN WALL";RS[RM]="NSE" end
end

function swing()
    if C[14]~=1 and RM==7 then MS="THIS IS NO TIME TO PLAY GAMES" end
    if OB==14 and C[14]==1 then MS="YOU SWUNG IT" end
    if OB==13 and C[13]==1 then MS="WHOOSH" end
    if OB==13 and C[13]==1 and RM==43 then RS[RM]="WN";DS[RM]="STUDY WITH SECRET ROOM";MS="YOU BROKE THE THIN WALL" end
end

function climb()
    if OB==14 and C[14]==1 then MS="IT ISN'T ATTACHED TO ANYTHING!" end
    if OB==14 and C[14]~=1 and RM==7 and F[14]==0 then MS="YOU SEE THICK FOREST AND CLIFF SOUTH";F[14]=1;return end
    if OB==14 and C[14]~=1 and RM==7 and F[14]==1 then MS="GOING DOWN!";F[14]=0 end
end

function light()
    if OB==17 and C[17]==1 and C[8]==0 then MS="IT WILL BURN YOUR HANDS" end
    if OB==17 and C[17]==1 and C[9]==0 then MS="NOTHING TO LIGHT IT WITH" end
    if OB==17 and C[17]==1 and C[9]==1 and C[8]==1 then MS="IT CASTS A FLICKERING LIGHT";F[0]=1 end
end

function unlight()
    if F[0]==1 then F[0]=0;MS="EXTINGUISHED" end
end

function spray()
    if OB==26 and C[16]==1 then MS="HISSSS" end
    if OB==26 and C[16]==1 and F[26]==1 then F[26]=0;MS="PFFT! GOT THEM" end
end

function use()
    if OB==10 and C[10]==1 and C[11]==1 then MS="SWITCHED ON";F[24]=1 end
    if F[27]==1 and F[24]==1 then MS="WHIZZ- VACUUMED THE GHOSTS UP!";F[27]=0 end
end

function unlock()
    if RM==43 and (OB==27 or OB==28) then open() end
    if RM==28 and OB==25 and F[25]==0 and C[18]==1 then F[25]=1;RS[RM]="SEW";DS[RM]="HUGE OPEN DOOR";MS="THE KEY TURNS!" end
end

function leave()
    if C[OB]==1 then C[OB]=0;L[OB]=RM;MS="DONE" end
end

function score()
    S=0

    for I=1 , G do
        if C[I]==1 then S=S+1 end
    end

    if S==17 and C[15]~=1 and RM~=57 then print "YOU HAVE EVERYTHING";print "RETURN TO THE GATE FOR FINAL SCORE" end
    if S==17 and RM==57 then print "DOUBLE SCORE FOR REACHING HERE!";S=S*2 end
    print("YOUR SCORE="..S)
    if S>18 then print "WELL DONE! YOU FINISHED THE GAME";os.exit() end
end

----- MAIN LOOP -----

while true do repeat

    -- description
    print "" print ""
    print "HAUNTED HOUSE"
    print "--------------"

    print "YOUR LOCATION"
    print(DS[RM])

    io.write("EXITS:")
    for I=1 , string.len(RS[RM]) do
        io.write(string.sub(RS[RM],I,I)..",")
    end
    print ""

    for I=1 , G do
        if L[I]==RM and F[I]==0 then print("YOU CAN SEE "..OS[I].." HERE") end
    end

    -- feedback
    print "============================"
    print(MS)
    MS="WHAT"

    -- input
    io.write("WHAT WILL YOU DO NOW ")
    QS=string.upper(io.read("*l"))

    -- input analysis
    VS="";WS="";VB=0;OB=0
    for I=1 , string.len(QS) do
        if string.sub(QS,I,I)==" " and VS=="" then VS=string.sub(QS,1,I-1) end
        if string.sub(QS,I+1,I+1)~=" " and VS~="" then WS=string.sub(QS,I+1);break end
    end
    if WS=="" then VS=QS end
    for I=1 , V do
        if VS==AS[I] then VB=I end
    end
    for I=1 , W do
        if WS==OS[I] then OB=I end
    end

    -- error messages and override conditions
    if WS~="" and OB==0 then MS="THAT'S SILLY" end
    if VB==0 then VB=V+1 end
    if WS=="" then MS="I NEED TWO WORDS" end
    if VB>V and OB>0 then MS="YOU CAN'T '"..QS.."'" end
    if VB>V and OB==0 then MS="YOU DON'T MAKE SENSE" end
    if VB<V and OB>0 and C[OB]==0 then MS="YOU DON'T HAVE '"..WS.."'" end
    if F[26]==1 and RM==13 and math.random(3)~=3 and VB~=21 then MS="BATS ATTACKING!";break end
    if RM==44 and math.random(2)==1 and F[24]==1 then F[27]=1 end
    if F[0]==1 then LL=LL-1 end
    if LL<1 then F[0]=0 end

    -- branch to subroutines
    if _G[string.lower(VS)] then _G[string.lower(VS)]() end

    if LL==10 then MS="YOUR CANDLE IS WANING!" end
    if LL==1 then MS="YOUR CANDLE IS OUT!" end

until true end
