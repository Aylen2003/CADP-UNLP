{ Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos los clientes. Los que le sobren 
se los quedará para él.
  a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la cantidad de clientes (Y), e imprima en pantalla un mensaje 
  informando la cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se quedará para sí mismo.
  b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un valor de $1.60. 
}

// PARTE A
program Ejer5A;
var
  caramelos,clientes:integer;
begin
	write('cuantos caramelos tiene?:');
	read(caramelos);
	write('Cuantos clientes hay?:');
	read(clientes);
	writeln('Le corresponde/n', caramelos DIV clientes,'caramelo/s a cada cliente');
	write('Usted se queda con', caramelos MOD clientes, 'cramalo/s');
end.

// PARTE B
program Ejer5B;
var 
 clientes,caramelos:integer;
begin
	write('cuantos caramelos tiene?:');
	read(caramelos);
	write('Cuantos clientes hay?:');
	read(clientes);
	writeln('Le corresponde/n', caramelos DIV clientes,'caramelo/s a cada cliente');
	write('Usted se queda con', caramelos MOD clientes, 'cramalo/s');
	writeln('Si cada caramelo vale 1.60 pesos, usted se queda con:', caramelos DIV clientes*1.60:1:2,'pesos');   
end.
