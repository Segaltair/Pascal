{Текстовый файл содержит квадратную матрицу целых чисел. 
Каждая строка матрицы записана в отдельной строке файла. 
Элементы в строке отделены друг от друга одним или несколькими пробелами. 
Записать в другой текстовый файл номера строк, элементы в каждой из которых одинаковы.}

procedure input(var t1:text;  //Ввод строки
                var s:string);
begin
  writeln('Enter file name');
  read(s);
  assign(t1,s);
end;

procedure search (t1:text;s:string);  //Поиск
var  
  a,b,i:integer;
  z:boolean;
begin
  i:=1;               //Номер строки
  reset(t1);
    while not eof(t1) do     //Читаем весь файл
      begin    
        z:=true;              
        read(t1,a);          //Считываем первое число
        while not eoln(t1) do//Читаем всю строку
          begin  
            read(t1,b);      //По очереди считываем все числа строки
            if a<>b then //Сравниваем со следующим числом
              z:=false;//Если не равны,то меняем значение z на ложь
          end;
        if z then//Если все числа в строке равны, то 
          writeln(i); //Выводим номер строки
        inc(i); //И смотрим следующую
      end;
end;

var
  t1:text;
  s:string;
begin
  input(t1,s);
  if fileexists(s) then //Если файл существует, то 
    begin
      reset(t1);        //Открываем файл
      search(t1,s);     //Ищем и выводим строки
      close(t1)         //Закрываем
    end
  else
    write('File not found');
end.