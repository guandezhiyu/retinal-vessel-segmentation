%%��ȡͼ��
clc;                       %��������д���
clear all;                 %��������ռ�����б���
close all;                 %�ر����е�Figure����

path="C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\�㷨�ĶԱ�\";
file = dir(fullfile(path,'*.bmp'));
pic1 =imread(strcat(path,file(1).name));pic1_1=pic1(:,:,2);
pic2 =imread(strcat(path,file(2).name));pic2_1=pic2(:,:,2);
pic3 =imread(strcat(path,file(3).name));pic3_1=pic3(:,:,2);

figure(1)
imshow(pic1);title('ԭͼ��');
figure(2)
imshow(pic2);title('��ѩ�ķ���');
figure(3)
imshow(pic3);title('�ҵķ���');

figure(4);
imshow(pic1);

k=waitforbuttonpress;
point1=get(gca,"CurrentPoint");
finalRect=rbbox;
point2=get(gca,"CurrentPoint");
point1=point1(1,1:2);
point2=point2(1,1:2);

p1=min(floor(point1),floor(point2));
p2=max(floor(point1),floor(point2));
offset=abs(floor(point1)-floor(point2));
x=[p1(1) p1(1)+offset(1) p1(1)+offset(1) p1(1) p1(1)];
y=[p1(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)];
hold on;


[x,y] = ginput(4);          %�����������
for j = 1 : length(file)
    pic =imread(strcat(path,file(j).name));

    x1=imcrop(pic,[p1(1) p1(2) offset(1) offset(2)]);
       

    adressString=['C:\Users\dell\Desktop\����\����ɢ�Ⱥ�Cake�˲�����\�㷨�ĶԱ�\��ȡ��ͼ��\' strcat(file(j).name)   '1'  '.bmp']; 
    imwrite(x1, adressString); 


end



