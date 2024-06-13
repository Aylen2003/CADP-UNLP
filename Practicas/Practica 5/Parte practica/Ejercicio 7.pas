{ Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener una longitud máxima de 50 caracteres.}
{a. Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño de memoria que requiere la estructura.}
type   
   cadena = String[50];   {51 bytes}
   ciudades = array [1..2500]of cadena; { 51 x 2500 = 127500 bytes}
var 
  c:ciudades;
begin 
end.
{b. Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que superen los 64 Kb, pensar en utilizar un vector de
punteros a palabras, como se indica en la siguiente estructura:}
type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
var
Punteros: ArrPunteros;
{b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.}
 4 x 2500 = 10000 bytes reservados en memoria dinamica
{b.2)scribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de memoria reservada después de ejecutar el módulo? 
¿La misma corresponde a memoria estática o dinámica?}
procedure CrearNombre(arrP:ArrPunteros);
var
  i:integer;
begin
  for i:= 1 to 2500
    new(arraP[i]);
end;
{ b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}
procedure leerNombre(arrP:ArrPunteros);
var
  i:integer;
begin
   for i:= 1 to 2500
     readln(arrP[i]^);
end;
