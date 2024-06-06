{ Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). 
La lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
Informar los dos códigos de género más elegidos.
b. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program Ejer1;
type
 rangoGe = 1..5;
 actores=record
   dni:integer;
   nombre:string;
   apellido:string;
   edad:integer;
   cod_ge:rangoGe;
end;
 lista=^nodo;
 nodo=record
   dato:actores;
   sig:lista;
end;
vectorContador = array [1..5]of integer;

procedure leerActores(var a:actores);
begin
  write('DNI:');
  readln(a.dni);
  write('Nombre:');
  readln(a.nombre);
  write('Apellido:');
  readln(a.apellido);
  write('Edad:');
  readln(a.edad);
  write('Codigo (del 1 al 5):');
  readln(a.cod_ge);
end;
procedure AgregarAtras(var L,ult:lista; a:actores);
var
 nue:lista;
begin
  new(nue);
  nue^.dato:=a;
  nue^.sig:=nil;
  if(L = nil)then
    L:=nue
  else
    ult^.sig:=nue;
  ult:=nue;
end;
procedure cargarLista(var L:lista);
var
 a:actores;
 ult:lista;
begin
  repeat
    leerActores(a);
    AgregarAtras(L,ult,a);
  until(a.dni = 33555444);
end;
function descomponer(num:integer):boolean;
var
 pares,impares:integer;
begin
  pares:=0;
  impares:=0;
  while(num <> 0)do begin
    if(num MOD 2 = 0)then
      pares:=pares+1
    else
      impares:=impares+1;
    num:=(num DIV 10);
  end;
  descomponer:=pares > impares;
end;
procedure inicializar(var vc:vectorContador);
var
 i:integer;
begin
  for i:= 1 to 5 do begin
    vc[i]:=0;
  end;
end;
procedure generosMasElegidos(vc:vectorContador);
var
 i:integer;
 codMax,codMax2,cantMax,cantMax2:integer;
begin
  cantMax:=-1;
  cantMax2:=-1;
  for i:= 1 to 5 do begin 
    if(vc[i] > cantMax)then begin
      codMax2:=codMax;
      cantMax2:=cantMax;
      codMax:=i;
      cantMax:=vc[i];
    end
    else if(vc[i] > cantMax2)then begin
      codMax2:=i;
      cantMax2:=vc[i];
    end;
  end;
end;
procedure digitos(L:lista);
var
 cantpar:integer;
 aux:lista;
 vc:vectorContador;
begin
  aux:=L;
  cantpar:=0;
  inicializar(vc);
  while(aux <> nil)do begin
    if(descomponer(aux^.dato.dni))then
      cantpar:=cantpar+1;
      vc[aux^.dato.cod]:=vc[aux^.dato.cod]+1;
      aux:=aux^.sig;
    end;
    generosMasElegidos(vc);
    writeln('Hay',cantpar,'personas con mas digitos pares que impares en su DNI');
end;
procedure eliminar(docu:integer; var L:lista);
var
 aux,actual:lista;
begin
  actual:=L;
  while((actual <> nil)and(actual^.dato.dni <> docu))do begin
    aux:=actual;
    actual:=actual^.sig;
  end;
  if(actual<>nil)then begin
    if(actual=L)then begin
      L:=L^.sig;
      dispose(actual);
    end
    else begin
      aux^.sig:=actual^.sig;
      dispose(actual);
    end;
  end;
end;
var
 L:lista;
begin
	L:=nil;
	cargarLista(L);
	digitos(L);
end.
