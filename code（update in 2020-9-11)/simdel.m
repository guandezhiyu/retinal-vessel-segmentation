function [outimg] = simdel(inimg,k,t)
%   simdel simply delete
%   对判断的血管点进行k*k的区域只有t血管点就认为是噪声点，并且进行去除
[m,n]=size(inimg);
outimg=zeros(m,n);
%k  判断窗口的大小
%t  窗口中非0的个数
for i=1:1:m
    for j=1:1:n
        num=0;
        if inimg(i,j)~=0
            m1=i; n1=j;
            if (0<m1-k)&&(m1+k<m)&&(0<n1-k)&&(n1+k<n)
              for i1=m1-k:1:m1+k
                  for j1=n1-k:1:n1+k
                      if inimg(i1,j1)~=0
                          num=num+1;
                      end
                  end
              end
              if num<=t
                  outimg(i,j)=0;
              else
                  outimg(i,j)=inimg(i,j);
              end
            else
                outimg(i,j)=0;
            end
        else
            outimg(i,j)=0;
        end   
    end
end

end

