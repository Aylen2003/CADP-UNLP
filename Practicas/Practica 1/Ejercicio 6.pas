{ Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza cuando se ingresa el 
legajo -1, que no debe procesarse. 
Por ejemplo, se lee la siguiente secuencia:
  33423 
  8.40 
  19003 
  6.43
  -1 
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43, y finalmente 
el legajo-1 (para el cual no es necesario leer un promedio).
Al finalizar la lectura, informar: 
  - La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
  - La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
  - El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 (en el ejemplo anterior 
  se debería informar 0%.}

program Ejer6;
var
 legajo,cantAlu,cantAluProm: integer;
 promedio,destacados: real;
begin
 cantAlu:= 0;
 cantAluProm:= 0;
 destacados:= 0;

 write ('Ingrese el legajo:');
 readln(legajo);
 while (legajo <> -1) do begin
    write('Ingrese promedio:');
    readln(promedio);
    cantAlu:= cantAlu + 1;
    if(promedio > 6.5)then
      cantAluProm:= cantAluProm + 1;
    if(promedio > 8.5) and (legajo < 2500)then
       destacados:= destacados + 1;
    write ('Ingrese el legajo:');
    readln(legajo);
 end;
   destacados:= destacados * 100 / cantAlu;
  writeln('La cantidad de alumnos leido fue:', cantAlu);
  writeln('La cantidad de alumnos con promedio mayor a 6.5 es:',cantAluProm);
  writeln('El procentaje de alumnos destacados es:', destacados:2:2,'%');
end.
