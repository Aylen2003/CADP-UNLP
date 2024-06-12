{ Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan 
por lo que consumen). Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de 
teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los 
clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:

a. Realizar un módulo que lea la información de una línea de teléfono.
b.  Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el módulo desarrollado en el inciso a.
) y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente.

Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}

program Ejer4;
type
  linea=record
    num:integer;
    min:integer;
    mb:integer;
 end;
  clientes=record
    cod:integer;
    cantL:integer;
 end;
procedure leerLinea(var l:linea);
begin
  writeln('Ingrese el numero de telefono');
  readln(l.num);
  writeln('Ingrese la cantidad de minutos consumidos');
  readln(l.min);
  writeln('Ingrese la cantidad de MB consumidos');
  readln(l.mb);
end;
procedure leerCliente(var c:clientes);
begin
  writeln('Ingrese el codigo de cliente');
  readln(c.cod);
  writeln('Ingrese la cantidad de lineas');
  readln(c.cantL);
end;
procedure facturar(var l:linea; var c:clientes; var minT,mbT:real);
var
 i:integer;
begin
  minT:=0;
  mbT:=0;
  for i:= 1 to c.cantL do begin
      leerLinea(l);
      minT:= minT+l.min*3.40;
      mbT:= mbT+l.mb*1.40;
   end; 
end;
var 
 c:clientes;
 l:linea;
 minT,mbT:real;
 i:integer;
begin
	 minT:=0;
	 mbT:=0;
	 for i:= 1 to 9300 do begin
	     leerCliente(c);
	     facturar(l,c,minT,mbT);
	     writeln('Cantidad total de minutos a facturar:',minT:2:5);
	     writeln('Cantidad total de Mb a facturar:',mbT:2:5);
	 end;
end.
