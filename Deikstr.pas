const
  N=15;


type
  graph=array [1..N+1,1..N+1] of integer;
  check=array [1..N] of boolean;
  pathway=array [1..N] of integer;
 
 
//���������� ���������� 
procedure input(var gr,mark:graph;                
                var ch:check;
                var size:integer);  //����������� �����
var 
  t:text;
  i,k:integer;
  //s:string;
begin
  //writeln('������� ��� �����');
  //s:='out.txt';
  //read(s);
  assign(t,'input.txt');
  reset(t);
  i:=1;
  k:=1;
  while not eof(t) do
    begin
      read(t,gr[i,k]);//��������� ���� � �������
      if not eoln(t) then //���� ��������� ��������� ������                  
        inc(k)          
      else
        begin            
          inc(i);
          k:=1;
        end;
    end;
  size:=i-1;//����������� �����
  for i:=1 to size do
    begin
      mark[1,i]:=maxint;//���������� �� ������ ����� ���� ����� �������������
      ch[i]:=false;
    end;
  close(t);   
end;


//�������� �� ������������ ���� ������
function test(ch:check;
         size:integer):boolean;
var
  i:integer;
begin
  test:=true;
  for i:=1 to size do
    if not ch[i] then
      test:=false;
end;


//���� ��� �� ��������� ��������
{
����� �������, ������� ��� �� �����, � ����������� ������ � �������� 
����� �� ����������� � ��� ��������.
���� ����� ����� ����� ������� � ����� ������ � ����������� ������ 
�������� ����� �����������, �� �������� �������� ����� �����������.
����� ������, �������� �������, ��� ����������.
}
procedure algDeikstr(var gr,mark:graph;
                     var ch:check;
                     size:integer;
                     j:integer);
var
  i,k,imin,amin:integer;  
begin
  amin:=maxint;
  for i:=1 to size do//����� �������, ������� ��� �� �����, � ����������� ������
    if (mark[j,i]<amin) and (ch[i]=false) then
      begin
        amin:=mark[j,i];//����������� �����
        imin:=i;        //������� � ���� ����������� ������
      end; 
  mark[j,size+1]:=imin;
  if imin=0 then
    for i:=1 to size do
      ch[i]:=true
  else
    for k:=1 to size do//� ���������� �� ����������� � ��� ��������
      begin            
        if (gr[imin,k]>0) and (gr[imin,k]+mark[j,imin]<mark[j,k]) then
          mark[j,k]:=gr[imin,k]+mark[j,imin];  
        mark[j+1,k]:=mark[j,k];
      end;
  if imin<>0 then
    ch[imin]:=true;//����� ������, �������� �������, ��� ����������
end;


//���������� ����������� ����
{
  ����� ������� �� ����� ����� ���������� �������� � �������
  mark ����� ������ � ���� ��������� ����� �� ������ ����,
  � ������ ������ ������� �������� ����� � ������ ������� �� �����
  ����, ������ ��������� ����� � ������� ����� ������ ������� �����, 
  ������� �� �������������. ������� � ��������� ������ ������� � ���������� 
  ������ �� ������ ��������� ���� �� ����� � ������. ���� �� ���������� ����
  ��������� �������� ���������� ����� ���� ����������, ��, ����� ������� � 
  �������� ����� �� ������ ������ ����� ��� �������.
}
procedure FormationWay (f,i:integer;
                        mark:graph;
                        var way:pathway;
                        size:integer);
var
  j,k:integer;
begin
  j:=size;
  k:=1;
  way[N]:=f;
  while j<>1 do
    begin
      if mark[j,f]<>mark[j-1,f] then//���� �� ���������� ���� ��������� ���������� ����� ����
        begin                       //�� �� ������ ������ ����� ��� �������
          way[N-k]:=mark[j,size+1];
          inc(k);
          f:=mark[j,size+1];
        end;
      dec(j);
    end;
  way[N-k-1]:=i;
end;


//�����
procedure output (way:pathway;
                  mark:graph;
                  size,f,j:integer);
var
  t:text;
  k:integer;
begin
  assign(t,'output.txt');
  rewrite(t);
  if mark[j-1,f]<>maxint then
    begin
      write(t,'��� ���������� ���� ');
      for k:=1 to N do
        if way[k]<>0 then
          write(t,way[k],' ');
      writeln(t);
      write(t,'����� ���� ����� ',mark[size,f]);     
    end
  else
    write(t,'��������, �� ���� ����� �� ������ :)');
  close(t);
end;


//�������� ����
var
  way:pathway;
  gr,mark:graph;
  ch:check;
  size:integer;
  i,j,f:integer;
begin
  input(gr,mark,ch,size);
  writeln('��� ������ � ����?');
  read(i,f);
  mark[1,i]:=0;
  j:=1;
  while not test(ch,size) do  //���������� �������� ��������, ���� �� ������� �� ���� ��������
    begin
      algDeikstr(gr,mark,ch,size,j);
      inc(j);
    end;
  if mark[j-1,f]<>maxint then
    formationWay(f,i,mark,way,size);
  output(way,mark,size,f,j);
end.