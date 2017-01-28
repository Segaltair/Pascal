{Вводим название файла, выводим содержимое файла в консоль}
procedure inputNameFile (var s:string);

begin                         //имя файла
  writeln('Enter name file');
  read(s);
end;

procedure outputContent (s:string); //вывод содержимого в консоль

var 
  t:text;
  c:char;
begin 
  assign(t,s);
  if fileexists(s) then //если файл существует
    begin
      reset(t);
      while not eof(t) do //пока не достигнут конец файла
        begin
          read(t,c);//читаем символ и выводим в консоль
          write(c);
        end;  
      close(t);
    end
  else 
    writeln('Error. Could not find file');//если файл не найден
end;

var
  s:string;
  
begin//основной блок программы
  inputNameFile(s);//Запрос имени файла
  outputContent(s);//Вывод содержимого в консоль
end.