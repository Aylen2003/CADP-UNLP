{ Un treatro está analizando la información de los tickets vendidos durante el año 2022. Para ello, se
dispone de una estructura de datos con la información de todos los tickets vendidos. De cada ticket se
conoce el código del evento, dni del comprador, mes de la función (entre 1 y 12) y ubicación (1:Palco, 
2:Pullman, 3: Platea alta, 4: Platea baja). La información se encuentra ordenada por código de evento.
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ubicación;

Realizar un programa que procese la información de los viajes y:
A. Genere una lista que tenga por cada código de evento, la cantidad de tickets vendidos. 
B. Informe el mes con mayor monto recaudado. 
C. COMPLETO: Informe el promedio recaudado por cada evento entre todos sus tickets. 

}

program Tema2;
const
 m = 12; 
 u = 4;
type
  meses = 1..m;
  ubicacion = 1..u;
  eventos = record
     evento,comprador: integer;
     mes: meses;
     ubi: ubicacion;
