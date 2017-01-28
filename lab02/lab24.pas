{вывод чисел от 1 до 10 с помощью цикла repeat}
const
  MAX=10;
  MIN=1;
var
  i:integer;
begin
  i:=MIN;
  repeat
    writeln(i);   //¬ыводим i и увеличиваем его на единицу пока i не будет больше чем max
    i:=i+1;
  until i>MAX;
end.
