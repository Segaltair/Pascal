{��� ��������� ���� f1. ����� ����� �� ����� 200 ��������. 
����� � ������� �������� ���� �� ����� ����� ��� ����������� ��������� � ������� ����������. 
����� ����� �� ����� 30 ��������. 
���� f2 �������� �� ����� 40 ����, ������� ��������� ��������. 
��� ����� �������� ����: ������ ������ ����� ��������� ����������, ������ ������ � ����������. 
����� � ����� f1 ��� ���������� ����� � �������� �� �� ��������������� ����������. 
��������� ��������� � ���� g.}
const
  N=20;//������������ ���������� ���������� ����

type
  words=array [1..N] of string;

procedure savezam(var zam1,zam2:words);//��������� � ������� ��������� � ���������� �����
var
  word1:string;
  c:char;
  z:boolean;
  i,j:integer;
  f2:text;
begin
  i:=1;
  j:=1;
  z:=true;
  assign(f2,'f2.txt');
  reset(f2);
  read(f2,c);
  while not eof(f2) do
    begin
      word1:='';     
      while (c<>',') and (not eof(f2)) do//������ �����
        begin
          word1:=word1+c;
          read(f2,c);
        end;
      if z then         //��������� � �������
        begin
          zam1[i]:=word1;
          inc(i);
          z:=false;
          if not eof(f2) then
            read(f2,c);
        end
      else
        begin
          zam2[j]:=word1;
          inc(j);
          z:=true;
          if not eof(f2) then
            read(f2,c);
        end;
    end;
  close(f2);
  {for i:=1 to N do //����� ��������
    write(zam1[i],' ');
  writeln();
  for i:=1 to N do
    write(zam2[i],' ');}
end;

procedure zamena(zam1,zam2:words);
var
  f1,g:text;
  i:integer;
  c:char;
  word1:string;
begin
  assign(f1,'f1.txt');
  reset(f1);
  assign(g,'g.txt');
  rewrite(g);
  read(f1,c);
  while not eof(f1) do
    begin
      word1:='';
      while (c<>' ') and (c<>',') and (not eof(f1)) do//������ �����
        begin
          word1:=word1+c;
          read(f1,c);
        end;
        {writeln(word1);//����� �� ����� ���� ���� � ��������� ������}
      for i:=1 to N do//��������� ����� �� ���� 
        if word1=zam1[i] then//���� ����� ���� � ���� �� ��������
          word1:=zam2[i];
      write(g,word1);//���������� �����(����� �� ��� �� ����) � �������� ����
      while ((c=' ') or (c=',')) and (not eof(f1))  do//���� �� ���������� ��� �������
        begin
          write(g,c);
          if not eof(f1) then
            read(f1,c)
        end;
    end;
    close(g);
    close(f1);
end;

var
  zam1,zam2:words;
begin
  savezam(zam1,zam2);
  zamena(zam1,zam2);
end.