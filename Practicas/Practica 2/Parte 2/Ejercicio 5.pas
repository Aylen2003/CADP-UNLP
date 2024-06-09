{ a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA
  b. Utilizando el módulo *realizado* en el inciso a., realizar un programa que lea secuencias de pares de números hasta encontrar el par (0,0), e 
  informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es el doble de numA.

  Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4 (cantidad de pares leídos) y 
  2 (cantidad de pares en los que numB es el doble de numA).
}

program ejercicio5;
//procesos y funciones
procedure leerNumeros(var numA,numB:integer);
begin
 writeln();
 write('Primer Par:'); 
 readln(num1);
 write('Segundo Par:'); 
 readln(num2);
 writeln();
end;
function esDoble(num1,num2:integer):boolean;
begin
 if(num1 * 2 = num2)then 
	 esDoble:=true
 else 
	 esDoble:=false;
end;
var //variables del PP
 num1,num2:integer;
 contadorNumeros,contadorDoble:integer;
begin //comienzo del PP
 contadorNumeros:=0; //aca contamos todos los numeros pares leidos
 contadorDoble:=0; //aca contamos los numeros pares(x,y) donde y es el doble de x
	
 leerNumeros(num1,num2); //proceso 1
 //estructura While -> corte 0,0
 while((num1 <> 0) OR (num2 <> 0))do begin
	 contadorNumeros:=contadorNumeros + 1;
	 if(esDoble(num1,num2))then begin
		 writeln('El segundo numero es el doble del primero num1:',num1,'-> num2:',num2);
		 contadorDoble:=contadorDoble + 1;
	  end
	 else 
		 writeln('No es el doble');
	    leerNumeros(num1,num2); //proceso1
	end;
	writeln('Cantidad de numeros leidos:',contadorNumeros,'- cantidad de pares en los que num2 es el doble de num1:',contadorDoble);
	write('Presione enter para finalizar'); 
	readln();
end.
