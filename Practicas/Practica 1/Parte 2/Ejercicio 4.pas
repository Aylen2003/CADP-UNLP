{ Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos números mínimos leídos.
  a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual debe procesarse.
  b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual no debe procesarse.
}

program Ejer4;
var 
  numero,i,minimo,minimo2:integer;
begin
 minimo:=9999;
 minimo2:=9999;
 for i:= 1 to 1000 do begin
   writeln('Ingrese el numero');
   readln(numero);
   if(numero<minimo)then begin
     minimo2:= minimo;
     minimo:= numero;
   end
   else if(numero<minimo2)then begin
     minimo2:= numero;
   end;
 end;
  writeln('El numero mas chico fue:',minimo);
  writeln('El segundo numero mas chico fue:',minimo2);	
end.
