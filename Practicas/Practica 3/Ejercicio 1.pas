{ Dado el siguiente programa:}
program Registros;
type
 str20 = string[20];
 alumno = record
   codigo : integer;
   nombre : str20;
   promedio : real;
 end;
procedure leer(var alu : alumno);
begin
  writeln(‘Ingrese el código del alumno’);
  read(alu.codigo);
  if (alu.codigo <> 0) then begin
   writeln(‘Ingrese el nombre del alumno’); 
   read(alu.nombre);
   writeln(‘Ingrese el promedio del alumno’); 
   read(alu.promedio);
 end;
end;
{ declaración de variables del programa principal }
var
a : alumno;
{cuerpo del programa principal}
begin
 ...
end.

{a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe la cantidad de alumnos leídos. La 
  lectura finaliza cuando ingresa un alumno con código 0, que no debe procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el nombre del alumno con 
  mejor promedio.}

program Ejer1ayb;
type
  str20= string[20];
  alumno=record
   codigo:integer;
   nombre:str20;
   promedio:real;
 end;
procedure leer(var alu:alumno);
begin
  writeln('Ingrese el codigo del alumno');
  readln(alu.codigo);
  if(alu.codigo<>0)then begin
    writeln('ingrese el nombre del alumno');
    read(alu.nombre);
    writeln('Ingrese el promedio del alumno');
    read(alu.promedio);
  end;
end;
procedure Maximo(alu:alumno; var promMax:real; var nombreMax:str20);
begin
  if(alu.promedio>promMax)then begin
    promMax:=alu.promedio;
    nombreMax:=alu.nombre;
  end;
end;
var 
 a:alumno;
 cant:integer;
 promMax:real;
 nombreMax:str20;
begin
	cant:=0;
	leer(a);
	while(a.codigo <> 0)do begin
	  cant:=cant+1;
	  Maximo(a,promMax,nombreMax);
	end;
	writeln();
end.
