{��������� ���� �������� ���������� ������� ����� �����. 
������ ������ ������� �������� � ��������� ������ �����. 
�������� � ������ �������� ���� �� ����� ����� ��� ����������� ���������. 
�������� � ������ ��������� ���� ������ �����, �������� � ������ �� ������� ���������.}

procedure input(var t1:text;  //���� ������
                var s:string);
begin
  writeln('Enter file name');
  read(s);
  assign(t1,s);
end;

procedure search (t1:text;s:string);  //�����
var  
  a,b,i:integer;
  z:boolean;
begin
  i:=1;               //����� ������
  reset(t1);
    while not eof(t1) do     //������ ���� ����
      begin    
        z:=true;              
        read(t1,a);          //��������� ������ �����
        while not eoln(t1) do//������ ��� ������
          begin  
            read(t1,b);      //�� ������� ��������� ��� ����� ������
            if a<>b then //���������� �� ��������� ������
              z:=false;//���� �� �����,�� ������ �������� z �� ����
          end;
        if z then//���� ��� ����� � ������ �����, �� 
          writeln(i); //������� ����� ������
        inc(i); //� ������� ���������
      end;
end;

var
  t1:text;
  s:string;
begin
  input(t1,s);
  if fileexists(s) then //���� ���� ����������, �� 
    begin
      reset(t1);        //��������� ����
      search(t1,s);     //���� � ������� ������
      close(t1)         //���������
    end
  else
    write('File not found');
end.