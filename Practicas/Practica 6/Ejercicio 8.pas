{ Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista queden ordenados de manera 
ascendente (insertar ordenado).
}

program Ejercicio8;
type
 lista = ^nodo;
 nodo = record
     num:integer;
     sig:lista;
   end;
procedure armarNodo(var l:lista; v: integer);
var
 nue:lista;
 act,ant:lista;
begin
  new (nue);
  nue^.num:= v;
  act:= l;
  ant:= l;
  while (act <> nil) and (act^.num < nue^.num) do begin
     ant:= act;
     act:= act^.sig;
  end;
   if (act = ant) then
     l:= nue
  else
     ant^.sig:= nue;  
  nue^.sig:= act;
end;
procedure Imprimir(l:lista);
begin
 while (l <> nil) do begin
    writeln(l^.num);
    l:= l^.sig;
 end;
end;
procedure incrementar(var l:lista; val:integer);
var
 aux:lista;
begin
 aux:= l;
 while (aux <> nil) do begin
   aux^.num:= aux^.num + val;
   aux:= aux^.sig;
  end;
end; 
var
 pri : lista;
 valor : integer;
begin
 pri := nil;
 writeln('Ingrese un numero');
 read(valor);
 while (valor <> 0) do begin
     armarNodo(pri, valor);
     writeln('Ingrese un numero');
     read(valor);
  end;
  Imprimir(pri);
end.
