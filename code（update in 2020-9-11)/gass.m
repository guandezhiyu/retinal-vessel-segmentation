function [blur] = gass(img,N_row,sigma)
%UNTITLED4 此处显示有关此函数的摘要
	gausFilter = fspecial('gaussian',[N_row N_row],sigma);      
    blur=imfilter(img,gausFilter,'conv');


end

