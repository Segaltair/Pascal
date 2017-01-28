const 
  N=4; { размерность матрицы }
type 
  matr=array[1..N,1..N] of integer;
  invmatr=array[1..N,1..2*N] of real;
  matInv=array[1..N,1..N] of real;
  
procedure PrintMatr(m:matr);
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

procedure printInvMatr(c:matInv);
var
  i,j:integer;
begin
  for i:=1 to N do
    begin
      for j:=1 to N do
        write(c[i,j]:0:3,'  ');
      writeln;
    end;  
  writeln;
end;

procedure GetMatr(a:matr; var b:matr; m{N},i,j:integer);
{ ¬ычеркивание из матрицы строки и столбца }
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
{ ¬ычисление определител€ матрицы }
var i,d,k:integer;
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
        PrintMatr(b);}
        d:=d+k*a[i,1]*Determinant(b,N-1);
        k:=-k;
      end;
  Determinant:=d;
end;

procedure invMatrix (var b:matInv;var c:invmatr;a:matr);
var
  i,j,k,kj:integer;
  f:real;
begin
  for i:=1 to N do
    for j:=1 to N do
      c[i,j]:=a[i,j];
  i:=1;
  j:=N+1;
  for k:=1 to N do      //добавление единичной матрицы
    begin
      c[i,j]:=1;
      inc(i);
      inc(j);
    end;
  k:=1;
  for j:=1 to N do
    begin
      //делим на число ту строку где нужно получить единицу
      f:=c[j,j];
      for kj:=j to 2*N do
            c[j,kj]:=c[j,kj]/f;
      for i:=1 to N do        //если нужно получить 0, то вычитаем из строки ту строку где единица в том же столбце
        if (i<>j) and (c[i,j]<>0) then
          begin
            f:=c[i,j];
            for kj:=j to 2*N do
              c[i,kj]:=c[i,kj]-c[j,kj]*f;
          end;        
        //printInvMatr(c);    
    end;
    for i:=1 to N do
      for j:=1 to N do
        b[i,j]:=c[i,N+j];
end;

var 
  b:matinv;
  c:invmatr;
  a:matr;
  i,j,dt:integer;
begin
{ «аполнение матрицы случайными числами }
  randomize;
  for i:=1 to N do
    for j:=1 to N do
      a[i,j]:=random(5)+1;
  {a[1,1]:=5;
  a[1,2]:=4;
  a[1,3]:=2;
  a[2,1]:=5;
  a[2,2]:=2;
  a[2,3]:=5;
  a[3,1]:=2;
  a[3,2]:=5;
  a[3,3]:=1;}
  PrintMatr(a);
  dt:=Determinant(a,N);
  writeln('=========');
  writeln('Determinant=',dt);
  if dt=0 then
    write('Inverse matrix does not exists')
  else
    begin
      invMatrix(b,c,a);
      writeln('Inverse matrix');
      printiNVMatr(b);
    end;
end.
