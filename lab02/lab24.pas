{����� ����� �� 1 �� 10 � ������� ����� repeat}
const
  MAX=10;
  MIN=1;
var
  i:integer;
begin
  i:=MIN;
  repeat
    writeln(i);   //������� i � ����������� ��� �� ������� ���� i �� ����� ������ ��� max
    i:=i+1;
  until i>MAX;
end.
