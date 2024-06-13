{ La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más grandes del país. De cada cliente conoce 
la fecha de firma del contrato con AWS, la categoría del monotributo (entre la A y la F), el código de la ciudad donde se encuentran las 
oficinales (entre 1 y 2400) y  el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de 
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
  a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
  b. Cantidad de clientes para cada categoría de monotributo
  c. Código de las 10 ciudades con mayor cantidad de clientes
  d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes
}

program Ejer5;   
const
 dimF = 500;  
type
 rangoCate='A'..'F';
 rangoCod=1..2400;
 rangoDia=1..31;
 rangoMes=1..12;
 rangoAnio=2000..2022;
 fecha=record
   dia:rangoDia;
   mes:rangoMes;
   anio:rangoAnio;
 end;
  cliente=record
   fechaFirma:fecha;
   categoria:rangoCate;
   codigo:rangoCod;
   monto:real;
 end;
  maxDiez=record
   codigo:rangoCod;
   maxx:integer;
  end;
 vector = array [1..dimF] of cliente;
 vcate = array [rangoCate] of integer;
 vciud = array [rangoCod] of integer;
 vdiez = array [1..10] of maxDiez;

procedure leerFecha(var f:fecha);
begin
 writeln('Ingrese el dia');
 readln(f.dia);
 writeln('Ingrese el mes');
 readln(f.mes);
 writeln('Ingrese el anio');
 readln(f.anio);
end;

procedure leerCliente(var c:cliente);
begin
 leerFecha(c.fechaFirma);
 writeln('Ingrese la categoria');
 readln(c.categoria);
 writeln('Ingrese el codigo');
 readln(c.codigo);
 writeln('Ingrese el monto');
 readln(c.monto);
end;

procedure cargar(var v:vector);
var 
 c:cliente;
 i:integer;
begin
 for i:=1 to dimF do begin
   leerCliente(c);
   v[i]:=c;
 end;
end;

procedure inicializarMaxDiez(var v:vdiez);
var 
 i:integer;
begin
  for i:=1 to 10 do
    v[i].maxx:=-1;
end;

procedure inicializarCate(var v:vcate);
var 
 i:rangoCate;
begin
 for i:='A' to 'F' do
   v[i]:=0;
end;

procedure inicializarCiud(var v:vciud);
var 
 i:rangoCod;
begin
 for i:=1 to 2400 do
   v[i]:=0;
end;

procedure mayorFirma(anio:rangoAnio;cant:integer;var anioMax:rangoAnio;var max:integer);
begin
 if(cant > max)then begin
   max:=cant;
   anioMax:=anio;
 end;
end;

procedure maximo(vcid:vciud; var vmax:vdiez); //este modulo lo hizo un compañero y anda perfecto 
var					      //la profe dijo que era como un insertar
 i,j,pos:integer;		      
begin
  for i:=1 to 2400 do begin
   pos:=1;
   while (pos <= 10) and (vcid[i] < vmax[pos].maxx) do
	   pos:= pos+1;
	 if (pos <= 10) then begin
		 for j:= 10 downto pos do begin
		   vmax[j].maxx:= vmax[j-1].maxx;
		   vmax[j].codigo:= vmax[j-1].codigo;
		 end;
		 vmax[pos].maxx:= vcid[i];
		 vmax[pos].codigo:= i;
	 end;
 end;
end;


function superanMonto(v:vector;promedio:real):integer;
var 
 cant,i:integer;
begin
 cant:=0;
 for i:=1 to dimF do begin
   if(v[i].monto>promedio)then
     cant:=cant+1;
 end;
 superanMonto:=cant;
end;

procedure recorrer(v:vector;var vcat:vcate;var vcid:vciud;var vmax:vdiez);
var
 anioAct,mesAct,cantContratoAnio,cantContratoMes,max1,i:integer;
 anioMax:rangoAnio;
 montoTotal,promedio:real;
begin
 i:=1;
 max1:=-1;
 montoTotal:=0;
 inicializarCate(vcat);
 inicializarCiud(vcid);
 inicializarMaxDiez(vmax);
  while(i < dimF) do begin
    anioAct:= v[i].fechaFirma.anio;
    cantContratoAnio:= 0;
    while(i < dimF) and (anioAct = v[i].fechaFirma.anio) do begin
      mesAct:= v[i].fechaFirma.mes;
      cantContratoMes:= 0;
      while(i < dimF) and (anioAct = v[i].fechaFirma.anio) and (mesAct = v[i].fechaFirma.mes) do begin
       cantContratoMes:= cantContratoMes+1;
       vcat[v[i].categoria]:= vcat[v[i].categoria]+1;
       vcid[v[i].codigo]:= vcid[v[i].codigo]+1;
       montoTotal:= montoTotal+v[i].monto;
       i:=i+1;
     end;
     writeln('Mes: ',mesAct,' cantidad de contrato: ',cantContratoMes);
     cantContratoAnio:=cantContratoAnio+cantContratoMes;
   end;
   writeln('Anio: ',anioAct,' cantidad de contrato: ',cantContratoAnio);
   mayorFirma(anioAct,cantContratoAnio,anioMax,max1);
 end;
 writeln('Año en que se firmó la mayor cantidad de contratos',anioMax);
 promedio:=montoTotal/dimF;
 writeln('Cantidad de clientes que superan mensualmente el monto promedio',superanMonto(v,promedio));
 maximo(vcid,vmax);
end;

procedure mostrar(var vcat:vcate);
var 
 i:rangoCate;
begin
 writeln('Cantidad de clientes para cada categoría de monotributo:');
 for i:='A' to 'F'do
   writeln('Categoria:',i,' cantidad:',vcat[i]);
end;

procedure mostrarDiez(var vmax:vdiez);
var 
 i:integer;
begin
 writeln('Código de las 10 ciudades con mayor cantidad de clientes:');
 for i:= 1 to 10 do
   writeln('Codigo ',vmax[i].codigo,' cantidad de clientes:',vmax[i].maxx);
end;

var 
 v:vector; 
 vcat:vcate;
 vcid:vciud;
 vmax:vdiez;
begin
 cargar(v);
 recorrer(v,vcat,vcid,vmax);
 mostrar(vcat);
 mostrarDiez(vmax);
end.
