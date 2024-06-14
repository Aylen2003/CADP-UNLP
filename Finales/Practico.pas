{Se dispone de un vecor de caracteres ordenados alfabéticamente(de a lo sumo 100 elementos) que pueden aparecer repetidos. Se pide generar un vector
que contenga la cantidad total de repeticiones de cada uno de los caracteres alfabeticos. Luego imprimir el vector resultante.}

program ContarRepeticionesDeCaracteres;
const
  df = 100;
type

  vector = array[1..df] of char;
  contador = array['a'..'z'] of integer;

procedure inicializar(var v2 : contador);
var
  i : char;
begin
  for i := 'a' to 'z' do
    v2[i] := 0;
end;

procedure recorrer(v1 : vector; var v2 : contador; diml : integer);
var
  dl, cont : integer;
  aux : char;
begin
  dl := 1;

  while(dl <= diml) do begin

    aux := v1[dl];
    cont := 0;
    while(dl <= diml) and (v1[dl] = aux) do begin
      v2[aux] := v2[aux] + 1;
      dl := dl + 1;
    end;

  end;

end;

procedure imprimir(v2 : contador);
var
  i : char;
begin
  for i := 'a' to 'z' do
    writeln(i,' ',v2[i]);
end;

var
  v1 : vector; //se dispone;
  v2 : contador;
  diml : integer;
begin

  v1[1] := 'a';
  v1[2] := 'b';
  v1[3] := 'b';
  v1[4] := 'c';
  v1[5] := 'h';
  diml := 5;

  inicializar(v2);
  recorrer(v1,v2,diml);
  imprimir(v2);

  readln;
end.

