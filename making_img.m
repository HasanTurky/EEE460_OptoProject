clc
clear all
close all

a = ones([10 10 3],'uint8');
a(:,:,1) =a(:,:,1).*0;
a(:,:,2) =a(:,:,2).*0;
a(:,:,3) =a(:,:,3).*255;
imshow(a);
imwrite(a,'test.jpg');