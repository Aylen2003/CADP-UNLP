{ Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones. De cada camión se tiene: patente, 
año de fabricación y capacidad (peso máximo en toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De cada viaje se lee: código de viaje, código 
del camión que lo realizó (1..100), distancia en kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. 
La lectura finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.
}

program ejercicio5;
type
 str20=string[20];
 camion=record
   patente:LongInt;
   anioFa:integer;
   pesoMa:real;
end;
 camiones = array [1..100] of camion;
 camionesKM = array [1..100] of real;
 lista=^nodo;
 viajes=record
  codigo:integer;
  codCamion:1..100;
  km:real;
  destino:str20;
  anoViaje:integer;
  DNI:LongInt;
end;
nodo=record
  dato:viajes;
  sig:lista;
end;
procedure inicializarVector(var v:camionesKM);
var
 i:integer;
begin
  for i:= 1 to 100 do
    v[i]:=0;
end;
procedure leerRegistro(var R:viajes);
begin
  writeln('Introducir el codigo de viaje');
  readln(R.codigo);
  if(R.codigo <> -1)then begin
    writeln('Introducir el codigo de cambio');
    readln(R.codCamion);
    writeln('Introducir los KM recorridos');
    readln(R.km);
    writeln('Introducir la ciudad de destino');
    readln(R.destino);
    writeln('Introducir el año de viaje');
    readln(R.anoViaje);
    writeln('Introducir el DNI del chofer');
    readln(R.DNI);
 end;
end;
procedure leerLista(var L:lista);
var
 nuevo:lista;
 R:viajes;
begin
  leerRegistro(R);
  while(R.codigo <> -1)do begin
    new(nuevo);
    nuevo^.dato:=R;
    nuevo^.sig:=L;
    L:=nuevo;
    leerRegistro(R);
  end;
end;
procedure maxMin(v:camionesKm; v2:camiones; var max:LongInt; var min:LongInt);
var
 i:integer;
 kmMax,kmMin:real;
begin
  kmMax:=-1;
  kmMin:=9999;
  for i:= 1 to 100 do begin
    if(v[i] > kmMax)then begin
      kmMax:=v[i];
      max:=v2[i].patente;
   end;
   if(v[i]<kmMin)then begin
    kmMin:=v[i];
    min:=v2[i].patente;
   end;
 end;
end;
function Condicion(peso:real; anoFa:integer; ano:integer):boolean;
begin
  Condicion:=(peso>30.5)and(ano-anoFa>5);
end;
function Condicion2(DNI:LongInt):boolean;
var
 impar:boolean;
begin
  impar:=false;
  while(DNI<>0)and(Not Impar)do begin
    if((DNI MOD 10 )MOD 2 = 0)then
      impar:=true;
    DNI:= DNI DIV 10;
   end;
   Condicion2:= Not Impar;
end;
procedure analizarLista(L:lista; v:camiones);
var
 patenteMax,patenteMin:LongInt;
 camionesKMVec:camionesKM;
 condicionV:integer;
begin
  inicializarVector(camionesKMVec);
  condicionV:=0;
  while(L <> nil) do begin
    camionesKMVec[L^.dato.codCamion]:=camionesKMVec[L^.dato.codCamion]+L^.dato.km;
    if(Condicion(v[L^.dato.codCamion].pesoMa,v[L^.dato.codCamion].anoFa,L^.dato.anoViaje))then
      condicionV:=condicionV+1;
      if(condicion2(L^.dato.DNI))then
        writeln('El DNI del chofer es',L^.dato.DNI);
      L:=L^.sig;
    end;
    maxMin(camionesKMVec,v,patenteMax,patenteMin);
    writeln('La patente con mayor recorrido es',patenteMax);
    writeln('La patente con menor recorrido es',patenteMin);
    writeln('Los camiones que cumple la condicion son',condicionV);
end;
{Programa Principal}
var
 pri:lista;
 camionesVec:camiones;
begin
	pri:=nil;
	CargraVector(camionesVec); // se dispone
	leerLista(pri);
	analizarLista(pri,camionesVec);
end.
