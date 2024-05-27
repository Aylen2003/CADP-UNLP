program ejercicio6;
//procesos y funciones
procedure leerNumeros;
var
 numero,numeroMax:integer;
begin
 numeroMax:=-1;
 write('Ingrese numero:');
 readln(numero);
 while(numero >= 0)do begin
     if(numero MOD 2 = 0)then begin
         if(numero > numeroMax)then
             numeroMax:=numero;
      end
      else 
         writeln('Tu numero no es par');

      writeln();
      writeln('--- Siguiente numero ---');
      writeln();

      write('otro numero:');
      readln(numero);
   end;
   writeln('El numero mas alto PAR es', numeroMax);
end;

begin
 leerNumeros;
 write('Presione enter para finalizar');
 readln();
end.
