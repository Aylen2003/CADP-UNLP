{ Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la información de los productos que mantiene 
actualmente en stock. Para ello, se conoce la siguiente información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, 
Opteron, Atom, Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en 
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de forma consecutiva por marca de 
procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no debe procesarse). Se pide implementar un programa que lea información
de los microprocesadores de la empresa importadora e informe:

  - Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
  - Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
  - Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.
}

program Ejer6;
type
 str20=string[20];
 Microprocesador=record
   marca:str20;
   linea:str20;
   cantCores:integer;
   relojGhz:real;
   tamaneoNm:real;
 end;
 max14nm=record
  marca:str20;
  cantProce14nm:integer;
 end;

procedure leer(var micro:Microprocesador);
begin
  writeln('Colocar la cantidad de Cores');
  readln(micro.cantCores);
  if(micro.cantCores<>0)then begin
    writeln('Marca del Microporcesador');
    readln(micro.marca);
    writeln('Linea del Microprocesador');
    readln(micro.linea);
    writeln('Reloj en Gigaherzios');
    readln(micro.relojGhz);
    writeln('Tamaño de Nanometros');
    readln(micro.tamaneoNm);
  end;
end;

function DosCore22nm(micro:Microprocesador):boolean;
begin
  DosCore22nm:=(micro.cantCores>2)and (micro.tamaneoNm<=22);
end;

function intelAMDEspecifico(micro:Microprocesador):boolean;
begin
  intelAMDEspecifico:=((micro.marca='Intel')or(micro.marca='AMD'))and(micro.cantCores>1)and(micro.relojGhz>=2);
end;

procedure max(proce14nm:integer; marca:str20; var max14nm1,max14nm2:max14nm);
begin
  if(proce14nm>max14nm1.cantProce14nm)then begin
    max14nm2.cantProce14nm:=max14nm1.cantProce14nm;
    max14nm2.marca:= max14nm1.marca;
    max14nm1.marca:=marca;
  end
  else
   if(proce14nm>max14nm2.cantProce14nm)then begin
    max14nm2.cantProce14nm:=proce14nm;
    max14nm2.marca:=marca;
  end; 
end;

// Programa principal
var 
  micro:Microprocesador;
  max14nm1,max14nm2:max14nm;
  marca:str20;
  proce14nm,intelAMD:integer;
begin
	leer(micro);
	max14nm1.cantProce14nm:=0;
	max14nm2.cantProce14nm:=0;
	max14nm1.marca:='';
	max14nm2.marca:='';
	intelAMD:=0;
	while(micro.cantCores<>0)do begin
	  marca:=micro.marca;
	  proce14nm:=0;
	  while(micro.cantCores<>0)and(marca=micro.marca)do begin
	    if(DosCore22nm(micro))then
	      writeln('El microprocesador de marca',micro.marca,'y linea',micro.linea,'tiene mas de 2 nucleos y a lo suma un tamaño no 22nm');
	    if(intelAMDEspecifico(micro))then
	       intelAMD:=intelAMD+1;
	    if(micro.tamaneoNm=14)then
	       proce14nm:=proce14nm+1;
	    leer(micro);
	  end;
	 max(proce14nm,marca,max14nm1,max14nm2);
  end;
  writeln('Las dos marcas con mayor cantidad de procesadores con transitores de 14nm son:',max14nm1.marca,'y',max14nm2.marca);
  writeln('La cantidad de procesadores multicore de Intel o AMD,cuyos relojes alcanzan velocidades de al menos 2 Ghz son:',intelAMD);
end.
