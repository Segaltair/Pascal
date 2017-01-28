//Алгоритм Крускала
const
  N=15;//Максимальная размерность графа

type
  graph=array [1..N,1..N+1] of integer;


//Сохраняем граф в массив 
procedure input(var grSource:graph;
                var size:integer); //размерность графа
var 
  t:text;
  i,k:integer;
  //s:string;
begin
  //writeln('Введите имя файла');
  //read(s);
  assign(t,'input.txt');
  reset(t);
  i:=1;
  k:=1;
  while not eof(t) do
    begin
      read(t,grSource[i,k]);//заполняем граф в матрице
      if not eoln(t) then //считываем строку                  
        inc(k)          
      else
        begin            
          inc(i);
          k:=1;
        end;
      size:=i-1;//Размерность графа
    end;            
  close(t);   
end;  


//Создаем массив принадлежности к множествам
procedure makeLink(var link:graph;
                   size:integer);
var i:integer;
begin
//Каждой вершине в графе присваивем свое множество, с индексом и значением
  for i:=1 to size do                    
    link[i,1]:=i;
end;

 
//Поиск минимальной дороги в графе
procedure searchMin(grSource:graph;                                        
                    size:integer;
                    var imin,kmin:integer);
var
  i,k,amin:integer;
begin
  amin:=maxint;
  for i:=1 to size-1 do
    for k:=2 to size do
      if (i<k) and (grSource[i,k]>0) and (grSource[i,k]<amin) then
        begin
          imin:=i;
          kmin:=k;
          amin:=grSource[i,k];
        end;
end;


//Проверка на принадлежность к множеству
function checkLink(i,imin_or_kmin:integer;
                   link:graph):boolean;
var
  j:integer;
begin
  checkLink:=False;
  j:=1;
  while link[i,j]<>0 do
    begin
      if link[i,j]=imin_or_kmin then
        checkLink:=True;
      inc(j);
    end;
end;                   
 
 
//Объединение двух множеств в один
procedure union(var link:graph;
                imin,kmin:integer);
var
  ii,ki,ik,kk:integer;                
begin
  ii:=1;
  ki:=1;
  kk:=1;
  ik:=1;  
  while link[ii,ki]<>imin do//Ищем мн-во, где есть первый элемент
    begin    
      inc(ki);
      if link[ii,ki]=0 then 
        begin
          inc(ii);
          ki:=1;
        end;
    end;
  while link[ik,kk]<>kmin do//теперь, где второй
    begin
      inc(kk);   
      if link[ik,kk]=0 then 
        begin
          inc(ik);
          kk:=1;
        end;
    end;
  while link[ii,ki]<>0 do//подыскиваем место, где можно разместить второе мн-во в первом
    inc(ki);
  kk:=1;
  while link[ik,kk]<>0 do//размещаем
    begin
      link[ii,ki]:=link[ik,kk];
      inc(ki);
      inc(kk);
    end;
  for kk:=1 to N do //Место, где находилось второе мн-во зануляем
    link[ik,kk]:=0;
end;

  
//Построение остовного дерева
procedure constructionGrRes(var grSource,grRes,link:graph;    
                            var i:integer;
                            size,imin,kmin:integer);
var
  check:boolean;                           
begin
  searchMin(grSource,size,imin,kmin);
  if (imin<>0) or (kmin<>0) then//когда закончатся ненулевые элементы ничего не выполняется
  begin
    check:=false;  
    for i:=1 to size do
      if checkLink(i,imin,link) and checkLink(i,kmin,link) then
        check:=true;
    if check then//Ищем другой мин
      grSource[imin,kmin]:=0
    else       
      union(link,imin,kmin);      
    grRes[imin,kmin]:=grSource[imin,kmin];
    grSource[imin,kmin]:=0;
  end;
end;                            


procedure output (size:integer;
                  grRes:graph);
var
  t:text;
  i,j:integer;
begin
  assign(t,'output.txt');
  rewrite(t);
  for i:=1 to size do
    begin
      for j:=1 to size do
        write(t,grRes[i,j],' ');
      writeln(t);
    end;
  close(t);
end;


//Основное тело
var
  grSource,grRes,Link:graph;
  i,k,size,imin,kmin,j:integer;
begin
  input(grSource,size);
  makeLink(link,size); 
  for j:=1 to N*(N-1) div 2 do  
    constructionGrRes(grSource,grRes,link,i,size,imin,kmin);
  for i:=1 to size-1 do
    for k:=2 to size do
      if (i<k) and (grRes[i,k]>0) then
        grRes[k,i]:=grRes[i,k];
  {for i:=1 to size do
    begin
      for k:=1 to size do
        write(grRes[i,k],' ');
      writeln;
    end;}
  output(size,grRes);
end.  