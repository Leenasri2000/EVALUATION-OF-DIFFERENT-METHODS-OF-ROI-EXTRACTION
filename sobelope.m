clc;
clear all;
close all;
A = imread('PREPROCESSED_IMAGE.png')
figure(1),imshow(A)
title('Original Image')
threshold =175;
grayImage = im2gray(A);
figure(3), imshow(grayImage);
c = grayImage>threshold;
figure(2); imshow(c);
E=edge(c,'sobel');
figure(6), imshow(E);
title('sobel');
I=bwareafilt(E,5);
figure(7), imshow(I);






