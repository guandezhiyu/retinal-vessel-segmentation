%%读取图像
clc;                       %清空命令行窗口
clear all;                 %清除工作空间的所有变量
close all;                 %关闭所有的Figure窗口
pic=imread('01_test.bmp'); %读入图像
pic_mask=imread('01_test_mask.bmp'); %读入mask图像
pic_stand=imread('01_manual1.gif'); %读入mask图像
pic_mask_gre=pic_mask(:,:,2);   

%%图像预处理
pic_gre=pic(:,:,2);                   %得到绿色通道下的图像
pic_cla=histeq(pic_gre);              %直方图均衡化增加血管的对比度
pic_mean=medfilt2(pic_cla,[5 5]);     %中值滤波
pic_hat_z=hat(pic_mean);              %进行多角度的顶帽变换
pic_cake=cake(pic_hat_z);             %使用cake滤波器进行滤波

%pic_cake_otsu=otsu(pic_cake);
pic_vec=Vec(pic_cake,0.5);             %使用向量场散度进行分割
pic_mask=mask(pic_vec,pic_mask_gre);   %对其边际之外进行归0
pic_sim=simdel(pic_mask,4,3);        %对窗口内的非0进行计数如果小于某一值进行归0
[pic_cor,pic_bri]=cor(pic_vec);        %对其进行形态学处理




%cake滤波器下处理
pic_hat_show=uint8(show(pic_hat_z,255));%%正确
pic_cake_show=1-show(pic_cake,1);%%正确
pic_cake_show1=show(pic_cake,1);%%正确
pic_vec_show=show(pic_vec,1);%%正确



%[TPR,FPR,ACC,TP,TN,FP,FN]=detg(pic_true_otsu,pic_vec);
%[TPR1,FPR1,ACC1,TP1,TN1,FP1,FN1]=detg(pic_true_otsu,pic_cor);
%[TPR2,FPR2,ACC2] = great(TP1,TN1,FP1,FN1,3);

%原图片展示
figure(1);
imshow(pic_mask);title('原图像');
figure(3);
imshow(pic_gre);title('初始图像');
figure(4);
imshow(pic_sim);title('2 1');
figure(5);
imshow(pic_stand);title('标准');

