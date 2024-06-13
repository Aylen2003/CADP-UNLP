{ Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información sobre todos los 
viajes realizados durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero 
transportado y distancia recorrida por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa una distancia 
recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
  - El monto promedio transportado de los viajes realizados
  - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
  - La cantidad de viajes realizados cada día del mes.
c.  Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}

program Prac4P2Ejer3;
const
 df = 200;
type
 viaje = record
	 dia: integer;
	 monto: real;
	 distancia: real;
   end;
 viajes = array [1..df] of viaje;
 vpordias = array [1..31] of integer;
{zona de declaracion de Procesos y Funciones}

procedure leerViaje(var via: viaje);
begin
 writeln('Ingrese los datos del viaje:');
 write('Distancia:');
 readln(via.distancia);
 if (via.distancia <> 0)then begin
	 write('Dia:');
	 readln(via.dia);
	 write('Monto:');
	 readln(via.monto);
  end;
end;

procedure cargarViajes(var vMarzo:viajes; var dl:integer);
var
 via: viaje;
begin
 dl:= 0;
 leerViaje(via);
 while (via.distancia <> 0) and (dl < df) do begin
	 dl:= dl +1;
	 vMarzo[dl]:=via;
	 leerViaje(via);
  end;
end;

procedure setearCeros(var v:vpordias);
var
 i: integer;
begin
 for i:=1 to 31 do begin
	 v[i]:=0;
   end;
end;

procedure sumarMonto(monto: real; var montoTotal:real);
begin
 montoTotal:= monto + montoTotal;
end;

procedure calcMin(via: viaje; var menos: viaje);
begin
 if (via.monto < menos.monto) then begin
	 menos:= via;
   end;
end;

procedure recorrerViajes(via: viajes; dl: integer);
var
 i: integer;
 montoT:real;
 menos: viaje;
 viajesPorDia: vpordias;
begin
 montoT:= 0;
 menos.monto:= 9999;
 setearCeros(viajesPorDia);
 for i:=1 to dl do begin
	 sumarMonto(via[i].monto,montoT);
	 calcMin(via[i],menos);
	 viajesPorDia[via[i].dia]:= viajesPorDia[via[i].dia] + 1;
  end;
 writeln('El monto promedio de los viajes realizados es de: $',(montoT/dl):0:2);
 writeln('El día del mes en que se realizó el viaje que transportó menos dinero fue',menos.dia,' y su distancia recorrida fue ',menos.distancia);
 for i:=1 to 31 do begin
	 writeln('La cantidad de viajes realizados para el dia ',i,' es de ',viajesPorDia[i],' viajes');
   end;
end;

procedure eliminarPos(var v: viajes; var dl:integer; pos: integer);
begin
 dl:= dl-1;
 for pos:= pos to dl do begin
	 v[pos]:= v[pos+1];
   end;
end;

procedure eliminarViajes100(var v:viajes;var dl: integer);
var
 i:integer;
begin
 for i:=1 to dl do
     if (v[i].distancia=100) then begin
		 eliminarPos(v,dl,i);
	  end;
end;

var
 vMarzo: viajes;
 dl:integer;
begin
 cargarViajes(vMarzo,dl);
 recorrerViajes(vMarzo,dl);
 eliminarViajes100(vMarzo,dl);
end.
