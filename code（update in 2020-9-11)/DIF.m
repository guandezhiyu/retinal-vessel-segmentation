function [F] = DIF(img,th)
% ��������������ɢ��
[dx,dy]=gradient(img);
[dxdx,dydx]=gradient(dx);
[dxdy,dydy]=gradient(dy);
F=dxdx*cos((th/180)*pi)+dydy*sin((th/180)*pi);
end

