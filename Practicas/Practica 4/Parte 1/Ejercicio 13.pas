{ El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los años mediciones de temperatura en 100 puntos 
diferentes del planeta y, para cada uno de estos lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y 
con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un programa que lea y almacene los 
datos correspondientes a las mediciones de los últimos 50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la 
información, obtener:
a. el año con mayor temperatura promedio a nivel mundial.
b. el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}

program Ejer13;
const
 LUGAR= 100;
 anioI= 1972;
 anioF= 2022;
type
 vector= array[1..100]of real; 
 anios= array[1972..2022]of vector; 

procedure cargar(var v:anios);
var 
 temperatura:real;aux:real;
 anio,punto:integer;
begin
 for anio:= anioI to anioF do begin 
   for punto:= 1 to LUGAR do begin
     writeln('Ingrese la temperatura promedio anual');
     readln(temperatura);
     aux:=v[anio];
     aux[punto]:= temperatura; 
   end;
 end;
end;

procedure maximo(promedio:real;var max:real;var anioMax:integer;anio:integer);
begin
 if(promedio > max)then begin
   max:= promedio;
   anioMax:= anio;
 end;
end;

procedure mayor(temp:real;var maxTemp:real;anio:integer;var anioMayor:integer);
begin
 if(temp > maxTemp)then begin
   maxTemp:= temp;
   anioMayor:= anio;
 end;
end;

var
 v:anios; 
 anio,punto,anioMayor,anioMax:integer;
 temp,max,promedio,maxTemp:real;
begin
 maxTemp:= -1;max:= -1;
 anioMayor:= 0;anioMax:= 0;
 cargar(v);
  for anio:= anioI to anioF do begin 
   temp:= 0;
   for punto:= 1 to LUGAR do begin
     temp:= temp+v[anio][punto]; 
     mayor(v[anio][punto],maxTemp,anio,anioMayor); 
   end;
   promedio:= temp/LUGAR;
   maximo(promedio,max,anioMax,anio);
 end; 
 writeln('El año con mayor temperatura promedio a nivel mundial',anioMax);
 writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años',anioMayor);
end.
