{��������� �����}
{ kol-vo diskov   vremya v secundah delay=1 (delay=0)
    9             7
    10            16
    11            32(4)
    12            78(9)
    13            (18)
    14            (36)
    15            (72)
    16
}
uses
  crt,graphabc;
const  
  DEL=0;    //��������
  WID=1200;   //������ ������
  HIG=600;    //������ ������
  X1R=185;    //
  Y1R=550;    //
  X2R=215;    //���������� ������ �������
  Y2R=110;    //
  DISTR=400;  //���������� ����� ���������
  X1D=10;     //
  X2D=390;    //
  Y1D=550;    //���������� ������� ������ �����
  Y2D=520;    //
  DISTD=1;    //���������� ����� �������
  DECD=12;    //���������� ������� �����
  CR1=X1R+(X2R-X1R) div 2; //����� ������ �������
  CR2=X1R+(X2R-X1R) div 2 + DISTR; //����� ������������ �������
  CR3=X1R+(X2R-X1R) div 2 + 2*DISTR; //����� ������� �������
  R1=1;       //������ �������� ����� �������
  R2=2;       //
  R3=3;       //
  M=40;       //���������� ����� ��� �������� ��������� ������
{��������� ��� ��������
if n=1 then
      writeln ('disk 1 from ',s1,' to ', s2 )
    else
      begin
        move (n-1,s1,s3,s2);
        writeln ('disk ',n,' from ', s1,' to ',s2);
        move (n-1,s3,s2,s1);
      end;
}

type
  koordDisk=array [1..M, 1..4] of integer;//x1,y1,x2,y2
  rods=array[1..M,1..3] of integer;  
  masRod=array[1..3] of integer;//���������� ������ ��������
var 
  n:integer;


procedure drawRod(X1R,Y1R,X2R,Y2R:integer);//��������� �������
begin
  setbrushcolor(clgray);
  fillrect(X1R,Y1R,X2R,Y2R);
end;


procedure disk (X1D,Y1D,X2D,Y2D:integer);//��������� �����
begin
  setbrushcolor(clRed);
  fillrect(X1D,Y1D,X2D,Y2D);
end;


procedure window(mdisk:koordDisk);  //�������� ����
var
  i:integer;
begin
  InitWindow(0,0,WID,HIG,clwhite);
  for i:=0 to 2 do //������ �������
    drawRod(X1R+i*DISTR,Y1R,X2R+i*DISTR,Y2R);
  for i:=1 to n do  //������� �����
    begin
      disk(mdisk[i,1],mdisk[i,2],mdisk[i,3],mdisk[i,4]);
    end;
end;


procedure saveSourceKoordDiskAndRod(var mDisk:koordDisk;
                        var rod:rods);//���������� �������� ��������� ������ � ������ ��������
var
  i:integer;
begin
  for i:=n downto 1 do
      begin        
        mdisk[i,1]:=X1D+(n-i)*DECD;
        mdisk[i,2]:=Y1D-(n-i)*(DISTD+Y1D-Y2D);
        mdisk[i,3]:=X2D-(n-i)*DECD;
        mdisk[i,4]:=Y2D-(n-i)*(DISTD+Y1D-Y2D);
        rod[M+i-n,1]:=i;//������ ������ - ����� ��� ����� ������� � �����, 
        //������ ������ ����� ������� �� ������� ����� ����, 
        //�������� i - ������ �������(����� ������� = n, ����� ��������� = 1)
      end;
end;


procedure saveCurrentKoordDisk(x,y,z,i,k:integer;//����:������ �����(x), � ������ �������(y), �� �����(z)
                               var mDisk:koordDisk);//����� ����� �� ������ �������(i),����� ����� �� ����� �������(k)
begin
  mDisk[x,1]:=mDisk[x,1]+(z-y)*DISTR;
  mDisk[x,2]:=mDisk[x,2]+(k-i)*(DISTD+Y1D-Y2D);
  mDisk[x,3]:=mDisk[x,3]+(z-y)*DISTR;
  mDisk[x,4]:=mDisk[x,4]+(k-i)*(DISTD+Y1D-Y2D);
end;


//�������������� �����
procedure shiftDisk(var rod:rods; x,y,z:integer;//����:������ �����(x), � ������ �������(y), �� �����(z)
                    var i,k:integer);          //����� ����� �� ������ �������(i),����� ����� �� ����� �������(k)
begin
  i:=M;                
  while rod[i,y]<>x do //���� ������ ���� �� �������
    dec(i);
  k:=M;
  while rod[k,z]<>0 do//���� ����� ��� ���� �� ������ �������
    dec(k);
  rod[k,z]:=rod[i,y];//�������������
  rod[i,y]:=0;
end;


procedure move(var mdisk:koordDisk;var rod:rods;n,s1,s2,s3:integer);  //�������� ��������� 
var
  i,k:integer;
  begin    
    if n=1 then
      begin        
        //writeln ('disk 1 from ',s1,' to ', s2 );     
        shiftDisk(rod,n,s1,s2,i,k);
        saveCurrentKoordDisk(n,s1,s2,i,k,mDisk);     
        delay(DEL);        
        window(mdisk);        
      end
    else
      begin
        move (mdisk,rod,n-1,s1,s3,s2);        
        //writeln ('disk ',n,' from ', s1,' to ',s2);        
        shiftDisk(rod,n,s1,s2,i,k);        
        saveCurrentKoordDisk(n,s1,s2,i,k,mdisk);      
        delay(DEL);
        window(mdisk);
        move (mdisk,rod,n-1,s3,s2,s1);  
      end;
  end;

    
var
  mDisk:koordDisk;
  rod:rods;
begin
  write('Kolichestvo diskov? (1-12)');
  read(n);
  while (n<1) or (n>122) do
    begin
      clearwindow();
      write('vvedite ot 1 do 12!');
      read(n);
    end;    
  saveSourceKoordDiskAndRod(mDisk,rod);   
  window(mDisk);  
  move(mdisk,rod,n,R1,R2,R3);
end.