%% *Homework4_2*
%% Programmers
% Mohammad Mahdi Elyasi - 9823007
%
% Moein Nasiri - 9823093
%% Clear Workspace
close all;
clear;
clc;
%% 4.3.1

img_03 = imread('./images/Image03.jpg');
figure(1);
imshow(img_03);

image_size = size(img_03);
[cA, cH, cV, cD] = dwt2(img_03, 'db1', 'mode', 'per');
figure('Name', 'wavelet 2D');
subplot(2, 2, 1)
imagesc(cV);
title('Vertical Detail Coefficients');

subplot(2, 2, 2)
imagesc(cH);
title('Horizontal Detail Coefficients');

subplot(2, 2, 3)
imagesc(cA);
title('Approximation Coefficients');

subplot(2, 2, 4)
imagesc(cD);
title('Diagonal Coefficients');

