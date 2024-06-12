{ Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo 400 alumnos. La lectura finaliza 
cuando se ingresa el DNI -1 (que no debe procesarse).
}

program Ejer9;
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
 vector = array[1..ING]of alumno; 

procedure leerAlu(var a:alumno);
begin
 writeln('Ingrese el dni');
 readln(a.dni);
 if(a.dni <> -1)then begin
   writeln('Ingrese el numero de inscripcion');
   readln(a.num);
   writeln('Ingrese el apellido');
   readln(a.ape);
   writeln('Ingrese el nombre');
   readln(a.nom);
   writeln('Ingrese el ano de nacimiento');
   readln(a.anio);
 end;
end;

procedure cargarVector(var v:vector;var dimL:integer);
var 
 a:alumno;
begin
 leerAlu(a);
 while(a.dni <> -1) and (dimL < ING)do begin
   dimL:=dimL+1;
   v[dimL]:=a;
   leerAlu(a);
 end;
end;

function soloDigitosPares(dni:integer):boolean;
var 
 dig,pares,cant:integer;
begin
 cant:= 0;
 pares:= 0;
 while(dni <> 0)do begin
   dig:= dni mod 10;
   cant:=cant+1;
   if((dig mod 2) = 0)then
     pares:= pares+1;
   dni:= dni div 10;
 end;
 soloDigitosPares:=(cant=pares);
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
 contador,dimL,min1,min2,i:integer;
 porcentaje:real;
 ape1,ape2,nom1,nom2:cadena;
begin
 dimL:=0;
 contador:=0;
 min1:=9999;ape1:='';nom1:='';
 cargarVector(v,dimL);
 for i:=1 to dimL do begin
   dosMayorEdad(ape1,ape2,nom1,nom2,min1,min2,v[i].ape,v[i].nom,v[i].anio);
   if(soloDigitosPares(v[i].dni))then
     contador:=contador+1;
  end;
  porcentaje:=contador*100/ING;
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares',porcentaje:2:2);
  writeln('Apellido y nombre de los dos alumnos de mayor edad ',ape1,nom1,' y ',ape2,nom2);
end.
