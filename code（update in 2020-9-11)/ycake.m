%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����    

data1 = cell(21,7);
title = {'TPR1','FPR1','ACC1','TPR2','FPR2','ACC2','��ѷ�ֵ'};
data1(1,:)=title;


    path='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\images\';  
    path_mask= 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\mask\'; 
    path_stand1 = 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\1st_manual\';%ר��1�ָ��׼
    path_stand2 = 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\2nd_manual\';
    path_out='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\�������\';   
    
    file = dir(fullfile(path,'*.tif'));
    file_mask = dir(fullfile(path_mask,'*.gif'));
    file_stand1 = dir(fullfile(path_stand1,'*.gif'));
    file_stand2 = dir(fullfile(path_stand2,'*.gif'));
    
for j = 1 : length(file)
       
    pic = imread(strcat(path,file(j).name));
    pic_mask = imread(strcat(path_mask,file_mask(j).name));
    pic_stand1 = imread(strcat(path_stand1,file_stand1(j).name));%�ļ�����·��
    pic_stand2 = imread(strcat(path_stand2,file_stand2(j).name));%�ļ�����·��
    

    pic_gre=pic(:,:,2);                   %�õ���ɫͨ���µ�ͼ��
    pic_cla=histeq(pic_gre);              %ֱ��ͼ���⻯����Ѫ�ܵĶԱȶ�
    pic_mean=medfilt2(pic_cla,[5 5]);     %��ֵ�˲�
    pic_hat_z=hat(pic_mean);              %���ж�ǶȵĶ�ñ�任
    pic_cake=cake(pic_hat_z);             %ʹ��cake�˲��������˲�
    t1=0.5;t2=0.01;t3=0.65;
   [pic_vec,count,NUM] = Vec(pic_cake,t1,t2,t3);
   PIC_sim=cell(1,count);
     
    
              %ʹ��������ɢ�Ƚ��зָ�
    for i=1:1:count
            th_pic_vec=pic_vec(i);
            T_th_pic_vec=(cell2mat(th_pic_vec));
            pic_mask=mask(T_th_pic_vec,pic_mask); 
            pic_sim=simdel(pic_mask,4,3); 
            [L, num] = bwlabel(pic_sim,8);
            NUM(i)=num;
            PIC_sim{i}=pic_sim;
    end
    
    
    

    [T,a] = Opth(NUM,count,t1,t2);
    th_pic_sim=PIC_sim(uint8(a));
    T_th_pic_sim=(cell2mat(th_pic_sim));
    adressString=['C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��\��ѷ�ֵ\' strcat(file(j).name)  sprintf('%0.1d', T) '.bmp']; 
    imwrite(T_th_pic_sim, adressString); 
      %����߼�֮����й�0
   
    %[pic_cor,pic_bri]=cor(pic_vec);        %���������̬ѧ����
    
    
    [TPR1,FPR1,ACC1,TP1,TN1,FP1,FN1] = detg(T_th_pic_sim,pic_stand1);
    [TPR2,FPR2,ACC2,TP2,TN2,FP2,FN2] = detg(T_th_pic_sim,pic_stand2);  
    data1(j+1,1)=num2cell(TPR1);
    data1(j+1,2)=num2cell(FPR1);
    data1(j+1,3)=num2cell(ACC1);
    data1(j+1,4)=num2cell(TPR2);
    data1(j+1,5)=num2cell(FPR2);
    data1(j+1,6)=num2cell(ACC2);
    data1(j+1,7)=num2cell(T);
    
    
    %���ͼ��ͱ��
   imwrite(T_th_pic_sim,strcat(path_out,file(j).name));


end
 xlswrite('C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��\�������\data1.xls',data1);
