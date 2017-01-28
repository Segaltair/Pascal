var str,pal,c:string;
i:integer;
begin
readln(str);
pal:='';
for i:=0 to (length(str)-1) do
pal:=pal + copy(str,length(str)-i,1);
writeln(pal);
end.