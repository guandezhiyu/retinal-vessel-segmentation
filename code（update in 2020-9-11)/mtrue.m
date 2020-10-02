function [pic_true_otsu] = mtrue(img)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

pic_true_gre=img(:,:,2);
pic_true_otsu=otsu(pic_true_gre);
end

