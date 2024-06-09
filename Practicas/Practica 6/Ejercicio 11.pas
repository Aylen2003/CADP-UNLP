{ La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará el premio Joaquín V. González. 
  De cada egresado se conoce su número de alumno, apellido y  el promedio obtenido durante toda su carrera. Implementar un programa que: 

  a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse. 
  b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados que recibirán el premio. La información
    debe imprimirse ordenada según el promedio del egresado (de mayor a menor).
}

program Ejercicio11;
type
 cadena = string[50];
 egresados = record
   num: integer;
   ape: cadena;
   prom: real;
  end;
 lista = ^nodo;
 nodo = record
   dato: egresados;
   sig: lista;
 end;
procedure leer(var e: egresados);
begin
  writeln ('Ingrese el numero de alumno:');
  readln (e.num);
  if (e.num <> 0) then begin
    writeln ('Ingrese el apellido del alumo:');
    readln (e.ape);
    writeln ('Ingrese el promedio obtenido en toda la carrera del alumno:');
    readln (e.prom);
  end;
end;
procedure InsertarOrdenado(var l:lista; e:egresados);
var
 nue:lista;
 act,ant:lista;
begin
  new(nue);
  nue^.dato:= e;
  act:= l;
  ant:= l;
  while (act <> nil) and (e.prom < act^.dato.prom ) do begin
    ant:= act;
    act:= act^.sig;
  end;
  if (act = ant) then
    l:= nue
 else
    ant^.sig:= nue;
 nue^.sig:= act;
end;
procedure CargarLista(var l:lista);
var
 e:egresados;
begin
  leer(e);
  while (e.num <> 0) do begin
   InsertarOrdenado(l,e);
   leer(e);
  end;
end;
procedure ProcesarLista(l:lista);
var
  i:integer;
begin
  i:= 0;
 writeln('Los 10 egresados con mejor promedio a los que la UNLP les entregara el premio Joaquin V. Gonzalez son:');
 while (l <> nil) and (i < 10) do begin
   writeln('' ,l^.dato.ape, ' '  ,l^.dato.num);
   i:= i + 1;
   l:=l^.sig;
 end;
end;
// Programa Principal
var 
 l:lista;
begin
 l:= nil;
 CargarLista(l); 
 ProcesarLista(l);
end.
