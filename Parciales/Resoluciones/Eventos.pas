{Un salón de eventos necesita un programa para administrar la información de las reservas de diciembre de 2023. Se dispone de una estructura
con la información de las reservas. De cada reserva se conoce: número de reserva, DNI del cliente, dia del evento (1..31), hora de iniicio,
hora de fin y categoria de servicio (1..4). Además, se dispone de una tabla con el precio por hora de reserva de acuerdo de cada categoría de servicio.
Se pide:
A) Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse ordenada por numero de reserva.
B) Informar los dos días del mes con mayor cantidad de reservas de clientes con DNI par.
C) Informar el porcentaje de reservas de eventos que inicien antes de las 12hs y se produzcan en la primera quincena,}

program Eventos;
type
  dias = 1..31;
  categorias = 1..4;
  tabla = array [categorias] of real; // SE DISPONE
  reserva = record
      num,DNI: integer;
      dia: dias;
      inicio, fin: integer;
      categoria: categorias;
  end;
  lista = ^nodo;
  nodo = record
     dato: reserva;
     sig: lista;
   end;
  nueva = record   
     num: integer;
     total: real;
   end;
 lista2 = ^nodo2;
 nodo2 = record
     dato: nueva;
     sig: lista2;
   end;
 vector = array [dias] of integer;

procedure CargarTabla(var T: tabla); // SE DISPONE

procedure CargarLista(var L:lista); // SE DISPONE 

procedure GenerarLista2(var L2:lista2; r2: nueva);
var
 nue, ant,act:lista2;
begin
  new(nue);
  nue^.dato:= r2; 
  ant:= L2;
  act:= L2;
  while (act <> nil) and (r2.num > act^.dato.num) do begin
      ant:= act;
      act:= act^.sig;
  end;
  if (ant = act) then
     L2:= nue
  else
     ant^.sig:= nue;
   nue^.sig:= act;
end;

procedure InicializarVector(var v: vector);
var
 i: dias;
begin
   for i:= 1 to 4 do
      v[i]:= 0 ;
end;

procedure maximo(v:vector; var max1,max2: integer);
var
 cant1,cant2: integer;
 i: dias;
begin
  cant1:= -1;
  cant2:= -1;
  for i:= 1 to 31 do begin 
     if (v[i] > cant1) then begin
         cant2:= cant1;
         max2:= max1;
         cant1:= v[i];
         max1:= i;
      end
      else
         if (v[i] > cant2) then begin
          cant2:= v[i];
          max2:= i;
       end;
  end;
end;

function Descoponer(num: integer): Boolean;
begin
   Descoponer:= ((num MOD 2) = 0);
end;

procedure ProcesarInfo(L:lista; var L2:lista2; var max1,max2: integer; var porcentaje: real; T: tabla);
var
 r2: nueva;
 quincena,cant: integer;
 v: vector;
begin
  InicializarVector(v);
  quincena:= 0;
  cant:= 0;
  while (L <> nil) do begin
      r2.num:= L^.dato.num;
      r2.total:= T[L^.dato.categoria] * L^.dato.inicio - L^.dato.fin;
      GenerarLista2(L2, r2);
      if (Descoponer(L^.dato.DNI)) then
         v[L^.dato.dia]:= v[L^.dato.dia] + 1;
      if (L^.dato.inicio < 12) and (L^.dato.dia <= 15) then
         quincena:= quincena + 1;
      cant:= cant + 1;
      L:= L^.sig;        
  end;
  maximo(v,max1,max2);
  porcentaje:= quincena * 100 / cant;
end;

var
 t:tabla;
 L2:lista2;
 L1:lista;
 max1,max2: integer;
 porcentaje: real;
begin
  L1:= nil;
  L2:= nil;
  CargarTabla(T);
  CargarLista (L);
  ProcesarInfo(L1,L2,max1,max2,porcentaje,T);
  writeln('Los dos días de mayor cantidad de reservas son:', max1, 'y' ,max2);
  writeln('El procentaje de reservas que inician antes de las 12hs es:', porcentaje);
end.
