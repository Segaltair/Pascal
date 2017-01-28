{Требуется найти площадь треугольника по трем сторонам. С клавиатуры вводятся длины трех сторон}
procedure inputLengthOfTheSides (var a,b,c:real);//Процедура ввода длин трех сторон треугольника
begin
  write('Enter the length of the sides of a triangle: ');
  readln(a,b,c);
end;

function areaCalculated (a,b,c:real;
                         var s:real):real; //Функция вычисления площади треугольника
var 
  p :real;
begin 
  if (a+b<=c) or (a+c<=b) or (b+c<=a) then //Защита от дурака (если сумма двух длин сторон треугольника меньше третьей) 
  writeln('Error, the sum of two sides is less than a third!')
  else
    begin
      p:=(a+b+c)/2;   //НАходим полупериметр треугольника
      s:=sqrt(p*(p-a)*(p-b)*(p-c));//НАходим площадь по формуле Герона
    end;
end;

procedure showResult (s:real);//Процедура вывода площади треугольника
begin
  writeln('Area of a triangle is equal to the ',s:0:3);
end;

var             //Начало программы
  a,b,c,s:real;
begin
  inputLengthOfTheSides (a,b,c);//Запрашиваем длины треугольника
  areaCalculated(a,b,c,s);      //Находим площадь треугольника и выводим результат
  showResult(s);  //ВЫводим результат
end.