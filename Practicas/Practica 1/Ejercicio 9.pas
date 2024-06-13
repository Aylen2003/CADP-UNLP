{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter, debe informar un error y finalizar. 
Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la 
operación leída con la secuencia de números, e imprimir el resultado final.
Por ejemplo: 
  - Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
  - Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

program Ejer9;
var
 carac:char;
 num:integer;
 resf:integer;
begin
 writeln('Escriba un caracter (debe ser + o -):');
 readln(carac);
 resf:=0;
 if(carac = '+') or (carac = '-') then begin
   readln(num);
   if(carac = '+') then begin
     while(num <> 0) do begin
       resf:= resf + num; 
        read(num);
     end;
   end
   else begin
     readln(num);
     while(num <> 0)do begin
       resf:= resf - num;
       readln(num);
     end;
   end;
   writeln('El resultado es:', resf);
 end
 else
   write('no es + ni - ');
end.
