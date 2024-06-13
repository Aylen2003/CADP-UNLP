{ Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC. De cada alumno se lee nombre y 
nota obtenida en el módulo EPA (la nota es un número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe 
procesarse. Al finalizar la lectura informar:
  - La cantidad de alumnos aprobados (nota 8 o mayor) y
  - La cantidad de alumnos que obtuvieron un 7 como nota
}

program Ejer3;
var 
 nombre:string[30];
 nota,apro,siete:integer;
begin
	apro:=0;
	siete:=0;
	repeat
	  write('Ingrese nombre');
	  readln(nombre);
	  write('Ingrese la nota:');
	  readln(nota);
	  if(nota >= 8)then
	    apro:=apro + 1
	  else 
	     if(nota = 7)then
	        siete:=siete + 1;
	until(nombre='Zidane Zinedine');
	write('La cantidad de alumnos aprobados es',apro,'y la cantidad de alumnos que obtuvieron 7 como nota fueron',siete);
end.
