
function [out] = fil(x,y)
%计算cake滤波器的模版
N=32;
t=3;
%  坐标转换
[theta,rho] = cart2pol(x,y);
%ang=(theta/pi)*180;%ang 角度(度) rho 半径

%求取幅度
sth=((2*pi)/N);
Amp=(mod(theta,2*pi)-pi/2)/sth;

%求解Gt
syms p;
Gth(p)=(1/(2*sqrt(pi*t)))*exp(-((p^2)/4*t));
TGth(p)=taylor((1/(2*sqrt(pi*t)))*exp(-((p^2)/4*t)),p,'Order',10);
MTG=double(Gth(rho)/TGth(rho));

%板条函数
L=-pi:0.1:pi;
L1=-pi:0.1:-0.5;
L2=-0.5:0.1:0.5;
%L3=0.5:0.1:pi;
LL=length(L);
LL1=length(L1);
LL2=length(L2);
B0=zeros(1,LL);
for i=LL1:1:LL1+LL2
    B0(i)=1;
end
B1=conv(B0,B0);
B2=conv(B1,B0);
LB2=length(B2);
%LB2max=max(B2);
n=ceil((theta-(-pi))/(2*pi)*LB2);
Bk=B2(n);
out=Bk*MTG*Amp;
end

