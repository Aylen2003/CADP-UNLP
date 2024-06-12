{ Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde teclado (a lo sumo 100) y los almacene en 
un vector. La carga finaliza al leer el número 0. Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento,
e informe la operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el elemento
mínimo ... que se encontraba en la posición ...”.
}

program practica4Ejer5;
const
 dimF=100;
type
 vnumeros=array[1..dimF]of integer;

procedure CargarVector(var v:vnumeros; var dimL:integer);
var
 num:integer;
begin
 writeln('Ingrese un numero');
 readln(num);
 while((num<>0)and(dimL<dimF))do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    writeln('Ingrese otro numero');
    readln(num);
 end;  
end;

var 
 v:vnumeros;
 dimL:integer;
begin
	cargarVector(v,dimL);
	Intercambio(v,elementoMaximo(v,dimL),elementoMinimo(v,dimL));
  writeln('El elementon maximo que se enecuntroba en la posion', v[elementoMaximo(v,dimL)],'fue intercambiado con ele elemento minimo que se encontraba en la posicion', v[elementoMinimo(v,dimL)]);
end.
