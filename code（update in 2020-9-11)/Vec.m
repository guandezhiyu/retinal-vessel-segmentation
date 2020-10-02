function [outimg,count,NUM] = Vec(inimg,t1,t2,t3)
%Vec 
count=(t3-t1)/t2+1;
outimg=cell(1,count);
NUM=zeros(1,count);
 
for t=t1:t2:t3
    Count=round((t-t1)/t2+1);
    outF=Vecnext(inimg,t);
    outimg{Count}=bwareaopen(outF,50);
end



end

