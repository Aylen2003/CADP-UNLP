{ Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de la provincia de Buenos Aires. Para 
cada candidato se lee: localidad, apellido del candidato, cantidad de votos obtenidos y cantidad de votantes de la localidad. La lectura finaliza al 
leer la localidad ‘Zárate’, que debe procesarse.
Informar:
  - El intendente que obtuvo la mayor cantidad de votos en la elección.
  - El intendente que obtuvo el mayor porcentaje de votos de la elección.
}

program ejercicio9;
type
    cadena30=string[30];
    candidato=record
         localidad:cadena30;
         apellido:cadena30;
         cantVotos:integer;
         cantVotantes:integer;
    end;

procedure leerCandidato(var c:candidato);
begin
  write('Ingrese la localidad:');
  readln(c.localidad);
  write('Ingrese el apellido:');
  readln(c.apellido);
  write('Ingrese la cantidad de votos:');
  readln(c.cantVotos);
  write('Ingrese la cantidad de votantes');
  readln(c.cantVotantes);
end;

procedure mayorCantVotos(cantVotos:integer;apellido:cadena30;var max:integer; var bbmaxApe:cadena30);
begin 
  if(cantVotos>max)then begin
    max:=cantVotos;
    maxApe:=apellido;
  end;
end;

function porcentaje(cantVotos:integer;totalVotos:integer):real;
begin
  porcentaje:=(cantVotos*100)/totalVotos;
end;

procedure mayorPorcentaje(porActual:real;apellido:cadena30;var maxP:real;var maxNom:cadena30);
begin
  if(porActual>maxP)then begin
    maxP:=porActual;
    maxNom:=apellido;
  end;
end;

// Programa Principal
var  
    can:candidato;
    max,cantTotalVotos:integer;
    maxP,porcentajeActual:real;
    maxApe,maxNom:cadena30;
begin
  max:=-1;
  maxP:=-1;
  cantTotalVotos:=0;
  repeat
    leerCandidato(can);
    cantTotalVotos:=cantTotalVotos+can.cantVotos;
    mayorCantVotos(can.cantVotos,can.apellido,max,maxApe);
    porcentajeActual:=porcentaje(can.cantVotos,cantTotalVotos);
    mayorPorcentaje(porcentajeActual,can.apellido,maxP,maxNom);
  until(can.localidad='Zarate');
  writeln('Intendente con mayor cantidad de votos:',maxApe);
  writeln('Intendente con mayor porcentaje de votos:',maxNom);
end.
