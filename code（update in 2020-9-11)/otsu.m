function [outimg] = otsu(img)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
level =graythresh(img);  
outimg = imbinarize(img,level); 
end

