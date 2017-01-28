{Вывод чисел от 1 до 10 с помощью цикла while}
const
  MAX=10;
  MIN=1;
var
  i:integer;
begin
  i:=MIN;            //Переменной i присваиваем значение нижней границы
  while i<=MAX do
    begin            //Пока i<=max будем выводить i и увеличивать на единицу
      writeln(i);
      inc(i);
    end;
end.
