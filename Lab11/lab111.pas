type st=^stek;
stek=record
t:integer;//��������� 
a:st;//����������
end;
var s1,s2:st;
i1:integer;
  begin
  s2:=nil;
  i1:=0;
  while i1>=0 do
        begin
            new(s1);
            writeln ('������� �����:');
            read(i1);
            s1^.t:=i1;
            s1^.a:=s2;
            s2:=s1;
            end;
        repeat
        writeln('������� �����: ',s1^.t);
        s2:=s1^.a;
        dispose(s1);
        s1:=s2;
    until(s1=nil);
    End.