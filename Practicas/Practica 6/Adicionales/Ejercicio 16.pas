{ La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial, en la que corredores de todos los países 
participantes salen a correr en el mismo momento en distintos puntos del planeta. La app registra, para cada corredor, el nombre y apellido, la 
distancia recorrida (en kilómetros), el tiempo (en minutos) durante el que corrió, el país y la ciudad desde donde partió, y la ciudad donde 
finalizó su recorrido. Realizar un programa que permita leer y almacenar toda la información registrada durante la competencia. La lectura finaliza 
al ingresar la distancia-1. Una vez que se han almacenado todos los datos, informar:
  - Lacantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores.
  - El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de kilómetros recorridos por los corredores de esa ciudad.
  - La distancia promedio recorrida por corredores de Brasil. o La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
  - El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.
}

program Ejercicio16;
type
 cadena = string[50];
 corredor = record
   nomYape : cadena;
   distancia: real;
   tiempo: real;
   pais: cadena;
   ciudadP: candena;
   ciudadD: cadena; 
 end;
 lista = ^nodo;
 nodo = record
   dato: corredor;
   sig: lista;
 end;

procedure leer(var c: coreedor);
begin
  writeln('Ingrese la distancia del corredor:');
  readln(c.distancia);
  if (c.distancia) then begin
   writeln('Ingrese el nombre y apellido del corredor:');
   readln(c.nomYape);
   writeln('Ingrese el tiempo del corredor:');
   readln(c.tiempo);
   writeln('Ingrese el  pais del corredor:');
   readln(c.pais);
   writeln('Ingrese la ciudad desde donde partio el corredor:');
   readln(c.ciudadP);
   writeln ('Ingrese la ciudad donde finalizo el corredor:');
   readln(c.ciudadD);
  end;
end;

procedure agregarAdelante(var l:lista; c:corredor);
var
  nue:lista;
begin
 new (nue);    
 nue^.dato:= c; 
 nue^.sig:= l; 
 l:= nue;      
end;

procedure CargarLista(var l:lista);
var
 c :corredor;
begin
  leer(c);
  while (c.distancia <> -1) do begin
    agregarAdelante(l,c);
    leer(c);
  end;
end;

procedure maximo(ciudad: cadena;  var max: integer);

procedure recorrerLista();



var
 l: lista;


begin
  CargarLista(l);
  recorrerLista(l,);
end. 
