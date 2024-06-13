{ Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se ingrese uno cuyo valor sea exactamente el doble 
de X (el primer número leído)}

program Ejer4;
var 
 num, valor: real;
begin
  write ('Ingrese un numero:');
  readln(num);
  valor:= num*2;
  while (num <> valor)do begin
     write ('Ingrese otro numero:');
     readln(num);
   end;
end. 
