{ A mí el pos me mareaba, no sé si le pasan lo mismo. Así que cambié pos por i , y valor !}

// Usando POS
function buscar(v:vector;dimL,n:integer):boolean;  
var
  pos:integer;esta:boolean;
begin
  pos:=1;
  esta:false;
  while(pos <= dimL)and(not esta)do begin
    if(v[pos] = n)then
      esta:=true;
    else
      pos:=pos + 1;
  end;
  buscar:=esta;
end;
// Usando i
function buscar(v:vector;dimL,n:integer):boolean;
var
  i:integer;esta:boolean;
begin
  i:=1;
  esta:false;
  while(i <= dimL)and(not esta)do begin
    if(v[i] = n)then
      esta:=true;
    else
      i:=i + 1;
  end;
  buscar:=esta;
end;

// Otras formas de codigo 
function buscar(v:vector;dimL,n:integer):boolean; // USANDO POS
var
  pos:integer;
begin
  pos:=1;
  while(pos <= dimL)and(v[pos] < n)do begin
    pos:=pos + 1;
    if(pos <= dimL)and(v[pos] = n)do begin
      buscar:=true
    else
      buscar:=false;
    end;
  end;
end;

function buscar(v:vector;dimL,n:integer):boolean; // USANDO i
var
  i:integer;
begin
  i:=1;
  while(i <= dimL)and(v[i] < n)do begin
    i:=i + 1;
    if(i <= dimL)and(v[i] = n)do begin
      buscar:=true
    else
      buscar:=false;
    end;
  end;
end;

