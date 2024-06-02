{La Secretaría de Apoyo a Empresas desea analizar la información de los créditos otorgados
a las 1450 empresas registradas en su sistema (Una empresa puede tener más de un
crédito). La secretaría otorga 6 tipos de créditos distintos: 1. Contratación de personal, 2.
Compra de equipos, 3. Cursos y capacitaciones, 4. Asesoramiento, 5. Viajes y 6. Otros.
Además, la secretaría dispone de una estructura de datos con información de las 1450
empresas. De cada empresa se conoce su código (entre 1 y 1450), nombre, localidad y
cantidad de empleados.
a) Realice un módulo que retorne una estructura de datos con la información de los
créditos registrados. De cada crédito se conoce el tipo de crédito, el código de la
empresa (entre 1 y 1450), el monto de dinero otorgado y el año en que fue otorgado.
La lectura finaliza al ingresar un crédito de monto -1.
b) Realice un módulo que reciba la información de las empresas y la información de los
créditos, y retorne la cantidad de créditos otorgados a empresas al menos de 40
empleados de las las localidades de Neuquén o de Bariloche, y el tipo de crédito con
menor monto total de créditos otorgados.}

program Secretaria;
const
 e = 1450;
type
  rango = 1..1450;
  cadena = string[50];
  cre = 1..6;
  empresa = record
     codigo: rango;
     nombre,localidad: candena;
     empleados: integer;
  end;
   arrEmpre = array[rango] of empresa; // vector de registros
   credito = record
      tipo: cre;
      codigoE: rango;
      monto: real;
      anio: integer;
   end;
   lista = ^nodo;
   nodo = record
     dato: credito;
     sig: lista;
   end;
  contador = array [cre] of integer; // para parte del inciso b

procedure CargarVector(var a: arrEmpre; // SE DISPONE

procedure leerCredito(var c: credito);
begin
  write('Ingrese el monto otorgado:'); readln(c.monto);
  if (c.monto <> -1)then begin
    write('Ingrese el tipo de credito:'); readln(c.tipo);
    write('Ingrese el codigo de la empresa:'); readln(c.codigoE);
    write('Ingrese el anio en que fue otorgado:'); readln(c.anio);
  end;

procedure agregarAdalante(var L:lista; c:credito);
var
 nue: lista;
 begin
  new(nue);
  nue^.dato:= c:
  nue^.sig:= L;
  L:= nue;
end;

procedure CargarLista(var L: lista);
var
 c:credito;
begin
  leerCredito(c); 
  while(c.monto <> -1)do begin
     agregarAdelante(L,c);
     leerCredito(c);
  end;
end;

procedure InicializarContador(var v:contador);
var
 i: cre;
begin
 for i:= 1 to 6 do 
    v[i]:= 0;
end;

procedure minimo(v:contador; var tipoMin: integer; var montoTMin:real);
var
  i: cre;
begin
 montoTMin:= 9999;
 for i:= 1 to 6 do begin
    if (v[i] < montoTMin)then begin
      montoTMin:= v[i];
      tipoMin:= i;
    end;
 end;
end;

function Condicion(emple:integer; localidad:cadena):boolean;
begin
 Condicion:= (emple >= 40) and ((localidad = 'Neuquen') or (localidad = 'Bariloche'));
end;

procedure Procesar(L:lista; a:arrEmpre);
var
  cant: integer;
  v: contador;
  tipo: cre;
  monto: real;
begin
 InicializarContador(v);
 cant:= 0;
 while(L <> nil)do begin
    v[L^.dato.tipo]:= v[L^.dato.tipo] + L^.dato.monto;
    if(Condicion(a[L^.dato.codigoE].empleados,v[L^.dato.codigoE].loalidad))then
       cant:= cant + 1;
    L:= L^.sig:
  end;
  minimo(v,tipo,monto);
  writeln('La cantidad de créditos otorgados a empresas al menos de 40 empleados es:',cant);
  writeln('El tipo de crédito con menor monto total de créditos otorgados es:',tipo);
end;

// Programa Principal
var 
  a: arrEmpre;
  L:lista;
begin
  L:= nil;
  CargarVector(a); // SE DISPONES
  CargarLista(L); // Inciso A
  Procesar(L,a);
end.
