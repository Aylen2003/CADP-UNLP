{ La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de la UNLP. Para ello, 
esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de 1300 alumnos durante el mes de marzo. De cada viaje 
se conoce el código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo 
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más de un medio de transporte en un 
mismo día. Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje. Realizar un programa que lea 
la información de los viajes de los alumnos y los almacene en una estructura de datos apropiada. La lectura finaliza al ingresarse el código de alumno
-1, que no debe procesarse. Una vez finalizada la lectura, informar: 

  a. La cantidad de alumnos que realizan más de 6 viajes por día 
  b. La cantidad de alumnos que gastan en transporte más de $80 por día 
  c. Los dos medios de transporte más utilizados. 
  d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.
}

program becasUNLP;
const 
 maxAlumnos = 1300;
 maxMedios = 5;
type
 rangoAlumnos = 1..maxAlumnos;
 rangoDias = 1..31;
 rangoMedios = 1..maxMedios;
 viaje = record
	 codAlumno : integer; //para el caso del -1
	 diaMes : rangoDias;
	 facultad : string;
	 medioTransporte : rangoMedios;
 end;
 tablaPrecios = array [rangoMedios] of real;
 tablaMedios = array[rangoMedios] of integer;    
 lista = ^nodo;
 nodo = record
   dato : viaje;
   sig : lista;
 end;	
 vectorAlumnos = array[rangoAlumnos] of lista;
procedure insertarOrdenado (var L : lista; v : viaje);
var
 aux,ant,act : lista;
begin
 new(aux); 
 aux^.dato := v;
 if (L = nil) then begin
   aux^.sig := nil;
   L := aux;      
 end 
 else begin  //insertar ordenado por día del viaje
   act := L;
   while (act^.sig <> nil) and (act^.dato.diaMes < v.diaMes) do begin
     ant := act;
     act := act^.sig;
   end;
   ant^.sig := aux;
   aux^.sig := act;
 end;
end;
procedure leerViaje(var v : viaje);
begin
 readln(v.codAlumno);
 if (v.codAlumno <> -1) then begin
   readln(v.diaMes);
   readln(v.facultad);
   readln(v.medioTransporte);
 end;
end;
procedure cargarViajes(var v : vectorAlumnos);
var
 unViaje : viaje;
 i : rangoAlumnos;
begin
 for i:= 1 to maxAlumnos do 
   v[i] := NIL;
 leerViaje(unViaje);
 while (unViaje.codAlumno <> -1) do begin
   InsertarOrdenado(v[i],unViaje);
   leerViaje(unViaje);
  end;
end;      
procedure procesarAlumno(L : lista; var cantAlumnosMuchosViajes, cantAlumnos80pesos, cantBicicletas : integer; var medios : tablaMedios; precios : tablaPrecios);
var
 usaBici, usaOtroMedio, combinaBici, superaLos6Viajes, superaLos80pesos : boolean;
 diaActual : rangoDias;
 gastoDelDia : real;
 cantViajesDia : integer;
begin
 usaBici := false;  //para ver si un dia usó la bici
 usaOtroMedio := false; //cuando no viaja en bici
 combinaBici := false; //para ver si un día no uso la bici
 superaLos6Viajes := false;
 superaLos80pesos := false;
 while (L<> nil) do begin
   diaActual := L^.dato.diaMes;
   gastoDelDia := 0;
   cantViajesDia := 0;
   while (L<> nil) and (diaActual = L^.dato.diaMes) do begin  //aprovecho que inserte ordenado por dia y hago un corte de control
     gastoDelDia := gastoDelDia + precios[L^.dato.medioTransporte];
     cantViajesDia := cantViajesDia + 1;
     if (L^.dato.medioTransporte = 5) then  //usa bicicleta
       usaBici := true
     else
       usaOtroMedio := true;
     medios[L^.dato.medioTransporte] := medios[L^.dato.medioTransporte] + 1; 
     L := L^.sig;  //pasamos al siguiente doa  
   end;
	  { termine de procesar un dia del alumno, ya puedo sacar muchas conclusiones }
	  if (usaBici and usaOtroMedio) then
	    combinaBici := true;
	  if (gastoDelDia > 80) then  //al menos un dia gasto mas de 80 pesos
	    superaLos80pesos := true;
	  if (cantViajesDia > 6) then //al  menos un dia hizo mas de 6 pesos
	    superaLos6Viajes := true;       
 end;
 //ya termine de procesar todos los viajes del alumno
 if (combinaBici) then
   cantBicicletas := cantBicicletas + 1; 
 if (superaLos6Viajes) then  
   cantAlumnosMuchosViajes := cantAlumnosMuchosViajes + 1;
 if (superaLos80pesos) then
   cantAlumnos80pesos := cantAlumnos80pesos + 1;
end; 
procedure calcularMaximos(medios : tablaMedios; var max1,max2 : rangoMedios);
var
 i, cant1, cant2 : integer;
begin
 cant1 := -1;
 cant2 := -1;
 for i:= 1 to maxMedios do begin
   if (medios[i] > cant1) then begin
     cant2 := cant1;
     max2 := max1;
     cant1 := medios[i];
     max1 := i;
   end
   else if (medios[i] > cant2) then begin
     cant2 := medios[i];
     max2 := i;
   end;
 end;
end;  
procedure procesarDatos(v : vectorAlumnos; precios : tablaPrecios);
var
 medios : tablaMedios;
 i, cantBicicletas, cantAlumnosMuchosViajes, cantAlumnos80pesos : integer;
 max1, max2 : rangoMedios;
begin
 cantAlumnosMuchosViajes := 0; // inciso a
 cantAlumnos80pesos := 0; //inciso b
 for i:=1 to maxMedios do  //vector contador, para el inciso c
   medios[i] := 0;
 cantBicicletas := 0; //inciso d
 for i:= 1 to maxAlumnos do
   procesarAlumno(v[i], cantAlumnosMuchosViajes, cantAlumnos80pesos, cantBicicletas, medios, precios);
 calcularMaximos(medios,max1,max2);
 writeln('Los dos medios de transporte mas utilizados son: ',max1, ' y ',max2);  
 writeln('La cant. de alumnos que realiza más de 6 viajes por día es ',cantAlumnosMuchosViajes);
 writeln('La cant. de alumnos que gastan mas de 80 pesos por día es ',cantAlumnos80pesos);
 writeln('La cant. de alumnos que combinan bicicleta con otro medio de transporte es ',cantBicicletas);
end;
procedure cargarPrecios(var p : tablaPrecios);
var
 i : rangoMedios;
begin
  for i:= 1 to maxMedios do
    p[i] := i * 10;  //asi los precios me quedan 10, 20, 30...
end;
{programa principal}
var
 v : vectorAlumnos;
 precios : tablaPrecios;
begin
 cargarPrecios(precios); //se dispone, pero la implemento para que me compile
 cargarViajes(v);
 procesarDatos(v,precios);
end.
