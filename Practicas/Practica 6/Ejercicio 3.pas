{ Utilizando el programa del ejercicio 1, realizar los siguientes cambios:

1. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados (agregar atrás). 
2. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados, 
manteniendo un puntero al último ingresado.
}

program Ejer3A;
procedure armarNodo(var pI:lista; v:integer);
var 
 aux,nuevo:lista;
begin
  new(nuevo); nuevo^.num:= v; nuevo^.sig:= nil; //Asigno el espacio en memoria y sus valores
  if(pI = nil)then  //Compruebo si esta vacia
    pI:= nuevo
  else begin
    aux:= pI;
    while(aux^.sig <> nil)do //Recorro para quedar en el ultimo
      aux:= aux^.sig;
  end;
  aux^.sig:=nuevo;  //Le indico al ultimo que ahora su siguiente es nuevo
end;
var
 l:lista;
 v: integer;
begin
 armarNodo(l,v);
end.

program Ejer3B;
procedure armarNodo(var pI,pU:lista; v:integer);
var
 nuevo:lista;
begin
  new(nuevo); nuevo^.num:=v; nuevo^.sig:= nil;
  if(pI = nil)then begin
    pI:=nuevo;
    pU:=nuevo;
  end
  else begin
   pU^.sig:=nuevo;
   pU:=nuevo;
  end;
end;
var
 l:lista;
 v: integer;
begin
 armarNodo(l,v);
end.
