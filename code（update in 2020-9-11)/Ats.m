function [outimg] = Ats(infig,h)
% Adaptive threshold segmentation
% 出王瑞雪的阈值分割
[count,x] = imhist(infig);
infig=uint8(show(infig,255));
num=0;
for i=1:1:255
    if(count(i)<h)
        num=num+1;
    end
end
b=zeros(1,num);
num=0;
for i=1:1:255
    if(count(i)<h)
        num=num+1;
        b(num)=i;
    end
end
L=length(b);
t=zeros(1,L);
for i=1:1:L
    t(i)=count(b(i));
end
[Tmin,index]=max(t);
[s1,s2]=size(infig);
outimg=zeros(s1,s2);
for i=1:1:s1
    for j=1:1:s2
        if infig(i,j)>Tmin
            outimg(i,j)=0;
        else
            outimg(i,j)=1;
        end
        
    end
end
end

