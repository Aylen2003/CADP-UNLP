{ Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego imprime dicha información en 
el orden inverso al que fue leída,identificar los 9 errores. }
program Ejer2; 
type 
  lista = ^nodo; 
  persona=record 
   dni:integer; 
   nombre:string; 
   apellido:string; 
 end; 
 nodo=record 
   dato:persona; 
   sig:lista; 
end; 
procedure leerPersona(p:persona); 
begin 
 read(p.dni); 
 if(p.dni <> 0)then begin 
   read(p.nombre); 
   read(p.apellido); 
 end;
end;
{Agrega un nodo a la lista} 
procedure agregarAdelante(l:lista;p:persona); 
var 
 aux: lista; 
begin 
 aux^.dato:= p; 
 aux^.sig:= l; 
 l:= aux; 
end;
{Carga la lista hasta que llega el dni 0} 
procedure generarLista(var l:lista); 
var 
 p:nodo; 
begin 
 leerPersona(p); 
 while(p.dni <> 0) do begin 
   agregarAdelante(l,p); 
 end; 
end; 
procedure imprimirInformacion(var l:lista); 
begin 
 while(l <> nil)dobegin 
   writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); 
   l:= l^.sig; 
 end; 
end;
{Programa principal} 
var 
 l:lista; 
begin 
 generarLista(l); 
 imprimirInformacion(l); 
end.
{ Error 1: En el procedure leerPersona , p no esta pasada por referencia
  Error 2: En el procedure agregarAdelante , la lista no esta pasada por referencia
  Erro3: aux^.dato:=p; aux no  le fue asiganado ningun espacio en memoria
  Error 4: El proceso leerPersona cuando se lo invoca en el proceso gereneraLista, el parametro no es de tipo persona
  Error 5:  while(p.dni<>0), error no existe el valor p.dni porque se invoco mal en el proceso
  Error 6: El proceso agregarAdelante, error el procedimiento nunca fue ejecutado
  Error 7: El proceso imprimirInformacion, error no es necesario pasarlo por referencia
  Error 8: writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido), error el nombre y el apellido se 
  acceden utilizando l^.dato.nombre y l^.dato.apellido
  Error 9: l:= l^.sig; error se van eliminando por punteros para recorrerlo.
}
