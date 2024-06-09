{ Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto debe leer el precio, código y 
tipo (pantalón, remera, camisa, medias, campera, etc.).

Informar:
  - Código de los dos productos más baratos.
  - Código del producto de tipo “pantalón” más caro.
  - Precio promedio.
}

program Ejer6;
procedure imprimir (baratoC1,baratoC2: integer; pantalonC,promedio:real);
begin
 writeln ('Los codigos de los 2 productos mas baratos son el ',baratoC1,' y ',baratoC2,'.');
 writeln ('El pantalon mas caro vale ',pantalonC:2:2,'$.');
 writeln ('El precio promedio es ',promedio:2:2,'$.');
end;

procedure productos;
var
 precio, baratoP1, baratoP2, pantalonC, promedio: real;
 x,cod, baratoC1, baratoC2, cant: integer;
 tipo: string[20];
begin
 baratoP1:= 32767;
 baratoP2:= baratoP1;
 pantalonC:= 0;
 cant:= 0;
 promedio:= 0;
for x:=1 to 5 do begin
     write ('Precio: '); 
	 readln(precio);
     write ('Codigo: '); 
	 readln(cod);
     write ('Tipo: '); 
	 readln(tipo);
     
	 cant:= cant + 1;
     promedio:= promedio + precio;

      if (baratoP1 > precio) then begin
         baratoP2:= baratoP1;
         baratoC2:= baratoC1;
         baratoP1:= precio;
         baratoC1:= cod;
       end
      else
        if (baratoP2 > precio) then begin
         baratoP2:= precio;
         baratoC2:= cod;
       end;
      if (tipo = 'pantalon') and (pantalonC < precio) then
         pantalonC:= precio;
   end;
 promedio:= promedio / cant;
 imprimir(baratoC1,baratoC2,pantalonC,promedio);
end;

//Programa principal
begin
  productos;
end.
