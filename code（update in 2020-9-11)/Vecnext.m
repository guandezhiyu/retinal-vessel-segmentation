function [outF] = Vecnext(img,t)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明


H1=img;                 
L1=DIF(H1,0) ; M1=chuli(L1,t); 
L2=DIF(H1,30); M2=chuli(L2,t); 
L3=DIF(H1,60); M3=chuli(L3,t); 
L4=DIF(H1,90); M4=chuli(L4,t); 
L5=DIF(H1,120);M5=chuli(L5,t); 
L6=DIF(H1,180);M6=chuli(L5,t); 


temp=zeros(1,6);
[s1,s2]=size(img);
outF=zeros(s1,s2);

for i=1:1:s1
    for j=1:1:s2
         temp(1)=M1(i,j);temp(2)=M2(i,j);
         temp(3)=M3(i,j);temp(4)=M4(i,j);
         temp(5)=M5(i,j);temp(6)=M6(i,j);
         outF(i,j)=sum(temp);
        
    end
end

end

