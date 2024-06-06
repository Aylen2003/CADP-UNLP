{ El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos astronómicos observados durante el año 2015. 
Los objetos se clasifican en 7 categorías: 1: estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas. 
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7), nombre del objeto, 
distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.

a. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.

b. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información: 
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares
}

program Ejercicio6;
type
 rangoCateg = 1..7;
 cadena30 = string[30];
 objeto = record
     codObjeto: integer;
     cateObjeto:rangoCateg;
     nombre: cadena30;
     distaTierra: integer;
     nomDescubridor: cadena30;
     anioDes: integer;
   end;
 lista = ^nodo;
 nodo = record
     dato: objeto;
     sig:lista;
   end;
 vectorContador = array[rangoCateg] of integer;

procedure inicializarVector(var vc: vectorContador);
var
 i:rangoCateg;
begin
    for i:= 1 to 7 do begin
        vc[i]:= 0;
    end;
end;
procedure leerObjeto( var o: objeto);
begin
 writeln('Ingrese el codigo del objeto:');
 readln(o.codObjeto);
 if (o.codObjeto <> -1) then begin
     writeln('Ingrese la categoria del objeto:');
     readln(o.cateObjeto);
     writeln('Ingrese el nombre del objeto:');
     readln(o.nombre);
     writeln('Ingrese la distancia de la tierra del objeto:');
     readln(o.distaTierra);
     writeln('Ingrese el nombre del decubridor del objeto:');
     readln(o.nomDescubridor);
     writeln('Ingrese el anio de descubrimiento:');
     readln(o.anioDes);
 end;
end;

procedure AgregarAtras(var l,ult:lista; o:objeto);
var
 nue:lista;
begin
  new(nue);       
  nue^.dato:= o;  
  if(l = nil)then 
     l:= nue      
  else           
     ult^.sig:= nue; 
  ult:= nue;   
end;
procedure cargarLista(l:lista);
var
 o: objeto;
 ult: lista;
begin
   leerObjeto(o);
   while (o.codObjeto <> -1) do begin
    agregarAtras(l,ult,o);
    leerObjeto(o);
   end;
end;
procedure MasLejanos(distancia : integer; codigo: integer; var max1,max2: integer; var cod1,cod2: integer);
begin
  if (distancia > max1) then begin
     max2:= max1;
     cod2:= cod1;
     max1:= distancia;
     cod1:= codigo;
  end
  else 
     if (distancia > max2) then begin
       max2:= distancia;
       cod2:= codigo;
     end;
end;
procedure infomarCantObjetos(vc:vectorContador);
var 
 i: rangoCateg;
begin
   for i:= 1 to 7 do 
     writeln('Categoria', i, 'objetos observados:', vc[i]);
end;
function masPares(codigo:integer): boolean;
var
 dig:integer;
 par,impar:integer;
begin
  par:= 0;
  impar:= 0;
  while (codigo <> 0) do begin
      dig:= codigo MOD 10;
      if( dig  MOD 2 = 0) then
          par:= par + 1
       else
          impar:= impar + 1;
     codigo:= codigo DIV 10;
  end;
  masPares:= (par > impar);
end;
procedure recorrerLista(l:lista; var cant:integer);
var
 max1,max2,cod1,cod2:integer;
 vc: vectorContador;
begin
 cod1:= 0;
 cod2:= 0;
 max1:= -1;
 max2:= -1;
  inicializarVector(vc);
  while (l <> nil) do begin
      vc[l^.dato.cateObjeto]:= vc[l^.dato.cateObjeto] + 1;
      if(l^.dato.nomDescubridor = 'Galileo Galilei') and (l^.dato.anioDes < 1600) then
       cant:= cant + 1;
     if(masPares(l^.dato.codObjeto)) and (l^.dato.cateObjeto = 1)then
       writeln('La estrella:', l^.dato.nombre, 'cumple con el punto 4');
     MasLejanos(l^.dato.distaTierra,l^.dato.codObjeto,max1,max2,cod1,cod2);
     l:= l^.sig;
  end;
  writeln('Los codigos mas lejanos a la tierra son:', cod1 ,  'y', cod2);
  infomarCantObjetos(vc);
end;
var
 l:lista;
 cant: integer;
begin
 l:= nil;
 cargarLista(l);
 recorrerLista(l,cant);
 writeln('La cantidad de planteas descubiertos por Galileo Galilei son:', cant);
end.
