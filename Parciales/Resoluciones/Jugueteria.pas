{Una juguetería necesita un programa para administrar la información de los productos que comercializa. 
De cada producto se lee: código, descripción, categoría (1: Primera infancia, 2: Didácticos, 3: De mesa, 4: Otros), 
marca y precio. La lectura finaliza cuando se lee el código -1, que no debe procesarse. La información se 
lee ordenada por marca.
Se pide:
A) Generar una estructura que contenga, para cada marca, la cantidad de productos comercializados.
B) Informar las dos categorías con menor cantidad de productos comercializados.
C) Informar el precio promedio de los productos con código múltiplo de 3.}

program Jugeteria;
type
 rango = 1..4;
 cadena = string[50];
 producto = record
     cod: integer;
     descripcion: cadena;
     cate: rango;
     marca: cadena;
     precio: real;
  end;
  lista = ^nodo;
  nodo = record
     dato: producto;
     sig: lista;
   end;
   vector = array [rango] of integer;
 
procedure Leer(var p: producto);
begin
   write ('Codigo de producto:'); readln(p.cod);
   if (p.cod <> -1) then begin
      write ('Descripcion del producto:'); readln(p.descripcion);
      write ('Categoria del producto (entre 1..4):'); readln(p.cate);
      write ('Marca del producto:'); readln(p.marca);
      write ('Precio del producto:'); readln(p.precio);
   end;
end; 

procedure AgregarAtras(var L, ULT:lista; p: producto);
var
 nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if (L = nil) then
     L:= nue
  else
     ULT^.sig:= nue;
   ULT:= nue;
end;

procedure CargarLista(var L:lista);
var
 p: producto;
 ULT: lista;
begin
  Leer(p);
  while (p.cod <> -1) do begin
      AgregarAtras(L,ult,p);
      Leer(p);
  end;
end;

procedure Inicializar(var v: vector);
var 
 i: rango;
begin
 for i:= 1 to 4 do 
     v[i]:= 0;
end;

procedure Minimos(v: vector; var min1,min2: integer);
var 
 i: rango;
 cant,cant2: integer;
begin
 cant:= -1;
 cant2:= -1;
   for i:= 1 to 4 do begin
    if(v[i] < cant)then begin
       cant2:= cant;   
       min2:= min1;   
       cant:= v[i];
       min1:= i;
    end
    else
       if(v[i] < cant2)then begin
          cant2:= v[i];
          min2:= i;
        end;
 end;
end;

function Descomponer(num: integer):boolean;
begin
   Descomponer:= ((num MOD 3)= 0);
end;

procedure Procesar(L:lista);
var
 cant,min1,min2: integer;
 v: vector;
 marcaAct: cadena;
 total: integer;
 precio,promedio: real; 
begin
 total:= 0;
 precio:= 0; 
 Inicializar(v);
 while (L <> nil) do begin
     cant:= 0;
     marcaAct:= L^.dato.marca;
     while (L <> nil) and (marcaAct = L^.dato.marca) do begin
         cant:= cant + 1;
         v[L^.dato.cate]:= v[L^.dato.cate] + 1;
         if (Descomponer(L^.dato.cod)) then
          total:= total + 1;
       precio:= precio + L^.dato.precio;
       L:= L^.sig;
      end;
      Minimos(v,min1,min2);
      promedio:= precio/total;
 end;
 writeln('Las dos categorias con menor cantidad de productos comercializados es:', min1, 'y', min2);
 writeln('El precio promedio de los productos con código múltiplo de 3 es:', promedio);
end; 

var
 L: lista;
begin
 L:= nil;
 CargarLista(L);
 Procesar(L);
end. 
