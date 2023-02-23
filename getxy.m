function [p,I] = getxy(img)
XYZ = rgb2xyz(img);
summation = sum(XYZ,3);
x = XYZ(:,:,1)./summation;
y = XYZ(:,:,2)./summation;
p = [x(:) y(:)];
I = summation(:);
end