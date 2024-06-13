{ Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales. La lectura deberá finalizar al ingresar 
un valor que sea el doble de X, o al leer el décimo número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program Ejer5;
var 
 num, valor: real;
 cont:integer;
begin
  cont:= 0;
  write ('Ingrese un numero:');
  readln(num);
  valor:= num*2;
  while (num <> valor) and (cont < 10)do begin
     write ('Ingrese otro numero:');
     readln(num);
     cont:= cont + 1;
   end;
   if (cont = 10) and (num <> valor)then
     writeln('No se ha ingresado el doble de X');
end. 
