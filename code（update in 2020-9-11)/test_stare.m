

%%读取图像
clc;                       %清空命令行窗口
clear all;                 %清除工作空间的所有变量
close all;                 %关闭所有的Figure窗口    

data1 = cell(21,7);
title = {'Sen1敏感度','Spec1特异度','Acc1准确度','Sen2敏感度','Spec2特异度','Acc2准确度','最佳阀值'};
data1(1,:)=title;


    path='C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\数据库\stare\STARE-bmp\';  
    %path_mask= 'C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\数据库\DRIVE\test\mask\'; 
    path_stand1 = 'C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\数据库\stare\ah\';%专家1分割标准
    path_stand2 = 'C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\数据库\stare\vk\';
    path_out='C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\'; 
    path_strong='C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\图像增强后的图像\';
    path_gre='C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\绿色通道\';
    path_cake='C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\cake\';
    
    file = dir(fullfile(path,'*.bmp'));
%   file_mask = dir(fullfile(path_mask,'*.gif'));
    file_stand1 = dir(fullfile(path_stand1,'*.bmp'));
    file_stand2 = dir(fullfile(path_stand2,'*.bmp'));
    
for j = 1 : length(file)
       
    pic =        imread(strcat(path,file(j).name));
%   pic_mask =   imread(strcat(path_mask,file_mask(j).name));
    pic_stand1 = imread(strcat(path_stand1,file_stand1(j).name));%文件所在路径
    pic_stand2 = imread(strcat(path_stand2,file_stand2(j).name));%文件所在路径
    

    pic_gre=pic(:,:,2);                   %得到绿色通道下的图像
    pic_cla=histeq(pic_gre);              %直方图均衡化增加血管的对比度
    pic_mean=medfilt2(pic_cla,[5 5]);     %中值滤波
    pic_hat_z=hat(pic_mean);              %进行多角度的顶帽变换
    pic_cake=cake(pic_hat_z);             %使用cake滤波器进行滤波
    t1=0.5;t2=0.01;t3=0.65;
   [pic_vec,count,NUM] = Vec(pic_cake,t1,t2,t3);
   PIC_sim=cell(1,count);
     
    
    %使用向量场散度进行分割
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
    adressString=['C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\最佳阀值\' strcat(file(j).name)  sprintf('%0.1d', T) '.bmp']; 
    imwrite(T_th_pic_sim, adressString); 
      %对其边际之外进行归0
   
    %[pic_cor,pic_bri]=cor(pic_vec);        %对其进行形态学处理
    
    
  
    [Sen1,Spec1,Acc1,TP1,TN1,FP1,FN1] = detg(T_th_pic_sim,pic_stand1);
    [Sen2,Spec2,Acc2,TP2,TN2,FP2,FN2] = detg(T_th_pic_sim,pic_stand2);
    
    data1(j+1,1)=num2cell(Sen1);
    data1(j+1,2)=num2cell(Spec1);
    data1(j+1,3)=num2cell(Acc1);
    data1(j+1,4)=num2cell(Sen2);
    data1(j+1,5)=num2cell(Spec2);
    data1(j+1,6)=num2cell(Acc2);
    data1(j+1,7)=num2cell(T);
    
    
    %输出图像和表格
   imwrite(T_th_pic_sim,strcat(path_out,file(j).name));
   imwrite(pic_mean,strcat(path_strong,file(j).name));
   imwrite(pic_gre,strcat(path_gre,file(j).name));
   %imwrite(pic_cake,strcat(path_cake,file(j).name));


end
 xlswrite('C:\Users\dell\Desktop\科研\基于散度和Cake滤波器的\针对多阀值的分割方法-stare\数据输出\data1.xls',data1);


