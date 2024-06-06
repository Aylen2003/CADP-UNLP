{ Un treatro está analizando la información de los tickets vendidos durante el año 2022. Para ello, se dispone de una estructura de datos con la 
información de todos los tickets vendidos. De cada ticket se conoce el código del evento, dni del comprador, mes de la función (entre 1 y 12) y 
ubicación (1:Palco, 2:Pullman, 3: Platea alta, 4: Platea baja). La información se encuentra ordenada por código de evento.
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ubicación. 

Realizar un programa que procese la información de los viajes y:
A. Genere una lista que tenga por cada código de evento, la cantidad de tickets vendidos. 
B. Informe el mes con mayor monto recaudado. 
C. COMPLETO: Informe el promedio recaudado por cada evento entre todos sus tickets. 

}

program Tema2;
const
 m = 12; 
 u = 4;
type
  meses = 1..m;
  ubicacion = 1..u;
  eventos = record
     evento,comprador: integer;
     mes: meses;
     ubi: ubicacion;
  end;
  lista = ^nodo;
  nodo = record
    dato: eventos;
    sig: lista;
  end;
  costos = array [ubicacion] of real;
  tickets = record
     codigo: integer;
     cantidad: integer;
   end;
   listaTicket =^nodoT;
   nodoT = record
     dato: tickets;
     sig: listaTicket;
   end;
   vector = array [meses] of real; 
  
procedure CargarEvento(var L:lista); // SE DISPONE

procedure CargarCostos(var C: costos); // SE DISPONE

procedure InicializarVector(var V: vector);
var
  i: meses;
begin
 for i:= 1 to m do 
    v[i]:= 0;
end;

function maximo(V:vector): real;
var
 max: real;
 mes,i: meses;
begin
 for i:= 1 to m do begin
   if(v[i] > max)then begin
     max:= v[i];
     mes:= i;
   end;
 end;
 maximo:= mes;
end;

procedure agregarAdelante(var L2:listaTicket; t:tickets);
var
 nue:listaTicket;
begin
  new(nue);
  nue^.dato:= t;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure procesar(L:lista; C: costos; var L2:listaTicket; V:vector);
var
 EventoAct,cantT:integer;
 costo:real;
 t:ticket;
begin
 InicializarVector(v);
 while (L <> nil) do begin
    EventoAct:= L^.dato.evento;
    cantT:= 0;
    while(L <> nil) and (EventoAct = L^.dato.evento) do begin
        cantT:= cantT + 1;
        costo:= C[L^.dato.ubicacion] * L^.dato.comprador;
        V[L^.dato.mes]:= v[L^.dato.mes] + costo;
        L:= L^.sig;
    end;
    t.codigo:= EventoAct;
    t.cantidad:= cantT;
    agregarAdelante(L2,t);
    writeln('El promedio recaudado por el evento', EventoAct,'es:',cantT/V[i]:5:2);
 end;
end;

// Porgrama Principal
var 
 L:lista;
 C: costos;
 L2: 
 begin
  CargarEvento(L); // SE DISPONE
  CargarCostos(C); // SE DISPONE
  L2:= nil;
  procesar(L,C,L2,V);
  writeln('El mes con mayor recaudacion es:'maximo(V));
 end.
