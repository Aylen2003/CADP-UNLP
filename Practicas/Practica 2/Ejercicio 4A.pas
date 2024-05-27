{Dado los siguientes programas, explicar la diferencia.}
program alcance4a;
var 
 a,b:integer;
procedure uno;
begin
 a:=1;
 writeln(a);
end;
BEGIN
  a:=1;
  b:=2;
  uno;
  writeln(b,a);	
END.

program alcance4b;
procedure uno;
begin
 a:=1;
 writeln(a);
end;
var 
 a,b:integer;
BEGIN
  a:=1;
  b:=2;
  uno;
  writeln(a,b);	
END.

// La diferencia entre el programa 4A y 4b, reside en la declaración de las variables, ya que , 
// en el programa 4A, las variables están declaradas correctamente ; En cambio, en el programa 4B 
// la variable A no esta declarada globalmente, solo están declaradas en el programa principal.  
// Al utilizarse en el programa principal, no se la reconoce debido a que no esta declarada en ese rango.
