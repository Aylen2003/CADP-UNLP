{Una distribuidora internacional de bebidas desea procesar la información de los pedidos que debe entregar. 
Para ello, dispone de una estructura con información de cada pedido. De cada pedido se conoce: nombre de país 
de destino y forma de pago (1: Transferencia, 2: Efectivo, 3: Tarjeta de crédito, 4: Cheque). Esta estructura se 
encuentra ordenada por nombre de país de destino y puede haber más de un pedido por país.
Se solicita calcular e informar: 
1- Para cada país, la cantidad de pedidos a entregar. 
2- La forma de pago más utilizada}

program Distribuidora;
type
 rango = 1..4;
 cadena = String[30];
 pedido = record 
   paisD: cadena;
   pago: rango;
 end;
 lista = ^nodo;
 nodo = record
   dato: pedido;
   sig: lista;
 end;
 vectorAcumulador = array [rango] of integer;

//procedure CargarLista(var L:lista); // SE DISPONE

procedure inicializarVector(var v: vectorAcumulador); 
var 
 i: rango;
begin
  for i:= 1 to 4  do 
   v[i]:= 0;  
end;

procedure Maximo( v: vectorAcumulador; var max: integer);
var
 cant1: integer;
 i: rango;
begin
  cant1:= -1;
  for i:= 1 to 4  do begin
   if( v[i] > cant1)then begin
     cant1:= v[i];
     max:= i;
   end;
 end;
end;

procedure ProcesarLista(L:lista);
var
 v: vectorAcumulador;
 cant, max: integer;
 paisActual:  cadena;
begin
  inicializarVector(v);
  while(L <> nil)  do begin
   paisActual := L^.dato.paisD; 
   cant:= 0;
   while (L <> nil) and (paisActual = L^.dato.paisD)do begin
     cant:= cant + 1; 
     v[L^.dato.pago]:= v[L^.dato.pago] + 1;
   end;
   writeLn('La cantidad de pedidos del pais', paisActual, 'es:', cant);
   L:= L^.sig;
   Maximo(v,max);
   writeLn('La forma de pago mas utilizada es:', max);
  end; 
end;

// P.P
var 
 L: lista;
begin
 L:= nil;
 //CargarLista(L); // SE DISPONE
 ProcesarLista(L);
end.
