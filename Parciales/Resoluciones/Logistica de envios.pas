{Una empresa de logística desea procesar información de los envíos que debe realizar. Para ello 
dispone de una estructura con información de cada paquete. De cada paquete se conoce: nombre de la 
localidad de destino y tipo de paquete a enviar (1: encomienda común, 2: encomienda express, 
3: encomienda frágil, 4: certificado). Esta estructura se encuentra ordenada por nombre de
localidad de destino y puede existir más de un envío por localidad. 
Se solicita calcular e informar: 
1- La cantidad de paquetes que se deben entregar en cada localidad. 
2- El tipo de paquete que más se va a enviar.}

program Logistica;
 const
  r = 4;
 type
   rango = 1.r;
   paquete = record
      localidad: string:
      tipo: rango;
  end;
  lista = ^nodo;
  nodo = record
    dato: paquete;
    sig: lista;
 end;
 arrContador = array [rango] of integer;
 // Programa Principal 
 var
  L:lista;
  begin
   CargarLista (L); // SE DISPONE
   Procesar(L);
  end. 
  
  procedure CargarLista(var L:lista); // SE DISPONE
  
  procedure InicializarVec(var a:arrContador);
  var
   i: rango;
  begin
    for i:= 1 to r do 
      a[i]:= 0;
  end;
  
  procedure maximo(var a:arrContador; var max: integer);
  var
   i,cant: integer;
  begin
   cant:= 0;
   for i:= 1 to 4 do begin
     if (a[i] > cant)then begin
        cant:= a[i];
        max:= i;
    end;
  end;
end;

procedure Procesar (L:lista);
var 
  cant,max: integer;
  a:arrContador;
  localidadACT: string;
begin
  InicializarVec(a);
  while (L <> nil) do begin
       localidadACT:= L^.dato.localidad;
       cant:= 0;
       while (L <> nil) and (L^.dato.localidad = localidadACT)do begin
          cant:= cant + 1;
          a[L^.dato.tipo]:= a[L^.dato.tipo] + 1;
        end;
        writeln('La cantidad de paquetes de la localidad:', localidadACT, 'es:',cant);
        L:= L^.sig;
        maximo(a,max);
        writeln('EL tipo que mas se va a enviar es:',max);
  end;
end;
