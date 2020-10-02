function [outimg] = otsu(img)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
level =graythresh(img);  
outimg = imbinarize(img,level); 
end

