{ Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de 
asistencias a clase. Dicha información se encuentra ordenada por nro de alumno de manera ascendente. Se pide: 
a.  Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos de teclado.
}

program Ejer4;
const
 dimF = 1000;
type
 cadena = string[60];
 alumno = record
   num:integer;
   apeYnom:cadena;
   asistencia:integer;
 end;
 vector = array [1..dimF] of alumno;

procedure leer(var a:alumno);
begin
 writeln('Ingrese numero');
 readln(a.num);
 if(a.num <> 0)then begin
   writeln('Ingrese apellido y nombre');
   readln(a.apeYnom);
   writeln('Ingrese la cantidad de asistencia');
   readln(a.asistencia);
 end;
end;

procedure cargar(var v:vector;var dimL:integer);
var
 a:alumno;
begin
 dimL:= 0;
 leer(a);
 while(dimL < dimF) and (a.num <> 0)do begin
   dimL:= dimL+1;
   v[dimL]:= a;
   leer(a);
 end;
end;

procedure mostrar(v:vector;dimL:integer);
var 
 i:integer;
begin
 for i:=1 to dimL do 
   writeln('Numero:',v[i].num,'Ape y nom:',v[i].apeYnom,'asistencia:',v[i].asistencia);
end;

function buscar(numero:integer;v:vector;dimL:integer):integer;
var 
 pos:integer;
begin
 pos:= 1;
 while(pos <= dimL) and (v[pos].num < numero)do begin
   pos:=pos+1;
   if(pos <= dimL) and (v[pos].num = numero)then
     buscar:= pos
   else
     buscar:= -1;
 end;
end;

procedure insertar(var v:vector;var dimL:integer;alu:alumno;pos:integer;var exito:boolean);
var 
 i:integer;
begin
 exito:= false;
 if(dimL < imF) and (pos >= 1) and (pos <= dimL)then begin
   exito:=true;
   for i:=dimL downto pos do
     v[i+1]:=v[i];
   v[pos]:=alu;
   dimL:=dimL+1;
 end;
end;

procedure borrar(var v:vector;var dimL:integer;pos:integer;var exito:boolean);
var 
 i:integer;
begin
 exito:=false;
 if(pos >= 1) and (pos <= dimL) then begin
   exito:=true;
   for i:=pos+1 to dimL do
     v[i-1]:=v[i];
   dimL:=dimL-1;
 end;
end;

procedure borrarAlu(var v:vector;var dimL:integer;num:integer;var exito:boolean);
var 
 pos:integer;
begin
 exito:= false;
 pos:= buscar(num,v,dimL);
 if(pos <> 0)then
   borrar(v,dimL,pos,exito);
end;

procedure borrarAsist0(var v:vector;var dimL:integer;var exito:boolean);
var 
 i:integer;
begin
 for i:=1 to dimL do begin
   if(v[i].asistencia = 0)then begin
     borrarAlu(v,dimL,v[i].num,exito);
     if(exito)then
       writeln('Se borro el alumno:',v[i].num,' con asistencia 0');
   end;
 end;
end;

var
 v:vector;
 a:alumno;
 numero,dimL,pos,posBorrar,numAlu:integer;
 exito:boolean;
begin
 cargar(v,dimL);
 mostrar(v,dimL);
 writeln('Ingrese el numero a buscar');
 readln(numero);
 pos:=buscar(numero,v,dimL);
 writeln('El numero buscado esta en la posicion:',pos);
 writeln('Ingrese el alumno a insertar');
 leer(a);
 insertar(v,dimL,a,pos,exito);
 if(exito)then
   writeln('Se inserto con exito');
 writeln('Ingrese la posicion del alumno a eliminar');
 readln(posBorrar);
 borrar(v,dimL,posBorrar,exito);
 if(exito)then
   writeln('Se borro con exito');
 writeln('Ingrese un numero de alumno a eliminar');
 readln(numAlu);
 borrarAlu(v,dimL,numAlu,exito);
 if(exito)then
   writeln('Se borro el alumno:',numAlu);
 borrarAsist0(v,dimL,exito);
end.
