function [outimg] = simdel(inimg,k,t)
%   simdel simply delete
%   ���жϵ�Ѫ�ܵ����k*k������ֻ��tѪ�ܵ����Ϊ�������㣬���ҽ���ȥ��
[m,n]=size(inimg);
outimg=zeros(m,n);
%k  �жϴ��ڵĴ�С
%t  �����з�0�ĸ���
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

