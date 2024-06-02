{Un servicio de comercio electrónico desea analizar las ventas de notebooks durante la última edición del Hot Sale. 
De cada notebook vendida se conoce su código de modelo (entre 1 y 200), marca, código del cliente y el medio de pago utilizado 
(1. Crédito; 2. Débito; 3. Transferencia; 4. Mercado Pago; 5. Bitcoin; 6. otro). 
Además, el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks.
a) Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada. La información se ingresa por teclado y debe
almacenarse en el orden en que fue leída. La lectura finaliza cuando se ingresa el
código de cliente -1.
b) Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
i) Los dos medios de pago que generaron el mayor monto total en ventas
ii) Cantidad de notebooks de marca “Lenovo” vendidas a clientes cuyo código de cliente termina con un dígito par.}
program Comercio;
type
  rangoM = 1..200;
  pagos = 1..6;
  cadena = string[30];
  venta = record
      cod: rangoM;
      marca: cadena;
      cliente: integer;
      pago: pagos;
   end;
   lista = ^nodo;
   nodo = record
     dato: venta;
     sig: lista; 
   end;

 tablaValorVta = array [rangoM] of real; // tabla que se dispone con los valores de la ventas
 vectorAcumulador = array[pagos] of real; 


procedure leer(var vta: venta);
begin
 writeln('Codigo de cliente:'); readln(vta.cliente);
 if(vta.cliente <> -1)then begin
     writeln('Modelo de la netbook:'); readln(vta.cod);
     writeln('Marca de la nootbook:'); readln(vta.marca);
     writeln('Medio de pago'); readln(vta.pago); 
 end;
end;

procedure agregarAtras(var L, ult: lista; vta: venta);
var
 nue: lista;
begin
  new(nue);
  nue^.dato:= vta;
  nue^.sig:= nil;
  if( l = nil)then
     l:= nue
  else
     ult^.sig:= nue;
 ult:= nue;
end;

procedure CargarLista(var L:lista);
var
 vta: venta;
 ult: lista;
begin
   leer(vta);
   while (vta.cliente <> -1) do begin
      agregarAtras(L,ult,vta);
      leer(vta);
   end;
end;

procedure CargarPrecios(var v: tablaValorVta); // SE DISPONE

procedure InicializarVector(var vA: vectorAcumulador);
var
 i: pagos;
begin
   for i:= 1 to 6 do 
     vA[i]:= 0;
end;

procedure CalcularDosMaximos(vA:vectorAcumulador; var max1,max2:integer);
var
 cant1,cant2: real;
 i: pagos;
begin
   cant1:= -1;
   cant2:= -1;
   for i:= 1 to 6 do begin
      if (vA[i] > cant1) then begin
         max2:= max1;
         cant2:= cant1;
         cant1:= vA[i];
         max1:= i;
      end
      else
         if (vA[i] > cant2) then begin
             cant2:= vA[i];
             max2:= i;
         end;
   end;
end;

procedure ProcesarLista(L:lista; var cant: integer; var max1,max2: integer);
var
 vA: vectorAcumulador;
 v: tablaValorVta;
begin
 InicializarVector(vA);
 CargarPrecios(v);
 cant:= 0;
   while (L <> nil) do begin
       vA[L^.dato.pago]:= vA[L^.dato.pago] + v[L^.dato.cod];
       if((L^.dato.marca = 'Lenovo') and (L^.dato.cliente MOD 2) = 0)then
          cant:= cant + 1;
      L:= L^.sig;
   end;
   CalcularDosMaximos(vA, max1,max2)
end;


var
 L:lista;
 max1,max2: integer;
 cant: integer;
begin
  CargarLista(L);
  ProcesarLista(L,cant, max1,max2);
  writeln('Las 2 formas de pago que mas ganancias generaron fueron:', max1, 'y', max2);
  writeln('La cantidad de PC Lenovo con cliente DNI par fue:', cant);
end.
