function [outimg] = oz(img,t)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(img);
outimg=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        if img(i,j)>=t
            outimg(i,j)=1;
        else
            outimg(i,j)=0;
        end
    end
end
end
