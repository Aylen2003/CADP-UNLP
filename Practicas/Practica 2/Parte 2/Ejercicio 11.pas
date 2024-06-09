{ Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A%B*, donde:
  - A es una secuencia de caracteres en la que no existe el carácter $.
  - B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo 3 veces el carácter @.
  - Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}

program Prac2Par2Ejer11;
const
 CORA='%';
 CORB='*';
 AST='@';
procedure ParteA(var cumple:boolean; var cant:integer);
var
 car:char;
begin
  cant:=0;
  cumple:=true;
  write('Ingrese un caracter:');
  readln(car);
  while((cumple)and(car<>CORA))do begin
    if(car='$')then
     cumple:=false
    else begin
     cant:=cant+1;
     write('Ingrese un caracter:');
     readln(car);
   end;
 end;
end; 
procedure ParteB(var ParB : boolean;cant:integer);
var
 car:char;
 aux,cumple:boolean;
 i,con:integer;
begin
  cumple:=true;
  aux:=true;
  i:=0;
  con:=0;
  while(aux)do begin
    write('Ingrese un caracter:');
    readln(car);
    if(car=CORB)then
     aux:=false
    else begin
     i:=i+1;
    if(car=AST)then
     con:=con+1;
    if not(i=cant)then
     cumple:=false
    else
     cumple:=true;
    if(con>3)then begin
     cumple:=false;
     aux:=false;
    end;
  end;
end; 
var 
 ParB,cumple:boolean;
 cant:integer;
begin
	ParteA(cumple,cant);
	if(cumple)then
	 ParteB(ParB, cant); {NICO: procedure}
	if((cumple)and(ParB))then
	 writeln('Se cumplieron las secuencias')
	else 
		if(not cumple)then
			writeln('La parte A no se cumpleio')
		else
			writeln('La parte B no se cumplio');
	readln;
	readln;
end.
