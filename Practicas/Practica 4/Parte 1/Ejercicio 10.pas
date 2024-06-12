{ Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 empleados). La carga finaliza cuando 
se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. Una vez finalizada la carga de datos se pide:
a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un módulo que reciba como parámetro un valor 
  real X, el vector de valores reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa
}

program Ejer10;
const
 dimF = 300;
type
 salarios = array[1..dimF] of real;

procedure cargarSalarios (var v: salarios; var dimL: integer);
var 
 num: Real;
begin
  WriteLn('Ingrese un Salario:');
  ReadLn(num);
  while (dimL < dimF) and (num <> 0 ) do begin
     dimL:= dimL + 1;
     v[dimL]:= num; {Le asigna a la dimension logica el valor de numero ingresado}
     WriteLn('Ingrese otro numero:');
     ReadLn(num);
  end;
end;

procedure Incremento(X:real;var v:salarios;dimL:integer);
var 
 i: integer;
begin
 for i:=1 to dimL do begin
	 v[i]:= v[i]*X;
	 writeln('Nuevo sueldo del empleado ',i,' : ',v[i]:2:2,'.');
   end;
end;

procedure Promedio(v:salarios;dimL:integer);
var
 i :integer;
 suma :real;
begin
 suma:=0;
 for i:= 1 to dimL do
	 suma:=v[i];
  writeln('El sueldo promedio es:',suma/dimL:2:2);
end;

var
 dimL,X:integer;
 v:salarios;
begin
 dimL:=0;
 cargarSalarios(v,dimL);
 writeln('Ingrese el 15% que desea aumentar');
 read(X);
 Incremento(X,v,dimL);
 Promedio(v,dimL);
end.
