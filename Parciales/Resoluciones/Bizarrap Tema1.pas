{El productor musical Bizarrap orginaza sesiones musicales con diferentes artistas. Implementar un programa que lea
y almacene información de dichas sesiones. De cada sesión se lee: titulo de sesión, nombre del artista, genero
musical(1: Trap Latino, 2: Reggaeton, 3: Urban, 4: Electrónica, 5: Pop Rap) y cantidad de visualizaciones en YouTube.
La lectura finaliza cuando se lee la sesion del artista con nombre "Peso Pluma", la cual debe procesarse. La información
debe quedar almacenada en una estructura de datos ordenada por título de sesión de forma ascendente.
Una vez leída y almacenada la información, se pide:
A) Informar los dos codigos de genero musical con mayor cantidad de visualizaciones en YouTube.
B) Informar la cantidad de sesiones del género "Reggaeton" cuya cantidad de visualizaciones contiene la misma
cantidad de dígitos pares que impares.
C) COMPLETO: Realizar un módulo que reciba un título de sesión y elimine dicha sesion de la estructura. El título de 
sesion puede no existir. Invocar el módulo desarrollado en el programa principal con titulo leído por teclado.}
program BizarrapTema1;
type
 cadena = string[50];
 rango = 1..5;
 sesion = record
     titulo,artista: cadena;
      genero: rango;
      cantidad: integer;
  end;
  lista = ^nodo;
  nodo = record
     dato: sesion;
     sig: lista;
   end;
 vector = array [rango] of integer;

procedure Leer(var s: sesion);
begin
   write ('Ingrese titulo de sesion:'); readln(s.titulo);
   write ('Ingrese el nombre del artista:'); readln(s.artista);
   write ('Ingrese el genero (entre 1 a 5):'); readln(s.genero);
   write ('Ingrese cantidad de visualizaciones:');  readln(s.cantidad);
end;

procedure InsertarOrdenado(var L: lista; s: sesion);
var
 nue,ant,act: lista;
begin
 new(nue);
 nue^.dato:= s;
 ant:= L;
 act:= L;
 while (act <> nil) and (s.titulo > L^.dato.titulo)do begin
     ant:= act;
     act:= act^.sig;
   end;
   if (ant = act) then
      L:= nue
  else
     ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure CargarLista(var L:lista);
var
 s: sesion;
begin
  repeat
      Leer(s);
      InsertarOrdenado(L,s);
  until(s.artista = 'Peso Pluma');
end;

procedure Inicializar(var v: vector);
var
 i: rango;
begin
   for i:= 1 to 5 do 
     v[i]:= 0;
end;

procedure Maximos(v: vector; var cod1,cod2: integer);
var
 i: rango;
 max1,max2: integer;
begin
 max1:= -1;
 max2:= -1;
  for i:= 1 to 5 do begin
    if (v[i] > max1) then begin
       max2:= max1;
       cod2:= cod1;
       max1:= v[i];
       cod1:= i;
    end
    else
       if (v[i] > max2) then begin
          max2:= v[i];
          cod2:= i;
       end;
  end;
end;

function Descomponer(num:integer):boolean;
var
 par,impar,digito: integer;
begin
  par:= 0;
  impar:= 0;
  while (num <> 0) do begin
     digito:= (num MOD 10);
     if(digito MOD 2 = 0)then 
	     par:= par + 1
	 else
         impar:= impar + 1;
     num:= num DIV 10;
   end;
  Descomponer:= (par = impar);
end;

procedure ProcesarInfo(L:lista);
var
 cod1,cod2: integer;
 v: vector;
 cant: integer; 
begin
  Inicializar(v);
  cant:= 0;
  while (L <> nil)do begin
     v[L^.dato.genero]:= v[L^.dato.genero] + L^.dato.cantidad;
     if(L^.dato.genero = 2) and (Descomponer(L^.dato.cantidad))then
	    cant:= cant + 1; 
      L:= L^.sig;
   end;  
   maximos (v, cod1,cod2);
   writeln('Los codigos con mayor cantidad de visualizaciones son:',cod1, 'y', cod2);
   writeln('La cantidad de sesiones del genero reggaeton fue:', cant);
end;
procedure Eliminar(var L:lista; titulo: cadena);
var
 ant,act:lista;
begin
  ant:= L;
  act:= L;
  while(act <> nil) and (act^.dato.titulo <> titulo) do begin
     ant:= act;
	 act:= act^.sig;
   end;
   if(act <> nil) then begin
      if(ant = act) then 
	     L:= L^.sig
	  else
	     ant^.sig:= act^.sig;
	  dispose(act);
   end;	 
end;

// Programa Principal

var
 L:lista;
 titulo: cadena;
begin
 L:= nil;
 CargarLista(L);
 ProcesarInfo(L); 
 WriteLn ('Ingrese un titulo de sesion:');
 readln(titulo);
 Eliminar(L, titulo);
end. 
