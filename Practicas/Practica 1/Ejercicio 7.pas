{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén. La lectura finaliza al ingresar el 
producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
Por ejemplo:
  - Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el aumento de precio del producto 10382 no 
    supera el 10%”
  - Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el aumento de precio del producto 32767 es superior 
    al 10%”}

program Ejer7;
var
  cod: integer;
  precioAct, nuePrecio: real;
begin
  cod:= 0;
  while (cod <> 32767) do
    begin
      write ('Ingrese el codigo:'); 
      readln (cod);
      write ('Ingrese el precio Actual:'); 
      readln (precioAct);
      write ('Ingrese el nuevo precio:'); 
      readln (nuePrecio);
      if ((((precioAct * 10) / 100) + precioAct) < nuePrecio) then
        writeln ('el aumento de precio del producto ',cod,' es suprerior al 10%')
      else
        writeln ('el aumento de precio del producto ',cod,' no supera el 10%');
    end;
end.
