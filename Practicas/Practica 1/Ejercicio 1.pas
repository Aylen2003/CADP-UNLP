{ Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos números es el mayor. Si son iguales 
debe informar en pantalla lo siguiente: “Los números leídos son iguales”}

program Ejer1 ;
var 
 num1,num2:integer;
begin
 write('Ingrese el primer numero:');
 readln(num1);
 write('Ingrese el segundo numero:');
 readln(num2);
 if(num1 > num2)then
  writeln('El numero mayor es:',num1)
 else
  begin
   if(num2 > num1)then
    writeln('El numero mayor es:',num2)
   else
    writeln('Los numeros son iguales');
   end;
end.
