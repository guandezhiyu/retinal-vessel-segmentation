function [blur] = gass(img,N_row,sigma)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
	gausFilter = fspecial('gaussian',[N_row N_row],sigma);      
    blur=imfilter(img,gausFilter,'conv');


end

