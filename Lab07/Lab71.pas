{Сортировка массива по возрастанию методом пузырька}
const
  N = 5;  //Количество элементов в массиве

var
  mas: array [1..N] of integer;
  i, k, r: integer;

begin
  writeln('Write elements of the array');
  for i := 1 to N do              //Ввод массива
    read(mas[i]);
  for k := N downto 2 do
    for i := 1 to k - 1 do
    begin
      if mas[i] > mas[i + 1] then //Если следующий элемент меньше предыдущего
      begin                       //То меняем их местами
        r := mas[i];
        mas[i] := mas[i + 1];
        mas[i + 1] := r;
      end;
    end;
  for i := 1 to N do              //Выводим отсортированный массив
    write(mas[i], ' ');
end.