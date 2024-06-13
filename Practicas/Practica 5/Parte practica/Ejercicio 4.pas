{ Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.}

// PARTE A
program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;
begin
  pc^:= 'un nuevo texto';
  new(pc);
  writeln(pc^);
end.
// Da error a ejecutarse 

// PARTE B
program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'un nuevo nombre';
  writeln(sizeof(pc^), ' bytes');
  writeln(pc^);
  dispose(pc);
  pc^:= 'otro nuevo nombre';
end.
// Da error a ejecutarse

// PARTE C
program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
  pun^:= 'Otro texto';
end;
var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'Un texto';
  writeln(pc^);
  cambiarTexto(pc);
  writeln(pc^);
end.
// Imprime un texto, otro texto 

// PARTE D
program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
  new(pun);
  pun^:= 'Otro texto';
end;
var
 pc: puntero_cadena;
begin
 new(pc);
 pc^:= 'Un texto';
 writeln(pc^);
 cambiarTexto(pc);
 writeln(pc^);
end.
// Imprime un texto , un texto 
