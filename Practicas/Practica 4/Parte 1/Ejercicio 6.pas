{ Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra para el mínimo), implementar un único 
módulo que recorra una única vez el vector y devuelva ambas posiciones. }

program Ejer6;
const 
 dimF=100;
type  
 vector=array[1..dimF]of integer;
 
procedure cargarVector(var v:vector;var dimL:integer);
var 
 num:integer;
begin
 write('Ingrese un numero entero:');
 readln(num);
 while(num <> 0) and (dimL < dimF)do begin
   dimL:=dimL+1;
   v[dimL]:=num;
   write('Ingrese un numero entero:');
   readln(num);
 end;
end;

procedure recorrerVector(v:vector;dimL:integer;var posMax,posMin:integer);
var 
 i,min,max:integer;
begin
 min:=999;
 max:=-1;
 for i:=1 to dimL do begin
   if(v[i] < min)then begin
     min:=v[i];
     posMin:=i;
   end;
   if(v[i] > max)then begin
     max:=v[i];
     posMax:=i;
   end;
 end;    
end;

procedure intercambio(var x,y:integer;var v:vector);
var 
 aux:integer;
begin
 aux:=v[x];
 v[x]:=v[y];
 v[y]:=aux;
end;

var 
 v:vector;
 posMax,posMin,dimL:integer;
begin
 cargarVector(v,dimL);
 recorrerVector(v,dimL,posMax,posMin);
 intercambio(posMax,posMin,v);
 writeln ('El elemento maximo ',v[posMin],' que se encontraba en la posicion ',posMax,' fue intercambiado con el elemento minimo ',v[posMax],' que se encontraba en la posicion ',posMin);
end.
