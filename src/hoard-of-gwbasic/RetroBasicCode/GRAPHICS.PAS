Program            Graphics;
{ fait par drche yoann pour IBM & Copactible }





const
         co=2;
var
    x,y,x1,y1 :integer;

Procedure TRACE;

Begin
       Draw(x,y,x1,y1,co);
End;


Procedure Calcule;

Begin
     x := x+1;
     x1:= x1-1 ;
     y:= y-1 ;
     y1:= y1+1;
     Trace;
End;
      { debut du programme }

Begin
Begin
GraphColorMode;
Palette(2);
       Calcule;
       trace;

       trace;
       calcule;

end


