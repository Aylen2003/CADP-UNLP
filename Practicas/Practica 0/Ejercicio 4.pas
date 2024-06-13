{ Implemente un programa que lea el diámetro D de un círculo e imprima:
  a. El radio (R) del círculo (la mitad del diámetro).
  b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2.
  c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula D*PI (o también PI*R*2).
}

// PARTE A
program Ejer4A;
var 
  diametro,radio:real;
begin
 writeln('Dame el diametro');
 readln(diametro);
 radio:= diametro/2;
 writeln('Radio:',radio:5:2);
end.
 
 // PARTE B
 program Ejer4B;
const 
 pi=3.1416;
var 
 r:real;
 ac:real;
begin
 writeln('Calcular el area del circulo');
 write('Introduce el valor del radio:');
 read(r);
 ac:=pi*r*r;
 write('El area es:',ac:5:2);
end.

// PARTE C
program Ejer4C;
const
 pi=3.1416; 
var 
  r:real;
  p:real;
begin
 writeln('Calcular el perimetro del circulo');
 write('introduce el valor del radio:');
 read(r);
 p:=pi*r*2;
 write('El perimetro es:',p:5:2);
end.
