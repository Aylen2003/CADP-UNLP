{ La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al espacio en la última década. De cada 
sonda se conoce su nombre, duración estimada de la misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías: 1. radio; 
2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma Realizar un programa que lea y almacene la información de
todas las sondas espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse. 
Una vez finalizada la lectura, informar: 

1. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento). 
2. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
3. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas. 
4. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas. 

Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible*
}

program Ejercicio6;
type
 rango = 1..7;
 cadena = string[50];
 sonda = record
   nom: cadena;
   duracion:integer;
   construcion: real;
   mensual: real;
   espectro: rango;
  end;
  lista = ^nodo;
  nodo = record
   dato: sonda;
    sig: lista;
 end;

  vContador = array[rango] of integer; // vector conatdor

procedure leerSonda(var s:sonda);
begin
 write ('Ingrese el nombre de la sonda:');
 readln(s.nom);
 write ('Ingrese la duracion estimada de la mision:');
 readln(s.duracion);
 write ('Ingrese el costo de construccion:');
 readln(s.construcion);
 write ('Ingrese el costo de mantenimiento mensual:');
 readln(s.mensual);
 write ('Ingrese el rango del espectro electromagnetico:');
 readln(s.espectro);
end;
procedure agregarAdelante(var l:lista; s:sonda);
var
 nue:lista;
begin
 new (nue);     
 nue^.dato:= s; 
 nue^.sig:= l; 
 l:= nue;      
end;
procedure Almacenar(var l:lista; var promDuracion,costProm: real);
var
 s:sonda;
 duraTotal,cosTotal:real;
 cant:integer;
begin
  duraTotal:= 0;
  cosTotal:= 0;
  cant:= 0;
  repeat
    leerSonda(s);
    duraTotal:= duraTotal + s.duracion;
    cosTotal:= cosTotal + s.construcion;
    cant:= cant + 1;
    agregarAdelante(l,s);
  until(s.nom = 'GAIA');
  promDuracion:= duraTotal / cant;
  costProm:= costProm / cant;
end;
function CostoSonda(s:sonda):real;
begin
  CostoSonda:= s.construcion + (s.duracion * s.mensual);
end;
procedure maximmo(s:sonda; var nomMax:cadena; var costMax:real);
var
 cos: real;
begin
  cos:= CostoSonda(s);
  if (cos > costMax) then begin
   costMax:= cos;
   nomMax:= s.nom;
  end;
end;
procedure InicializarVector(var v: vContador);
var
 i:rango;
begin
 for i:= 1 to 7 do begin
    v[i]:= 0;
 end;  
end;
procedure ProcesarLista(l:lista; promDuracion,costProm: real);
var
 costMax:real;
 nomMax:cadena;
 v: vContador;
 cantSuperDuracion,i:integer;
begin
 costMax:= -1;
 cantSuperDuracion:= 0;
 InicializarVector(v);
 while (l <> nil) do begin
   v[l^.dato.espectro]:=  v[l^.dato.espectro] + 1;
   if(l^.dato.duracion > promDuracion)then
      cantSuperDuracion:= cantSuperDuracion + 1;
   if(l^.dato.construcion > costProm) then
      writeln('La sonda que supera el costo promedio de todas las sondas es:'l^.dato.nom); 
   maximmo(l^.dato, nomMax,costMax);
   l:= l^.sig;
 end;
 writeln('El nombre de la sonda mas costosa es:', nomMax);
 writeln('La cantidad de sondas cuya duracion estimada supera la duración promedio es:', cantSuperDuracion);
 for i:= 1 to 7 do begin
   writeln(i,v[i]);
 end;
end;

// Programa Principal
var
 l:lista;
 promDuracion,costProm:real;
begin
 l:= nil;
 Almacenar(l,promDuracion,costProm);
 ProcesarLista(l,promDuracion,costProm); 
end.           
