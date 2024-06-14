// INSERTAR ELEMENTO EN UN VECTOR ORDENADO

procedure InsertarElemOrd(var v:vector; var dimL:integer; elem:TipoElem; var exito:boolean);
  function DeterminarPosicion(x:integer; v:Vector; dimL:integer):integer;
  var
       pos : integer;
  begin
       pos:=1;
       while (pos <= dimL) and (x > v[pos]) do
          pos := pos + 1;
       DeterminarPosicion := pos;
  end;
  procedure Insertar(var v:vector; var dimL:integer; pos: integer; elem:integer);
    var
         j: indice;
    begin

        for j:= dimL downto pos do
          v [j+1] := v [j] ;

        v [pos] := elem;
        dimL := dimL+1;
    end;
 var
   pos: integer;
begin
   exito := false;
   if (dimL < dimF) then begin
      pos:= DeterminarPosicion (elem, v, dimL);
      Insertar (v, dimL, pos, elem);
      exito := true;
   end;
end
