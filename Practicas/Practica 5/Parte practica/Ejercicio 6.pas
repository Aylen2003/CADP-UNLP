{ Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
a. El programa debe utilizar sólo memoria estática
b. El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
c. El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4 bytes)
}

// PARTE A
program seisA;
type 
    vectorEnteros = array [1..24999] of integer; {49998}
var
  v:vectorEnteros;
  i:integer;
begin
    for i:=1 to 24999 do 
    begin 
        v[i]:=0; {valido}
        v:=0; {no es valido}
    end;
end.

// PARTE B
program seisB;
type
  puntero = ^integer;
  vectorEnteros= array [1..12498] of integer; {24996}
  vectorPUnteros= array [1..6250] of puntero; {25000}
var
    v:vectorEnteros; 
    p:puntero; {4}
begin
    {25000 bytes estaticos}
     new(p);
end.

// PARTE C
program seisC;
type
  puntero = ^integer;
var
  p, p1:puntero;
begin
   {4 bytes en estatica, y 0 en dinamica}
   new(p); {el sistema operativo busca un espacio de memoria de 2 bytes y cuando lo encuentra lo marca como ocupado}
            {y pone la direccion ocupada en la variable p} { p = 2 y 44}
    {4 bytes en estatica y 2 bytes en dinamica}
    p^:=4; {valido}

    new(p1); {los encuentra en 7 y 50} {p = 7 y 50}
   {4 bytes en estatica y 4 (2 +2) bytes en dinamica}
end.
