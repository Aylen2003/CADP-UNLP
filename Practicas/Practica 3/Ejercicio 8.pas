{ La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa Jóvenes y Memoria durante la 
convocatoria 2020. Cada proyecto posee un código único, un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos 
que participan del proyecto, el nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La 
información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que lea la información de 
los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e informe:

  - Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
  - Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
  - Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}

program Ejercicio8;
type
 docente = record
	 DNI:string;
	 nombre:string;
	 apellido:string;
	 email:string;
   end;
 proyecto =record
	 codigo:integer;
	 titulo:string;
	 docentecoordinador:docente;
	 cantidadAlumnos:integer;
	 nombreEscuela:string;
	 localidad:string;
   end;

procedure leerDocente(var d:docente);
begin
 writeln('Ingrese el DNI del docente: ');
 readln(d.DNI);
 writeln('Ingrese el nombre del docente: ');
 readln(d.nombre);
 writeln('Ingrese el apellido del docente: ');
 readln(d.apellido);
 writeln('Ingrese el email del docente: ');
 readln(d.email);
end;

procedure leerinfo(var proyecto1:proyecto);
begin
 writeln('Ingrese el codigo del proyecto: ');
 readln(proyecto1.codigo);
 if (proyecto1.codigo<>-1) then begin
     writeln('Ingrese la localidad del proyecto: ');
	 readln(proyecto1.localidad);
	 writeln('Ingrese el titulo del proyecto: ');
	 readln(proyecto1.titulo);
	 writeln('Ingrese la cantidad de alumnos que participan del proyecto: ');
	 readln(proyecto1.cantidadAlumnos);
	 writeln('Ingrese el nombre de la escuela del proyecto: ');
	 readln(proyecto1.nombreEscuela);
	 writeln('Ingrese datos del docente: ');
	 leerDocente(proyecto1.docentecoordinador);
   end;
end;

procedure maximos (p2:proyecto;var maxEscue1,maxEscue2:integer;var maxnomEscue1,maxEscue2:string;var totalAlumnos:integer);
begin
 if (totalAlumnos>maxEscu1) then begin
	 maxEscue2:=maxEscue1;
	 maxEscue1:=totalAlumnos;
	 maxnomEscue2:=maxnomEscue1;
	 maxnomEscue1:=p2.nombreEscuela;
   end
   else if (totalAlumnos>maxEscue2) then begin
     maxEscue2:=totalAlumnos;
	 maxnomEscue2:=p2.nombreEscuela;
  end;
end;

function localidadD(codigo:integer):boolean;
var
 cantidadP,cantidadI,descomponer:integer;
begin
 cantidadP:=0;cantidadI:=0;
 while (codigo <> 0) do begin
	 descomponer:=codigo mod 10;
	 if (descomponer mod 2=0) then
	     cantidadP:=cantidadP +1
	 else
		 cantidadI:=cantidadI +1;
	 codigo:=codigo div 10;
   end;
   localidadD:=(cantidadP=cantidadI);
end;

{Programa Principal}
var
 p:proyecto;
 localidadAct,maxnomEscue,maxnomEscue2,escuela:string;
 cantidadEL, maxescuela,maxescuela2,cantidadE,totalAlumnos:integer;
begin
 maxescuela:=-1;maxescuela2:=-1;cantidadE:=0;
 leerinfo(p);
 while (p.codigo<>-1) do begin
	 if (p.localidad='Daireaux') and (localidadD(p.codigo)=true) then
		 writeln('El titulo del proyecto, ',p.titulo,' es de Diareaux y su codigo tiene la misma cantidad de digitos impares como pares.');
	 localidadAct:=p.localidad;
	 cantidadEL:=0;
     while (p.codigo<>-1) and (p.localidad=localidadAct) do begin
		 escuela:=p.nombreEscuela;
		 cantidadE:=cantidadE +1;
		 totalAlumnos:=0;
		 while (p.codigo<>-1) and (p.localidad=localidadAct) and (escuela=p.nombreEscuela) do begin
			 totalAlumnos:=totalAlumnos + p.cantidadAlumnos;
			 cantidadEL:= cantidadEL +1;
			 leerinfo(p);
		  end;
		  maximos(p,maxescuela,maxescuela2,maxnomEscue,maxnomEscu2,totalAlumnos);
	  end;
	  writeln('La cantidad de escuelas para la localidad ',localidadAct,' es de: ',cantidadEL);
  end;
	writeln('La escuela con mayor cantidad de alumnos participantes es: ',maxnombreescuela,' y la segunda escuela con mayor cantidad de alumnos participantes es: ',maxnombreescuela2);
	writeln('La cantidad de escuelas que participaron fue de: ',cantidadE);
end.
