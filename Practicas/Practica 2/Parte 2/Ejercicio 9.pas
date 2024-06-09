{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se lee: número de inscripción, apellido y nombre.
La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, que debe procesarse. Se pide calcular e informar:
  - Apellido de los dos alumnos con número de inscripción más chico.
  - Nombre de los dos alumnos con número de inscripción más grande.
  - Porcentaje de alumnos con nro de inscripción par.
}

program Ejer9;
procedure maximos(a:integer;nombre:string; var max1,max2:integer; var nombre1,nombre2:string);
begin
  if(a>max1)then begin
    nombre2:=nombre1;
    max2:=max1;
   nombre1:=nombre;
    max1:=a;
  end
  else if(a>max2)then begin
    nombre2:=nombre;
    max2:=a;
  end;
end;
procedure minimos(a:integer;apellido:string; var min1,min2:integer; var apellido1,apellido2:string);
begin
  if(a<min1)then begin
   apellido2:=apellido1;
   min2:=min1;
   apellido1:=apellido;
   min1:=a;
  end
  else if(a<min2)then begin
    apellido2:=apellido;
    min2:=a;
  end;
end;
var
 nombre,apellido:string;
 inscripcion,cantInscripciones,cantPar:integer;
 porcentaje:real;
 MaxInscripcion,MaxInscripcion2:integer;
 MinInscripcion,MinInscripcion2:integer;
 MaxNombre1,MaxNombre2:string;
 MinApellido1,MinApellido2:string;
begin
	MaxInscripcion:=-1;
	MaxInscripcion2:=-1;
	MinInscripcion:=32000;
	MinInscripcion2:=32000;
	cantPar:=0;
	porcentaje:=0;
	cantInscripciones:=0;
	repeat
	  write('Numero de Inscripcion:');
	  readln(inscripcion);
	  write('apellido:');
	  readln(apellido);
	  write('nombre:');
	  readln(nombre);
	  cantInscripciones:=cantInscripciones+1;
	  maximos(inscripcion,nombre,MaxInscripcion,MaxInscripcion2,MaxNombre1,MaxNombre2);
	  minimos(inscripcion,apellido,MinInscripcion,MinInscripcion2,MinApellido1,MinApellido2);
	  if(inscripcion mod 2 = 0)then 
	   cantPar:=cantPar+1;
	until(inscripcion=1200);
	porcentaje:=(cantPar*100)/cantInscripciones;
	writeln('El porcentaje de alumnos con nro de incripcion par son:',porcentaje);
	writeln('El apellido de los dos alumnos con numero de inscripcion mas chico son:',MinApellido1,'y',MinApellido2);	
  writeln('El nombre de los dos alumnos con numero de inscriocion mas grandre son:',MaxNombre1,'y',MaxNombre2);
end.
