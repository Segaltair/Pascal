{��������� �������� ���������, ������� �� �������� ����������� ������
������������ ������� ��� ������� � ����� ������}
procedure inputPoints (var x1,y1,x2,y2,x3,y3:real);  //������� ��������� ������� ����������� � ������������ ���������� ������ ������������ 
begin
  write('Press koordinate x1 y1 first point: ');
  readln(x1,y1);
  write('Press koordinate x2 y2 second point: ');
  readln(x2,y2);
  write('Press koordinate x3 y3 third point: ');
  readln(x3,y3);
end;

function areaCalculation (x1,y1,x2,y2,x3,y3:real; //������� �������, ������� ����� ��������� ������� ������������ �� ��� ��������
                          var s:real):real;       
var
  p,a,b,c:real; //���������� '�' ������ ������������ ������������, 'a', 'b', 'c' ����� ��� ������
begin
  a:=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));  //������� ������� ������������
  b:=sqrt((x2-x3)*(x2-x3)+(y2-y3)*(y2-y3));
  c:=sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1));
  p:=(a+b+c)/2;    //������� ������������
  s:=sqrt(p*(p-a)*(p-b)*(p-c));  //�� ������� ������ ��������� �������
end;

function mediansCalculation (x1,y1,x2,y2,x3,y3:real;   //������� ���������� ���� ������
                             var m1,m2,m3:real):real;
var
  xm1,xm2,xm3,ym1,ym2,ym3:real;
begin
  xm1:=(x2+x3)/2;               //������� ���������� ������ ������
  ym1:=(y2+y3)/2;
  xm2:=(x1+x3)/2;
  ym2:=(y1+y3)/2;
  xm3:=(x1+x2)/2;
  ym3:=(y1+y2)/2;
  m1:=sqrt((x1-xm1)*(x1-xm1)+(y1-ym1)*(y1-ym1)); //������� ����� ������
  m2:=sqrt((x2-xm2)*(x2-xm2)+(y2-ym2)*(y2-ym2));
  m3:=sqrt((x3-xm3)*(x3-xm3)+(y3-ym3)*(y3-ym3));
end;

procedure showResult(s,m1,m2,m3:real); //��������� ������� �� ����� ������� � ����� ������ ������������
begin
  writeln('Area of a triangle is equal to the ',s);
  writeln('The length of the medians of a triangle are equal ',m1:0:3,', ',m2:0:3,' and ',m3:0:3);
end;

var                               //������ ���������
  x1,x2,x3,y1,y2,y3,s,m1,m2,m3:real;
begin
  inputPoints(x1,y1,x2,y2,x3,y3); //�������� ��������� ������� ���������
  if ((x1=x2) and (y1=y2)) or ((x1=x3) and (y1=y3)) or ((x2=x3) and (y2=y3)) then //��������� �� ���� �� ������������ ����������� ����������(����������)
    writeln('Incorrectly coordinates!')
  else
    begin                                           
      areaCalculation(x1,y1,x2,y2,x3,y3,s);           //������� �������
      mediansCalculation (x1,y1,x2,y2,x3,y3,m1,m2,m3);//������� ����� ������
      showResult(s,m1,m2,m3);  //������� ��������� �� �����
    end;
end.                          
