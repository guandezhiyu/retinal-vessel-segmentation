%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����
pic=imread('01_test.bmp'); %����ͼ��
pic_mask=imread('01_test_mask.bmp'); %����maskͼ��
pic_stand=imread('01_manual1.gif'); %����maskͼ��
pic_mask_gre=pic_mask(:,:,2);   

%%ͼ��Ԥ����
pic_gre=pic(:,:,2);                   %�õ���ɫͨ���µ�ͼ��
pic_cla=histeq(pic_gre);              %ֱ��ͼ���⻯����Ѫ�ܵĶԱȶ�
pic_mean=medfilt2(pic_cla,[5 5]);     %��ֵ�˲�
pic_hat_z=hat(pic_mean);              %���ж�ǶȵĶ�ñ�任
pic_cake=cake(pic_hat_z);             %ʹ��cake�˲��������˲�

%pic_cake_otsu=otsu(pic_cake);
pic_vec=Vec(pic_cake,0.5);             %ʹ��������ɢ�Ƚ��зָ�
pic_mask=mask(pic_vec,pic_mask_gre);   %����߼�֮����й�0
pic_sim=simdel(pic_mask,4,3);        %�Դ����ڵķ�0���м������С��ĳһֵ���й�0
[pic_cor,pic_bri]=cor(pic_vec);        %���������̬ѧ����




%cake�˲����´���
pic_hat_show=uint8(show(pic_hat_z,255));%%��ȷ
pic_cake_show=1-show(pic_cake,1);%%��ȷ
pic_cake_show1=show(pic_cake,1);%%��ȷ
pic_vec_show=show(pic_vec,1);%%��ȷ



%[TPR,FPR,ACC,TP,TN,FP,FN]=detg(pic_true_otsu,pic_vec);
%[TPR1,FPR1,ACC1,TP1,TN1,FP1,FN1]=detg(pic_true_otsu,pic_cor);
%[TPR2,FPR2,ACC2] = great(TP1,TN1,FP1,FN1,3);

%ԭͼƬչʾ
figure(1);
imshow(pic_mask);title('ԭͼ��');
figure(3);
imshow(pic_gre);title('��ʼͼ��');
figure(4);
imshow(pic_sim);title('2 1');
figure(5);
imshow(pic_stand);title('��׼');

