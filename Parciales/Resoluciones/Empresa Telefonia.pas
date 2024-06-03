{Una empresa de telefonía celular desea analizar las ventas de 130 modelos de teléfonos
durante la última edición del Cybermonday. De cada venta se conoce: código del cliente,
código de teléfono vendido (entre 1 y 130), marca del teléfono y el medio de pago
utilizado (1. Crédito; 2. Débito; 3. Transferencia; 4. Mercado Pago; 5. Bitcoin; 6. otro).
Además, la empresa dispone de una tabla con el valor de venta de cada modelo de
teléfono.
a) Realizar un módulo que retorne la información de las ventas en una estructura de datos
adecuada. La información se ingresa por teclado y debe almacenarse en el orden en
que fue leída. La lectura finaliza cuando se lee el código de cliente 1111, que debe
procesarse.
b) Realizar un módulo que reciba la información cargada en el inciso anterior y retorne:
i) Los dos medios de pago que generaron el mayor monto total en ventas
ii) Cantidad de ventas de teléfonos marca “Motorola” de clientes cuyo código de cliente no
termine ni en 0 ni en dígito 1.}

program Telefonia;
const
 r = 130;
type
  cadena = string[50];
  rangoT = 1..r;
  medio = 1..6;
  ventas = record
    cliente: integer;
    telefono: rangoT;
    marca: cadena;
    pago: medio;
  end;
  arrVenta = array [rangoT] of ventas; // vector de registros
  tabla = array [rangoT] of real; // se dispone
  contador = array [medio] of intger; // vector contador para el inciso B-i

procedure leerInfo(var vt:venta);
begin
  write('Ingrese el codigo de cliente:'); readln(vt.cliente);
  repeat
    write('Ingrese el codigo de telefono:'); readln(vt.telefono);
    write('Ingrese la marca del telefono:'); readln(vt.marca);
    write('Ingrese el medio de pago utilizado:'); readln(vt.pago
  until(vt.cliente = 1111)
end;

procedure CargarVector(var v:arrVenta);
var
  i: rango;
  vt: venta;
begin
  for i:= 1 to r do begin
    leerInfo(vt);
    v[i]:= vt;
end;

procedure InicializarVector (c:contador);
var
 i: medio;
begin
 for i:= 1 to 6 do 
   c[i]:= 0;
end;

procedure maximo(c: contador; var max1,max2: integer);
var
  cant1,cant2: integer;
  i: medio;
begin
 cant1:= -1;
 cant2:= -1;
 for i:= 1 to 6 do begin
   if (c[i] > cant1) then begin
     cant2:= cant1;
     max2:= max1;
     cant1:= c[i];
     max1:= i;
   end
   else
     if (c[i] > cant2) then begin
       cant2:= c[i];
       max2:= i;
    end;
 end;
end;






// Programa Principal
var
  v: arrVenta;
begin
  CargarVector(v);
end.
  
    
