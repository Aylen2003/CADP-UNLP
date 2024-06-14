//BUSQUEDA DICOTOMICA O BINARIA (PARA VECTORES ORDENADOS)

procedure BusquedaBin( var v:Vector; var j:integer; dimL:integer, x:TipoElem);
var
     pri, ult, medio: integer;
begin
    j := 0;
    pri := 1;
    ult := dimL;
    medio := (pri + ult) div 2;
    while (pri <= ult) and (x <> v [medio]) do begin
            if (x < v [ medio ]) then
               ult:= medio - 1
            else
               pri:= medio+1 ;
            medio := (pri + ult) div 2;
     end;
     if (pri <= ult) then
        j := medio
     else
        j := 0;
   end ;
