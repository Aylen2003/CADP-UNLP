{Dado el siguiente programa:}

program alcanceYFunciones; 
var 
 suma, cant : integer; 
function calcularPromedio: real 
var 
  prom : real; 
begin 
  if (cant = 0) then 
     prom := -1 
   else 
     prom := suma / cant; 
  end; 
  
begin { programa principal } 
  readln(suma); 
  readln(cant); 
  if (calcularPromedio <> -1) then begin 
     cant := 0; 
     writeln('El promedio es:', calcularPromedio) 
  end; 
  else 
   writeln('Dividir por cero no parece ser una buena idea'); 
end.
{a. La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero parece incompleta. ¿qué debería
  agregarle para que funcione correctamente?
b. En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse. ¿cómo debería modificarse el programa 
  principal para invocar a dicha función una única vez?
c. Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el programa? Considere las tres posibilidades:
  - El programa original
  - El programa luego de realizar la modificación del inciso a)
  - El programa luego de realizar las modificaciones de los incisos a) y b)}

// Parte A
program alcanceYFunciones; 
var 
suma, cant : integer; 
function calcularPromedio : real;
var 
 prom : real; 
begin 
  if (cant = 0) then 
     prom := -1 
  else 
     prom := suma / cant; 
  calcularPromedio:=prom;
end; 
begin { programa principal } 
 readln(suma); 
 readln(cant); 
 if (calcularPromedio <> -1) then begin 
     cant := 0; 
     writeln('El promedio es:',calcularPromedio) 
  end 
  else 
     writeln('Dividir por cero no parece ser una buena idea'); 
end.

// Parte B
program alcanceYFunciones; 
var 
suma, cant : integer; 
function calcularPromedio : real;
var 
 prom : real; 
begin 
  if (cant = 0) then 
     prom := -1 
  else 
     prom := suma / cant; 
  calcularPromedio:=prom;
end;
var
 promedio:real;
begin { programa principal } 
 readln(suma); 
 readln(cant); 
 promedio:=calcularPromedio;
 if (calcularPromedio <> -1) then begin 
     cant := 0; 
     writeln('El promedio es:',promedio);
  end 
  else 
     writeln('Dividir por cero no parece ser una buena idea'); 
end.
// Parte C
{ i. El primer programa retorna error dado que una función siempre debe retornar un valor.
  ii. Retorna  -1 
  iii. Retorna 8 }
