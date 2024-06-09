{Dado el siguiente programa:}

program anidamientos;
procedure leer;
var
 letra:char;
 function analizarLetra:boolean;
  begin
    if(letra>='a')and(letra<='z')then
      analizarLetra:=true
    else
      if(letra>='A')and(letra<='Z')then
        analizarletra:=false;
    end; {fin de la funcion analizarletra}
      begin
       readln(letra);
       if(analizarletra)then
         writeln('Se trata de una minuscula')
       else
         writeln('Se trata de una mayuscula');
      end; {fin del preocedure leer}
var
 ok:boolean;
begin {Programa principal}
  leer;
  ok:=analizarLetra;
  if ok then
    writeln('Gracias, vuelva prontosss');
end.
{ a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto puede traer problemas en el código 
  del programa principal. 
    - ¿Qué clase de problema encuentra?
    - ¿Cómo se puede resolver el problema para que el programa compile y funcione correctamente?

b.  La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
  - ¿De qué valores se trata?
  - ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
  - ¿Cómo se puede resolver este problema?}


{ a. Respuestas 
  i.  Los problemas que encontramos es que el submódulo  v lo no puede  ser llamado por el codigo principal.
  ii.  Para resolverlo  podemos poner el submódulo por separado y encima del proceso leer.
  
  b.  Respuestas 
      i. De los valores que no son minúsculas ni mayúsculas. 
      ii. Da error en la ejecución.
      iii. Este problema se puede resolver cambiando el tipo de función analizarLetra para que contemple los demás caracteres y adaptar el 
      resultado del codigo a este cambio.
}
