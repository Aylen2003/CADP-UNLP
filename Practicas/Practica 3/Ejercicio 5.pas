{ Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee: marca, modelo y precio. La 
  lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La información se ingresa ordenada por marca. Se pide calcular e informar:
  a. El precio promedio por marca.
  b. Marca y modelo del auto más caro
}

program Ejer5;
type
  auto=record
   marca:string;
   modelo:string;
   precio:real
 end;
 
procedure leerAuto(var a:auto);
begin
  writeln('Ingrese la marca del auto');
  readln(a.marca);
  if(a.marca <> 'zzz')then begin
   writeln('Ingrese el modelo del auto');
   readln(a.modelo);
   writeln('Ingrese el precio del auto');
   readln(a.precio);
 end; 
end;

procedure Maximo(a:auto; var precioMax:real; var marcaMax,modeloMax:string);
begin
  if(a.precio > precioMax)then begin
    precioMax:=a.precio;
    marcaMax:=a.marca;
    modeloMax:=a.modelo;
  end;
end;

// Programa Principal
var 
  a:auto;
  cant:integer;
  total:real;
  marca_actual:string;
  precioMax:real;
  marcaMax,modeloMax:string;
begin
	leerAuto(a);
  marcaMax:='';
  modeloMax:='';
  precioMax:= -1;
	while(a.marca <> 'zzz')do begin
	  cant:=0;
	  total:=0;
	  marca_actual:=a.marca;
	   
	 while(a.marca=marca_actual)do begin
	   cant:= cant+1;
	   total:= total+a.precio;
	   Maximo(a,precioMax,marcaMax,modeloMax);

	   leerAuto(a);
	 end;
	 writeln('El precio promedio para los autos',marca_actual,'es',total/cant);
 end;
 writeln('La marca y el modelo del auto mas caro es',marcaMax, 'con el modelo', modeloMax);
end.
