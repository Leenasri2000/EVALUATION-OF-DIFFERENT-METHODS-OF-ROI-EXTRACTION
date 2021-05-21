clc;
close all;
clear all;

a = imread('B_3022pp.png');
a = rgb2gray(a);
figure(1);
imshow(a); title('Original Image');


%% Create a temporary matrix g

tmp = a;

[m n]= find(a<26);
for j = 1: length(m)
    tmp(m(j),n(j))=0;
end

[m n]= find(a>26 & a <= 150);
for j = 1: length(m)
    tmp(m(j),n(j))=0.8;
end

[m n]= find(a>150);
for j = 1: length(m)
    tmp(m(j),n(j))=0;
end

I2 = im2bw(tmp,0);
figure(2),imshow(I2);


se = strel('line',2,100);
I = imdilate(I2,se);
figure(3), imshow(I), title('Dilated')
se=ones(3, 3);
  
% store number of rows in P and number of columns in Q.            
[P, Q]=size(se); 
  
% create a zero matrix of size I.        
In=zeros(size(I, 1), size(I, 1)); 
  
for i=ceil(P/2):size(I, 1)-floor(P/2)
    for j=ceil(Q/2):size(I, 2)-floor(Q/2)
  
        % take all the neighbourhoods.
        on=I(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2)); 
  
        % take logical se
        nh=on(logical(se)); 
        
        % compare and take minimum value of the neighbor 
        % and set the pixel value to that minimum value. 
        In(i, j)=min(nh(:));      
    end
end
 figure(4), imshow(In);
 kernel = -1*ones(4);
kernel(4,4) = 175;
enhancedImage = imfilter(In, kernel);
figure(5), imshow(enhancedImage);

