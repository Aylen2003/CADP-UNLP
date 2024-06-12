{ Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no debe procesarse) e informe:
  a. la cantidad de ocurrencias de cada dígito procesado.
  b. el dígito más leído.
  c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
           *Número 3: 2 veces
          Número 4: 2 veces
        Número 6: 2 veces
       Número 9: 4 veces
     El dígito más leído fue el 9.

Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8*
}

program Ejer7;
type
  rango = 0..9;
  numeros = array [rango] of integer;

function digitoMax (a: numeros): rango;
var
  i,digmax: rango;
  max: Integer;
begin
  max:= -1;
  for i:= 0 to 9 do
    if (a[i] > max) then begin
      max:= a[i];
      digmax:= i;
    end;
  digitoMax:= digmax;
end;

procedure digito (a: numeros);
var
  i: rango;
begin
  for i:= 0 to 9 do
    if (a[i] = 0) then begin
      WriteLn('Los digitos que no tuvieron ocurrencias son: ', i);
    end;
end;

procedure inicializar (var a: numeros);
var
  i: rango;
begin
  for i:= 0 to 9 do
     a[i]:= 0;
end;

procedure descomponer (var a: numeros; num: Integer);
var
  resto: rango;
begin
  while (num <> 0 ) do begin
     resto:= num MOD 10;
     a[resto]:= a[resto] + 1;
     num:= num DIV 10;
  end;
end;

procedure informar (a: numeros);
var
  i: rango;
begin
  for i:= 0 to 9 do begin
  	 if (a[i] > 0) then
         WriteLn('Numero ',i,': ',a[i],'veces ');
  end;
end;

var
  nro : numeros;
  num : Integer;
begin
  ReadLn(num);
  inicializar(nro);
  while (num <> -1) do begin
     descomponer(nro,num);
     ReadLn(num);
  end;
  informar(nro);
  WriteLn('El digito mas leido fue el:', digitoMax(nro));
  digito(nro);
end.
