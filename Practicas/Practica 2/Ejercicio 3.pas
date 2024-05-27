{Dado el siguiente programa, indicar cuál es el error y su causa.}
program alcance3; 
var a: integer; 
procedure uno; 
var b: integer;
begin 
  b:= 2; 
  writeln(b); 
end; 
begin 
  a:= 1; 
  uno; 
  writeln(a, b);
 end.

// El programa da error, porque la variable B no esta declarada globalmente, solo en el proceso.
// Al utilizarse en el programa principal no la reconoce, dado que no esta declarada en este rango.
