{ a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que posee y la suma de los mismos.
  b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la cantidad total de dígitos leídos. La lectura 
  finaliza al leer un número cuyos dígitos suman exactamente 10, el cual debe procesarse.
}

program Ejer7;
procedure descomponer(num: integer; var cantD, sumaD: integer);
var
  aux: integer;
begin
  while (num > 0) do begin
     aux:= num mod 10;
     cantD:= cantD + 1;
     sumaD:= sumaD + aux;
     num:= num div 10;
   end;
end;
procedure leer;
var
 num, cantD, sumaD: integer;
begin
 cantD:= 0;
  repeat
     sumaD:= 0;
     write ('Ingresar num: '); readln(num);
     descomponer(num,cantD,sumaD);
  until (sumaD = 10);
 writeln ('La cantidad total de digitos leidos es: ',cantD);
end;
//Programa principal
begin
  leer;
end.
