{Dado el siguiente programa, indicar cuál es el error.}
program alcance4;
function cuatro:integer;
begin
 cuatro:=4;
end;
var a:integer;
begin
 cuatro;	
 writeln(a);
end.

// Error 1: la variable a no esta declarada globalmente, solo en el programa principal. Al utilizarse en el programa 
// principal no la reconoce dado que no esta  declarado en este rango.
// Error2: la función cuatro esta mal invocada.
