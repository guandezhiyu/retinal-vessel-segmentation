function [img_hat,img_3] = cor(img)

% 基于形态学处理

img_clean = bwmorph(img,'clean');
img_fill=bwmorph(img_clean,'fill');
img_3=bwareaopen(img_fill,4);
img_bri=bwmorph(img_3,'bridge');
img_hat=bwmorph(img_bri,'dilate');
img_4=bwareaopen(img_fill,20);



end

