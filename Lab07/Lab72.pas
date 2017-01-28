{Сортировка массива по возрастанию методом простого выбора}
const
  N=5;//Размер массива
var
  a:array[1..N] of integer;
  i,k,med,min,l:integer;
begin
  for i:=1 to N do          //Вводим элементы массива
    read(a[i]);
  for i:=1 to N do     
    begin
      min:=a[i];
      for k:=(i+1) to N do  //Ищем минимальный
        begin
          if a[k]<min then      //Если нашли элемент меньше минимального
            begin                 //Сохраняем элемент и его индекс
              min:=a[k];
              l:=k
            end;
        end;
      if a[i]<>min then       //Если рассматриваемый элемент и есть минимальный
        begin                     //Меняем их местами
          med:=a[i];
          a[i]:=min;
          a[l]:=med;
        end;
    end;
  for i:=1 to N do          //Вывод отсортированного массива
    write(a[i],' ');
end.