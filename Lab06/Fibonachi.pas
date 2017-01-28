const
  M=111;
  N=1;
var
  i:integer;
  posFib:array [1..M*N] of uint64;
begin
  posFib[1]:=1;
  posFib[2]:=1;
  for i:=3 to (M*N) do
    begin
      posFib[i]:=posFib[i-1] + posFib[i-2];
      writeln(i,' ',posFib[i]);
    end;
end.
{18446744073709551615 размер uint64
 14013500826593372729 108 член последовательности}