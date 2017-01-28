{��������� ������ ������� ��������� �� �������. ��� �������� ������������������
���������� ��� uint64, ����������� ������� �������� �� 110(47) ����� ������������������}
{������� ������ M+2 �� N+2. ������ ����� 1, �� ��� ������ ����� ����� 0. ����� ���������}
procedure pfib(var fib1,fib2:integer);
var
  fib:integer;
begin
  fib:=fib1+fib2;
  fib1:=fib2;
  fib2:=fib;
end;

const
  M=4;//���-�� �����
  N=6;//���-�� ��������
var
  i,k,j:byte;
  fib1,fib2:integer;
  tab:array [1..M+2,1..N+2] of integer;
begin
  if (N>13) or (M*N>46) then  //������ �����������, ����� ������� ���� ����������
    writeln('Error! Number of lines of more than 10 or the number of elements in the sequence more than 46')
  else
    begin
      for i:=1 to M+2 do    //�������� ������
        for k:=1 to N+2 do
          tab[i,k]:=0;
      for i:=1 to M+2 do    //�� ����� �������� 1
        begin
          tab[i,1]:=1;
          tab[i,N+2]:=1;       
        end;
      for k:=1 to N+2 do
        begin
          tab[1,k]:=1;
          tab[M+2,k]:=1;   //��������� ������� 1
        end;
      fib1:=1;
      fib2:=1;
      i:=2;
      k:=1;
      for j:=1 to 4 do
        begin
          while tab[i,k+1]=0 do //���� ������
            begin
              tab[i,k+1]:=fib1;
              inc(k);
              pfib(fib1,fib2);
            end;
          while tab[i+1,k]=0 do //���� ����
            begin
              tab[i+1,k]:=fib1;
              inc(i);
              pfib(fib1,fib2);
            end;
          while tab[i,k-1]=0 do //�����
            begin
              tab[i,k-1]:=fib1;
              dec(k);
              pfib(fib1,fib2);
            end;
          while tab[i-1,k]=0 do //�����
            begin
              tab[i-1,k]:=fib1;
              dec(i);
              pfib(fib1,fib2);
            end;
        end;
      for i:=2 to M+1 do    //������� ������
        begin
          for k:=2 to N+1 do
            write(tab[i,k]:11,' ');
          writeln();
        end;
    end;
    
end.{
9223372036854775808
1323752223
}