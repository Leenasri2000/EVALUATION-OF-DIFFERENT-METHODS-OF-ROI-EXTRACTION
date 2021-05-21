clc;
clear all;
close all;
A = imread('EXTRACTED_IMAGE.png');
I = imresize(A,[1000,1000]);
figure(1);
imshow(I)
title('Original Image')
BW_groundTruth = imread('GROUNDTRUTH.png');
I2 = imresize(BW_groundTruth,[1000,1000]);
dice = 2*nnz(I&I2)/(nnz(I) + nnz(I2))
