function [oimg] = show(img,L)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
img=double(img);
[s1,s2]=size(img);
oimg=zeros(s1,s2);

img_min = min(min(img)); 
img_max=  max(max(img));
for i=1:1:s1
    for j=1:1:s2
        oimg(i,j)=((img(i,j)-img_min)/(img_max-img_min))*L;
    end
end
%outimg=uint8(oimg);
end

