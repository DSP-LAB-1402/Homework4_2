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

%% 4.3.2
image_sudoko = imread('image03.jpg');
img_03_double = im2double(image_sudoko);
figure('Name', 'Original Image');
imshow(image_sudoko);

image_size = size(image_sudoko);
[cA, cH, cV, cD] = dwt2(image_sudoko, 'db1');
ch = imresize(cH, 2);
ch = ch(1:image_size(1), 1:image_size(2), :);
ch(:, :, 2) = 0;
ch(:, :, 3) = 0;
image03_horiz_line = 10 * ch + 0.7 * img_03_double;
figure('Name', 'image03 Horizental Lines');
imshow(image03_horiz_line);

%% 4.4.1
image_cam = imread('image04.png');
img_04_double = im2double(image_cam);
h = fspecial('motion', 15, 20);
MotionBlur = imfilter(img_04_double, h, 'conv', 'circular');
imshow(MotionBlur);
title('Blured Image');
%% 4.4.2

snr = [0, 0.1, 0.01, 0.001];

for i = 1:length(snr)
    wnr3 = deconvwnr(MotionBlur, h, snr(i));
    subplot(2, 2, i);
    imshow(wnr3);
    title(sprintf('Restoring Noisy Image With SNR=%.3f', snr(i)));
end
