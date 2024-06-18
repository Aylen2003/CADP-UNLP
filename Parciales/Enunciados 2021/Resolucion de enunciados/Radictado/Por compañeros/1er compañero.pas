program teatro;
type
  obras = 1..420;
  str = string[20];
  ticket = record
     dni: integer;
     asiento: integer;
     sala: str;
     obra: obras;
     valor: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: ticket;
    sig: lista;
  end;
  obra = record
    cod:obras;
    titulo: str;
    duracion: integer;
    director: str;
  end;
  vector = array[obras] of obra
  obra_retornar = record
     titulo: str;
     duracion: integer;
     monto_total: real;
     cada_ticket: listaT;
end;
inf_T = record
  asiento: integer;
  sala: str;
  valor: real;
end;
listaT = ^nodoT;
nodoT = record
  dato: inf_t;
  sig: listaT;
end;

procedure leerO(var o: obra);
begin
  readln(o.cod); readln(o.titulo); readln(o.duracion); readln(o.director);
end;

procedure leerV (var v:vector);
var
 i: obras; b: obras;
begin
  for i:= 1 to 420 do begin
     leerO(b);
     v[b.cod]:= b;
  end;
end;

procedure insertarOrdenado(i:inf_T; var l:lista);
var
 ant,act,nue: lista;
begin
 new(nue);
 nue^.data:= i;
 act:= l;
 ant:= l;
 while(l <> nil) and (i.valor < l^.dato.valor) do begin
    ant:= act;
    act:= act^.sig;
 end;
 if (act = l) then
    l:= nue
else
   ant^.sig:= nue;
 nue^.sig:= act;
end;

procedure retornar (v:vector; l:lista; cod:integer;var o: obra_retornar)
var
  lt: listaT;
  i: inf_T;
begin
  lt:= nil;
  if (cod > 420) or (cod < 1)then 
     o.titulo:= 'No existe'
  else begin
     o.titulo:= v[cod].titulo;
     o.duracion := v[cod].duración;
     o.monto_Total:= 0;
     while(l^.dato.cpd <= cod) do begin // esto asumiendo que la lista esta ordenada de menor a mayor
        if (l^.dato.cod = cod) then begin
           o.monto_Total:= o.monto_Total + l^.dato.valor;
           transformar(l^.dato,i);
           insertarOrdenado(i,lt);
        end;
        l:= l^.sig;
     end;
     o.cada_ticket:= lt;
  end;
end;

procedure transformar(t:ticket; var i: inf_t);
begin
  i.asiento:= t.asiento; i.sala:= t.sala; i.valor:= t.valor;
end;

var
  v: vector; l:lista; o:obra_retornar; cod: integer;
begin
 l:= nil;
 leerL(l); // Se dispone
 leerV(v);
 writeln('Ingrese el codigo:');
 realnd(cod);
 retornar(v,l,cod,o);
end.
