{ a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor n y retorne si n se encuentra en 
el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera ascendente.
}

program Ejer1a;
const 
 dimF = 500;
type  
 vector = array [1..dimF] of integer;

function buscar( v:vector;dimL:integer;n:integer):boolean;
var 
 pos:integer;
 esta:boolean;
begin
 pos:=1;
 esta:=false;
 while (pos <= dimL) and (not esta)do begin
   if(v[pos] = n)then
     esta:= true;
   else
     pos:= pos+1;
 end;
 buscar:= esta;
end;

var 
 v:vector;
 n,dimL:integer;
begin
 write('Ingrese el valor a buscar:');
 readln(n);
 if(buscar(v,dimL,n))then
   writeln('Se ha encontrado el elemento ',n);
 else
   writeln('No se ha encontrado el elemento ',n);
end.

// PARTE B

program Ejer1b;
const 
 dimF = 500;
type  
 vector = array [1..dimF] of integer;

function buscar( v:vector;dimL:integer;n:integer):boolean;
var 
 pos:integer;
begin
 pos:=1;
 while (pos <= dimL) and (v[pos] < n)do begin
   pos:=pos+1;
   if(pos <= dimL) and (v[pos] = n)then
     buscar:=true;
   else
     buscar:=false;
 end;
end;

var 
 v:vector;
 n,dimL:integer;
begin
 write('Ingrese el valor a buscar:');
 readln(n);
 if(buscar(v,dimL,n))then
   writeln('Se ha encontrado el elemento ',n);
 else
   writeln('No se ha encontrado el elemento ',n);
end.
