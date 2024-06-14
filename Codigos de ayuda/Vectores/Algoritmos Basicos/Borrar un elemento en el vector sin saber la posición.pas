//BORRA UN ELEMENTO SIN SABER LA POSICION

procedure BorrarElem (var v: vector;  var dimL:indice; elem:integer; var exito: boolean);

    function BuscarPosElem (x:integer; v:vector; dimL:integer):integer;
    var
      pos: integer;
      exito: boolean;
    begin
         pos:=1;
         exito:= false;

         while (pos <= dimL) and (not exito) do
              if (x = v[pos]) then
                 exito := true
              else
                 pos: = pos + 1;

         if (exito = false) then
            pos:=0;

         BuscarPosElem := pos;
    end;

   procedure BorrarPosModif (var v:vector; var dimL:integer; pos:integer);
   var
     i: integer; 
   begin
      for i:=pos+1 to dimL  do
         v[i-1] := v [i];
      dimL := dimL-1;
   end;

var
  pos: indice;
begin
  exito:= False;
  pos:= BuscarPosElem (elem, v, dimL);
  if pos <> 0 then begin
    BorrarPosModif(v,dimL,pos);
    exito:= true;
  end;
end;
