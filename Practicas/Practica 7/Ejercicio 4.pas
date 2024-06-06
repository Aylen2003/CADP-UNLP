{ Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso registrado el primer día de 
cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa que analice esta información, determine e informe:
1. Para cada embarazada, la semana con mayor aumento de peso.
2. El aumento de peso total de cada embarazada durante el embarazo.
}

program ejercicio4;
const
 dimF=42;
type
  lista=^nodo;
  str20=string[20];
  sem42= array [1..dimF] of real;
  madre=record
   nombre:str20;
   apellido:str20;
   pesosSemanas:sem42;
   dimL:1..dimF;
end;
nodo=record
 dato:madre;
 sig:lista;
end;
function pesosMaxArreglo(v:sem42;dimL:integer):integer;
var 
 i:integer;
 cambioPeso,CambioPesoMax:real;
 semanaMax:integer;
begin
  cambioPesoMax:=-1;
  for i:=  1 to (dimL-1) do begin
    cambioPeso:=v[i+1]-v[i];
    if(cambioPeso>CambioPesoMax)then begin
     CambioPesoMax:=cambioPeso;
     semanaMax:= i+1;
   end;
 end;
 pesosMaxArreglo:=semanaMax;
end;
procedure AnalizarLista(L:lista);
begin
  while(L <> nil)do begin 
    write('La sema con mayor aumento de pesos es',pesosMaxArreglo(L^.dato.pesosSemanas,L^.dato.dimL));
    write('El cambio de peso total de la embarazada es',L^.dato.pesosSemanas[L^.dato.dimL]-L^.dato.pesosSemanas[1]);
   L:=L^.sig;
  end;
end;
{Programa Principal}
var
 pri:lista;
BEGIN
	pri:=nil;
	cargarLista(pri); // se dispone
	analizarLista(pri);
END.
