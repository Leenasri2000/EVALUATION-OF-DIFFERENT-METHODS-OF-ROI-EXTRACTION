clc;
clear all;
close all;
bboxA = [306, 384, 338, 152]; %bounding box value of extracted ROI
bboxB = [247, 363, 409, 206]; %bounding box value of ground truth ROI
I = imread("D_4181_1.LEFT_CC_Mask.jpg");
I2 = imresize(I,[1000,1000]);
RGB = insertShape(I2,'FilledRectangle',bboxA,'Color','red');
RGB = insertShape(RGB,'FilledRectangle',bboxB,'Color','red');
imshow(RGB)
ssimval = ssim(bboxA,bboxB)
