clc
clear all
close all

%% 
data = xlsread('new7.csv');
x = data(:,6);
y = data(:,7);
lambda = data(:,1);
lambda = lambda';
img = imread('test2.jpg');
[p, I] = getxy(img);

for i = 1:height(p)
    tx = p(i,1);
    ty = p(i,2);
    wp = [0.33 tx];
    tp = [0.33 ty];
    coefficient = polyfit(wp,tp,1);
    a = linspace(0,1,length(x));
    value = polyval(coefficient,a);
%     plot(x,y);
%     hold on
%     plot(.33,.33,'*');
%     hold on
%     plot(tx,ty,'o')
%     hold on
%     plot([x(1), x(end)],[y(1), y(end)])
%     hold on
%     plot(a,value)
    color_space = [x';y'];
    intersect = InterX([x';y'],[a;value]);
    X = [intersect(:,1)';tx ,ty];
    distance1 = pdist(X,'euclidean');
    if(width(intersect)>1)
        Y = [intersect(:,2)';tx ,ty];
        distance2 = pdist(Y,'euclidean');
    else
        intersect(:,2) = InterX([a;value],[x(1), x(end);y(1), y(end)]);
        Y = [intersect(:,2)';tx ,ty];
        distance2 = pdist(Y,'euclidean');
    end
    if distance1<distance2
        distance = distance1
        dominant_point = intersect(:,1)'
    else
        distance = distance2
        dominant_point = intersect(:,2)'
    end
    %% finding points of interest
    ad = pdist2([x y],dominant_point);
    ad_homino = ad;
    [mdis, index] = min(ad);
    ad_homino(index) = [];
    mdis2 = min(ad_homino);
    index2 = find(ad==mdis2);


    %% finding wavelength
    xval = [x(index) x(index2)];
    wL = [lambda(index) lambda(index2)];
    % ataloss = polyfit(xval,wL,1);
    % Wavelength = polyval(ataloss,dominant_point(1));
    wavelength(i) = interp1(xval,wL,dominant_point(1));
%     scatter(wavelength,I(i));
    hold on
end
%% 
stem(wavelength,I);
% [wavelength,idx] =  sort(wavelength,'ascend');
% I = I(idx);
% plot(wavelength,I);
