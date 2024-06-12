{ El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para cada una de las 200 fotos
publicadas en su página de Facebook, cuenta con la siguiente información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de 
clics y cantidad de comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura, el programa 
debe procesar los datos e informar:
a. Título de la foto más vista (la que posee mayor cantidad de clics).
b. Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}

program Ejer11;
const
 dimF=200;
type
 foto=record
	 titulo:string;
	 autor:string;
	 MG:integer;
	 clics:integer;
	 comentarios:integer;
end;
  rango= 1..dimF;
  fotos = array [rango] of foto;

procedure leer (var f:foto);
begin
 writeln('Ingrese titulo de la foto '); 
 readln(f.titulo);
 writeLn('Ingrese autor de la foto '); 
 readln(f.autor);
 writeln('Ingrese cantidad de mg '); 
 readln(f.MG);
 writeln('Ingrese cantidad de clics '); 
 readln(f.clics);
 writeln('Ingrese cantidad de comentarios '); 
 readln (f.comentarios);
end;

procedure cargar (var v:fotos);
var
 i:rango;
begin
 for i:= 1 to dimF do 
	 leer (v[i]);
end;

procedure masVista (titulo:string;clics:integer;var maxTitulo:string; var maxClics:integer);
begin
 if (clics > maxClics) then begin
	 maxClics:= clics;
	 maxTitulo:= titulo;
   end;
end;

procedure cantFotos (autor:string; megusta:integer;var cantTotal:integer);
begin
 if (autor = 'Art Vandelay') then
	 cantTotal:= cantTotal + megusta;
end;

procedure recorrer (v:fotos;var maxTitulo:string; var maxClics,cantTotal:integer);
var
 i:rango;
begin
 maxTitulo:='';
 maxClics:=-1;
 cantTotal:=0;
 for i:= 1 to dimF do begin
	 masVista (v[i].titulo,v[i].clics,maxTitulo,maxClics);
	 cantFotos (v[i].autor,v[i].mg,cantTotal);
	 writeln ('La cantidad de comentarios de la foto ',v[i].titulo,' es: ',v[i].comentarios);
	end;
end;

{programa principal}
var
 v:fotos;
 maxClics,cantTotal:integer;
 maxTitulo:string;
begin
 cargar (v);
 recorrer (v,maxTitulo,maxClics,cantTotal);
 writeln ('El titulo de la foto mas vista: ',maxTitulo);
 writeln ('Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotografo Art Vandelay: ',cantTotal);
end.
