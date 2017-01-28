{�������� ������. ��������� ������, ������������ ������� ��� ����������� ������ ������}
const
  N = 255;//���������� ��������

type
  masstr=array [0..N] of string;
  massyms=array [0..N] of integer;

procedure input(var str: string);//���� ������
begin
  readln(str);
end;
  
function table (var str: string;
                var massym:masstr;//������� ������ ��� �������� ���� ��������� �������� � �������
                var tab:massyms): string;//����� �������
var
  c:string;                   //����� ������
  m,k:integer;  
  i:byte;
begin
  for i:=0 to N do //������� �������� ������ massym ����� ���������� ���������, � ������ tab ��������
  begin
    massym[i]:=chr(i);
    tab[i]:=0;
  end;
  for k:=1 to length(str) do  //����������� �� ���� ������
  begin
    c := copy(str, k, 1);//������� k-�� ������
    for i := 0 to N do    //���� ��� � ������� ��������
    begin
      if c = massym[i] then //����� �������, ����������� �� ������� ��������������� ��� ������� � ������� ��������
        inc(tab[i]); 
    end;
  end;
end;

procedure outputTab(massym:masstr;//����� �������
                    tab:massyms);
var                    
  m,i:integer;
begin
  for m:=0 to N do//������� �������
    begin
      if tab[m]<>0 then//������� ������ �� �������, ���������� ������� � ������ ������ ����
      begin
        write('"',massym[m],'" ');
        for i:=1 to tab[m] do
          write('*');
        writeln();
      end;
    end;
end;

var     //�������� ���� ���������
  str: string;
  massym:masstr;
  tab:massyms;
begin     
  input(str);
  table(str,massym,tab);
  outputTab(massym,tab);
end.