{ Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse. 
Informar en pantalla:
  - El número máximo leído.
  - El número mínimo leído.
  - La suma total de los números leídos
}

program Ejer5;
var
  num,min,max,suma:integer;
begin
  suma:=0;
  min:=32765;
  max:=-32766;
  repeat
     write('Ingrese un numero:');
     readln(num);
     suma:=suma+num;
     if(num > max) then
         max:=num;
      if (num < min)then
         min:=num;
   until (num=100);
   writeln('El numero maximo leido es:', max);
   writeln('El numero minimo leido es:', min);
   writeln('La suma total de los numero leido es:', suma);
end.
