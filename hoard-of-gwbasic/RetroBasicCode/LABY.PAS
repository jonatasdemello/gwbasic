{cette version de LABY contien :                                              }
{         -Creation d'un labyrinthe 38*11              27/11/1987}
{         -recherche de la solution                    27/01/1988}
{         -Optimisation de l'algorythme:               14/02/1988}
{          g‚n‚ration du laby => 9"50 sur XT ,2"30 sur AT        }

CONST  xmax=38;
       YMAX=11;
       AD=$B800;

TYPE Pointeur_vers_piece = ^piece;
     Piece = RECORD
            Precedent : Pointeur_vers_piece;
                x,y,r : byte;
            END;

VAR debut_de_liste,ptr1,ptr2:Pointeur_vers_piece;
        r,d,i,x,xp,y,yp,moy:byte;
                      dx,dy:integer;
                        rep:char;

{-----------------------------------------------------------------------------}
{           Procedures pour g‚n‚rer le labyrinthe                             }
{-----------------------------------------------------------------------------}

PROCEDURE Direction(dr:byte;var sx,sy:integer);
          Begin
          sx:=((2*dr+1) div 3)-1;
          sy:=((2*dr+1) mod 3)-1;
          End;

FUNCTION Trace(mr,mx,my:byte):boolean;   { Y a-t-il une trace de l'autre cot‚ }
         var vx,vy:integer;              { du mur dans la direction mr ?      }
        Begin                                           { Coord laby }
        Direction(mr,vx,vy);
        if Mem[ad:320*(my+vy)+4*(mx+vx)]=32 then Trace:=false else Trace:=true;
        End;

PROCEDURE Enlever_mur(our,ox,oy:byte);      { EnlŠve le mur de la piece ox,oy }
          Var odx,ody:integer;              { dans la direction our           }
          Begin                                                { Coord laby }
          Direction(our,odx,ody);
          Mem[ad:160*(2*oy+ody)+2*(2*ox+odx)]:=32;
          End;

FUNCTION Distance(drr,dix,diy:byte):byte;  { Donne la distance en nombre      }
         Begin                             { de pieces entre la piece dix,diy }
         Case drr of                       { et le bord du labyrinthe         }
           0: Distance:=dix-1;             { dans la direction drr            }
           1: Distance:=diy-1;                                 { Coord  laby }
           2: Distance:=ymax-diy;
           3: Distance:=xmax-dix;
           end;
         End;

FUNCTION Possible_avancer(pr,a,b:byte):boolean;    { Est-il posible d'avancer }
         Var vx,vy:integer;                        { dans la direction pr     }
         Begin                                     { sans cr‚er de boucle     }
         Direction(pr,vx,vy);                                    { Coord laby }

         if (Trace(pr,a,b)) and (Mem[ad:160*(b*2+vy)+2*(a*2+vx)]<>32)
         then Possible_avancer:=false
         else Possible_avancer:=true;
         End;

PROCEDURE Remplissage;                        { Remplis les coins suivant     }
          Var d,i,exp2,n,x,y,rx,ry:byte;      { la position des murs attenant }
                             vx,vy:integer;
          Begin
          for x:=0 to xmax do begin
              for y:=0 to ymax do begin
              rx:=2*x+1;
              ry:=2*y+1;
              n:=0;exp2:=1;
              for i:=0 to 3 do begin
                  Direction(i,vx,vy);
               if Mem[ad:160*(ry+vy)+2*(rx+vx)]<>32 then n:=n+exp2;
                  exp2:=exp2*2
                  end;
              Case n of
                    0: d:= 32;    1: d:= 181;   2: d:= 208;   3: d:= 188;
                    4: d:= 210;   5: d:= 187;   6: d:= 186;   7: d:= 185;
                    8: d:= 198;   9: d:= 205;  10: d:= 200;  11: d:= 202;
                   12: d:= 201;  13: d:= 203;  14: d:= 204;  15: d:= 206;
                    end;
          Mem[ad:160*ry+2*rx]:=d;
              end;
           end;
          End;
{-----------------------------------------------------------------------------}
{          Procedure pour rechercher la solution                              }
{-----------------------------------------------------------------------------}

FUNCTION Sens_interdit(r,x,y:byte):boolean;       { Permet de savoir s'il est }
         Var ax,ay:integer;                       { possible d'avencer dans   }
         Begin                                    { la direction r            }
         Direction(r,ax,ay);
         if ( Mem[ad:160*(2*y+ay)+2*(2*x+ax)]<>32)
         or ( Mem[ad:320*(y+ay)+4*(x+ax)]<>32)
         then Sens_interdit:=true
         else Sens_interdit:=false;
         End;

{-----------------------------------------------------------------------------}
{                   G‚n‚ration du Labyrinthe                                  }
{-----------------------------------------------------------------------------}

BEGIN

 Clrscr;{------------ Pr‚paration de l'‚cran----------------------------------}

 for y:=0 to ymax do for x:=1 to xmax do Mem[ad:320*y+4*x+160]:=205; { dessin }
 for y:=1 to ymax do for x:=0 to xmax do Mem[ad:320*y+4*x+2]:=186;   {des murs}

 Remplissage;                                                {Dessin des coins}
 Mem[ad:324]:=79;                                                      {entr‚e}
 Mem[ad:320*ymax+4*xmax+2]:=32;                                        {Sortie}
 for dx:=0 to 1999 do Mem[ad:2*dx+1]:=7;                         {Encre normal}

 Randomize;
 Moy:=(xmax+ymax) *2;
{-----------------------Fabrication du Labyrinthe-----------------------------}

 For yp:=1 to ymax do begin                    { Balayage de toute les piŠces }
     for xp:=1 to xmax do begin
                                        (** Recherche du d‚but d'un couloir **)
 if Mem[ad:320*yp+4*xp]=32 then

    BEGIN
    r:=random(4);                                           { Choix direction }
    while (not Trace(r,xp,yp)) or (Distance(r,xp,yp)=0)
       do r:=(r+1) mod 4;

    Enlever_mur(r,xp,yp);                    { Ouverture sur un autre couloir }
    x:=xp; y:=yp;
                                                  (** G‚neration du couloir **)
    For i:=1 to moy do begin
        r:=random(4);                                       { Choix direction }
        while Distance(r,x,y)=0 do r:=(r+1) mod 4;          { ‚viter le bord  }

        Direction(r,dx,dy);
        D:=random(Distance(r,x,y)) mod 3 +1;     { Choix longueur des petites }
                                                                   { avanc‚es }
        while Possible_avancer(r,x,y) and (D>0) do
              begin                                 { On avance en d‚truisant }
              Enlever_mur(r,x,y);                   { des murs et en laissant }
              Mem[ad:160*2*y+2*2*x]:=176;           { des traces derriˆre soi }
              x:=x+dx;
              y:=y+dy;
              Mem[ad:160*2*y+2*2*x]:=219;
              D:=D-1;
              end;
    end;
    Mem[ad:160*2*y+2*2*x]:=254;                        { On quitte ce couloir }
    END;                                    { Fin de la g‚n‚ration du couloir }
         End;                                     { Fin couloir, Fin balayage }
  End;

{---------------------------Finition------------------------------------------}

 Remplissage;                                               { Dessin de coins }
                                                          { Efface les traces }
 for y:=1 to ymax do for x:=1 to xmax do Mem[ad:320*y+4*x]:=32;
 Mem[ad:324]:=79;

gotoxy(5,25);write('Pressez une touche ...');read(kbd,rep);gotoxy(1,25);clreol;
{-----------------------------------------------------------------------------}
{                         Recherche de la solution                            }
{-----------------------------------------------------------------------------}

 NEW ( Debut_de_liste );                      { Cr‚ation de la premi‚re piŠce }

 With Debut_de_liste^ do begin
                         Precedent:=NIL;
                                 x:=1;
                                 y:=1;
                                 r:=0;
                         end;

  Ptr1:=debut_de_liste;
  x:=1; y:=1; r:=0;

  REPEAT {-------------------D‚placement--------------------------------------}

  While (Sens_interdit(r,x,y)) and (r<4) do r:=r+1;  { Cherche r pour avancer }
  IF r=4
  THEN begin
       Ptr2:=Ptr1^.precedent;
       r:=Ptr2^.r;
       x:=Ptr2^.x;
       y:=Ptr2^.y;
       Direction(r,dx,dy);
       Mem[ad:160*(2*y+dy)+2*(2*x+dx)]:=32;
       Mem[ad:320*(y+dy)+4*(x+dx)]:=32;
       DISPOSE(Ptr1);
       Ptr1:=Ptr2;
       r:=r+1;
       end
  ELSE begin
       NEW(ptr2);
       Ptr2^.precedent:=Ptr1;
       Ptr1^.r:=r;
       Direction(r,dx,dy);
       if (r=0) or (r=3) then Mem[ad:160*(2*y+dy)+2*(2*x+dx)]:=196
                         else Mem[ad:160*(2*y+dy)+2*(2*x+dx)]:=179;
       x:=x+dx;
       y:=y+dy;
       Mem[ad:320*y+4*x]:=219;
       Ptr2^.x:=x;
       ptr2^.y:=y;
       ptr2^.r:=0;
       r:=0;
       ptr1:=ptr2;
       end;
  UNTIL (x=xmax) and (y=ymax);

{----------------------------- Fin du programme ------------------------------}
 sound(1500);delay(50);Nosound;gotoxy(1,24);
End.
