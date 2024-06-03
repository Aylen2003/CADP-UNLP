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
 
  
