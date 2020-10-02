

%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����    

data1 = cell(21,7);
title = {'Sen1���ж�','Spec1�����','Acc1׼ȷ��','Sen2���ж�','Spec2�����','Acc2׼ȷ��','��ѷ�ֵ'};
data1(1,:)=title;


    path='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\stare\STARE-bmp\';  
    %path_mask= 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\DRIVE\test\mask\'; 
    path_stand1 = 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\stare\ah\';%ר��1�ָ��׼
    path_stand2 = 'C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\���ݿ�\stare\vk\';
    path_out='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\'; 
    path_strong='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\ͼ����ǿ���ͼ��\';
    path_gre='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\��ɫͨ��\';
    path_cake='C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\cake\';
    
    file = dir(fullfile(path,'*.bmp'));
%   file_mask = dir(fullfile(path_mask,'*.gif'));
    file_stand1 = dir(fullfile(path_stand1,'*.bmp'));
    file_stand2 = dir(fullfile(path_stand2,'*.bmp'));
    
for j = 1 : length(file)
       
    pic =        imread(strcat(path,file(j).name));
%   pic_mask =   imread(strcat(path_mask,file_mask(j).name));
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
            %pic_mask=mask(T_th_pic_vec,pic_mask); 
            pic_sim=simdel(T_th_pic_vec,4,3); 
            [L, num] = bwlabel(pic_sim,8);
            NUM(i)=num;
            PIC_sim{i}=pic_sim;
    end
    
    
    

    [T,a] = Opth(NUM,count,t1,t2);
    th_pic_sim=PIC_sim(uint8(a));
    T_th_pic_sim=(cell2mat(th_pic_sim));
    adressString=['C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\��ѷ�ֵ\' strcat(file(j).name)  sprintf('%0.1d', T) '.bmp']; 
    imwrite(T_th_pic_sim, adressString); 
      %����߼�֮����й�0
   
    %[pic_cor,pic_bri]=cor(pic_vec);        %���������̬ѧ����
    
    
  
    [Sen1,Spec1,Acc1,TP1,TN1,FP1,FN1] = detg(T_th_pic_sim,pic_stand1);
    [Sen2,Spec2,Acc2,TP2,TN2,FP2,FN2] = detg(T_th_pic_sim,pic_stand2);
    
    data1(j+1,1)=num2cell(Sen1);
    data1(j+1,2)=num2cell(Spec1);
    data1(j+1,3)=num2cell(Acc1);
    data1(j+1,4)=num2cell(Sen2);
    data1(j+1,5)=num2cell(Spec2);
    data1(j+1,6)=num2cell(Acc2);
    data1(j+1,7)=num2cell(T);
    
    
    %���ͼ��ͱ��
   imwrite(T_th_pic_sim,strcat(path_out,file(j).name));
   imwrite(pic_mean,strcat(path_strong,file(j).name));
   imwrite(pic_gre,strcat(path_gre,file(j).name));
   %imwrite(pic_cake,strcat(path_cake,file(j).name));


end
 xlswrite('C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\��Զ෧ֵ�ķָ��-stare\�������\data1.xls',data1);


