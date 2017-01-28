{Программа запрашивает начальную и конечную температуру и шаг
в цельсиях и выводит таблицу перевода из цельсиях в фаренгейты}
const
  LIMIT_STROK=500;  //Устанавливаем предел на количество строк
  ABS_MINIMUM=-273;
var
  step:integer;
  nach,conech,k:real;
begin
  writeln('Введите начальную температуру и конечную температуру');
  readln(nach,conech);
  while (nach<ABS_MINIMUM) or (conech<ABS_MINIMUM) or (conech=nach) do 
    //Если пользователь вводит температуру ниже абсолютного минимума или вводит одинаковые начальные и конечные значения
    begin
      writeln('Ошибка. Неккоректные значения температур (<-273) или введены одинаковые начальные и конечные значения температуры, введите другие значения');
      readln(nach,conech);
    end;
  writeln('Введите шаг');
  readln(step);
  while (abs(nach-conech)/step)>LIMIT_STROK do  //Если таблица слишком большая (более LIMIT_STROK строк), то ввести другой шаг
    begin               
      writeln('Слишком маленький шаг, введите другое значение');
      readln(step);
    end;
  while step=0 do
    begin
      writeln('Шаг не может быть нулевым, введите другое значение');
      readln(step);
    end;
  if conech>nach then 
    begin
      while (conech>=nach) do //Вывод таблицы с положительным шагом
        begin 
          step:=abs(step);    //Если шаг отрицательный, то выводим таблицу с положительным шагом
          write(nach:10:3);
          k:= 9/5*nach + 32;
          writeln(k:12:3);
          nach:= nach + step;
        end;
    end
  else
    begin
      while (conech<=nach) do //Вывод таблицы с отрицательным шагом
        begin
          step:=-abs(step);   //Если шаг положительный, то выводим таблицу с отрицательным шагом
          write(nach:10:3);
          k:= 9/5*nach + 32;
          writeln(k:12:3);
          nach:= nach + step;
        end;
    end;
end.
