program Ejer12;
const
 z1=6.0;
 z2=2.6;
 z3=1.4;
 precio=320.0;
 HectFin=900;
 localFin='Saladillo';
type
 subzona=1..3;
 cadena=string[25];
 
procedure Leer(var hect:integer; var zona:subzona; var localidad:cadena);
begin
  writeln('Ingrese el nombre de la localidad del campo:');
  readln(localidad);
  writeln('Ingrese la cantidad de hectareas sembradas:');
  readln(hect);
  writeln('Ingrese el tipo de zona de siembre(1-2-3):');
  readln(zona);
end;
function Rendimiento(zona:subzona;hect:integer;precioPorTonelada:real):real;
var
 ton,precioTotal:real;
begin
  case zona of
     1:ton:=z1*hect;
     2:ton:=z2*hect;
     3:ton:=z3*hect;
  end;
 precioTotal:=ton*precioPorTonelada;
 Rendimiento:=precioTotal;
end;

{Nota: podriamos refactorizar para usar funcion}
procedure TresFebrero(localidad:cadena; precioTotal:real; var tresFeb:integer);
begin
  if(localidad='Tres de Febrero')and(precioTotal>10000)then 
    tresFeb:=tresFeb+1;
end;
procedure Maximo(localidad:cadena; precioTotal:real; var locaMax:cadena; var rendMax:real);
begin
  if(precioTotal>rendMax)then begin
   rendMax:=precioTotal;
   locaMax:=localidad;
  end;
end;
procedure Minimo(localidad:cadena; precioTotal:real; var locaMin:cadena; var rendMin:real);
begin 
  if(precioTotal<rendMin)then begin
    rendMin:=precioTotal;
    locaMin:=localidad;
  end;
end;
var 
 precioTotal,rendMax,rendMin,totalEstimado:real;
 zona:subzona;
 cont,hect,tresFeb:integer;
 localidad,locaMin,locaMax:cadena;
 begin
  tresFeb:=0;
  cont:=0;
  rendMax:=-9999;
  rendMin:=999999;
  totalEstimado:= 0;
  repeat
    Leer(hect,zona,localidad);
    precioTotal:=Rendimiento(zona,hect, precio); {NICO: Le mandamos la constante}
    TresFebrero(localidad,precioTotal,tresFeb);
    Maximo(localidad,precioTotal,locaMax,rendMax);
    Minimo(localidad,precioTotal,locaMin,rendMin);
    totalEstimado:= totalEstimado + precioTotal; {Sumar montos de cada campo}
    cont:=cont+1;
   until((localidad=localFin)and (hect=hectFin));
   
   writeln('La cantidad de campos de Tres de Febrero con rendimiento estimado superior a 10.000 dolares es de:',tresFeb);
   writeln('El campo con mayor rendimiento esperado es:',locaMax);
   writeln('El campo con menor rendimento esperado es:',locaMin);
   writeln('El redimiento economico promedio es de:',totalEstimado/cont:0:2);
   readln();
   readln();  
end.
