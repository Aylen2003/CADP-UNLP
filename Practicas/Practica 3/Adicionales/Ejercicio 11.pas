{ Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus aviones durante todo el año 2019. De 
cada vuelo se conoce el código de avión, país de salida, país de llegada, cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La 
información se ingresa ordenada por código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
  - Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
  - El avión que salió desde más países diferentes.
  - La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
  - La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}

program Ejercicio11;
type
 vuelo=record
   avion:string;
   salida:string;
   destino:string;
   KM:integer;
   ocupacion:real;
 end;

function esoceania(destino:string):boolean;
var
 ok:boolean;
begin
 ok:=false;
 if((destino='nz')or(destino='aus'))then
   ok:=true;
 esoceania:=ok;
end;

procedure leerVuelo(var dato:vuelo);
//Se leen los datos de un registro
begin
 writeln('codigo de avion');
 readln(dato.avion);
 if(dato.avion<>'44')then begin
   writeln('Lugar de salida:');
   readln(dato.salida);
   writeln('Lugar de destino:');
   readln(dato.destino);
   writeln('KM recorridos:');
   readln(dato.KM);
   writeln('Porecentaje de ocupacion:');
   readln(dato.ocupacion);
 end;
end;

procedure maximos1y2(num:integer;nombre:string;var max1,max2:integer; var nombremax1,nombremax2:string);
//Se calculan dos maximos
begin
 if(num > max1)then begin
   max2:=max1;
   nombremax2:=nombremax1;
   max1:=num;
   nombremax1:=nombre;
 end
 else if(num > max2)then begin
    max2:=num;
    nombremax2:=nombre;
 end;    
end;

procedure minimos1y2(num:integer;nombre:string; var min1,min2:integer; var nombremin1,nombremin2:string);
//Se calcualan dos minimos
begin
  if(num < min1)then begin
    min2:=min1;
    nombremin2:=nombremin1;
    min1:=num;
    nombremin1:=nombre;
  end
  else if(num < min2)then begin
    min2:=num;
    nombremin2:=nombre;
  end;
end;

procedure maximo(num:integer;nombre:string; var  max:integer; var nombremax:string);
//Se calcula un maximo
begin
  if(num > max)then begin
   max:=num;
   nombremax:=nombre;
  end;
end;

// Programa Principal
var 
 v:vuelo;
 actualavion,actualsalida,nombremaxkm1,nombremaxkm2,nombreminkm1,nombreminkm2,nombremaxciudad:string;
 oceaniacorto,bajaganancia,ciudades,kilometros,maxkm1,maxkm2,minkm1,minkm2,maxciudad:integer;
begin
	oceaniacorto:=0;
	bajaganancia:=0;
	maxkm1:=-1;
	maxkm2:=-1;
	minkm1:=3200;
	minkm2:=3200;
	maxciudad:=0;
	nombremaxkm1:=('DATOS INSUFICIENTES');
	nombremaxkm2:=('DATOS INSUFICIENTES');
	nombreminkm1:=('DATOS INSUFIENTES');
	nombreminkm2:=('DATOS INSUFIENTES');
	leervuelo(v);
	while(v.avion<>'44')do begin
	  actualavion:=v.avion;
	  actualsalida:=v.salida;
	  kilometros:=0;
	  ciudades:=1;
	  while((actualavion=v.avion)and(v.avion<>'44'))do begin
	    if(esoceania(v.destino))and(v.KM<10000)then
	       oceaniacorto:=oceaniacorto+1;
	    if((v.ocupacion<=60)and(v.KM>5000))then 
	       bajaganancia:=bajaganancia+1;
	    kilometros:=kilometros+v.KM;
	    if(v.salida<>actualsalida)then begin
	      ciudades:=ciudades+1;
	      actualsalida:=v.salida;
	    end;
	    leervuelo(v);
	 end;
	 maximos1y2(kilometros,actualavion,maxkm1,maxkm2,nombremaxkm1,nombremaxkm2);
	 minimos1y2(kilometros,actualavion,minkm1,minkm2,nombreminkm1,nombreminkm2);
	 maximo(ciudades,actualavion,maxciudad,nombremaxciudad);
  end;
  writeln('Los dos aviones con mas km fueron',nombremaxkm1,'con',maxkm1,'y',nombremaxkm2,'con',maxkm2);
  writeln('Los dos aviones con menos km fueron',nombreminkm1,'con',minkm1,'y',nombreminkm2,'con',minkm2);
  writeln('El avion que despego de mas paises fue',nombremaxciudad,'con',maxciudad);
  writeln('La cantidad de vuelos con poca ganancia fue de',bajaganancia);
  writeln('La cantidad de vuelos cortos a oceania fue de',oceaniacorto);
end.
