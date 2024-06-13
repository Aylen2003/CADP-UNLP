{ Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee código y precio (cada código es un número 
entre 1 y 200). Informar en pantalla:
  - Los códigos de los dos productos más baratos.
  - La cantidad de productos de más de 16 pesos con código par.
}

program Ejer6;
const
 cantProductos = 200;
type
  codigo = 1..cantProductos;
var 
 cod:codigo;
 min1,min2: integer;
 precio:real;
 i,cant16par:integer;
begin
 min1:= 9999;
 min2:= 9999;
 cant16par:=0;
 for i:= 1 to cantProductos do 
 begin
   writeln('Ingrese un codigo entre 1 y 200');
   readln(cod);
   writeln('Ingrese un precio');
   readln(precio);
   {calculo del inciso A}
   if(precio < min1)then begin
     min2:=min1;
     min1:=cod; 
   end
   else
     if(precio < min2)then
       min2:=cod;
   {calculo del inciso B} 
    if(cod MOD 2 = 0) and (precio > 16)then
     cant16par:=cant16par + 1;
 end;
 writeln('Los codigos de los dos productos mas baratos son', min1, 'y', min2);
 writeln('La cantidad de productos de más de 16 pesos con código par es', cant16par);
end.
