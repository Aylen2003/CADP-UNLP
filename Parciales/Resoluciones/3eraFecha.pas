{Una revista deportiva dispone de información de los jugadores de fútbol participantes de la liga
profesional 2022. De cada jugador se conoce código de jugador, apellido y nombres, código de 
equipo(1..28), año de nacimiento y la calificación obtenida para cada una de las 27 fechas 
del torneo ya finlizado. La calificación es númerica de 0 a 10, donde el valor 0 significa que el 
jugador no ha participado de la fecha. 
Se solicta:
a. Informar para cada equipo la cantidad de jugadores mayores a 35 años. 
b. Informar los códigos de los 2 jugadores con major calificación promedio en los partidos en los 
que participó. Solo deben considerarse los jugadores que particparon en más de 14 fechas. 
c. (COMPLETO): Implementar e invocar a un módulo que genere una lista con los jugadores cuyo código
posee exactamente 3 dígitos impares y haya nacido entre 1983 y 1990. La lista dbe estar ordenada por 
código de jugador.}

program terceraFecha;
const
  equipos = 28;
  fechas = 27;
type
 rangoE = 1..equipos;
 rangoF = 1..fechas;
 cadena = string[50];
 
 arrPuntuaciones = array [rangoF] of integer;  
 
 jugador = record
    codigo: integer;
    nomYape: cadena;
    equi: rangoE;
    anioNac: integer;
    calificacion: arrPuntuaciones;
 end;
 lista = ^nodo;
 nodo = record
   dato: jugador;
   sig: lista;
end;
vectorEquipos = array [rangoE] of integer;

procedure CargarJugadores(var L:lista); // SE DISPONE

procedure Inicializar(var v:vectorEquipos);
var
  i: rangoE;
begin
  for i:= 1 to equipos do 
     v[i]:= 0;
end;

procedure analizarPuntuaciones(a:arrPuntuaciones, var promedio: real; var fechas: integer);
var
 i: rangoF;
 suma: integer;
begin
 suma:= 0;
 fechas:= 0;
 for i:= 1 to fechas do begin
   if (v[i] <> 0) then begin
     suma:= suma + v[i];
     fechas:= fechas + 1;
   end;
 end;
 promedio:= suma / fechas;
end;

procedure actualizarMaximo(var jug1,jug2:integer; var prom1,prom2:real;jugador: integer; promedio:real);
begin
  if (promedio > prom1)then begin
     jug2:= jug1;
     prom2:= prom1;
     jug1:= jugador;
     prom1:= promedio;
     
 end
 else
    if(promedio > prom2)then begin
       prom2:= promedio;
       jug2:= jugador;
   end;
end;


procedure recorrer(L:lista; var v:vectorEquipos, var jug1,jug2: integer);
var
 prom,pormjug1,promjug2: real;
 cant: integer;

begin
 promjug1:= -1;
 promjug2:= -1;
 while (L <>  nil) do begin
    if(2023 - L^.dato.anioNac > 35)then
      v[L^.dato.equipo]:= v[L^.dato.equipo] + 1;
      
    analizarPuntuaciones(L^.dato.calificaciones, prom, cant);
    if (cant > 14) then 
      actualizarMaximos(jug1,jug2,promjug1,promjug2,L^.dato.codigo,prom);
    L:=: L^.sig;
 end;
end;

procedure imprimir(v:vectorEquipos);
var
  i: rangoE;
begin
 for i:= 1 to equipos do 
    writeln('El equipo', i,'tiene',v[i], 'jugadores de más de 35 anios');
end;

function contarImpares(num:integer): integer;
var
 cant:integer;
begin
  cant:= 0;
  while(num <> 0) do begin
    if (((num MOD 10) mod 2) = 1)then
      cant:= cant + 1;
    num:= num DIV 10;
end;

procedure insertarOrdenado(var L:lista; elem: jugador);
var
 nue,act,ant: lista;
begin
 new(nue); nue^.dato:= 0; ant:= L; act:= L;
 while(act <> nil) and (elem.codigo > act^.dato.codigo) do begin
    ant:= act;
    act:= act^.sig;
 end;
 if (act = ant) then
    L:= nue
 else
   ant^.sig:= nue;
  nue^.sig:= act;
end; 

procedure armarLista2(l:lista; var L2:lista);
begin
  while (L <> nil) do begin
     if (contarImpares(L^.dato.codigo) = 3) and (L^.dato.anioNac >= 1983) and (L^.dato.anioNac <= 1990)then
        insertarOrdenado(L2,L^.dato);
     L:= L^.sig;
  end;
end;
var 
 L,L2:lista;
 v: vectorEquipos;
 jug1,jug2: integer;
begin
 L:= nil;
 L2:= nil;
 CargarJugadores(L); // SE DISPONE
 Inicializar(v);
 recorrer(L,v,jug1,jug2);
 imprimir(v);
 writeln(jug1,jug2)
 armarLista2(L,L2);
end.
