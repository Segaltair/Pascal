//Ханойские башни. Со стержня s1 на s2
procedure move(n,s1,s2,s3:byte);
  begin
    if n=1 then
      writeln ('disk 1 from ',s1,' to ', s2 )
    else
      begin
        move (n-1,s1,s3,s2);
        writeln ('disk ',n,' from ', s1,' to ',s2);
        move (n-1,s3,s2,s1);
      end;
  end;
var 
  n:integer;
begin
  read(n);
  move (n,1,2,3);
end.