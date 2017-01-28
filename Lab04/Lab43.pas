{��������� ����� ������� ������������ �� ���� ��������. � ���������� �������� ����� ���� ������}
procedure inputLengthOfTheSides (var a,b,c:real);//��������� ����� ���� ���� ������ ������������
begin
  write('Enter the length of the sides of a triangle: ');
  readln(a,b,c);
end;

function areaCalculated (a,b,c:real;
                         var s:real):real; //������� ���������� ������� ������������
var 
  p :real;
begin 
  if (a+b<=c) or (a+c<=b) or (b+c<=a) then //������ �� ������ (���� ����� ���� ���� ������ ������������ ������ �������) 
  writeln('Error, the sum of two sides is less than a third!')
  else
    begin
      p:=(a+b+c)/2;   //������� ������������ ������������
      s:=sqrt(p*(p-a)*(p-b)*(p-c));//������� ������� �� ������� ������
    end;
end;

procedure showResult (s:real);//��������� ������ ������� ������������
begin
  writeln('Area of a triangle is equal to the ',s:0:3);
end;

var             //������ ���������
  a,b,c,s:real;
begin
  inputLengthOfTheSides (a,b,c);//����������� ����� ������������
  areaCalculated(a,b,c,s);      //������� ������� ������������ � ������� ���������
  showResult(s);  //������� ���������
end.