{ El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de los usuarios. Para ello, se dispone 
de información sobre los 3600 usuarios que utilizan el portal. De cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector),
revista en la que participa y cantidad de días desde el último acceso. 
  a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista Económica. El listado debe 
    ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente). 
  b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal. 
  c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}

program Ejer13;
const
 Max_usuarios = 3600;
type
 cadena = string[20];
 rango = 1..4;
 usuario = record
     email:cadena;
     rol:rango;
     revista:cadena;
     cantidad_dias:integer;
  end;
  lista = ^ nodo;
  nodo = record
     dato:usuario;
     sig:lista;
  end;
  vector_Usuarios = array [1..Max_usuarios] of usuario;
  vector_contador = array [rango] of integer;
procedure InsertarOrdenado(var pri:lista; us:usuario);
var
 ant, nue, act:lista;
begin
 new(nue);
 nue^.dato:= us;
 act:= pri;
 ant:= pri;
 // Recorro mientras no se termine la lista y no encuntrela posicion corecta
 while (act <> nil) and (act^.dato.cantidad_dias < us.cantidad_dias) do begin
     ant:=act;
     act:=act^.sig;
 end;
 if (ant = act) then
     pri:= nue   //el dato va al principio
 else
     ant^.sig:= nue; // va entre dos o al final
  nue^.sig:= act;
end;
procedure InicializarVector (var vc: vector_contador);
var 
 i:Integer;
begin
  for i:= 1 to 4 do begin
     vc[i]:= 0;
  end; 
end;
procedure ActualizardosMaximos(var max1,max2:integer; var maxemail,maxemail2:cadena; us:usuario);
begin
  if (max1 < us.cantidad_dias) then
  begin
     max2:= max1;
     maxemail2:= maxemail;
     max1:= us.cantidad_dias;
     maxemail:= us.email;
  end
  else
     if(max2 < us.cantidad_dias) then begin
         max2:= us.cantidad_dias;
         maxemail2:= us.email;
       end;
end;
procedure Recorrer(var l:lista; vu:vector_Usuarios; var vc:vector_contador);
var 
 i, rol,max1,max2:integer;
 maxemail,maxemail2:cadena;
begin
  max1:= -1;
  max2:= -1;
  for i:= 1 to 3600 do begin
     if(vu[i].revista = 'Economica')then begin
         InsertarOrdenado(l, vu[i]);
     end;
     rol:= vu[i].rol;
     vc[rol]:= vc[rol]+1;
     ActualizardosMaximos(max1,max2,maxemail,maxemail2,vu[i]);
   end;
end;
// PROGRAMA PRINCIPAL
var
 l:lista;
 v:vector_Usuarios;
 vc: vector_contador;
 maxemail,maxemail2:cadena;
begin
 l:= nil;
 CargarVector(v); //Se dispone
 InicializarVector(vc);
 Recorrer(l,v,vc);
 WriteLn('Los dos email de los usuarios que no ingresaron al portal son:', maxemail, 'y', maxemail2);
end.
