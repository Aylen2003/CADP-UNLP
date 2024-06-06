{Una empresa de venta de tickets de tren está analizando la información de los viajes realizados 
por sus trenes durante el año 2022. Para ello, se dispone de una estructura de datos con la 
información de todos los viajes. 
De cada viaje se conoce el código de tren, el mes en que se realizó el viaje (entre 1y 12), la 
cantidad de pasajeros que viajaron y el código de la ciudad de destino (entre 1 y 20). La información
se encuentra ordenada por código de tren. 
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ciudad
destino. 

Realizar un programa que procese la información de los viajes y:
A. Generar una lista que tenga por cada código del tren, la cantidad de viajes realizados. 
B. Informe el mes con mayor monto recaudado. 
C. COMPLETO: Informe el promedio de pasajerospor cada tren entre todos sus viajes.
}

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
infoTren = record
   tren: integer;
   cant: integer;
end;
listaTren = ^nodoTren;
nodoTren = record
  dato: infoTren;
  sig: listaTren;
end;
vector = array [meses] of real; // esto para el inciso B

procedure CargarViajes(var L:lista); // SE DISPONE

procedure CargarCostos(var t: tabla); // SE DISPONE

procedure InicializarVector(var v: vector);
var
 i: meses;
begin
 for i:= 1 to m do 
    v[i]:= 0;
end;

function maximo(v:vector):real;
var
 max: real;
 mesMax,i:meses;
begin
 max:= -1;
 for i:= 1 to m do begin
    if(v[i] > max)then begin
      max:= v[i];
      mesmax:= i;
    end;
 end;
 maximo:= mesmax;
end;

procedure agregarAdelante(var L2:listaTren; tren:infoTren);
var
 nue:listaTren;
begin
 new(nue);
 nue^.dato:= tren;
 nue^.sig:= L2;
 L2:= nue;
end;

procedure procesarInfo(L:lista; t:tabla; var L2:listaTren; v:vector);
var
 trenAct,cantVia,cantPasa: integer;
 costo:real;
 tren: infoTren;
begin
  InicializarVector(v);
  while(L <> nil) do begin
     trenAct:= L^.dato.tren;
     cantVia:= 0;
     cantPasa:= 0; 
     while(L <> nil) and (trenAct = L^.dato.tren)do begin
        cantVia:= cantVia + 1;
        cantPasa:= cantPasa + L^.dato.pasajeros;
        costo:= t[L^.dato.destino] *  L^.dato.pasajeros;
        v[L^.dato.mes]:= v[L^.dato.mes] + costo;

        L:= L^.sig;
     end;
     tren.tren:= trenAct;
     tren.cant:= cantPasajeros;
     agregarAdelante(L2,tren);
     writeln('El promedio de pasajeros en el tren',trenAct, 'es:',cantPasajeros/cantVia:5:2)
  end; 
end;

// Programa principal
var
 L: lista;
 t: tabla;
 L2: listaTren;
 v: vector;
begin
 CargarViajes(L); // SE DISPONE
 CargarCostos(t); // SE DISPONE
 L2:= nil;
 procesarInfo(L,t,L2,v);
 writeln('El mes con mayor recaudacion es:',maximo(v))
end.
