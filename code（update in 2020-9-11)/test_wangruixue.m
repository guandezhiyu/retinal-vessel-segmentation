%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����



   pic = imread("02_test.tif");
   path_mask= 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\mask\'; 
   file_mask = dir(fullfile(path_mask,'*.gif'));
   pic_mask =   imread(strcat(path_mask,file_mask(1).name));
   
   
    pic_gre=pic(:,:,2);                   %�õ���ɫͨ���µ�ͼ��
    pic_cla=histeq(pic_gre);              %ֱ��ͼ���⻯����Ѫ�ܵĶԱȶ�
    pic_mean=medfilt2(pic_cla,[5 5]);     %��ֵ�˲�
    pic_hat_z=hat(pic_mean);              %���ж�ǶȵĶ�ñ�任
    pic_cake=cake(pic_hat_z);             %ʹ��cake�˲��������˲�
    for i=1:10:1000
      pic_ats=Ats(pic_cake,i);
      pic_mask=mask(pic_ats,pic_mask);  
      pic_sim=simdel(pic_ats,4,3); 
      adressString=['C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\����ѩ�ķ���\''im0139' sprintf('%0.1d', i) '.bmp']; 
      imwrite(pic_sim, adressString); %
    end
    
    
    
    

