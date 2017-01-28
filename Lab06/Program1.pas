{http://dmvn.mexmat.net/}
procedure inputString (var str:string);
  begin
    readln(str);
  end;

function searchMaxPalindrom (str:string;
                             var
                               maxStrPal:string):string;
var
  i:integer;
  word1,backRow:string;
begin
  maxStrPal := '';
  i := 1;
  while i < length(str) do
    if pos(' ',str) = i then
      begin
        word1 := '';
        word1 := copy(str,1,i-1);
        backRow := '';
        for i := 0 to (length(word1)-1) do
          backRow := backRow + copy(word1,length(word1)-i,1);
        if (word1 = backRow) and (length(word1) > length(maxStrPal)) then
            maxStrPal := word1
        else
          begin
            delete(str,1,i);
            i := 1;
            writeln(i, ' str= ',str,' maxStrPal= ',maxStrPal);
          end;
      end
    else
      inc(i);
end;

procedure outputMaxPal(maxStrPal:string);
begin
  writeln(maxStrPal);
end;
var
  str,maxStrPal:string;
begin
inputString(str);
searchMaxPalindrom(str,maxStrPal);
outputMaxPal(maxStrPal);
end.