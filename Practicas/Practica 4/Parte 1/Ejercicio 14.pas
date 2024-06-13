program Prac4Ejer14;
const 
 dimF = 10;
type
 rango = 1..5;
 vectorMontoHora = array [rango] of real;
 rango2 = 1..dimF;
 str = string [20];
 participante = record
     codigo:integer;
     pais : str;
     nombre:str;
     rol:rango;
     horas:integer;
 end;
 vectorMenorMonto = array [rango2] of real;
 vectorCantArquitectos = array [rango2] of integer;

procedure cargarAux(var VMH:vectorMontoHora ); {se dispone, lo cargamos para probarlo}
begin
 VMH[1] := 35.20;
 VMH[2] := 27.45;
 VMH[3] := 31.03;
 VMH[4] := 44.28;
 VMH[5] := 39.87;
end;

procedure leerParticipante(var P:participante);
begin
 readln(P.codigo);
 if (P.codigo <> -1) then begin
     readln(P.pais);
     readln(P.nombre);
     readln(P.rol);
     readln(P.horas); 
   end;
end;

procedure inicializarVectorMenorMonto(var VMM: vectorMenorMonto);
var 
 i : integer;
begin
 for i := 1 to dimF do 
     VMM[i] := 0;
end;

procedure inicializarVectorCantArquitectos(var VCA: vectorCantArquitectos);
var 
 i : integer;
begin
 for i := 1 to dimF do 
     VCA[i] := 0;
end;

procedure minimo (monto: real; codigo: integer; var min: real; var codMin: integer);
begin
 if (monto < min) then begin
     min := monto;
     codMin := codigo;
   end;
end;

procedure readinfo(var MontoArg: real; var HAdmin: integer; var VMM: vectorMenorMonto; var VCA: vectorCantArquitectos; VMonto: vectorMontoHora );
var 
 p:participante;
 auxMonto: real;
begin
 leerParticipante(p);
 while (p.codigo <> -1) do begin
     auxMonto := p.horas * VMonto[p.rol];
     if(p.pais = 'Argentina')then 
         MontoArg := MontoArg + auxMonto;
     if(p.rol = 3)then 
         HAdmin := HAdmin + p.horas
     else 
         if(p.rol = 4)then 
             VCA[p.codigo] :=  VCA[p.codigo] + 1;
     VMM[p.codigo] := VMM[p.codigo] + auxMonto;
     leerParticipante(p);
   end;
end;

{programa principal}
var
 MontoA, menorMontoInvertido: real;
 HAdmin, codigoMenorMontoInvertido, i: integer;
 VMMonto: vectorMenorMonto;
 VCArquitectos: vectorCantArquitectos;
 VMHora:vectorMontoHora;
begin
 MontoA := 0;
 HAdmin := 0;
 menorMontoInvertido := 99999;
 cargarAux(VMHora); {Esto se dispone, esta mal cargarlo}
 inicializarVectores(VMMonto, VCArquitectos);
 readinfo(MontoA,HAdmin,VMMonto,VCArquitectos,VMHora);
    
 writeln('d) La cantidad de Arquitectos de software de cada proyecto');
 for i := 1 to dimF do begin
     minimo(VMMonto[i], i, menorMontoInvertido,codigoMenorMontoInvertido);
     writeln(VCArquitectos[i]);
   end;
   writeln('a) El monto total invertido en desarrolladores con residencia en Argentina:', MontoA:0:2);
   writeln('b) La cantidad total de horas trabajadas por Administradores de bases de datos:', HAdmin);
   writeln('c) El código del proyecto con menor monto invertido:', codigoMenorMontoInvertido); 
end.
