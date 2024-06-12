{ El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2019. Para ello, cuenta con 
  información de las fechas de todos los casamientos realizados durante ese año.
  
1. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
2. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso a. 
3. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al ingresar el año 2020, que no debe 
procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos 
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}

program Ejer2;
type
  fecha=record
    dia:1..31;
    mes:1..12;
    anio:2019..2020;
  end;
procedure leer_fecha(var f:fecha);
begin
  writeln('Ingrese el anio');
  readln(f.anio);
  if(f.anio <> 2020)then begin
    writeln('Ingrese el dia');
    readln(f.dia);
    writeln('Ingrese el mes');
    readln(f.mes);
 end;
end;
var 
 f:fecha;
 casamientoEnVerano:integer;
 primerosDias:integer;
begin
	casamientoEnVerano:=0;
	primerosDias:=0;
	leer_fecha(f);
	while(f.anio<>2020)do begin
	   if(f.mes = 1) or (f.mes= 2 )or (f.mes= 3)then
	     casamientoEnVerano:=casamientoEnVerano+1;
	   if(f.dia<=10)then
	     primerosDias:=primerosDias+1;
	   leer_fecha(f);
   end;
writeln('La cantidad de casmientos de los meses verano es:',casamientoEnVerano);
writeln('La cantidad de casamientos en los primero 10 dias es:',primerosDias);
end.
