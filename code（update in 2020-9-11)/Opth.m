function [T,a] = Opth(NUM,count,t1,t2)
%Optimal threshold ×î¼Ñ·§Öµ
max=0;
a=0;
for i=1:1:count
    if(NUM(i)>max)
        max=NUM(i);
        a=i;
    end
end
T=t1+(a-1)*t2;
end

