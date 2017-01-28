const 
  N=3; { размерность матрицы }
type 
  matr=array[1..N,1..N] of integer;
  
procedure PrintMatr(m:matr;N:integer);
{ процедура вывода матрицы на экран }
var 
  i,j:integer;
begin
  for i:=1 to N do
    begin
      for j:=1 to N do
        write(m[i,j]:3);
      writeln;
    end;
end;

procedure GetMatr(a:matr; var b:matr; m{N},i,j:integer);
{ Вычеркивание из матрицы строки и столбца }
var ki,kj,di,dj:integer;
begin
  di:=0;
  for ki:=1 to m-1 do
    begin
      if (ki=i) then 
        di:=1;
      dj:=0;
    for kj:=1 to m-1 do
      begin
        if (kj=j) then 
          dj:=1;
        b[ki,kj]:=a[ki+di,kj+dj];
      end;
    end;
end;

Function Determinant(a:matr;N:integer):integer;
{ Вычисление определителя матрицы }
var i,j,d,k:integer;
  b:matr;
begin
  d:=0; 
  k:=1;
  if (N=1) then 
    d:=a[1,1]
  else if (N=2) then 
    d:=a[1,1]*a[2,2]-a[2,1]*a[1,2]
  else { n>2 }
    for i:=1 to N do
      begin
        GetMatr(a,b,N,i,1);
        {writeln('i=',i,' a[',i,',1]=',a[i,1]);
        PrintMatr(b,N);}
        d:=d+k*a[i,1]*Determinant(b,N-1);
        k:=-k;
      end;
  Determinant:=d;
end;

var 
  a,b:matr;
  i,j,dt:integer;
begin
{ Заполнение матрицы случайными числами }
  randomize;
  for i:=1 to N do
    for j:=1 to N do
      a[i,j]:=random(5)+1;
  { Печать исходной матрицы }
  PrintMatr(a,N);
  { Вычисление и вывод определителя }
  dt:=Determinant(a,N);
  writeln('=========');
  writeln('Determinant=',dt);
end.
