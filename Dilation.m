clc;
clear all;
close all;

Im=imread('PREPROCESSED_IMAGE.png');   
  
% convert to binary  
Im=im2bw(Im); 
se = strel('line',2,150);
I = imdilate(Im,se);
figure(1), imshow(I), title('Dilated')
se=ones(7,7);
  
% store number of rows in P and number of columns in Q.            
[P, Q]=size(se); 
  
% create a zero matrix of size I.        
In=zeros(size(I, 8), size(I, 9)); 
  
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
 figure(2), imshow(In);
