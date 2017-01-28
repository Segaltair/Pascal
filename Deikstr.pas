const
  N=15;


type
  graph=array [1..N+1,1..N+1] of integer;
  check=array [1..N] of boolean;
  pathway=array [1..N] of integer;
 
 
//Объявление переменных 
procedure input(var gr,mark:graph;                
                var ch:check;
                var size:integer);  //размерность графа
var 
  t:text;
  i,k:integer;
  //s:string;
begin
  //writeln('Введите имя файла');
  //s:='out.txt';
  //read(s);
  assign(t,'input.txt');
  reset(t);
  i:=1;
  k:=1;
  while not eof(t) do
    begin
      read(t,gr[i,k]);//заполняем граф в матрице
      if not eoln(t) then //если закончили считывать строку                  
        inc(k)          
      else
        begin            
          inc(i);
          k:=1;
        end;
    end;
  size:=i-1;//Размерность графа
  for i:=1 to size do
    begin
      mark[1,i]:=maxint;//изначально до каждой точки путь равен бесконечности
      ch[i]:=false;
    end;
  close(t);   
end;


//проверка на пройденность всех вершин
function test(ch:check;
         size:integer):boolean;
var
  i:integer;
begin
  test:=true;
  for i:=1 to size do
    if not ch[i] then
      test:=false;
end;


//Один шаг из алгоритма Дейкстры
{
Берем вершину, которую еще не брали, с минимальной меткой и начинаем 
обход по прилегающим к ней вершинам.
Если сумма метки нашей вершины и ребра идущей к прилегающей меньше 
значения ветки прилегающей, то заменяем значение метки прилегающей.
После обхода, помечаем вершину, как пройденную.
}
procedure algDeikstr(var gr,mark:graph;
                     var ch:check;
                     size:integer;
                     j:integer);
var
  i,k,imin,amin:integer;  
begin
  amin:=maxint;
  for i:=1 to size do//Берем вершину, которую еще не брали, с минимальной меткой
    if (mark[j,i]<amin) and (ch[i]=false) then
      begin
        amin:=mark[j,i];//минимальная метка
        imin:=i;        //вершина с этой минимальной меткой
      end; 
  mark[j,size+1]:=imin;
  if imin=0 then
    for i:=1 to size do
      ch[i]:=true
  else
    for k:=1 to size do//и проходимся по прилегающим к ней вершинам
      begin            
        if (gr[imin,k]>0) and (gr[imin,k]+mark[j,imin]<mark[j,k]) then
          mark[j,k]:=gr[imin,k]+mark[j,imin];  
        mark[j+1,k]:=mark[j,k];
      end;
  if imin<>0 then
    ch[imin]:=true;//После обхода, помечаем вершину, как пройденную
end;


//Построение кратчайшего пути
{
  После прохода по всему графу алгоритмом Дейкстры в массиве
  mark будут данные о всех значениях меток на каждом шаге,
  в каждой строке массива значение метки у каждой вершины на одном
  шаге, причем последнее число в массиве равно номеру вершины графа, 
  который мы рассматривали. Начиная с последней строки массива и поднимаясь 
  наверх мы сможем построить путь из конца в начало. Если на предыдущем шаге
  алгоритма значение кратчайшей длины пути изменилось, то, чтобы попасть в 
  конечную точку мы должны пройти через эту вершину.
}
procedure FormationWay (f,i:integer;
                        mark:graph;
                        var way:pathway;
                        size:integer);
var
  j,k:integer;
begin
  j:=size;
  k:=1;
  way[N]:=f;
  while j<>1 do
    begin
      if mark[j,f]<>mark[j-1,f] then//Если на предыдущем шаге алгоритма изменилась длина пути
        begin                       //то мы должны пройти через эту вершину
          way[N-k]:=mark[j,size+1];
          inc(k);
          f:=mark[j,size+1];
        end;
      dec(j);
    end;
  way[N-k-1]:=i;
end;


//вывод
procedure output (way:pathway;
                  mark:graph;
                  size,f,j:integer);
var
  t:text;
  k:integer;
begin
  assign(t,'output.txt');
  rewrite(t);
  if mark[j-1,f]<>maxint then
    begin
      write(t,'Ваш кратчайший путь ');
      for k:=1 to N do
        if way[k]<>0 then
          write(t,way[k],' ');
      writeln(t);
      write(t,'Длина пути равна ',mark[size,f]);     
    end
  else
    write(t,'Извините, но туда никак не пройти :)');
  close(t);
end;


//Основное тело
var
  way:pathway;
  gr,mark:graph;
  ch:check;
  size:integer;
  i,j,f:integer;
begin
  input(gr,mark,ch,size);
  writeln('Вам откуда и куда?');
  read(i,f);
  mark[1,i]:=0;
  j:=1;
  while not test(ch,size) do  //Используем алгоритм дейкстра, пока не процдем по всем вершинам
    begin
      algDeikstr(gr,mark,ch,size,j);
      inc(j);
    end;
  if mark[j-1,f]<>maxint then
    formationWay(f,i,mark,way,size);
  output(way,mark,size,f,j);
end.