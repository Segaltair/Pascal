{������������ ������ �������� ����(� ��������), ��������� ������� ����� ����� ����}
const
  MAX=1e20;
var
  x,x1:real;
begin
  writeln('������� �������� ����(� ��������)');
  readln(x);
  if abs(x)>MAX then
    writeln('������� ������� ������� ��������.')
  else
    begin
      x1:=x*Pi/180; //��������� � �������
      writeln('sin(',x,')= ',sin(x1):0:3);
    end;
end.