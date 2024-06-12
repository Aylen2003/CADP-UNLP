{ En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.irregular), su masa (medida en kg) y 
la distancia en pársecs (pc) medida desde la Tierra. La Unión Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que 
componen el Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a. la cantidad de galaxias de cada tipo.
b. la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el porcentaje que esto representa respecto a la 
  masa de todas las galaxias.
c. la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d. el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}

program Ejer12;
const
 GA = 53;
type
 rango = 1..4;
 cadena = string[30];
 galaxia = record
   nombre:cadena;
   tipo:rango;
   masa:real;
   distancia:real;
 end;
 vector = array[1..GA]of galaxia;
 vContador = array[rango]of integer; 

procedure leer(var g:galaxia);
begin
 writeln('Ingrese el nombre de la galaxia');
 readln(g.nombre);
 writeln('Ingrese el tipo');
 readln(g.tipo);
 writeln('Ingrese la masa');
 readln(g.masa);
 writeln('Ingrese la distancia');
 readln(g.distancia);
end;

procedure cargar(var v:vector;i:integer);
var 
 g:galaxia;
begin
 leer(g);
 v[i]:= g;
end;

procedure inicializar(var vc:vContador);
var 
 i:rango;
begin
 for i:= 1 to 4 do
   vc[i]:= 0;
end;

procedure cargarTipo(var vc:vContador;tipo:rango);
begin
 vc[tipo]:= vc[tipo] + 1;
end;

procedure informarTipo(vc:vContador);
var 
 i:rango;
begin
 for i:=1 to 4 do 
   writeln('Tipo: ',i,' cantidad de galaxias:',vc[i]);
end;

function tresGalaxias(nombre:cadena):boolean;
begin
 tresGalaxias:=(nombre='Via Lactea') or (nombre='Andromeda') or (nombre='Triangulo');
end;

function noIrregular(tipo:rango;distancia:real):boolean;
begin
 noIrregular:=(tipo = 4) and (distancia < 1000);
end;

procedure maximos(var max1,max2:real;var maxNom1,maxNom2:cadena;masa:real;nombre:cadena);
begin
 if(masa > max1)then begin
   max2:=max1;
   max1:=masa;
   maxNom2:=maxNom1;
   maxNom1:=nombre;
 end
 else if(masa > max2)then begin
   max2:=masa;
    maxNom2:=nombre;
 end;
end;

procedure minimos(var min1,min2:real;var minNom1,minNom2:cadena;masa:real;nombre:cadena);
begin
 if(masa < min1)then begin
   min2:=min1;
   min1:=masa;
   minNom2:=minNom1;
   minNom1:=nombre;
 end
 else if(masa < min2)then begin
   min2:= masa;
   minNom2:= nombre;
 end;
end;

var
 v:vector;vc:vContador;
 i,cantNoIrreg:integer;
 masa3,masaTotal,porcentaje,max1,max2,min1,min2:real;
 maxNom1,maxNom2,minNom1,minNom2:cadena;
begin
 max1:= -1;
 min1:= 9999;
 maxNom1:= '';
 minNom1:= '';
 cantNoIrreg:= 0;
 masaTotal:= 0;
 inicializar(vc);
 for i:=1 to GA do begin
   cargar(v,i);
   cargarTipo(vc,v[i].tipo);
   masaTotal:=masaTotal+v[i].masa;
   if(tresGalaxias(v[i].nombre))then
     masa3:=masa3+v[i].masa;
   if(noIrregular(v[i].tipo,v[i].distancia))then
     cantNoIrreg:=cantNoIrreg+1;
   maximos(max1,max2,maxNom1,maxNom2,v[i].masa,v[i].nombre);
   minimos(min1,min2,minNom1,minNom2,v[i].masa,v[i].nombre);
 end;
 porcentaje:=masa3*100/masaTotal;
 informarTipo(vc);
 writeln('La masa total acumulada de las 3 galaxias principales',masa3:2:2);
 writeln('Porcentaje de las 3 galaxias respecto a la masa de todas las galaxias',porcentaje:2:2);
 writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc',cantNoIrreg);
 writeln('Nombre de las dos galaxias con mayor masa',maxNom1,' y ',maxNom2);
 writeln('Las dos galaxias con menor masa',minNom1,' y ',minNom2);
end.
