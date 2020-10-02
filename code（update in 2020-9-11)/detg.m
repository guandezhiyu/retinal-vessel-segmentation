function [Sen,Spec,Acc,TP,TN,FP,FN] = detg(trueimg,detimg)
%   计算TPR等评价指标
[s1,s2]=size(trueimg);
TP=0;FN=0;FP=0;TN=0;
for i=1:1:s1
    for j=1:1:s2
           if trueimg(i,j)==1
               if detimg(i,j)~=0
                   TP=TP+1;
               elseif detimg(i,j)==0
                   FN=FN+1;
               end
           elseif trueimg(i,j)==0
               if detimg(i,j)~=0
                   FP=FP+1;
               elseif detimg(i,j)==0
                   TN=TN+1;
               end
           end
    end
end
Sen=TP/(TP+FN);
Spec=TN/(TN+FP);
Acc=(TP+TN)/(TP+TN+FP+FN);%

end

