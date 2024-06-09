{ Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el número 123456, el cual no debe 
procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la cantidad de dígitos impares que posee.
}

program Ejer8;
procedure digitosPI(num:integer; sumaPar:integer; var cantDI:integer);
var
digito:integer;
begin
 sumaPar:=0;
 cantDI:=0;
 while(num<>0)do 
  begin
   digito:= num MOD 10;
   if(digito MOD 2)=0 then
     sumaPar:=sumaPar+digito
   else
    cantDI:=cantDI+1;
    num:=num DIV 10;
   end;
end;
var 
 numero,sumP,cantDigImpares:integer;
begin
  sumP:=0;
	writeln('Ingrese un numero');
	readln(numero);
	while(numero <> 1234)do
	  digitosPI(numero,sumP,cantDigImpares);
	  writeln('La suma de sus digitos pares es:',sumP);
	  writeln('La cantidad de digitos impares es:',cantDigImpares);	
end.
