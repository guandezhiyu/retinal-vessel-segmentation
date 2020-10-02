
%给出模版大小计算模版
function [mo] = moban(N_row)
ucake=zeros(N_row);
mo=zeros(N_row);
gausFilter = fspecial('gaussian',[N_row N_row],sigma); 

for i=1:1:N_row
    for j=1:1:N_row
        ucake(i,j)=double(fil(i-8,j-8));
    end
end
for i=1:1:N_row
    for j=1:1:N_row
        mo(i,j)=gausFilter(i,j)*ucake(i,j);
    end
end
end

