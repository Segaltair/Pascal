{������� ����� �� �����. ����������� �������� ����� � ��������� � ��������, � 
���������� ������������ ����� � ������ ���븨}
procedure inputNameFile (var s1,s2:string);//���� ���� ������

begin
  writeln('Enter the file name');
  readln(s1);
  writeln('Enter the name file that records the result');
  readln(s2);
end;

procedure transformation (s1,s2:string);

var
  c:char;
  x:byte;
  t1,t2:text;
begin
  assign(t1,s1);
  reset(t1);
  assign(t2,s2);
  rewrite(t2);
  if fileExists(s1) then       //���� ���� ����������
    begin
      while not eof(t1) do     //���������� �� �����
        begin 
          read(t1,c);         //������ ������
          x:=ord(c);          //��������� ��� ���
          case ord(c) of      //����������� ���
            168:inc(x,16);    //�
            184:dec(x,16);    //�
            65..90:inc(x,32); // 
            97..122:dec(x,32);//
            192..223:inc(x,32);
            224..255:dec(x,32);
          end;
          c:=chr(x);        //
          write(t2,c);
        end;
      close(t1);
      close(t2);
    end
  else
    begin
      writeln('Error. Not found the source file');
    end;
end;

var
  s1,s2:string;
begin
  inputNameFile(s1,s2);
  transformation(s1,s2);
end.