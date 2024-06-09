{ Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos los dispositivos que poseen sus juegos 
instalados. De cada dispositivo se conoce la versión de Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que 
posee (medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información 
disponible de todos los dispositivos e informe: 
  a. La cantidad de dispositivos para cada versión de Android. 
  b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
  c. El tamaño promedio de las pantallas de todos los dispositivos.
}

program Ejercicio12;
type
 dispositivos = record
     android: real;
     pantalla: integer;
     RAM: integer;
  end;
  lista = ^nodo;
  nodo = record
     dato:dispositivos;
     sig: lista;
  end;

procedure  CargarLista(var L:lista); // Se dispone

procedure ProcesarLista(L:lista; var cant, totalDisp: integer; var totalTam:real);
var
 actual: real;
 cantV:integer;
begin
 cant:= 0;
 totalDisp:= 0;
 totalTam:= 0;
 while (l <> nil) do begin
     actual:= L^.dato.android;
     cantV:= 0;
     while (L <> nil) and (L^.dato.android = actual) do begin
        cantV:= cantV + 1;
        if (L^.dato.RAM > 3) and (L^.dato.pantalla <= 5) then
          cant:= cant + 1;

        totalDisp:= totalDisp + 1;
        totalTam:= totalTam + L^.dato.pantalla;
       L:= L^.sig;
     end;
     writeln('La cantidad de dispositivos para cada versión de Android es:',cantV);
 end;
end;

//PROGRAMA PRINCIPAL
var
 L:lista;
 cant, totalDisp:integer;
 totalTam:real;
begin
  CargarLista(L); // Se dispone
  ProcesarLista(L, cant, totalDisp,totalTam);
  writeln('Dispositivos de con mas de 3GB y pantalla de a lo sumo 5 pulgadas son:', cant);
  writeln('El tamaño promedio de las pantallas de todos los dispositivos es:' ,totalTam/totalDisp:2:2);
end.
