{������ ����. ������� � ��� ��������� �� �������� � ������ � ������ ����}
const
  N=100;                                
type
  strings=array[1..N] of string; //������ �� ����� 
  
procedure Sort(var str:strings;n:integer);//���������� ������� ���������
var
  k,j:integer;
  str1:string;
begin
  for k:=N downto 1 do
    for j:=1 to k-1 do
      if str[j]>str[j+1] then
      begin
        str1:=str[j];
        str[j]:=str[j+1];
        str[j+1]:=str1
      end;
end;  
      
procedure Input(var name:string);//����
begin
  writeln('Enter name of file');
  readln(name);
end;

var
  f,f2:text;//����
  str:strings;//��� �����
  filename:string;
  i,k:integer;
begin
  input(FileName);
  if not FileExists(FileName) then//���� ����� ���, �� ����� ���������� ����� �������
    FileName:=FileName+'.txt';
  if FileExists(FileName) then//���� ���� ����
    begin
      assign(f,FileName); 
      assign(f2,'Rez.txt');
      reset(f);//��������� ��������� ����
      i:=1;
      while not EoF(f) do//��������� ������
        begin
          readln(f,str[i]);
          i:=i+1;
        end;
      close(f);//��������� ����
      i:=i-1;//������ ����� �����
      Sort(str,i);//���������
      rewrite(f2);//������� Rez
      for k:=1 to i do//������� ������
        writeln(f2,str[k]); 
      close(f2);//���������
    end
  else
    writeln('File is not');  
end.