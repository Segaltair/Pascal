{������ �������� �����, ������� ���������� ����� � �������}
procedure inputNameFile (var s:string);

begin                         //��� �����
  writeln('Enter name file');
  read(s);
end;

procedure outputContent (s:string); //����� ����������� � �������

var 
  t:text;
  c:char;
begin 
  assign(t,s);
  if fileexists(s) then //���� ���� ����������
    begin
      reset(t);
      while not eof(t) do //���� �� ��������� ����� �����
        begin
          read(t,c);//������ ������ � ������� � �������
          write(c);
        end;  
      close(t);
    end
  else 
    writeln('Error. Could not find file');//���� ���� �� ������
end;

var
  s:string;
  
begin//�������� ���� ���������
  inputNameFile(s);//������ ����� �����
  outputContent(s);//����� ����������� � �������
end.