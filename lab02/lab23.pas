{����� ����� �� 1 �� 10 � ������� ����� while}
const
  MAX=10;
  MIN=1;
var
  i:integer;
begin
  i:=MIN;            //���������� i ����������� �������� ������ �������
  while i<=MAX do
    begin            //���� i<=max ����� �������� i � ����������� �� �������
      writeln(i);
      inc(i);
    end;
end.
