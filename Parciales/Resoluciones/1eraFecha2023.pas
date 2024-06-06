{}

program Tema1;
const
 m = 12;
 d = 20;
type 
 meses = 1..m;
 destinos = 1..d;
 viaje = record
   tren: integer;
   mes: meses;
   pasajeros: integer;
   destino: destinos;
end;
lista = ^nodo;
nodo = record
   viajes: viaje;
   sig: lista;
end;
tabla = array [destinos] of real; // tabla de costos de ticket
contador = array [meses] of integer; // esto para el inciso B

procedure CargarViajes(L:lista); // Se dispone

procedure InicializarVector(var c: contador);
var
 i: meses;
begin
 for i:= 1 to m do 
    c[i]:= 0;
end;

procedure maximo()
var
 L,L2: lista;

begin
 L:= nil;
 L2:= nil;
 CargarViajes(L);
 procesarLista(L,max,);
 GenerarLista2(L,L2);
end.
