function [outimg] = hat(img)
% 多尺度的顶帽变换
img=double(img);
LEN=15;
SE1=strel('line',LEN,0);
SE2=strel('line',LEN,30);
SE3=strel('line',LEN,60);
SE4=strel('line',LEN,90);
SE5=strel('line',LEN,120);
SE6=strel('line',LEN,150);
SE7=strel('line',LEN,180);
SE8=strel('line',LEN,210);
SE9=strel('line',LEN,240);
SE10=strel('line',LEN,270);
SE11=strel('line',LEN,300);
SE12=strel('line',LEN,330);

L1=imclose(img,SE1); 
L2=imclose(img,SE2); 
L3=imclose(img,SE3); 
L4=imclose(img,SE4); 
L5=imclose(img,SE5); 
L6=imclose(img,SE6); 
L7=imclose(img,SE7); 
L8=imclose(img,SE8); 
L9=imclose(img,SE9); 
L10=imclose(img,SE10); 
L11=imclose(img,SE11); 
L12=imclose(img,SE12); 

outimg=L1+L2+L3+L4+L5+L6+L7+L8+L9+L10+L11+L12-12*img;
end

