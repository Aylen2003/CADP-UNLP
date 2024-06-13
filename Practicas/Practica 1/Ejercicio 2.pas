{ Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X, se escribe |X| y se define como: 
|X| = X cuando X es mayor o igual a cero |X| = -X cuando X es menor a cero}

program Ejer2;
var 
  x:real;
begin
 write('Ingresa el numero:');
 readln(x);
 if(x >= 0)then
  writeln('Muestra:',x:5:2)
 else
  begin
   if(x <= 0)then
    writeln('Muestra',-x:5:2);
    end;
end.
