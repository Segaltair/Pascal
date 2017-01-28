{����� ������������ ���������� �������. ������� �������, �������� ������.
������� ����� ���� 2�2 3�3 4�4 5�5.
���������� ��������� ������� ������� �� ������� �������}
const
  N=5;
type
  mas=array [1..N,1..N] of integer;
  
procedure input (var mat:mas);
var 
  i,k:byte;
  x:integer;
  t:text;
begin
  {for i:=1 to N do      //���������� ������� 
    for k:=1 to N do
      mat[i,k]:=random(8)+1;}
  assign(t,'text.txt');
  reset(t);
  for i:=1 to N do      //���������� ������� 
    for k:=1 to N do
      begin
        read(t,x);
        mat[i,k]:=x;
      end;
  close(t);
end;

procedure output (mat:mas);
var
  i,k:byte;
begin
  for i:=1 to N do      //����� �������
    begin
      for k:=1 to N do
        write(mat[i,k]:4,' ');
      writeln();
    end;
end;

procedure downToMat2x2 (var mat:mas;
                        var kmat:integer);
var
  i,k,j:byte;
  s,p,opr:integer;
  znam:array[1..N] of integer;
begin
  kmat:=1;
  for i:=1 to N do
    znam[i]:=1;
  for j:=1 to N-2 do                          //�������� ������� N-2 ���
    begin
      for i:=N-j+1 downto 1+j-1 do                          //������ ����������� ��������� �������
          znam[i]:=mat[i-j+1,1]*znam[i];   
      {��������������� ������, ����� ������ ��� ������� ��� ����� 0}
      for i:=N-j+1 downto 2 do                        //�� ��������� ������ �� ������
        begin
          {s:=mat[i-1,1];                          //���������� 
          p:=mat[i,1];            }                //����������
          for k:=N-j+1 downto 1 do                    //�� ���������� � ������� �������� � ������
            begin
              mat[i,k]:=mat[i,k]*mat[i-1,1]-mat[i-1,k]*mat[i,1];  //������ ������� �������(���������)
            end;
        end;   
      kmat:=mat[1,1]*kmat;
      for i:=2 to N do            //������ ����� ������� �� ������� ������
        for k:=2 to N do
          mat[i-1,k-1]:=mat[i,k];
    writeln();
    output(mat);
    writeln();
    for i:=1 to n do
    write(znam[i],' ');
    opr:=kmat*(mat[1,1]*mat[2,2]-mat[2,1]*mat[1,2]);
    end;
    
end;
  
function det (mat:mas;
              kmat:integer):integer;
begin
  det:=kmat*(mat[1,1]*mat[2,2]-mat[2,1]*mat[1,2]);
end;  
  
var 
  mat:mas;
  kmat:integer;
begin
  {writeln('������� ������� �������');
  readln(p);} 
  input (mat);
  output(mat);
  downToMat2x2(mat,kmat);
  output(mat);
  writeln(det(mat,kmat));
end.