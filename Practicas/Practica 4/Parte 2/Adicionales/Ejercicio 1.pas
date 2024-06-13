{ La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para ello, debe realizar un programa que lea y 
almacene información sobre las computadoras con este sistema operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, 
la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la cantidad de cuentas de usuario que poseen. 
La información debe almacenarse ordenada por código de computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1,
que no debe procesarse. Una vez almacenados todos los datos, se pide:
  a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
  b. Informar el promedio de cuentas de usuario por computadora.
  c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
  d. Eliminar la información de las computadoras con código entre 0 y 500.
}

program Adi1;
const
 dimF=10000;
type
 computadora=record
	 cod:integer;
	 version:real;
	 paquetes:integer;
	 cuentas:integer;
  end;
 vComputadoras=array[1..dimF] of computadora;

procedure LeerComputadora(var c:computadora);
begin
 with c do begin
	 write('Codigo:');
   readln(cod);
	 if (cod<>-1) then begin
		 write('Version: ');
         readln(version);
		 write('Paquetes: ');
         readln(paquetes);
		 write('Cuentas: ');
         readln(cuentas);
	  end;
   end;
end;

function Posicion(vC:vComputadoras; dimL:integer; cod:integer):integer; 
var
 pos:integer;
begin
 pos:=1;
 while (pos <= dimL) and (cod > vC[pos].cod) do begin
	 pos:=pos+1;
  end;
 Posicion:=pos;
end;
procedure CargarComputadoras (var vC:vComputadoras; var dimL:integer); 

procedure insertar(var vC:vComputadoras;var dimL:integer; pos:integer; c:computadora; var ok:boolean); 
var
 i:integer;
begin
 if (pos>=1) and (dimL<dimF) then begin {NICO: No hace falta verificar por el lugar ni que pos >= 1 ya que viene dentro del while}
     ok:=true;
	 for i:=dimL downTo pos do
		 vC[i+1]:=vC[i]; //esto lo hace demas cuando pos y dimL valen 1
	 vC[pos]:=rC;
   end
  else begin
	 vC[pos]:=rC; {Perfecto, faltaba el ultimo}
	 ok:=false {NICO: ok no hace falta, pero en este caso que significaria?}
  end;
end;		

var
 rC:rComputadora;
 ok:boolean;
 pos:integer;
begin
 LeerComputadora(rC);
 dimL:=0;
 while (dimL<dimF) and (rC.cod<>-1) do begin
     pos:=Posicion(vC,dimL,rC.cod);
	 insertar(vC,dimL,pos,rC,ok);
	 dimL:=dimL+1;
	 LeerComputadora(rC);
  end;
end;

procedure procesar(var vC:vComputadoras; var dimL:integer; var CantVersion:integer; var promCuentas,verMaxPaq:real);
 function versiones(ver:real):boolean;
 begin
	 versiones:=(ver=18.04)or (ver=16.04);
  end;
 procedure mayorVerPaq(ver:real; paq:integer; var verMaxPaq:real; var maxPaq:integer);
 begin
	 if (paq>maxPaq) then begin
		 maxPaq:=paq;
		 verMaxPaq:= ver;
	  end;
  end;
 
 procedure Eliminar(var vC:vComputadoras; var dimL:integer; pos:integer);
 var
   i:integer;
 begin
	 if(pos>0) then begin
	     Writeln ('Eliminar hasta posicion: ',pos-1,'. Teniamos en total ',dimL); {NICO: pos - 1 ya que el 500 lo tengo que dejar, todo lo que haya antes se borra}
		 {NICO: En lugar de dimL-pos, debo eliminar todos los elementos HASTA POS - 1, y verificar que lo que copio no este fuera de rango}
		 for i:=1 to pos-1 do 
			 if (pos-1+i <= dimL) then
			     vC[i]:=vC[pos-1+i];
			 dimL:=dimL-pos+1; {NICO: Actualice con +1}
				{ ALTERNATIVA }
				{for i:= diml downto pos do
					vC[i-pos+1]:= vC[i];
				dimL:=dimL-pos+1;}
	   end;
  end;		

var
	 maxPaq,i,sumaCuentas,pos:integer;
 begin
	 maxPaq:=-1;
	 CantVersion:=0;
	 sumaCuentas:=0;
	 pos:=0;
	 for i:=1 to dimL do begin
		 if versiones(vC[i].version) then
			 CantVersion:=CantVersion+1;
		 sumaCuentas:=sumaCuentas+vC[i].cuentas;
		 mayorVerPaq(vC[i].version,vC[i].paquetes,verMaxPaq,maxPaq);
	  end;
	 pos:=Posicion(vC,dimL,500);
	 Eliminar(vC,dimL,pos);
	 if (dimL > 0)then
		 promCuentas:=sumaCuentas/dimL;
  end;	

procedure Imprimir(vC:vComputadoras; dimL:integer);
 var 
   i:integer;
 begin
	 writeln('Quedaron ', diml, ' elementos.');
	 for i:=1 to dimL do
		 writeln('Cod: '[,vC[i].cod,] '- version:' [,(vC[i].version):2:2,]);
 end;

{Programa Principal}
var 
 vC:vComputadoras;
 dimL,CantVersion:integer;
 promCuentas,verMaxPaq:real;
begin
 CargarComputadoras(vC,dimL);
 procesar(vC,dimL,CantVersion,promCuentas,verMaxPaq);
 Imprimir(vC,dimL);
end.
