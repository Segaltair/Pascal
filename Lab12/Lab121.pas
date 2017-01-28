uses 
  GraphABC;
const
  WID=1200;   //Ширина экрана
  HIG=700;    //Высота экрана
  SX=1;       //Масштаб по х
  SY=1;       //Масштаб по у
  D=0.01;     //Шаг
  R=5;        //Ширина насечек
  GX=20;      //Растяжение, сжатие по оси х()
  GY=99;      //Растяжение сжатие по оси у()
var
  xr,yr:real;
  x,y:integer;
begin
  InitWindow(0,0,WID,HIG,clwhite);    //Размеры окна
  SetCoordinateScale(SX,SY);          //Масштаб
  CenterWindow;                       //Ставим окно по центру экрана
  SetCoordinateOrigin(WID div 2,HIG div 2);       //Устанавливаем центр системы соординат()
  line(-WID div 2,0,WID div 2,0);     //рисуем ось x  
  line(0,-HIG div 2,0,HIG div 2);     //рисуем ось у
  line(0,-HIG div 2,5, -HIG div 2+10);//Рисуем стрелочки
  line(0,-HIG div 2,-5, -HIG div 2+10);
  line(WID div 2,0,WID div 2 -10,-5);
  line(WID div 2,0,WID div 2 -10,+5);
  xr:=-(WID div 2);
  while xr<(WID div 2) do
  begin    
    yr:=cos(xr);
    x:=trunc(xr*GX);      //находим координаты точки в пикселях
    y:=trunc(yr*GY);      
    putpixel(x,-y,clgreen);
    
    xr:=xr+D;
  end; 
end.