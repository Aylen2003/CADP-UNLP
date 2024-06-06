{ La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon cuenta con una tabla con las 35 áreas 
temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces que fue vendido y código
del área temática (1..35).
Realizar un programa que:
a. Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con más de 250 ventas.
b. Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial y el título de cada libro con más de 250 ventas.
}

program AmazonBook;
type
 cadena = string[40];
 tematicas = array [1..35] of cadena;
 libro = record
     titulo,editorial: cadena;
     cantPag: integer;
     anioE:1..2021;
     cantVen: Integer;
     codTematica: 1..35;
  end;
  Detalle = record
      titulo, NomTe: cadena;
      cantPag: integer;
   end;
   lista = ^nodo;
   nodo = record
       dato: detalle;
       sig: lista;
  end;
  estructura = record
      editorial: cadena;
      anioAntiguo: 1..2021;
      CantEditados: integer;
      cantVentas: integer;
      Deta: lista;
   end;

procedure Leer(var L: libro);
begin
   write ('Titulo:'); readln(L.titulo);
   write ('Editorial:'); readln(L.editorial);
   write ('Paginas:'); readln(L.cantPag);
   write ('Anio Edicion:'); readln(L.anioE);
   write ('Cant Ventas:'); readln(L.cantVen);
   write ('Cod de tematica:');  readln(L.codTematica);
end;
procedure agregarAdelante();
