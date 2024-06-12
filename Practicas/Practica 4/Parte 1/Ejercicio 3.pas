{ Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la mitad más uno hacia la última posición.
d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición X hasta la Y. Asuma que tanto X
  como Y son menores o igual a la dimensión lógica. Y considere que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia 
  adelante o hacia atrás.
e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
}

program Ejer3;
{A}
procedure posicionAaB(v:vector; dimL:integer);
var
  i:integer;
begin
  for i:= 1 to dimL do 
   writeln('En la posicion',i,'esta el numero:',v[i]); 
end;
{B}
procedure posicionBaA(v:vector; dimL:integer);
var
 i:integer;
begin
  for i:= 1 downto 1 do 
   writeln('En la poscion',i,'esta el numero:',v[i]);
end;
{C}
procedure poscionMitad(v:vector;dimL:integer);
var
 i,mitad:integer;
 num:integer;
begin
  num:=1;
  mitad:= dimL DIV 2;
  for i:=mitad to num do 
   writeln('En la posicion',i,'se encuntra el numero:',v[i]);
  
  for i:= mitad to dimF do
   writeln('En la posicion',i,'se encuntra el numero:',v[i]);
end;
{D}
procedure posicionXeY(v:vector; X, Y:integer);
var
 i:integer;
begin
  if(X <= Y)then
   for i:= X to Y do
     writeln(v[i])
 else
   for i:= Y downto X do
     writeln(v[i]);
end;
var
 v:vector;
 dimL:integer;
begin
 posicionXeY(v,dimL); // inciso E, lo generalise para a,b,c
end.
