{ El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos de investigación avanzada. Para los
proyectos de sondas espaciales vistos en el ejercicio anterior, se han determinado los siguientes criterios:

- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar un programa que:

1. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos criterios H2020.
2. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y retorne dos listados, uno con los proyectos 
que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.
3. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo total (construcción y mantenimiento) 
de los proyectos que no serán financiados por H2020. Para ello, utilice el módulo realizado en b.
}

program Ejercicio7;
type
 rango = 1..7;
 cadena = string[50];
 sonda = record
   nom: cadena;
   duracion:integer;
   construcion: real;
   mensual: real;
   espectro: rango;
  end;
  lista = ^nodo;
  nodo = record
   dato: sonda;
   sig: lista;
  end;
  vContador = array[rango] of integer;

procedure leer(var s:sonda);
begin
  writeln('Ingrese el nombre de la sonda');
  readln(s.nom);
  writeln('Ingrese la duracion aproximada en meses');
  readln(s.duracion);
  writeln('Ingrese el costo de construccion');
  readln(s.construcion);
  writeln('Ingrese el costo de mantenimiento');
  readln(s.mensual);
  writeln('Ingrese el rango de estrudio de la sonda');
  readln(s.espectro);
end;
procedure agregarAdelante(var l:lista; s:sonda);
var
 nue:lista;
begin
 new (nue);     
 nue^.dato:= s; 
 nue^.sig:= l; 
 l:= nue;      
end;

procedure CargarLista(var l:lista);
var
 s:sonda;
begin
  repeat
   leer(s);
   agregarAdelante(l,s);
  until(s.nom = 'GAIA');
end;

function CumplenCondicion(s:sonda):boolean;
begin
  CumplenCondicion:= (s.mensual < s.construcion) and (s. espectro <> 1);
end;

procedure Inciso(l:lista; var F,NoF:lista); // F = Financiado  NoF = No Financiado
begin
  while (l <> nil) do begin
   if (CumplenCondicion(l^.dato)) then
      agregarAdelante(F, l^.dato)
   else
     agregarAdelante(NoF, l^.dato);
   l:= l^.sig;
  end;
end;

procedure Procesar(l:lista);
var
 cant:integer;
 costTotal:real;
begin
 cant:= 0;
 costTotal:= 0;
 while (l <> nil) do begin
    cant:= cant + 1;
    costTotal:= costTotal + (l^.dato.mensual + l^.dato.construcion);
    l:= l^.sig;
 end;
  writeln ('La cantidad de proyectos que no seran financiado son:', cant);
  writeln('El costo total de los proyectos que no seran financiados es:', costTotal:5:2);
end;

// PROGRAMA PRINCIPAL
var
 l,Finan,NoFinan:lista;
begin
 l:= nil;
 Finan:= nil;
 NoFinan:= nil;
 CargarLista(l);
 Inciso(l,Finan,NoFinan);
 Procesar(NoFinan);
end.
