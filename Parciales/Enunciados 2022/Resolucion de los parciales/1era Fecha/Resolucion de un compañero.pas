program Parcial;
const
 areas = 4;
type
 vcont = array [1..areas] of integer;
 subrango = 1..areas;
 empleados = record
     DNI:integer;
     AP_Nom:string;
     condicion: string;
     area: subrango;
     anios:integer;
   end;
 lista = ^nodo;
 nodo = record
     dato:empleados;
     sig: lista;
  end;

procedure LeerEmp(var e:empleados);
begin
 read(e.DNI);
 read(e.AP_Nom);
 read(e.condicion);
 read(e.area);
 read(e.anios);
end;
procedure ArmarInformar(var L:lista);
var
 v:vcont; 
 e:empleados;
 DNI1,DNI2,Min1,Min2:integer;
begin
 L:= nil;
 Min1:=9999;
 DNI1:=0;
 InicializarVec(v);
 repeat
   LeerEmp(e);
   if(e.condicion = 'Permanente')then
     v[e.area]:= v [areas] + 1;
   if(e.area = 'Administrativa')then
     ActualizarMin(e,DNI1,DNI2,Min1,Min2);
   if(e.condicion = 'Temporal') and (ParImpar(e.DNI))then
     AgregarOrd(L,e);
 until(e.DNI = 33444555);
 InformarVec(v);
 write(DNI1,DNI2);
end;

procedure InicializarVec(var v:vcont);
var
 i: integer;
begin
 for i:= 1 to areas do
   v[i]:= 0;
end;

procedure InformarVec(v:vcont);
var
 i:integer;
begin
 for i:= 1 to areas do
   write('Area',i,'Cantidad', v[i]);
end;

procedure ActualizarMin(e:empleados; var NI1,DNI2,Min1,Min2:integer);
begin
 if(e.años < Min1)then begin
   Min2:= Min1;
   DNI2:= DNI1;
   Min1:= e.anios;
   DNI1:= e.DNI;
 end
 else if(e.años < Min2)then begin
   Min2:= e.años;
   DNI2:= e.DNI;
 end;
end;

function ParImpar(DNI:integer):boolean;
var
 Par,Impar:integer;
begin
 Par:= 0;
 Impar:= 0;
 while(DNI <> 0) do begin
   if(DNI mos 2 = 0)then
     Par:= Par + 1
   else
     impar:= impar + 1;
   DNI:=DNI div 10
 end;
 ParImpar:= (Par = Impar);
end;

procedure AgregarOrdenado(var L:lista; e:empleados);
var
 nue,ant,act:lista;
begin
 new(nue);
 nue^.dato:= e;
 if(L = nil)then begin
   nue^.sig:=L;
   L:= nue;
 end
  else begin
   ant:=L;
   act:=L;
   while(act <> nil) and (L^.dato.AP_Nom < e.AP_Nom) do begin
     ant:= act;
     act:= act^.sig;
   end;
   if(act = ant)then
     L:=nue
   else
     ant^.sig:=nue;
   nue^.sig:=act; 
 end;
end;

// Programa Principal
var
 L:lista
begin
 ArmarInformar(L); 
end.
