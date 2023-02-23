clc
close all
clear all
a = randi(255,1,1);
% a = zeros(100,75);
% b = randi(255,100,75);
b = zeros(1,1);
c = randi(255,1,1);
A(:,:,1) = a;
A(:,:,2) = b;
A(:,:,3) = c;
imshow(A)