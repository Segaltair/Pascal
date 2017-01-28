{Дан текстовый файл f1. Длина строк не более 200 символов. 
Слова в строках отделены друг от друга одним или несколькими пробелами и знаками препинания. 
Длина слова не более 30 символов. 
Файл f2 содержит не более 40 слов, которые разделены запятыми. 
Эти слова образуют пары: каждое первое слово считается заменяемым, каждое второе – заменяющим. 
Найти в файле f1 все заменяемые слова и заменить их на соответствующие заменяющие. 
Результат поместить в файл g.}
const
  N=20;//Максимальное количество заменяемых слов

type
  words=array [1..N] of string;

procedure savezam(var zam1,zam2:words);//Сохраняем в массивы заменямые и заменяющие слова
var
  word1:string;
  c:char;
  z:boolean;
  i,j:integer;
  f2:text;
begin
  i:=1;
  j:=1;
  z:=true;
  assign(f2,'f2.txt');
  reset(f2);
  read(f2,c);
  while not eof(f2) do
    begin
      word1:='';     
      while (c<>',') and (not eof(f2)) do//Читаем слово
        begin
          word1:=word1+c;
          read(f2,c);
        end;
      if z then         //Сохраняем в массивы
        begin
          zam1[i]:=word1;
          inc(i);
          z:=false;
          if not eof(f2) then
            read(f2,c);
        end
      else
        begin
          zam2[j]:=word1;
          inc(j);
          z:=true;
          if not eof(f2) then
            read(f2,c);
        end;
    end;
  close(f2);
  {for i:=1 to N do //Вывод массивов
    write(zam1[i],' ');
  writeln();
  for i:=1 to N do
    write(zam2[i],' ');}
end;

procedure zamena(zam1,zam2:words);
var
  f1,g:text;
  i:integer;
  c:char;
  word1:string;
begin
  assign(f1,'f1.txt');
  reset(f1);
  assign(g,'g.txt');
  rewrite(g);
  read(f1,c);
  while not eof(f1) do
    begin
      word1:='';
      while (c<>' ') and (c<>',') and (not eof(f1)) do//Читаем слово
        begin
          word1:=word1+c;
          read(f1,c);
        end;
        {writeln(word1);//Вывод на экран всех слов в отдельной строке}
      for i:=1 to N do//Пробиваем слово по базе 
        if word1=zam1[i] then//Если слово есть в базе то заменяем
          word1:=zam2[i];
      write(g,word1);//Записываем слово(какое бы оно не было) в итоговый файл
      while ((c=' ') or (c=',')) and (not eof(f1))  do//Туда же записываем все пробелы
        begin
          write(g,c);
          if not eof(f1) then
            read(f1,c)
        end;
    end;
    close(g);
    close(f1);
end;

var
  zam1,zam2:words;
begin
  savezam(zam1,zam2);
  zamena(zam1,zam2);
end.