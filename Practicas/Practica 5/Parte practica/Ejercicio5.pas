{ De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación interna de cada tipo de dato en Pascal, calcular 
el tamaño de memoria en los puntos señalados a partir de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 
bytes libres. Justificar mediante prueba de escritorio. }

program Alocacion_Dinamica;
type
  TEmpleado = record
      sucursal: char;
      apellido: string[25];
      correoElectrónico: string[40];
      sueldo: real;
   end;
   {La suma de los campos me dio 72 bytes}
   Str50 = string[50];
var
  alguien: TEmpleado;
  PtrEmpleado: ^TEmpleado;
begin
  {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
  Readln( alguien.apellido ); {sigo con los 400.000 bytes disponibles}
  {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
  New( PtrEmpleado ); {estas pidiendo que te reserven 72 bytes libres en memoria dinamica (le reservo espacio en 3 y 50}
    {400 mil menos 72 = 399928 de memoria disponible}
  {¿Cuánta memoria disponible hay ahora? (III)}
  Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
  Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
 {esto no cambia nada porque el lugar ya estaba reservado, aca solo se escribe en esa hoja que estaba en blanco}
  {¿Cuánta memoria disponible hay ahora? (IV)}
  Dispose( PtrEmpleado );
  {¿Cuánta memoria disponible hay ahora? (V)}
end.
