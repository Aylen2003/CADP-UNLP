{ La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de Analista Programador Universitario.
Para ello se deberá leer la información de cada alumno, a saber: número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso,
año de egreso y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).

1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la estructura generada en el inciso 1. 
El alumno puede no existir
}

program ejercicio7;
const
 CANTMAT=24;
type
 lista=^nodo;
 notas = array [1..CANTMAT] of integer;
 alumno=record
   numero:integer;
   apellido:string;
   nombre:string;
   email:string;
   anio_ingreso:integer;
   anio_egreso:integer;
   materia:notas;
end;
 nodo=record
  dato:alumno;
  sig:lista;
end;
procedure cargarNotas(var n:notas);
var
 i,j,l,notas:integer;
begin
  readln(n[1]);
  for i:= 2 to CANTMAT do begin
    readln(notas);
    j:=1;
    while(j < i)and(n[j] > notas)do
      j:=j+1;
    for l:= 1 downto j+1 do
      n[l]:=n[l-1];
    n[j]:= notas;
  end;
end;
procedure leerAlumnos(var a:alumno);
begin
  readln(a.numero);
  if(a.numero<>-1)then begin
    readln(a.apellido);
    readln(a.nombre);
    readln(a.email);
    readln(a.anio_ingreso);
    readln(a.anio_egreso);
    cargarNotas(a.materia);
 end;
end;
procedure agregarAdelante(var l:lista; a:alumno);
var
 nuevo:lista;
begin
  new(nuevo);
  nuevo^.dato:=a;
  nuevo^.sig:=nil;
  l:=nuevo;
end;
procedure CargarLista(l:lista);
var 
 a:alumno;
begin
  leerAlumnos(a);
  while(a.numero <> -1)do begin
     agregarAdelante(l,a);
     leerAlumnos(a);
  end;
end;
function soloDigImp(num:integer):boolean;
var
 dPar:boolean;
begin
  dPar:=(num = 0);
  while(num<>0)and(not dPar)do begin
    if(num MOD 2)=0 then
     dPar:=true;
    num:=num DIV 10;
  end;
  soloDigImp:=not dPar;
end;
function promedio(v:notas):real;
var
 total,i:integer;
begin
  total:=0;
  for i:= 1 to CANTMAT do 
     total:= v[i];
  promedio:=total/CANTMAT;
end;
procedure maximos(anioE:integer; var anioMax1,anioMax2:integer; nombre,apellido,email:string; var nomMax1,nomMax2,apeMax1,apeMax2,emailMax1,emailMax2:string);
begin
  if(anioE > anioMax1)then begin
     nomMax2:=nomMax1;
     nomMax1:=nombre;
     apeMax2:=apeMax1;
     apeMax1:=apellido;
     emailMax2:=emailMax1;
     emailMax1:=email;
  end
  else if(anioE > anioMax2)then begin
     nomMax2:=nombre;
     apeMax2:=apellido;
     emailMax2:=email;
 end;
 end;
procedure ProcesarLista(l:lista; var nomMax1,nomMax2,apeMax1,apeMax2,emailMax1,emailMax2:string);
var
 anio,anioMax1,anioMax2,anioTotal:integer;
 nom,ape,email:string;
begin
  read(nom);
  read(ape);
  read(email);
  aniomax1:=-1;
  anioMax2:=-1;
  while(l <> nil)do begin
    anio:=l^.dato.anio_egreso;
    anioTotal:=0;
    while(l^.dato.anio_egreso = anio)do begin
      anioTotal:=anioTotal+L^.dato.anio_egreso;
       if(soloDigImp(l^.dato.numero))then
        writeln(l^.dato.nombre,'son los alumnos que poseen unicamente digitos impares');
    end;
    maximos(anio,anioTotal,aniomax2,nom,ape,email,nomMax1,nomMax2,apeMax1,apeMax2,emailMax1,emailMax2);
   end;
end;
procedure eliminar(num:integer; var l:lista);
var
 aux,actual:lista;
begin
  actual:=l;
  while((actual <> nil)and(actual^.dato.numero <> num))do begin
    aux:=actual;
    actual:=actual^.sig;
  end;
  if(actual<>nil)then begin
    if(actual=l)then begin 
      l:=l^.sig;
      dispose(actual);
    end
    else begin
      aux^.sig:=actual^.sig;
      dispose(actual);
    end;
  end;
end;
{Programa Principal}
var
 l:lista;
 nomMax1,nomMax2,apeMax1,apeMax2,emailMax1,emailMax2:string;
begin
	l:=nil;
	CargarLista(l);
	ProcesarLista(l,nomMax1,nomMax2,apeMax1,apeMax2,emailMax1,emailMax2);
	writeln('Los nombres los apellidos el email de los dos alumnos que mas rapido se recibieron son',nomMax1,'',apeMax1,'',emailMax1,'y',nomMax2,'',apeMax2,'',emailMax2);
	writeln('El promedio de notas obtenidas por cada alumno es',(promedio));
end.
