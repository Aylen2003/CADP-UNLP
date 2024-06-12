{ Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de Informática de la UNLP en el año 2020. De cada 
alumno se lee: nro de inscripción, DNI, apellido, nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.
}

program Ejer8;
const 
 ING = 400;
type
 cadena = string[30];
 alumno = record
   num:integer;
   dni:integer;
   ape:cadena;
   nom:cadena;
   anio:integer;
 end;
 vector = array[1..ING] of alumno; 

procedure leerAlu(var a:alumno);
begin
 writeln('Ingrese el numero de inscripcion');
 readln(a.num);
 writeln('Ingrese el dni');
 readln(a.dni);
 writeln('Ingrese el apellido');
 readln(a.ape);
 writeln('Ingrese el nombre');
 readln(a.nom);
 writeln('Ingrese el ano de nacimiento');
 readln(a.anio);
end;

procedure cargarVector(var v:vector;i:integer);
var 
 a:alumno;
begin
 leerAlu(a);
 v[i]:=a;
end;

function soloDigitosPares(dni:integer):boolean;
var 
 dig,pares,cant:integer;
begin
 cant:=0;
 pares:=0;
 while(dni <> 0)do begin
   dig:= dni mod 10;
   cant:= cant+1;
   if((dig mod 2) = 0)then
     pares:= pares+1;
   dni:=dni div 10;
  end;
 soloDigitosPares:=(cant = pares);
end;

procedure dosMayorEdad(var ape1,ape2,nom1,nom2:cadena;var min1,min2:integer;ape:cadena;nom:cadena;anio:integer);
begin
 if(anio < min1)then begin
   min2:=min1;
   min1:=anio;
   ape2:=ape1;
   ape1:=ape;
   nom2:=nom1;
   nom1:=nom;
 end
 else if(anio < min2)then begin
   min2:=anio;
   ape2:=ape;
   nom2:=nom;
 end;
end;

var
 v:vector;
 contador,i,min1,min2:integer;
 porcentaje:real;
 ape1,ape2,nom1,nom2:cadena;
begin
 contador:= 0;
 min1:= 9999;
 ape1:='';
 nom1:='';
 for i:=1 to ING do begin
   cargarVector(v,i);
   dosMayorEdad(ape1,ape2,nom1,nom2,min1,min2,v[i].ape,v[i].nom,v[i].anio);
   if(soloDigitosPares(v[i].dni))then
     contador:= contador+1;
  end;
 porcentaje:= contador*100/ING;
 writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares',porcentaje:2:2);
 writeln('Apellido y nombre de los dos alumnos de mayor edad ',ape1,nom1,' y ',ape2,nom2);
end.
