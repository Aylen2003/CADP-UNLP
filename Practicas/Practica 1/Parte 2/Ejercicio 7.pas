{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se lee el nombre del piloto y 
el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100 autos. Informar en pantalla: Los nombres de los dos pilotos 
que finalizaron en los dos primeros puestos. Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
}

program Ejer7;
var 
 i,timeUp1,timeUp2,timeDown1,timeDown2,time:integer;
 nom,nomUp1,nomUp2,nomDown1,nomDown2:string;
begin
  writeln('Escriba 100 pilotos y sus tiempos:');
  timeUp1:=-9999;
  timeUp2:=-9999;
  timeDown1:=9999;
  timeDown2:=9999;
  nomUp1:='';
  nomUp2:='';
  nomDown1:='';
  nomDown2:='';
  for i:= 1 to 10 do begin
    writeln('Escriba el piloto:');
    readln(nom);
    writeln('Escriba su tiempo:');
    readln(time);
    if(time > timeUp1)then begin
     timeUp2:=timeUp1;
     timeUp1:=time;
     nomUp2:=nomUp1;
     nomUp1:=nom;
   end
   else begin
     if(time > timeUp2)then begin
       timeUp2:=time;
       nomUP2:=nom;
     end;
   end;
   if(time<timeDown1)then begin
     timeDown2:=timeDown1;
     timeDown1:=time;
     nomDown2:=nomDown1;
     nomDown1:=nom;
   end
   else begin
     if(time<timeDown2)then begin
       timeDown2:=time;
       nomDown2:=nom;
     end;
   end;
 end;
 writeln('El primer piloto fue',nomDown1,'y el segundo fue',nomDown2);
 writeln('El ultimo piloto fue',nomUp1,'y el anteultimo',nomUp2);
end.
