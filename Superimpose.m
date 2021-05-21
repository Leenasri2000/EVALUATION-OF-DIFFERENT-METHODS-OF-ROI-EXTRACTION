A = imread('B_3412_BO.png');
B = imrotate('B_3412_1.LEFT_MLO_MASK.jpg');
C = imfuse(A,B,'blend','Scaling','joint');
imshow(C)
