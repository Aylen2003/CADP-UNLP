{ Utilizando el programa del ejercicio 1, realizar los siguientes módulos: 

a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso contrario. 
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe).  
    Nota: la lista podría no estar ordenada. 
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los elementos de la lista L mayores 
    que A y menores que B. 
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera ascendente. 
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera descendente.

}

program Ejercicio9;
type
 lista = ^nodo;
 nodo = record
   num:integer;
   sig:lista;
 end;
procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;
begin
 new(aux);
 aux^.num := v;
 aux^.sig := L;
 L := aux;
end;
procedure cargarLista(var L:lista);
var 
 valor:integer;
begin
 writeln('Ingrese un numero:'); 
 readln(valor); 
 while (valor <> 0) do begin    
   armarNodo(L, valor);  
   writeln('Ingrese un numero');
   read(valor);
 end;
end;
procedure Imprimir(l:lista);
begin
 while (l <> nil) do begin
   writeln(l^.num);
   l:= l^.sig;
 end;
end; 
procedure incrementarValores(l:Lista; val:integer);
var
 aux:lista;
begin
 aux:= l;
 while (aux <> nil) do begin
   aux^.num:= aux^.num + val;
   aux:= aux^.sig;
 end;
end;
{A}
function estaOrdenada(l:lista):boolean;
var
 act,ant:lista;
begin
 ant:=l;
 act:=l^.sig;
 while(act^.sig <> nil) and (ant^.num > act^.num) do begin
   ant:= act;
   act:= act^.sig;
  end;
 if (ant^.num > act^.num) then
   estaOrdenada:= true
 else
   estaOrdenada:= false;
end;
{B}
procedure eliminar(l:lista; var v: integer);
var
 ant,act:lista;
begin
 ant:= l;
 act:= l;
 while (act <> nil) and (act^.num <> v) do begin
   ant:= act;
   act:= act^.sig;
  end;
  if (act <> nil) then begin
   if(ant = act) then 
       l:= l^.sig
   else
     ant^.sig:= act^.sig;
   dispose(act);
  end;
end;
{C}
procedure sublista(l:lista; val1,val2:integer; var l2:lista);
begin
 while(l <> nil) do begin
     if((l^.num > val1) and (l^.num < val2))then
         armarNodo(l2,l^.num);
      l:=l^.sig;
  end;
end;
{D}
procedure sublistaOrdenadaAsen(l:lista; v1,v2:integer; var l2:lista);
begin
  while (l <> nil) and (l^.num < v2)do begin
     if (l^.num > v1) then
       armarNodo(l2,l^.num);
     l:= l^.sig; 
  end;
end;
{E}
procedure sublistaOrdenadaDes(l:lista; v1,v2:integer; var l2:lista);
begin
 while(l <> nil) and (l^.num > v1)do begin
   if(l^.num < v2)then
       armarNodo(l2,l^.num);
      l:=l^.sig;
  end;
end;
// Programa Principal
var
 l,l2:lista;
 v,val1,val2: integer;
begin
 l:= nil;
 l2:= nil;
 cargarLista(l);
 eliminar(l,v);
 sublista(l,val1,val2,l2);
end.
