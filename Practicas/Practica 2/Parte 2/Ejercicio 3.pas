{ Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía, indicar en qué línea se 
  encuentra cada error y en qué consiste:
  }

1. program ejercicio5;
2. {suma los números entre a y b, y retorna el resultado en c}
3. procedure sumar(a, b, c : integer)
4. var
5.  suma : integer;
6. begin
7. 
8.   for i := a to b do
9.     suma:= suma + i;
10.   c := c + suma;
11. end;
12. var
13.  result : integer;
14. begin
15.   result := 0;
16.   readln(a); readln(b);
17.   sumar(a, b, 0);
18.   write('La suma total es ',result);
19.   {averigua si el resultado final estuvo entre 10 y 30}
20.   ok := (result >= 10) or (result <= 30);
21.   if (not ok) then
22.   write ('La suma no quedó entre 10 y 30');
23. end.

{ Linea 3: c tiene que estar pasado por referencia 
  procedure  sumar (a,b:integer; var c: integer)
Linea 8: i no esta declarada en el modulo
Linea 9: Suma no esta inicializada  en el modulo  
    suma:=0
Linea 16: a y b no están declaradas en el programa 
    a,b:integer;
Linea 17: sumar tiene los parametros  mal pasados
    sumar(a,b,result) 
Linea 20: ok no esta declarada en el modulo y esta mal puesto el or entre las dos condiciones 
    ok: boolean
    ok:= (result >= 10 )AND(result <= 30);
}
