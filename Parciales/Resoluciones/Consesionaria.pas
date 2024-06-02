{Una concesionaria de la ciudad de La Plata necesita un programa para administrar
información de ventas de autos efectuadas en febrero de 2020. Para ello, se debe leer la
información de las ventas realizadas. De cada venta se lee: código de venta, modelo de
auto, DNI del cliente al que se vendió el auto, día de la venta (1..28). La información de las
ventas se lee de manera ordenada por modelo de auto y finaliza cuando se ingresa el
modelo ‘ZZZ’ (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada modelo de auto, la cantidad de veces
que fue vendido. Esta estructura debe quedar ordenada por modelo de auto.
B) Calcular e informar el día del mes en que se realizaron más ventas a clientes con DNI
impar.
C) Calcular e informar el porcentaje de ventas con código par.}

program Concesionaria;
const
 r = 28;
type 
 cadena = string[50];
 rango = 1..r;
 ventas = record
   codigo,dni: integer;
   auto: cadena;
   dia: rango;
 end;
 lista = ^nodo;
 nodo = record
   dato: ventas;
   sig: lista;
 end;
 vector = array [rango] of integer;

procedure leerInfo(var v: ventas);
begin
 writeln('Ingrese el modelo del auto:'); readln(v.auto);
 if (v.auto <> 'ZZZ')then begin
    writeln('Ingrese el codigo de la veta:'); readln(v.codigo);
    writeln('Ingrese el dni del cliente:'); readln(v.dni);
    writeln('Ingrese el dia de la ventas (entre 1 y 28):'); readln(v.dia);
 end;
end;

procedure insertarOrdenado(var L:ista; v:ventas);
var
 nue,act,ant: lista;
begin
 new(nue); nue^.dato:= v; ant:= L; act:= L;
 while(act <> nil) and (v.auto > act^.dato.auto) do begin
   ant:= act;
   act:= act^.sig;
 end;
 if (act = ant) then
   L:= nue
 else
   ant^.sig:= nue;
 nue^.sig:= act;
end;

procedure CargarLista(var L: lista);
var
 v:ventas;
begin
 leerInfo(v);
 while(v.auto <> 'ZZZ') do begin
     insertarOrdenado(L,v);
     leerInfo(v);
end;

procedure InicializarVector(a:vector);
var
 i: rango;
begin
 for i:= 1 to r do 
   a[i]:= 0;
end;

function dniImpar(dni: integer):boolean;
begin
  dniImpar:= ((dni MOD 2) = 1);
end;

procedure maximo(a:vector; var max: integer);
var
 cant: integer;
 i: rango;
begin
 cant:= -1;
 for i:= 1 to r do begin
   if (v[i] > cant)then begin
     cant:= v[i];
     max:= i;
   end;
 end;
end;

function Condicion(codigo: integer): boolean;
begin
 Condicion:= ((codigo MOD 2) = 0);
end;

procedure Procesar();
{Programa Principal}
var
 L:lista;

begin
 L:= nil;
 CragarLista(L);
end.
   
