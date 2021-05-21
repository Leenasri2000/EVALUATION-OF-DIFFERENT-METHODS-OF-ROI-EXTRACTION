clc;
clear all;
close all;
RGB = imread('D_4034pp.png');
RGB = imresize(RGB,5.0);
figure,imshow(RGB);
title('original Image');
L = imsegkmeans(RGB,3);
B = labeloverlay(RGB,L);
figure,imshow(B);
threshold =180;
grayImage = im2gray(B);
figure(3), imshow(grayImage);
BW = grayImage>threshold;
figure(4), imshow(BW);

