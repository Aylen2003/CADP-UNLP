{ Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}
procedure incrementar(var L:lista; x:integer); 
begin
  while(L <> nil)do begin    
    L^.num:= L^.num + dato;                   
    L:= L^.sig;
  end;
end;
{El problema es que no anda el módulo. No me modifica el contenido de la lista.
 Entonces la profesora de la práctica nos dió estos ejemplos :}
//MODIFICA VALORES DE LA LISTA MANDANDOLA POR REFERENCIA
procedure incrementar(var L:lista; x:integer);
var  aux:lista;
begin
  aux:= L; //USO AUXILIAR PARA RECORRER
  while(aux <> nil)do begin    
    aux^.num:= aux^.num + x;                   
    aux:= aux^.sig;
  end;
end;
//MODIFICA LOS VALORES DE LA LISTA MANDANDOLA POR VALOR - SIN AUXILIAR
procedure incrementar(L:lista; x:integer); 
begin
  while(L<>nil)do begin    
    L^.num:= L^.num + x;                    
    L:=L^.sig;
  end;
end;
{La solución es mandarlo por valor no por referencia. En vectores si se pasaba por referencia.}
