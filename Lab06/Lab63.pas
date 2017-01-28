{Найти определитель квадратной матрицы. Вывести матрицу, обратную данной.
Матрица может быть 2х2 3х3 4х4 5х5.
Используем понижение порядка матрицы по первому столбцу}
const
  N=5;
type
  mas=array [1..N,1..N] of integer;
  
procedure input (var mat:mas);
var 
  i,k:byte;
  x:integer;
  t:text;
begin
  {for i:=1 to N do      //Заполнение матрицы 
    for k:=1 to N do
      mat[i,k]:=random(8)+1;}
  assign(t,'text.txt');
  reset(t);
  for i:=1 to N do      //Заполнение матрицы 
    for k:=1 to N do
      begin
        read(t,x);
        mat[i,k]:=x;
      end;
  close(t);
end;

procedure output (mat:mas);
var
  i,k:byte;
begin
  for i:=1 to N do      //Вывод матрицы
    begin
      for k:=1 to N do
        write(mat[i,k]:4,' ');
      writeln();
    end;
end;

procedure downToMat2x2 (var mat:mas;
                        var kmat:integer);
var
  i,k,j:byte;
  s,p,opr:integer;
  znam:array[1..N] of integer;
begin
  kmat:=1;
  for i:=1 to N do
    znam[i]:=1;
  for j:=1 to N-2 do                          //Понижаем матрицу N-2 раз
    begin
      for i:=N-j+1 downto 1+j-1 do                          //Храним знаменатель элементов матрицы
          znam[i]:=mat[i-j+1,1]*znam[i];   
      {преобразовываем строки, чтобы первый его элемент был равен 0}
      for i:=N-j+1 downto 2 do                        //От последней строки до второй
        begin
          {s:=mat[i-1,1];                          //Коэффицент 
          p:=mat[i,1];            }                //Коэффицент
          for k:=N-j+1 downto 1 do                    //От последнего к первому элементу в строке
            begin
              mat[i,k]:=mat[i,k]*mat[i-1,1]-mat[i-1,k]*mat[i,1];  //Меняем элемент матрицы(числитель)
            end;
        end;   
      kmat:=mat[1,1]*kmat;
      for i:=2 to N do            //Строим новую матрицу на порядок меньше
        for k:=2 to N do
          mat[i-1,k-1]:=mat[i,k];
    writeln();
    output(mat);
    writeln();
    for i:=1 to n do
    write(znam[i],' ');
    opr:=kmat*(mat[1,1]*mat[2,2]-mat[2,1]*mat[1,2]);
    end;
    
end;
  
function det (mat:mas;
              kmat:integer):integer;
begin
  det:=kmat*(mat[1,1]*mat[2,2]-mat[2,1]*mat[1,2]);
end;  
  
var 
  mat:mas;
  kmat:integer;
begin
  {writeln('Введите порядок матрицы');
  readln(p);} 
  input (mat);
  output(mat);
  downToMat2x2(mat,kmat);
  output(mat);
  writeln(det(mat,kmat));
end.