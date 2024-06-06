{ Dado el siguiente programa: }
program JugamosConListas; 
type 
 lista = ^nodo; 
 nodo =record 
    num:integer; 
    sig:lista; 
  end; 
procedure armarNodo(varL:lista; v:integer); 
var 
  aux:lista; 
begin 
   new(aux); 
   aux^.num := v; 
   aux^.sig := L; 
   L := aux; 
end;
var 
 pri:lista; 
 valor:integer; 
begin 
  pri:= nil; 
  writeln('Ingrese un numero'); 
  read(valor); 
  while(valor <> 0)then begin 
     armarNodo(pri, valor); 
     writeln('Ingrese un numero'); 
     read(valor); 
   end; 
   . . .{ imprimir lista } 
end.
{ a. Indicar qué hace el programa.
  b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
  c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
  d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}
  
{A. El programa recibe numeros enteros que seran almacenados en una lista hasta que se ingrese el valor 0 al final imprime dicha lista.
 B.La lista queda conformada 48 13 21 10, los cuales estan almacenados en ese orden y son impresos de esa forma.
 C. procedure imprimir(l:lista);
    begin
      while(l<>nil)do begin
        writeln(l^.num);
        l:= l^.sig;
     end;
    end;
D. procedure incrementar(var l:lista; dato:integer);
  var
   aux:lista;
  begin
    aux:=l;
    while(aux<>nil)do begin
       aux^.num:=aux^.num + dato;
       aux:= aux^.sig;
     end;
  end;
}
