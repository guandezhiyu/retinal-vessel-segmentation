function [pic_true_otsu] = mtrue(img)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

pic_true_gre=img(:,:,2);
pic_true_otsu=otsu(pic_true_gre);
end

