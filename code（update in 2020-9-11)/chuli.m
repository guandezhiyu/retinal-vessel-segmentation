function [outimg] = chuli(img,t)
%��ͼ����зָ���ڷ�ֵt���зָ�
[s1,s2]=size(img);
outimg=zeros(s1,s2);
oimg=show(img,1);
for i=1:1:s1
    for j=1:1:s2
        if oimg(i,j)>t
            outimg(i,j)=1;
        else
            outimg(i,j)=0;
        end
        
    end
end
%ɾ����ֵͼ��BW�����С��P�Ķ���Ĭ�������connʹ��8����
end

