{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. 
Al finalizar la lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b.Implemente un programa que invoque al módulo del inciso a.}
program seis;
procedure masalto;
var
 nums, parmasalto:integer;
begin
 parmasalto:=0;
 writeln('Ingrese numero');
 readln(nums);
 while(nums >= 0)do begin
     if((nums mod 2)=0)and(parmasalto <= nums)then
         parmasalto:=nums;

      writeln('Ingrese otro numero');
      readln(nums);
   end;
   writeln('El numero par mas alto es:', parmasalto);
end;
begin
 masalto;
end.
