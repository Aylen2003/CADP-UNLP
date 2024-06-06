{ Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de transferencias de dinero 
entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada transferencia se conoce: número de cuenta origen,
DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de 
la transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee orden alguno. 
Se pide: 
a. Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que las cuentas origen y destino no pertenecen al mismo titular). Esta
nueva estructura debe estar ordenada por número de cuenta origen. Una vez generada la estructura del inciso a), utilizar dicha estructura para: 
b. Calcular e informar para cada cuenta de origen el monto total transferido a terceros. 
c. Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo. 
d. Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea 
menos dígitos pares que impares.
}

program Ejer8;
const
 motivo = 7;
type
 rango = 1..motivo;
 rangoDia = 1..31;
 rangoMes = 1..12;
  rangoAnio = 2000..2022;
  cadena=string[30];
 fechaF=record
     dia:rangoDia;
     mes:rangoMes;
     anio:rangoAnio;
   end;
  transferencia=record
     nroOrigen:integer;
     dniOrigen:integer;
     nroDestino:integer;
     dniDestino:integer;
     fecha:fechaF;
     hora:real;
     monto:real;
     codMotivo:rango;
   end;
  lista = ^nodo;
  nodo = record
     dato:transferencia;  
     sig:lista;
  end;
 vcont = array [rango] of integer;
  
procedure insertarOrdenado(var L:lista; t:transferencia);
var  
 act,ant,nue:lista;
begin
 new(nue);
 nue^.dato:= t;
 ant:= L;
 act:= L;
 while (act <> nil) and (act^.dato.nroOrigen < t.nroOrigen)do begin
     ant:= act;
     act:= act^.sig;
  end;
 if(ant = act)then 
     L:= nue
 else 
     ant^.sig:= nue;
  nue^.sig:= act;
end;
function distintoTitular(dniO,dniD:integer):boolean;
begin
  distintoTitular:= (dniO <> dniD);
end;
procedure cargarLista2(L:lista; var L2:lista);
begin
 while(L<>nil)do begin
     if(distintoTitular(L^.dato.dniOrigen,L^.dato.dniDestino))then
         insertarOrdenado(L2,L^.dato);
     L:=L^.sig;
  end;
end;
procedure inicializar(var v:vcont);
var 
 i:rango;
begin
 for i:=1 to motivo do
     v[i]:=0;
end;
procedure masTranferencias(var max:integer; v:vcont);
var 
 i:rango;
begin
 max:= -1;
 for i:= 1 to motivo do
     if(v[i] > max)then
         max:= v[i];
end;
function menosPares(numero:integer):boolean;
var 
 dig,pares,impares:integer;
begin
 pares:=0;
 impares:=0;
 while(numero <> 0)do begin
     dig:= numero mod 10;
     if(dig mod 2 = 0)then  
         pares:= pares+1
      else  
         impares:= impares+1;
     dig:= numero div 10;
  end;
  if(pares < impares)then
     menosPares:=true
  else
     menosPares:=false;
end;      
procedure recorrerLista2(L:lista);
var 
 ctaActual,max,cant:integer;
 montoTotal:real;
 v:vcont;
begin
  cant:=0;
  inicializar(v);
  while(L <> nil)do begin
     ctaActual:=L^.dato.nroOrigen;
     montoTotal:=0;
     while(L<>nil)and(ctaActual=L^.dato.nroOrigen)do begin
         montoTotal:=montoTotal+L^.dato.monto;
         v[L^.dato.codMotivo]:=v[L^.dato.codMotivo]+1;
         if(L^.dato.fecha.mes=6)and(menosPares(L^.dato.nroDestino))then
             cant:=cant+1;
         L:=L^.sig;
      end;
     writeln('Cuenta de origen:',ctaActual,' monto total:',montoTotal:2:2);
  end;
  masTranferencias(max,v);
  writeln('Cantidad de transferencias en junio con nro cuenta destino con menos digitos pares:',cant);
end;
var 
 L,L2:lista;
 max:integer;
begin
 L:=nil;  //se dispone
 L2:=nil;
 cargarLista(L); //se dispone
 cargarLista2(L,L2);
 recorrerLista2(L2);
 writeln('Código de motivo que más transferencias a terceros tuvo:',max);
end.
