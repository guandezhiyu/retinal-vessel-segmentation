function [outimg] = mask(inimg,maskimg)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
b=[0 1 0;1 1 1;0 1 0];
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�
maskimg=imerode(maskimg,b);%ͼ��ʴ,��ֹ���ְױ�


[m,n]=size(inimg);
outimg=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        if (maskimg(i,j)==0)
            outimg(i,j)=0;
        else
            outimg(i,j)=inimg(i,j);
        end
    end
end

end

