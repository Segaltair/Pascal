{Вводится строка. Выводится график, показывающий сколько раз встречается каждый символ}
const
  N = 255;//Количество символов

type
  masstr=array [0..N] of string;
  massyms=array [0..N] of integer;

procedure input(var str: string);//Ввод строки
begin
  readln(str);
end;
  
function table (var str: string;
                var massym:masstr;//Создаем массив для хранения всех возможных символов в паскале
                var tab:massyms): string;//Вывод таблицы
var
  c:string;                   //Новая строка
  m,k:integer;  
  i:byte;
begin
  for i:=0 to N do //Сначала заполним массив massym всеми возможными символами, а массив tab зануляем
  begin
    massym[i]:=chr(i);
    tab[i]:=0;
  end;
  for k:=1 to length(str) do  //Пробегаемся по всей строке
  begin
    c := copy(str, k, 1);//Смотрим k-ый символ
    for i := 0 to N do    //Ищем его в массиве символов
    begin
      if c = massym[i] then //Когда находим, увеличиваем на единицу соответствующий код символа в таблице символов
        inc(tab[i]); 
    end;
  end;
end;

procedure outputTab(massym:masstr;//Вывод таблицы
                    tab:massyms);
var                    
  m,i:integer;
begin
  for m:=0 to N do//Выводим таблицу
    begin
      if tab[m]<>0 then//Выводим только те символы, количество которых в строке больше нуля
      begin
        write('"',massym[m],'" ');
        for i:=1 to tab[m] do
          write('*');
        writeln();
      end;
    end;
end;

var     //Основной блок программы
  str: string;
  massym:masstr;
  tab:massyms;
begin     
  input(str);
  table(str,massym,tab);
  outputTab(massym,tab);
end.