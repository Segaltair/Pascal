{Пользователь вводит значение угла(в градусах), программа находит синус этого угла}
const
  MAX=1e20;
var
  x,x1:real;
begin
  writeln('Введите значение угла(в градусах)');
  readln(x);
  if abs(x)>MAX then
    writeln('Введено слишком большое значение.')
  else
    begin
      x1:=x*Pi/180; //Переводим в градусы
      writeln('sin(',x,')= ',sin(x1):0:3);
    end;
end.