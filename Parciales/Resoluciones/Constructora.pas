program constructora;
const
  dF = 3500;
type
  rango = 1..dF;
  cadena = string[50];
  departamento = record
      superficie: integer;
      montoT: real;
      localida: cadena;
  end;
  lista = ^nodo;
  nodo = record
    dato: departamento;
    sig: lista;
  end;
 arrDepar = array[rango] of departamento; // vector de registros

// Programa Principal 
var 
  a: arrDepar;
  L:lista;
begin
 L:= nil;
 CargarVector(a); // SE DISPONE
 recorrerVector(a,L);
end.

procedure CargarVector(var a:arrDepar); // Se dispone

procedure agregarAtras()
