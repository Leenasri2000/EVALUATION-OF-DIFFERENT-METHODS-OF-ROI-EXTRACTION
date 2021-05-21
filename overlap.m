clc;
clear all;
close all;
bboxA = [594 166 381 102]; %bounding box value of extracted ROI
bboxB = [825, 164, 123, 77]; %bounding box value of ground truth ROI
I1 = imread('D_4034Mask.jpg');
I2 = imresize(I1,[1000,1000]);
RGB = insertShape(I2,'FilledRectangle',bboxA,'Color','red');
RGB = insertShape(RGB,'FilledRectangle',bboxB,'Color','blue');
imshow(RGB)
overlapRatio = bboxOverlapRatio(bboxA,bboxB)

