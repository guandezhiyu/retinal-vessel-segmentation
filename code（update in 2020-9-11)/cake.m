function [outimg] = cake(img)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
H1=[     0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0   -7.1813         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0   -7.0131         0         0         0         0         0         0         0;
         0         0         0         0         0         0    0.0031   -0.2400   -0.0041         0         0         0         0         0         0;
         0         0         0         0         0         0    0.0000   -0.0001   -0.0000   -0.0000         0         0         0         0         0;
         0         0         0         0         0    0.0000    0.0000   -0.0000   -0.0000   -0.0000         0         0         0         0         0;
         0         0         0         0         0    0.0000    0.0000   -0.0000   -0.0000   -0.0000   -0.0000         0         0         0         0;
         0         0         0         0    0.0000    0.0000    0.0000   -0.0000   -0.0000   -0.0000   -0.0000   -0.0000         0         0         0;
         0         0         0    0.0000    0.0000    0.0000    0.0000   -0.0000   -0.0000   -0.0000   -0.0000   -0.0000   -0.0000         0         0];
H2=imrotate(H1,45,'crop');
H3=imrotate(H1,90,'crop');
H4=imrotate(H1,135,'crop');
H5=imrotate(H1,180,'crop');
H6=imrotate(H1,225,'crop');
H7=imrotate(H1,270,'crop');
H8=imrotate(H1,315,'crop');

L1=filter2(H1,img);
L2=filter2(H2,img);
L3=filter2(H3,img);
L4=filter2(H4,img);
L5=filter2(H5,img);
L6=filter2(H6,img);
L7=filter2(H7,img);
L8=filter2(H8,img);

temp=zeros(1,8);
[s1,s2]=size(img);
outimg=zeros(s1,s2);
for i=1:1:s1
    for j=1:1:s2
        temp(1)=L1(i,j);temp(2)=L2(i,j);
        temp(3)=L3(i,j);temp(4)=L4(i,j);
        temp(5)=L5(i,j);temp(6)=L6(i,j);
        temp(7)=L7(i,j);temp(8)=L8(i,j);
        outimg(i,j)=max(temp);
    end
end
end

