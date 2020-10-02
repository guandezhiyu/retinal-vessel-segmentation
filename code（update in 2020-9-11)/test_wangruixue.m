%%读取图像
clc;                       %清空命令行窗口
clear all;                 %清除工作空间的所有变量
close all;                 %关闭所有的Figure窗口



   pic = imread("02_test.tif");
   path_mask= 'C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\数据库\DRIVE\test\mask\'; 
   file_mask = dir(fullfile(path_mask,'*.gif'));
   pic_mask =   imread(strcat(path_mask,file_mask(1).name));
   
   
    pic_gre=pic(:,:,2);                   %得到绿色通道下的图像
    pic_cla=histeq(pic_gre);              %直方图均衡化增加血管的对比度
    pic_mean=medfilt2(pic_cla,[5 5]);     %中值滤波
    pic_hat_z=hat(pic_mean);              %进行多角度的顶帽变换
    pic_cake=cake(pic_hat_z);             %使用cake滤波器进行滤波
    for i=1:10:1000
      pic_ats=Ats(pic_cake,i);
      pic_mask=mask(pic_ats,pic_mask);  
      pic_sim=simdel(pic_ats,4,3); 
      adressString=['C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\王瑞雪的方法\''im0139' sprintf('%0.1d', i) '.bmp']; 
      imwrite(pic_sim, adressString); %
    end
    
    
    
    

