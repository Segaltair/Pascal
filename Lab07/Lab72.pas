{���������� ������� �� ����������� ������� �������� ������}
const
  N=5;//������ �������
var
  a:array[1..N] of integer;
  i,k,med,min,l:integer;
begin
  for i:=1 to N do          //������ �������� �������
    read(a[i]);
  for i:=1 to N do     
    begin
      min:=a[i];
      for k:=(i+1) to N do  //���� �����������
        begin
          if a[k]<min then      //���� ����� ������� ������ ������������
            begin                 //��������� ������� � ��� ������
              min:=a[k];
              l:=k
            end;
        end;
      if a[i]<>min then       //���� ��������������� ������� � ���� �����������
        begin                     //������ �� �������
          med:=a[i];
          a[i]:=min;
          a[l]:=med;
        end;
    end;
  for i:=1 to N do          //����� ���������������� �������
    write(a[i],' ');
end.