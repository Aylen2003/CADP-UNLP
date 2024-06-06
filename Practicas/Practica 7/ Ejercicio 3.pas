{ Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De cada viaje se conoce: número de viaje, 
código de auto, dirección de origen, dirección de destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada 
por código de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
1. Informar los dos códigos de auto que más kilómetros recorrieron.
2. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.
}

program ejercicio3;
type 
 lista=^nodo;
 viaje=record
   nViaje:integer;
   codAuto:integer;
   dirOrigen:string;
   dirDestino:string;
   kmRecorrido:integer;
end;
 nodo=record
  dato:viaje;
  sig:lista;
end;
procedure max(cod:integer;km:real; var codMax1,codMax2:integer; var kmMax1,kmMax2:real);
begin
  if(km > kmMax1)then begin
    kmMax2:=kmMax1;
    kmMax1:=km;
    codMax2:=codMax1;
    codMax1:=cod;
  end
  else if(km > kmMax2)then begin
    kmMax2:=km;
    codMax2:=cod;
  end;
end;
procedure insertarOrdenado(var L:lista; R:viaje);
var
 ant,act,nuevo:lista;
begin
  ant:=L;
  act:=L;
  new(nuevo);
  nuevo^.dato:=R;
  nuevo^.sig:=nil;
  while(act <> nil)and(act^.dato.codAuto > R.codAuto)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act = ant)then
   L:=nuevo
  else
   ant^.sig:=nuevo;
  nuevo^.sig:=act;
end;
procedure AnalizarLista(L:lista; var L2:lista; var codMax1,codMax2:integer);
var
 kmMax1,kmMax2,kmTotal:real;
 codigo:integer;
begin
  kmMax1:=-1;
  kmMax2:=-1;
  while(L <> nil)do begin
    codigo:=L^.dato.codAuto;
    kmTotal:=0;
    while(L^.dato.codAuto = codigo)do begin
      kmTotal:=kmTotal+L^.dato.kmRecorrido;
      if(L^.dato.kmRecorrido > 5)then begin
        insertarOrdenado(L2,L^.dato);
      end;
      L:=L^.sig;
    end;
   L:=L^.sig;
  end;
  max(codigo,kmTotal,codMax1,codMax2,kmMax1,kmMax2);
 end;
{Programa Principal}
var
 pri,pri2:lista;
 codMax1,codMax2:integer;
begin
 pri:=nil;
 pri2:=nil;
 cargarLista (pri);// Se Dispone
 AnalizarLista(pri,pri2,codMax1,codMax2);
 writeln('Los codigos de los auto con mayor km recorrido son',codMax1,'y',codMax2);
end.
