const
  N=15;
  FIRSTTOP=4;//� ����� ������� �������� ��������
  

type
  graph=array [1..N+1,1..N+1] of integer;
  check=array [1..N] of boolean;
 
 
//���������� ���������� 
procedure input(var gr,grRes:graph;                
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


//������� ������ �������������� � ����������
procedure makeLink(var link:graph;
                   size:integer);
var i:integer;
begin
//������ ������� � ����� ���������� ���� ���������, � �������� � ���������
  for i:=1 to size do                    
    link[i,1]:=i;
end;


//�������� �� �������������� � ���������
function checkLink(i,imin_or_kmin:integer;
                   link:graph):boolean;
var
  j:integer;
begin
  checkLink:=False;
  j:=1;
  while link[i,j]<>0 do
    begin
      if link[i,j]=imin_or_kmin then
        checkLink:=True;
      inc(j);
    end;
end;                   
 
 
//����������� ���� �������� � ����
procedure union(var link:graph;
                imin,kmin:integer);
var
  ii,ki,ik,kk,i,k:integer;                
begin
  ii:=1;
  ki:=1;
  kk:=1;
  ik:=1;  
  while link[ii,ki]<>imin do//���� ��-��, ��� ���� ������ �������
    begin 
      inc(ki);
      if link[ii,ki]=0 then 
        begin
          inc(ii);
          ki:=1;
        end;
    end;
  while link[ik,kk]<>kmin do//������, ��� ������
    begin
      inc(kk);   
      if link[ik,kk]=0 then 
        begin
          inc(ik);
          kk:=1;
        end;
    end;
  while link[ii,ki]<>0 do//����������� �����, ��� ����� ���������� ������ ��-�� � ������
    inc(ki);
  kk:=1;
  while link[ik,kk]<>0 do//���������
    begin
      link[ii,ki]:=link[ik,kk];
      inc(ki);
      inc(kk);
    end;
  for kk:=1 to N do //�����, ��� ���������� ������ ��-�� ��������
    link[ik,kk]:=0;
end;


//�������� �����
procedure algPrima  (var gr,grRes,link:graph;
                     var ch:check;
                     size:integer);
var
  i,k,imin,min,kmin:integer;  
begin
  min:=maxint;
  for i:=1 to size do
    if ch[i]=true then
      for k:=1 to size do
        if (gr[i,k]<min) and (gr[i,k]>0) and (not checkLink(FIRSTTOP,k,link)) then
          begin
            min:=gr[i,k];
            imin:=i;
            kmin:=k;
          end; 
  gr[imin,kmin]:=0;
  gr[kmin,imin]:=0;
  grRes[imin,kmin]:=min;
  grRes[kmin,imin]:=min;
  ch[kmin]:=true;//����� ������, �������� �������, ��� ����������
  union(link,imin,kmin);
end;


//�����
procedure output (grRes:graph;
                  size:integer);
var
  t:text;
  i,k:integer;
begin
  assign(t,'output.txt');
  rewrite(t);
  for i:=1 to size do
    begin
      for k:=1 to size do 
        write(t,grRes[i,k],' ');
      writeln(t);
    end;
  close(t);
end;


//�������� ����
var
  gr,grRes,link:graph;
  ch:check;
  size:integer;
  i,k:integer;
begin
  input(gr,grRes,ch,size);
  makeLink(link,size);
  ch[FIRSTTOP]:=true;
  while not test(ch,size) do  //���������� �������� �����, ���� �� ������� �� ���� ��������
    algPrima(gr,grRes,link,ch,size);
  output(grRes,size);
end.