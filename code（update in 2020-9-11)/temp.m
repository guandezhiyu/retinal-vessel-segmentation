%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����

I1=imread("1.bmp");
I2=imread("2.bmp");
I3=imread("3.bmp");
figure(1)
imshow(I1);title('ԭͼ��');
figure(2)
imshow(I2);title('��ѩ�ķ���');
figure(3)
imshow(I3);title('�ҵķ���');
