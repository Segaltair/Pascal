{Требуется написать программу, которая по заданным координатам вершин
треугольника выводит его площадь и длины медиан}
procedure inputPoints (var x1,y1,x2,y2,x3,y3:real);  //Создаем процедуру которая запрашиваем у пользователя координаты вершин треугольника 
begin
  write('Press koordinate x1 y1 first point: ');
  readln(x1,y1);
  write('Press koordinate x2 y2 second point: ');
  readln(x2,y2);
  write('Press koordinate x3 y3 third point: ');
  readln(x3,y3);
end;

function areaCalculation (x1,y1,x2,y2,x3,y3:real; //Создаем функцию, которая будет вычислять площадь треугольника по его вершинам
                          var s:real):real;       
var
  p,a,b,c:real; //Переменная 'р' хранит полупериметр треугольника, 'a', 'b', 'c' длины его сторон
begin
  a:=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));  //Находим стороны треугольника
  b:=sqrt((x2-x3)*(x2-x3)+(y2-y3)*(y2-y3));
  c:=sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1));
  p:=(a+b+c)/2;    //Находим полупериметр
  s:=sqrt(p*(p-a)*(p-b)*(p-c));  //По формуле Герона вычисляем площадь
end;

function mediansCalculation (x1,y1,x2,y2,x3,y3:real;   //Функция нахождения длин медиан
                             var m1,m2,m3:real):real;
var
  xm1,xm2,xm3,ym1,ym2,ym3:real;
begin
  xm1:=(x2+x3)/2;               //Находим координаты вершин медиан
  ym1:=(y2+y3)/2;
  xm2:=(x1+x3)/2;
  ym2:=(y1+y3)/2;
  xm3:=(x1+x2)/2;
  ym3:=(y1+y2)/2;
  m1:=sqrt((x1-xm1)*(x1-xm1)+(y1-ym1)*(y1-ym1)); //Находим длины медиан
  m2:=sqrt((x2-xm2)*(x2-xm2)+(y2-ym2)*(y2-ym2));
  m3:=sqrt((x3-xm3)*(x3-xm3)+(y3-ym3)*(y3-ym3));
end;

procedure showResult(s,m1,m2,m3:real); //Процедура выводит на экран площадь и длины медиан треугольника
begin
  writeln('Area of a triangle is equal to the ',s);
  writeln('The length of the medians of a triangle are equal ',m1:0:3,', ',m2:0:3,' and ',m3:0:3);
end;

var                               //Начало программы
  x1,x2,x3,y1,y2,y3,s,m1,m2,m3:real;
begin
  inputPoints(x1,y1,x2,y2,x3,y3); //Вызываем процедуру запроса координат
  if ((x1=x2) and (y1=y2)) or ((x1=x3) and (y1=y3)) or ((x2=x3) and (y2=y3)) then //Проверяем не ввел ли пользователь некоректные координаты(одинаковые)
    writeln('Incorrectly coordinates!')
  else
    begin                                           
      areaCalculation(x1,y1,x2,y2,x3,y3,s);           //Находим площадь
      mediansCalculation (x1,y1,x2,y2,x3,y3,m1,m2,m3);//Находим длины медиан
      showResult(s,m1,m2,m3);  //Выводим результат на экран
    end;
end.                          
