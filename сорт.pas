{���������� �������}
const
  N=100;//���������� ����� �������

type 
  tree=^S;//������
  s=record
    key:integer;
    left:tree;
    right:tree;
  end;
  Tarray=array[1..N] of integer;//������ 
   
procedure Input(var arr:tarray; var k:integer);//��������� �����
var
  i:integer;
begin
  writeln('Enter amount of elements');
  readln(k);
  writeln('Enter elements');
  for i:=1 to k do
    read(arr[i]);
end;

procedure round(a:tree);//������������ ����� ������
begin
  if a<>nil then
  begin
    round(a^.left);
    write(a^.key,' ');
    round(a^.right);
  end;
end;

procedure ins(root:integer;var a:tree);//������� ����� � ������
begin
    if (a=nil) then//���� �� � ������ �����
      begin
      new(a);//������� ���
      a^.key:=root;//���������
      a^.left:=nil;
      a^.right:=nil;
      end
    else
    begin  
      if root>a^.key then//���� ������ ���� �������, ���� ������ �����
        ins(root,a^.right)
      else
        ins(root,a^.left);
    end;
end;

procedure Do_tree(arr:tarray;k:integer; var a:tree);//���������� ������
var
  i:integer;
begin
  for i:=1 to k do//������ ������� ������� ��������� � ������
    ins(arr[i],a);
end;

var
  a:tree;//������
  arr:tarray;//������
  k:integer;//���-�� ���������

begin
  Input(arr,k);//���� �������
  Do_tree(arr,k,a);//���������� ������
  Round(a);//������������ ����� ������
end.