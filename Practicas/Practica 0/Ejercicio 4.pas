{ Implemente un programa que lea el diámetro D de un círculo e imprima:
  a. El radio (R) del círculo (la mitad del diámetro).
  b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2.
  c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula D*PI (o también PI*R*2).
}

program Ejer4A;
var 
  diametro,radio:real;
begin
	 writeln('Dame el diametro');
	 readln(diametro);
	 radio:= diametro/2;
	 writeln('Radio:',radio:5:2);
end.