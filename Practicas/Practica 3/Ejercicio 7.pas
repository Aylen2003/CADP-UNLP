{ Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada centro se lee su nombre abreviado (ej. 
LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores y la cantidad de becarios que poseen. La información se lee de 
forma consecutiva por universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:

  - Cantidad total de centros para cada universidad.
  - Universidad con mayor cantidad de investigadores en sus centros.
  - Los dos centros con menor cantidad de becarios.
}

program Ejercicio7;
type
  centro=record
    nombre:string;
    universidad:string;
    becarios:integer;
    investigadores:integer;
  end;

procedure leerCentro(var c:centro);
begin
  readln(c.investigadores);
  if(c.investigadores<>0)then begin
     readln(c.nombre);
     readln(c.universidad);
     readln(c.becarios);
  end;
end;

procedure Maximo(c:centro; var cant_max:integer; var universidad_maximo:string);
begin
  if(c.investigadores>cant_max)then begin
    cant_Max:=c.investigadores;
    universidad_maximo:=c.universidad;
  end;
end;

procedure Minimo(c:centro; var cant_Min1,cant_Min2:integer; var centroMin1,centroMin2:string);
begin
   if(c.becarios<cant_Min1)then begin
     cant_Min2:=cant_Min1;
     cant_Min1:=c.becarios;
     centroMin2:=centroMin1;
     centroMin1:=c.nombre;
   end
  else if(c.becarios<cant_Min2)then begin
     cant_Min2:=c.becarios;
     centroMin2:=c.nombre;
  end;
end;

// Programa Principal
var 
 c:centro;
 universidad_actual:string;
 cantidad_centros:integer;
 cantidad_investigadores:integer;
 universidad_maximo:string;
 cantidad_maximo:integer;
 cantidad_min1,cantidad_min2:integer;
 centroMin1,centroMin2:string;
begin
	cantidad_Min1:=9999;
	cantidad_Min2:=9999;
	cantidad_maximo:=-1;
	leerCentro(c);
	while(c.investigadores<>0)do begin
	  universidad_actual:=c.universidad;
	  cantidad_centros:=0;
	  cantidad_investigadores:=0;
	  while(c.investigadores<>0)and(c.universidad=universidad_actual)do begin
	      cantidad_centros:=cantidad_centros+1;
	      cantidad_Investigadores:=cantidad_investigadores+c.investigadores;
	      Minimo(c,cantidad_min1,cantidad_min2,centroMin1,centroMin2);
	      
	      leerCentro(c);
	 end;
	 Maximo(c,cantidad_maximo,universidad_maximo);
	 write('La universidad',universidad_actual,'tiene',cantidad_centros,'centros');
   end;
	write('La universidad con mas investigadores es',universidad_maximo);
	write('Los dos centros con menos becarios son',centroMin1,'y',centroMin2);
end.
