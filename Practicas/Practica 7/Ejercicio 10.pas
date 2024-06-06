{ Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les provee sus productos. De cada empresa 
se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada 
cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de meses que 
lleva el ciclo de cultivo.

a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).

Una vez leída y almacenada la información, calcular e informar:

b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales.
}

program Ejer10;
const
 dimF=20;
type
  rCult = record
     tipo:string;
     cantH:integer;
     cantM:integer;
   end;
  vCult= array [1..dimF] of rCult;
  rEmp = record
     cod:integer;
     nom:string;
     sect:string;
     ciud:string;
     cult:vCult;
     dimL:integer;
  end;
  lista = ^nodo;
  nod = record
     emp:rEmp;
     sig:lista;
   end;

procedure leerCult(var c:rCult);
begin
  read(c.cantH);
  if(c.cantH <> 0) then begin
     read(c.tipo);
     read(c.cantM);
   end;
end;
procedure cargarCult(var v:vCult; var dimL:integer);
var
 c:rCult;
begin
  dimL:=0;
  leerCult(c);
  while(dimL < dimF)and(c.cantH <> 0)do begin
     dimL:=dimL+1;
     v[dimL]:=c;
     leerCult(c);
  end;
end;
procedure leerEmp(var e:rEmp);
begin
  read(e.cod);
  if(e.cod <> -1)then begin
     read(e.nom);
     read(e.sect);
     read(e.ciud);
     cargarCult(e.cult,e.dimL);
   end;
end;
procedure sumarNodo(var L:lista; e:rEmp);
var
n:lista;
begin
 new(n);
 n^.sig:=L;
 n^.emp:=e;
 L:=n;
end;
procedure cargarEmp(var L:lista);
var
 e:rEmp;
begin
 leerEmp(e);
 while(e.cod <> -1)do begin
     sumarNodo(L,e);
     leerEmp(e);
   end;
end;
function dos0(cod:integer):boolean;
var
dig,ceros:integer;
begin
 ceros:=0;
 while(cod <> 0)and(ceros < 2)do begin
     dig:=cod mod 10;
     if(dig = 0)then
         ceros:=ceros+1;
     cod:= cod div 10;
   end;
   dos0:=(ceros >= 2);
end;
function porcentaje(cant,total:integer):real;
begin
 porcentaje:=(cant/total)*100;
end;
procedure maximo(e:string; t:integer; var maxE:string; var maxT:integer);
begin
 if(t >= maxT)then begin
     maxT:=t;
     maxE:=e;
   end;
end;
procedure procesar(L:lista; var cant:integer; var porc:real; var maxE:string);
var
 trigo,maiz:boolean;
 i,tot,maxT,tiempo:integer;
begin
  cant:=0;
  maxT:=0;
  tot:=0;
  while(L <> nil)do begin
     trigo:=false;
     maiz:=false;
     tiempo:=0;
     for i:= 1 to (L^.emp.dimL)do begin //Recorre cultivo de empresa
         tot:=tot + L^.emp.cult[i].cantH;

         if(L^.emp.cult[i].tipo = 'Soja')then // Para inciso c
             cant:=cant + L^.emp.cult[i].cantH
         else if(L^.emp.cult[i].tipo = 'Maiz')then begin
             tiempo:= tiempo+L^.emp.cult[i].cuntM;
             maiz:=true;
           end
            else 
              if(L^.emp.cult[i].tipo = 'Trigo')then
             trigo:=true;
           end;
         if((trigo)and(L^.emp.ciud ='San miguel del monte')and(dos(L^.emp.cod))then // Inciso A
         	 writeln(L^.emp.nombre);
          if(maiz)then
             maximo(L^.emp.nom,tiempo,maxE,maxT); //Para inciso d
          L:=L^.sig;
       end;
       porc:=porcentaje(cant,tot); // Para inciso C
   end;
end;
procedure Incrementar(L:lista);
var
 i:intger;
begin
  while(L <> nil)do begin
     if(L^.emp.sect <>'Estatal')then begin
         for i:= 1 to L^.emp.dimL do begin
             if(L^.emp.cult[i].tipo = 'Girasol')and(L^.emp.cult[i].cantH < 5)then
                 L^.emp.cult[i].cantM:=L^.emp.cult[i].cantM + 1; 
       L:=L^.sig; 
   end;
end;

var
 L:lista;
 cant:intger;
 porc:real;
 maxE:string;
begin
 L:=nil;
 cargarEmp(L);
 procesar(L,cant,porc,maxE);
 write(cant,porc) // Inciso C
 write(maxE); // Inciso D
 Incrementar(L);
end;
