%%读取图像
clc;                       %清空命令行窗口
clear all;                 %清除工作空间的所有变量
close all;                 %关闭所有的Figure窗口

I1=imread("1.bmp");
I2=imread("2.bmp");
I3=imread("3.bmp");
figure(1)
imshow(I1);title('原图像');
figure(2)
imshow(I2);title('瑞雪的方法');
figure(3)
imshow(I3);title('我的方法');
