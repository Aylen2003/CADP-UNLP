{Analice el siguiente programa:}

1. program memoria;
2. type
3.   datos = array [1..20] of integer; {20 x 2 = 40 bytes}
4.   punt = ^datos; {4 bytes}
5.
6. procedure procesarDatos(v : datos; var v2 : datos);
7. var
8.  i, j : integer;
9. begin
10.   for i := 1 to 20 do
11.      v2[21 - i] := v[i];
12. end;
13.
14. var
15.   vect : datos; {40 bytes}
16.   pvect : punt; {4 bytes}
17.   i : integer; {2 bytes}
18. begin {46 bytes}
19.   for i:= 1 to 20 do
20.     vect[i] := i; {no cambia la ocupacion ya que lo que sucede es que se agregan datos a ocupaciones ya "ocupadas"}
21.   new(pvect);
22.   for i:= 20 downto 1 do
23.      pvect^[i] := 0;  {40 bytes en dinamica}
24.    procesarDatos(pvect^, vect);
25.    writeln(‘fin’); {no cambio nada de la ocupacion porque lo que hizo el proceso 'procesarDatos' fue solo mover valores dentro de estructuras ya creadas}
26. end.

{Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18 : 46 bytes
b) Hasta la sentencia de la línea 20 : 46 bytes
c) Hasta la sentencia de la línea 23: 40 bytes  
d) Hasta la sentencia de la línea 11: en la linea 11 aun no comenzo la ejecucion del principal entonces no se ocupo nada aun.
e) Hasta la sentencia de la línea 25: no cambio nada de la ocupacion porque lo que hizo el proceso 'procesarDatos' fue solo mover valores 
dentro de estructuras ya creadas }
