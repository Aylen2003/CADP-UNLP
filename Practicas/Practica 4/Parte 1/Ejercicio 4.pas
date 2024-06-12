{ Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.
b. **intercambio:crecibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde se intercambiaron los valores 
  de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector.
f. elementoMinimo: retorna la posicion del menor elemento del vector.
}

program Ejer4;
{A}
function posicion(X,dimL:integer; v:vector):integer;
begin
  if(X <= dimL)and(X > 1)then
   posicion:= v[X]
  else
   posicion:= -1;
end;
{B}
procedure Intercambio(X,Y:integer; var v:vector);
var
 aux:integer;
begin
 aux:= v[X];
 v[X]:= v[Y];
 v[Y]:= aux;
end;
{C}
procedure sumarVector(v:vector; dimL,suma:integer);
var
 i:integer;
begin
 suma:=0;
 for i:= 1 to dimL do 
   suma:=suma + v[i];
end;
{D}
function promedio(v:vector, dimL:integer):real;
var
 suma:integer;
begin
 sumaVector(v,dimL,suma); 
 
 promedio:= sumaVector(v,dimL)/ dimL;
end;
{E}
function elementoMaximo(v:vector; dimL:integer):integer;
var
 i,max:integer;
begin
  max:= -1;
  for i:= 1 to dimL do  begin
   if(v[i] > v[max])then
     max:= i;
 end;
 elementoMaximo:= max;
end;
{F}
function elementoMinimo(v:vector; dimL:integer):integer;;
var
 i,min:integer;
begin
  min:= 1;
  for i:= 1 to dimL do begin
   if(v[i] < v[min])then
     min:=i;
 end;
 elementoMinimo:= min;
end;
var
  v:vector;
  dimL,X,Y,suma:integer; 
begin
  posicion(v,dimL,X);
  Intercambio(X,Y,v);
  sumarVector(v,dimL,suma);
  promedio(v, dimL);
  elementoMaximo(v,dimL);
  elementoMinimo(v,dimL);
end.
