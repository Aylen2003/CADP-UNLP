 { La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de préstamos de libros efectuados en 
 marzo de 2020. Para ello, se debe leer la información de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro 
 prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera ordenada por ISBN y
 finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
  a. Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado. Esta estructura debe quedar ordenada por 
      ISBN de libro.
  b. Calcular e informar el día del mes en que se realizaron menos préstamos.
  c. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par.
 }

 program Ejer14;
type
 rangoDia=1..31;
 prestamo=record
     numero:integer;
     isbn:integer;
     numSocio:integer;
     dia:rangoDia;
  end;
 libro=record
     isbn:integer;
     cantVeces:integer;
  end;
 lista=^nodo;
 nodo=record
     dato:libro;
     sig:lista;
  end;
 vdia=array[rangoDia]of integer; 
procedure leerPrestamo(var p:prestamo);
begin
 writeln('Ingrese el isbn');
 readln(p.isbn);
 if(p.isbn<>-1)then begin
     writeln('Ingrese el numero prestamo');
     readln(p.numero);
     writeln('Ingrese el numero de socio');
     readln(p.numSocio);
     writeln('Ingrese el dia');
     readln(p.dia);
  end;
end;
procedure agregarAtras(var L,ult:lista;lib:libro);
var 
 nue:lista;
begin
 new(nue);
 nue^.dato:=lib;
 nue^.sig:=nil;
 if(L=nil)then 
     L:=nue
  else  
     ult^.sig:=nue;
  ult:=nue;
end;
procedure inicializar(var v:vdia);
var 
 i:rangoDia;
begin
 for i:=1 to 31 do 
     v[i]:=0;
end;
procedure minimo(var min:integer;var diaMin:rangoDia;v:vdia);
var 
 i:rangoDia;
begin
 for i:=1 to 31 do begin
     if(v[i]<min)then begin
         min:=v[i];
         diaMin:=i;
      end;
  end;
end;
function digitosPar(num:integer):boolean;
var 
 dig:integer;
begin
 dig:=num mod 10;
 if(dig mod 2 = 0)then
     digitosPar:=true
  else
     digitosPar:=false;
end;
procedure recorrerLista(p:prestamo;var L:lista);
var 
 lib:libro;
 v:vdia;
 cant,total,min:integer;
 porcentaje:real;
 ult:lista2;
 diaMin:rangoDia;
begin
 cant:=0;total:=0;min:=999;
 inicializar(v);
 leerPrestamo(p);
 while(p.isbn<>-1)do begin
     lib.isbn:= p.isbn;
     lib.cantVeces:= 0;
     while(lib.isbn=p.isbn)do begin
         lib.cantVeces:=lib.cantVeces+1;
         v[p.dia]:=v[p.dia]+1;
         total:=total+lib.cantVeces;
         if(digitosPar(p.numSocio))and(not digitosPar(p.numero))then
             cant:=cant+1;
          L:=L^.sig;
       end;
     agregarAtras(L2,ult,lib);
  end;
 minimo(min,diaMin,v);
 writeln('Día del mes en que se realizaron menos préstamos',diaMin);
 porcentaje:=cant*100/total;
 writeln('Porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par',porcentaje:2:2,'%');
end;
var
 L:lista;
begin
 L:=nil;
 recorrerLista(p,L);
end.
