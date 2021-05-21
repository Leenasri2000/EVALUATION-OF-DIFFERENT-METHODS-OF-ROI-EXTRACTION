A = imread('EXTRACTED_IMAGE.png');
B = imrotate('GROUNDTRUTH.jpg');
C = imfuse(A,B,'blend','Scaling','joint');
imshow(C)
