{ Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no 
debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}

program Ejer2;
const 
 dimF = 500;  
type 
 cadena50 = string[50];
 valumnos = array [1..dimF] of cadena50;    

procedure leerAlumnos(var a:cadena50);
begin
 write('Ingrese el nombre del alumno:');
 readln(alumno);
end;

procedure cargarAlumnos(var v:valumnos;var dimL:integer);
var 
 a:cadena50;
begin
 dimL:=0;
 leerAlumnos(a);
 while(dimL < dimF) and (a <> 'ZZZ')do begin
   dimL:= dimL+1;
   v[dimL]:= a;
   leerAlumnos(a);
 end;
end;

procedure borrar(var v:valumnos;var dimL:integer;var ok:boolean);
var 
 nom: cadena50;
 pos,i: integer;
begin
 pos:= 1; 
 ok:= false;
 write('Ingrese el nombre que desea borrar:');
 readln(nom);
 while(pos <= dimL) and (not ok)do begin
   if(v[pos] = nom)then begin
     for i:= pos to (dimL-1)do
       v[i]:=v[i+1];
     ok:= true;
     dimL:= dimL-1;
   end
   else 
     pos:=pos+1;
 end;
end;

procedure insertar(var v:valumnos;var dimL:integer;var ok:boolean);
var 
 nom:cadena50;i:integer;
begin
 ok:= false;
 write('Ingrese el nombre que desea insertar en la posicion 4:');
 readln(nom);
 if((dimL+1) <= dimF)then begin
   for i:= dimL downto 4 do
     v[i+1]:= v[i];
   ok:= true;
   v[4]:= nom;
   dimL:= dimL+1;
 end;
end;

procedure agregar(var v:valumnos;var dimL:integer;var ok:boolean);
var 
 nom:cadena50;
begin
 ok:=false;
 write('Ingrese el nombre que desea agregar:');
 readln(nom);
 if((dimL+1)<=dimF)then begin
   ok:=true;
   dimL:=dimL+1;
   v[dimL]:=nom;
 end;
end;

procedure imprimir(v:valumnos,dimL:integer);
var 
 i:integer;
begin
 for i:=1 to dimL do
   writeln('Posicion ',i ,' : ' v[i]);
end;

var 
 v:valumnos;
 dimL:integer;
 ok:boolean;
begin
 cargarAlumnos(v,dimL);
 borrar(v,dimL,ok);
 insertar(v,dimL,ok);
 agregar(v,dimL,ok);
 imprimir(v,dimL);
end.
