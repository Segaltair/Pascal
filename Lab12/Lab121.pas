uses 
  GraphABC;
const
  WID=1200;   //������ ������
  HIG=700;    //������ ������
  SX=1;       //������� �� �
  SY=1;       //������� �� �
  D=0.01;     //���
  R=5;        //������ �������
  GX=20;      //����������, ������ �� ��� �()
  GY=99;      //���������� ������ �� ��� �()
var
  xr,yr:real;
  x,y:integer;
begin
  InitWindow(0,0,WID,HIG,clwhite);    //������� ����
  SetCoordinateScale(SX,SY);          //�������
  CenterWindow;                       //������ ���� �� ������ ������
  SetCoordinateOrigin(WID div 2,HIG div 2);       //������������� ����� ������� ���������()
  line(-WID div 2,0,WID div 2,0);     //������ ��� x  
  line(0,-HIG div 2,0,HIG div 2);     //������ ��� �
  line(0,-HIG div 2,5, -HIG div 2+10);//������ ���������
  line(0,-HIG div 2,-5, -HIG div 2+10);
  line(WID div 2,0,WID div 2 -10,-5);
  line(WID div 2,0,WID div 2 -10,+5);
  xr:=-(WID div 2);
  while xr<(WID div 2) do
  begin    
    yr:=cos(xr);
    x:=trunc(xr*GX);      //������� ���������� ����� � ��������
    y:=trunc(yr*GY);      
    putpixel(x,-y,clgreen);
    
    xr:=xr+D;
  end; 
end.