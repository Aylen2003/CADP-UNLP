{ Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De cada evento se dispone la siguiente información: 
nombre del evento, tipo de evento (1: música, 2: cine, 3:obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de 
personas permitidas para el evento y costo de la entrada. 
Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se debe guardar: código de venta, número de 
evento (1..100), DNI del comprador y cantidad de entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
  a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
  b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo 
    “obra de teatro”.
  c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de personas permitidas.
}

program Ejer11; 
const
 dimF = 100;
type
 rEvento = 1.. dimF;
 rango = 1..5;
 cadena = string[40];
 evento = record
     nombre:cadena;
     tipo:rango;
     lugar:cadena;
     MaxPersonas:integer;
     costo:real;
   end;
 totalEventos = array [rEvento] of evento; // SE DISPONE
 venta = record
     codigo:integer;
     nroEvento:rEvento;
     dni:integer;
     cantEntradas:integer;
  end;
 lista = ^nodo;
 nodo = record
     datos:venta;
     sig:lista;
  end; 
 vector_contador = array [rEvento] of integer;

procedure leerVenta(var v:venta);
begin
 writeln('Ingrese el codigo');
 readln(v.cod);
 if(v.cod <> -1)then begin
     writeln('Ingrese el numero de evento');
     readln(v.num);
     writeln('Ingrese el DNI');
     readln(v.dni);
     writeln('Ingrese la cantidad de entradas');
     readln(v.cantEnt);
  end;
end;

procedure AgregarAdelante(var L:lista;V:venta);
var
 nue:lista;
begin
 new(nue);
 nue^.datos:=V;
 nue^.sig:=L;
 L:=nue;
end;

procedure CargarLista(var L:lista);
var
 v:venta;
begin
 leerVenta(V);
 while (V.codigo <> -1) do begin
     AgregarAdelante(L,V);
     leerVenta(V);
   end;
end;

procedure DosMenores(L:lista;TE:totalEventos; var nombre1,lugar1,nombre2,lugar2:cadena; var recaudacion1,recaudacion2:real);
var 
 min:real;
begin
 min:=TE[L^.datos.nroEvento].costo*(L^.datos.cantEntradas);
 if (min < recaudacion1) then begin
     recaudacion2:= recaudacion1;
     nombre2:= nombre1;
     lugar2:= lugar1;
     recaudacion1:= min;
     nombre1:=TE[L^.datos.nroEvento].nombre;
     lugar1:=TE[L^.datos.nroEvento].lugar;
   end
    else begin
     if (min < recaudacion2) then begin
         recaudacion2:=min;
         nombre2:=TE[L^.datos.nroEvento].evento;
         lugar2:=TE[L^.datos.nroEvento].lugar;
      end;
  end;      
end;

function dniPar (dni:integer):boolean;
var
 dig:integer;
 par:integer;
 impar:integer;
begin
 par:=0;
 impar:=0;
 while (dni <> 0) do begin
     dig:= dni mod 10;
     if (dig mod 2 = 0) then 
         par:=par + 1
     else
         impar:=impar + 1;  
     dig:=dni div 10;
  end;
 if (par > impar) then 
     dniPar:= true
 else
     dniPar:= false;  
end;

procedure inicializarVector(vc:vector_contador);
var
 i:rEvento;
begin
 for i:=1 to dimF do begin
     vc[i]:=0;
   end;
end;

procedure RecorrerLista(L:lista;TE:totalEventos);
var
 nombre1,lugar1,nombre2,lugar2:cadena;
 recaudacion1,recaudacion2:real;
 cumpleB:integer;
 cumplePares:boolean;
 vc:vector_contador;
begin
 inicializarVector(VC);
 cumpleB:=0;
 recaudacion1:=-1;
 recaudacion2:=-1;
 while (L <> nil) do begin
     vc[L^.datos.nroEvento]:= vc[L^.datos.nroEvento] + L^.datos.cantEntradas;
     cumplePares:=dniPar(L^.datos.dni);
     if (cumplePares) and ((TE[L^.datos.nroEvento].evento) = 'obra de teatro') then begin
         cumpleB:=cumpleB+1;  
       end;
     L:=L^.sig;
   end;
 DosMenores(L,TE,nombre1,lugar1,nombre2,lugar2,recaudacion1,recaudacion2);
 if (vc[50] >= TE[50].MaxPersonas) then begin
        writeln('Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de personas permitidas. ');
    end;
end;

// Programa Principal
var
 L:lista;
 TE:totalEventos;
 nombre1,lugar1,nombre2,lugar2:cadena;
begin
 cargarEventos(TE);//Se dispone
 CargarLista(L);
 RecorrerLista(L,TE);
 writeln('El nombre y lugar que tuvo menor recaudacion es:',nombre1,'',lugar1);
 writeln('El nombre y lugar que tuvo la segunda menor recaudacion es:',nombre2,'',lugar2);
end.
