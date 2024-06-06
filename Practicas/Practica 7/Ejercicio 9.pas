{ Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene: código de película, título de la película,
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado 
por las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe leer desde teclado las críticas que 
han realizado críticos de cine, de cada crítica se lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La
lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un móduo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).
}

program Ejer9;
const
 dimF=8;
type
 cadena = string[30];
 rango = 1..dimF;
 pelicula=record
     codigo:integer;
     titulo:cadena;
     genero:rango;
     puntaje:real;
   end;
 lista=^nodo;  //se dispone
 nodo=record
     dato:pelicula;
     sig:lista;
   end;
 critica=record
     dni:integer;
     ape:cadena;
     nom:cadena;
     cod:integer;
     punto:real;
   end;
  vcont = array[rango]of real;
procedure inicializar(var v:vcont);
var 
 i:rango;
begin
 for i:= 1 to dimF do
     v[i]:= 0;
end;
procedure leerCritica(var c:critica);
begin
 writeln('Ingrese el dni');
 readln(c.dni);
 writeln('Ingrese el apellido');
 readln(c.ape);
 writeln('Ingrese el nombre');
 readln(c.nom);
 writeln('Ingrese el codigo');
 readln(c.cod);
 writeln('Ingrese el puntaje');
 readln(c.punto);
end;

function paresImpares(dni:integer):boolean;
var 
 dig,par,impar:integer;
begin
 par:=0;
 impar:=0;
 while(dni<>0)do begin
     dig:=dni mod 10;
     if(dig mod 2 = 0)then
         par:=par+1
     else
         impar:=impar+1;
     dni:=dni div 10;
   end;
  if(par=impar)then
     paresImpares:=true
  else
     paresImpares:=false;
end;
procedure actualizar(L:lista;var v:vcont);
var 
 c:critica;
 codActual,total:integer;
 suma,promedio:real;
begin
 total:=0;
 leerCritica(c);
 while(c.cod<>-1)do begin
     codActual:=c.cod;
     suma:=0;
     while(c.cod<>-1)and (codActual=c.cod)do begin
         suma:=suma + c.punto;
         total:=total+1;
         if(paresImpares(c.dni))then
             writeln('críticos con la misma cantidad de dígitos pares que impares en su DNI:',c.ape,' ',c.nom);
         leerCritica(c);
       end;
     promedio:=suma/total;  //promedio por cada codigo de pelicula
     while(L<>nil)do begin
         if(L^.dato.codigo=codActual)then  //pregunto si los codigos de peli son iguales
             L^.dato.puntaje:=promedio;       //Le agrego nuevo promedio
         v[L^.dato.genero]:=v[L^.dato.genero]+L^.dato.puntaje;  //Le cargo el promedio en el vector
         L:=L^.sig;
       end;
  end;
end;
procedure informar(v:vcont);
var 
 i:rango;
 max:real;
 pos:integer;
begin
 max:=-1;
 for i:=1 to dimF do
     if(v[i]>max)then begin
         max:=v[i];
         pos:=i;
       end;
 writeln('Código de género que más puntaje obtuvo entre todas las críticas:',pos);
end;    
procedure eliminar(var L:lista;codigo:integer;var exito:boolean);
var 
 ant,act:lista;
 num:integer;
begin
 exito:= false;
 act:= L; 
 while(act <> nil)and(act^.dato.codigo <> codigo )do begin
     ant:= act;
     act:= act^.sig;
  end;
 if(act <> nil)then begin
     exito:= true;
      if(act = L)then   
         L:= act^.sig
      else   
         ant^.sig:= act^.sig;
     dispose(act);
   end;
end;          
var
 L:lista;
 v:vcont;
 codigo:integer;
 ok:boolean;
begin
 L:=nil;  //se dispone
 cargarPeli(L); //se dispone
 actualizar(L,v);
 informar(v);
 writeln('Ingrese un codigo a eliminar');
 readln(codigo);
 eliminar(L,codigo,ok);
 if(ok)then  
     writeln('Se elimino de la lista')
 else  
     writeln('No se encontro el codigo');
end.
