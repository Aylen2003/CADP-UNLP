{ Utilizando el programa del ejercicio 1, realizar los siguientes módulos: 
1. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo. 
2. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo. 
3. Múltiplos:recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la lista que son múltiplos de A.
}

program Ejer4;
function Maximo(L:lista):integer;
var
 max:integer;
begin
  max:=-1;
  while(L <> nil)do begin
   if(L^.num > max)then
     max:= L^.num;
   L:= L^.sig;
  end;
  maximo:= max;
end;
function Minimos(L:lista):integer;
var
 min:integer;
begin
  min:=9999;
  while(L <> nil)do begin
   if(L^.num < min)then
     min:= L^.num;
   L:= L^.sig;
  end;
  minimo:= min;
end;
function multiplos(L:lista; M:integer):integer;
var
 contador:integer;
begin
  contador:=0;
  while(L <> nil)do begin
    if(L^.num MOD M = 0)then
      contador:= contador + 1;
    L:= L^.sig;
  end;
  multiplos:= contador;
end;
var
 L:lista;
 M:integer;
begin
 Maximo(L);
 Minimos(L);
 multiplos(L,M);
end.
