{ La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos los alumnos que cursaron EPA. De cada 
alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir un programa que procese la información de alumnos disponible y los distribuya 
en turnos utilizando los siguientes criterios:
  - Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
  - Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
  - Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno. 
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}

program Ejercicio15;
type
 rango = 1..5;
 notas = 1..10;
 cadena = string[30];
 alumno = record
     DNI: integer;
     apellido: cadena;
     nombre : cadena;
     nota: notas;
  end;
  lista = ^nodo;
  nodo = record
     dato: alumno;
     sig: lista;
   end;
 turnos = array[rango] of lista; // para ir cargando por turno
 vCont = array[rango] of integer; // para ir contando cuantos alumnos hay en cada turno

procedure CargarLista(L:lista); // SE DISPONE

procedure inicializarVC(var vc: vCont);
var
 i: rango;
begin
  for i:=  to dimF do
     v[i]:= 0;
end;

procedure inicializarTurnos(var t: turnos);
var
 i: rango;
begin
  for i:= 1 to 5  do
     v[i]:= nil; 
end;

function Turno1y4(v:vCont): integer;
begin
  if (v[1] < v[4]) then
     Turno1y4:= 1
  else
     Turno1y4:= 4;
end;

function Turno2y3y5(v:vCont):integer;
begin
 if(v[2] < v[3])then  
     Turno2y3y5:=2
  else
      if (v[3] < v[5])then  
         Turno2y3y5:=3
      else  
         Turno2y3y5:=5;
end;
 
procedure distribuir(L:lista;var t:turnos);
var  
 v:vcont;
 tur:rango;
begin
  inicializarVC(v);
  inicializarTurnos(t);
  while(L <> nil)do begin
     if(L^.dato.nota >= 8)then
         tur:=Turno1y4(v)
      else 
          if(L^.dato.nota >=5 ) and (L^.dato.nota < 8)then
              tur:=Turno2y3y5(v)
          else
              writeln('Alumno:',L^.dato.nom,'No se le asignara un turno');
      v[tur]:=t[tur]+1;
     L:=L^.sig;
  end;
end;
procedure imprimir(L:lista; t:turnos);  //v[i]=puntero al primero de la lista
var 
 i:rango;
begin
  for i:= 1 to 5 do begin
      writeln('Turno:',i);
      L:=t[i]; 
      while(L<>nil)do begin
          writeln('DNI:',L^.dato.DNI,'Apellido:',L^.dato.apellido,'Nombre:',L^.dato.nombre,'Nota:',L^.dato.nota);
          L:=L^.sig;
       end;
  end;
end;
var
  L:lista;
  t:turnos;
  v: vCont;
begin
  L:=nil;
  CargarLista(L);//se dispone
  distribuir(L,t);
  imprimir(L,t);
end.
