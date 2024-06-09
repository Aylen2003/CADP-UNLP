{ Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#, donde:
  - A es una secuencia de sólo letras vocales
  - B es una secuencia de sólo caracteres alfabéticos sin letras vocales
  - los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}

program Ejercicio10; 
function esVocal(letra: char): boolean;
begin
      esVocal:= (letra = 'a')or (letra = 'e') or (letra = 'i')or(letra = 'o')or(letra = 'u')or(letra = 'A')or(letra = 'E')or(letra = 'I')or(letra = 'O')or(letra = 'U');
end;

procedure validarA (var cumple: boolean);
var 
 letra: char;
begin
writeln('Ingrese la secuencia A');
readln(letra);
while((letra <>  '$') and (cumple)) do begin
   if (not esVocal(letra)) then
      cumple:= false
   else {NICO: no hace falta leer si no cumple}
  readln(letra);
end; 
 end;

function esConsonante(letra: char): boolean;
var 
 ok: boolean;
begin
      if((((letra >= 'a') and (letra <= 'z')) or ((letra >= 'A') and (letra <= 'Z'))) and (not esVocal(letra))) then
        ok:= true
      else
        ok:= false;
        
        esConsonante:= ok;
end;
 
procedure validarB (var cumple: boolean);
var 
 letra: char;
begin
writeln('Ingrese la secuencia B');
readln(letra);
while((letra <>  '#') and (cumple)) do begin
  if (not esConsonante(letra)) then
    cumple:= false
  else
  readln(letra); 
 end;
 end;
 
var
   cumple: boolean;
begin 
   cumple:= true;
   validarA(cumple);
   if (cumple) then begin //if A
     validarB(cumple);
     if (cumple) then  
     //if B
       writeln('Cumplio la secuencia')
     else
       writeln('No cumplio B')
   end //end if A
   else
     writeln('No cumplio A');    
end.
