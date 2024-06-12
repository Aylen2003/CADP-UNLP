{ El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As, con el objetivo de evaluar si 
  se cumple la proporción de alumnos por docente calculada por la UNESCO para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con 
  información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide 
  implementar un programa que procese la información y determine:
  
    - Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
    - CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.

El programa debe utilizar:

a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad de alumnos y la cantidad de docentes).
}

program Ejer3;
type 
  escuela=record
   Cue: integer;
   nombre:string[20];
   cant_docentes:integer;
   cant_alumnos:integer;
   localidad:string[10];
 end;

{a)Un módulo para la lectura de la información de la escuela}
procedure leer_escuela(var e:escuela);
begin
  readln(e.Cue);
  readln(e.nombre);
  readln(e.cant_docentes);
  readln(e.cant_alumnos);
  readln(e.localidad);
end;
{b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
 de alumnos y la cantidad de docentes).}
procedure DosEscuelasConMejorRelacion(cueActual:integer; nombreActual:string; var mejorCue:integer; var nombreMejorCue:string; var segundoCue:integer; var nombreSegundoCue:string);
begin
 if( cueActual > mejorCue)then
 begin
   segundoCue:= mejorCue;
   nombreSegundoCue:= nombreMejorCue;
   
   mejorCue:= cueActual;
   nombreMejorCue:= nombreActual;
 end
 else
   if( cueActual > segundoCue)then begin
     segundoCue:= cueActual;
     nombreSegundoCue:= nombreActual;
 end;
end;
function relacionEstaPorEncimaUnesco(relacionActual : real):boolean;
begin
 relacionEstaPorEncimaUnesco:= relacionActual > (1/23.435);
end;
{Programa Principal}
var
 i:integer;
 e:escuela;
 relacionActual:real;
 cantEscuelasPorEncimaRelacionUnesco:integer;
 mejorCue,segundoCue:integer;
 nombreMejorCue1, nombreMejorCue: String; 
begin
  cantEscuelasPorEncimaRelacionUnesco:=0;
  mejorCue:= -1;
  segundoCue:= -1;
  for i:= 1 to 2400 do begin
  {a) Un módulo para la lectura de la información de la escuela.}
    leer_escuela(e);
    {b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
    de alumnos y la cantidad de docentes).}
    relacionActual:= e.cant_alumnos / e.cant_docentes;
    if( relacionEstaPorEncimaUnesco(relacionActual ) ) then
     cantEscuelasPorEncimaRelacionUnesco:=cantEscuelasPorEncimaRelacionUnesco +1;
    DosEscuelasConMejorRelacion(e.cue, e.nombre, mejorCue, nombreMejorCue1, segundoCue, nombreMejorCue);
  end;
  {● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
   ● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.}
    
  write('la cantidad de escuelas con una relación de alumnos por docente superior a la sugerida por UNESCO es : ', cantEscuelasPorEncimaRelacionUnesco);
  write('los dos CUES y nombres con mejor relación entre docentes y alumnos son: ' , mejorCue, nombreMejorCue1, segundoCue, nombreMejorCue);
end.
