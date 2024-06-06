{ Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto se lee: código, descripción, stock actual, 
stock mínimo y precio. La lectura finaliza cuando se ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, 
calcular e informar:
1. Porcentaje de productos con stock actual por debajo de su stock mínimo. 
2. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
3. Código de los dos productos más económicos.
}

program Ejercicio5;
type
 cadena = string[50];
 producto = record
     cod: integer;
     descripcion:cadena;
     stockActual,stockMinimo:integer;
     precio:real;
  end;
  lista = ^nodo;
  nodo = record
     dato: producto;
     sig:lista;
  end;
procedure leer(var p:producto);
begin
 write ('Ingrese el codigo del producto:');
 readln(p.cod);
 if (p.cod <> -1) then begin
     write ('Ingrese la descripcion del producto:');
     readln(p.descripcion);
     write ('Ingrese el stock actual del producto:');
     readln(p.stockActual);
     write ('Ingrese el stock minimo del producto:');
     readln(p.stockMinimo);
     write ('Ingrese el precio del producto:');
     readln(p.precio);
 end;
end;
procedure AgregarAdelante(var l:lista; p:producto);
var
 nue: lista;
begin
 new (nue);
 nue^.dato:= p;
 nue^.sig:= l;
 l:= nue;
end;
procedure CargarLista(var l:lista);
var
 p:producto;
begin
 leer(p);
 while (p.cod <> -1) do begin
     AgregarAdelante(l,p);
     leer(p);
  end;
end;
function par(num:integer):boolean;
begin
 par:= (num MOD 2 = 0);
end;
{B}
function digitosPares(cod:integer):boolean;
var
 cantP, dig:integer;
begin
 cantP:= 0;
 while (cod <> 0) and (cantP < 3) do begin
     dig:= cod DIV 10;
     if (par(dig)) then
         cantP:= cantP + 1;
     cod:= cod DIV 10;
 end;
 digitosPares:= (cantP >= 3);
end;
{C}
procedure ActualizarMinimo(precio:real; codigo:integer; var min1,min2:real; var cod1,cod2:integer);
begin
  if (precio < min1) then begin
     min2:= min1;
     cod2:= cod1;
     min1:= precio;
     cod1:= codigo;
  end
  else 
     if (precio < min2) then begin
         min2:= precio;
         cod2:= codigo;
     end;
end;
procedure incisos(l:lista; var porcentaje:real; var codMin1, codMin2: integer);
var
 cantProcMin, cant:integer;
 min1,min2:real;
begin
 cant:= 0;
 cantProcMin:= 0;
 min1:= 999;
 min2:= 999;
 while (l <> nil) do begin
      cant:= cant + 1;
      if (l^.dato.stockActual < l^.dato.stockMinimo) then 
         cantProcMin:= cantProcMin + 1;
     if (digitosPares(l^.dato.cod)) then 
	     writeln ('El producto ', l^.dato.descripcion, ' tiene un codigo con al menos 3 cifras pares.');
      ActualizarMinimo(l^.dato.precio, l^.dato.cod, min1,min2, codMin1,codMin2);
     l:= l^.sig
 end;
 porcentaje:= cantProcMin * 100 / cant;
end;
{Programa Principal}
var 
 l:lista;
 porcentaje: real;
 codMin1, codMin2:integer;
begin
 CargarLista(l);
 incisos(l,porcentaje,codMin1,codMin2);
 writeln('El porcentaje de productos por debajo de su stock minimo es:',porcentaje:5:2);
 writeln ('Los dos codigos de los productos mas baratos son:', codMin1, 'y',codMin2);
end.
