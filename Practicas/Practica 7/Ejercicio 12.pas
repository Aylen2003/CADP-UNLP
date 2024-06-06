{ El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 
4)Todas las clases. Para ello, el centro dispone de una tabla con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el nombre, DNI, edad y tipo de 
suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, 
el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.
}

program Ejer12;
const
 dimF=4;
type
 cadena=string[30];
 rango=1..dimF;
 vtabla=array[rango]of real; //dispone de una tabla con el costo de cada tipo
 cliente=record
     nom:cadena;
     dni:integer;
     edad:integer;
     tipo:rango;
   end;
 lista=^nodo;
 nodo=record
     dato:cliente;
     sig:lista;
   end;
 masDe40=record
     nom:cadena;
     dni:integer;
  end;
 lista2=^nodo2;
 nodo2=record
     dato:masDe40;
     sig:lista2;
  end;
 vcont=array[rango]of integer; //Las 2 suscripciones con más clientes
procedure leer(var c:cliente);
begin
 writeln('Ingrese el dni');
 readln(c.dni);
 if(c.dni<>0)then begin
     writeln('Ingrese el nombre');
     readln(c.nom);
     writeln('Ingrese la edad');
     readln(c.edad);
     writeln('Ingrese el tipo');
     readln(c.tipo);
  end;
end;
procedure agregarAdelante(var L:lista;c:cliente);
var 
 nue:lista;
begin
 new(nue);
 nue^.dato:=c;
 nue^.sig:=L;
 L:=nue;
end;
procedure cargarLista(var L:lista);
var 
 c:cliente;
begin
 leer(c);
 while(c.dni<>0)do begin
     agregarAdelante(L,c);
     leer(c);
  end;
end;
procedure inicializar(var vc:vcont);
var 
 i:rango;
begin
 for i:=1 to 4 do
     vc[i]:=0;
end;
procedure maximo(var max1,max2:integer;var tipo1,tipo2:rango;vc:vcont);
var 
 i:rango;
begin
 for i:=1 to 4 do begin
     if(vc[i]>max1)then begin
         max2:=max1;
          max1:=vc[i];
         tipo2:=tipo1;
         tipo1:=i;
       end
        else if(vc[i]>max2)then begin
          max2:=vc[i];
         tipo2:=i;
      end;
  end;
end;
procedure insertarOrdenado(var L2:lista2;c:cliente);
var
 nue,ant,act:lista2;
begin
 new(nue);
 nue^.dato.nom:=c.nom;
 nue^.dato.dni:=c.dni;
 ant:=L2;
 act:=L2;
 while(act<>nil)and(act^.dato.dni < c.dni)do begin
     ant:=act;
     act:=act^.sig;
   end;
   if(ant=act)then 
     L2:=nue
  else 
     ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure recorrerLista( L:lista; var L2:lista2; v:vtabla);
var 
 vc:vcont;
 gananciaTotal:real;
 max1,max2:integer; 
 tipo1,tipo2:rango;
begin
 max1:=-1;
 tipo1:=0;
 gananciaTotal:=0;
 inicializar(vc);
 while(L<>nil)do begin
     gananciaTotal:=gananciaTotal+v[L^.dato.tipo];
     vc[L^.dato.tipo]:=vc[L^.dato.tipo]+1;
     if(L^.dato.edad > 40) and ((L^.dato.tipo=3) or (L^.dato.tipo=4))then
         insertarOrdenado(L2,L^.dato);
     L:=L^.sig;
  end;
  maximo(max1,max2,tipo1,tipo2,vc);
  writeln('La ganancia total de Fortaco’s:', gananciaTotal);
  writeln('Las 2 suscripciones con más clientes:',tipo1,' y ',tipo2);
end;
procedure informarL2(L2:lista2);
begin
 while(L2<>nil)do begin
     writeln(L2^.dato.nom,' ',L2^.dato.dni);
     L2:=L2^.sig;
  end;
end;
var  
 L:lista;
 L2:lista2;
 v:vtabla;
begin
 L:=nil;
 L2:=nil;
 cargarTabla(v); //se dispone
 cargarLista(L);
 recorrerLista(L,L2,v);
 informarL2(L2);
end.
