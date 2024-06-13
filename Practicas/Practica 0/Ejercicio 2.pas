{ Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos números:
  a. Utilizando una variable adicional.
  b. Sin utilizar una variable adicional.
}

// PARTE A
program Ejer2A;
var 
 numero1:integer;
 numero2:integer;
 suma:integer;
begin
	writeln('Introduce el primer numero');
	readln(numero1);
	writeln('Introduce el segundo numero');
	readln(numero2);
	suma:= numero1+numero2;
	writeln('La suma de los dos numeros es:',suma);
end.

// PARTE B
program Prac0Ejer2B;
var 
 numero:integer;
 numero2:integer;
begin
	write('Introduce un numero:');
	readln(numero);
	write('Introduce otro numero:');
	readln(numero2);
	write('La suma de los dos numeros es:');
	writeln(numero+numero2);
end.
