{ Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
  a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}

program Ejer1;
const
  fin=10; 
var
i,num,suma,cant:integer;
begin
  suma:=0;
  cant:=0;
  for i:=1 to fin do begin
     write('Ingrese un numero');
     read(num);
     suma:=suma+num;
     if(num > 5)then
	     cant:=cant+1;
  end;
  writeln('La suma total es:',suma);
  writeln('La cantidad de numeros mayores a 5 es:',cant);
end.
