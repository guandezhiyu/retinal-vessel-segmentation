function [outimg] = chuli(img,t)
%对图像进行分割，大于阀值t进行分割
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
%删除二值图像BW中面积小于P的对象，默认情况下conn使用8邻域
end

