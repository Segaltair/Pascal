{��������� ����������� ��������� � �������� ����������� � ���
� �������� � ������� ������� �������� �� �������� � ����������}
const
  LIMIT_STROK=500;  //������������� ������ �� ���������� �����
  ABS_MINIMUM=-273;
var
  step:integer;
  nach,conech,k:real;
begin
  writeln('������� ��������� ����������� � �������� �����������');
  readln(nach,conech);
  while (nach<ABS_MINIMUM) or (conech<ABS_MINIMUM) or (conech=nach) do 
    //���� ������������ ������ ����������� ���� ����������� �������� ��� ������ ���������� ��������� � �������� ��������
    begin
      writeln('������. ������������ �������� ���������� (<-273) ��� ������� ���������� ��������� � �������� �������� �����������, ������� ������ ��������');
      readln(nach,conech);
    end;
  writeln('������� ���');
  readln(step);
  while (abs(nach-conech)/step)>LIMIT_STROK do  //���� ������� ������� ������� (����� LIMIT_STROK �����), �� ������ ������ ���
    begin               
      writeln('������� ��������� ���, ������� ������ ��������');
      readln(step);
    end;
  while step=0 do
    begin
      writeln('��� �� ����� ���� �������, ������� ������ ��������');
      readln(step);
    end;
  if conech>nach then 
    begin
      while (conech>=nach) do //����� ������� � ������������� �����
        begin 
          step:=abs(step);    //���� ��� �������������, �� ������� ������� � ������������� �����
          write(nach:10:3);
          k:= 9/5*nach + 32;
          writeln(k:12:3);
          nach:= nach + step;
        end;
    end
  else
    begin
      while (conech<=nach) do //����� ������� � ������������� �����
        begin
          step:=-abs(step);   //���� ��� �������������, �� ������� ������� � ������������� �����
          write(nach:10:3);
          k:= 9/5*nach + 32;
          writeln(k:12:3);
          nach:= nach + step;
        end;
    end;
end.
