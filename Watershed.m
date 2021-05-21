clc;
clear all;
close all;
% read the input CT image
I=imread('PRPROCESSED_IMAGE.jpg');
figure;
imshow(I);
title('ORIGINAL IMAGE');
Igra1=rgb2gray(I);
figure;
imshow(Igra1);
title('GRAY IMAGE');
Ifil2=medfilt2(Igra1,[3,3]);
figure;
imshow(Ifil2);
title('FILTERED GRAY IMAGE');
text(732,501,'Image courtesy of Corel(R)',...
 'FontSize',7,'HorizontalAlignment','right')
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(Ifil2), hy, 'replicate');
Ix = imfilter(double(Ifil2), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure;
imshow(gradmag,[]), title('Gradient magnitude (gradmag)')
L = watershed(gradmag);
Lrgb = label2rgb(L);
figure, imshow(Lrgb), title('Watershed transform of gradient magnitude (Lrgb)')
se = strel('disk', 14);
Io = imopen(Ifil2, se);figure;
imshow(Io), title('Opening (Io)')
Ie = imerode(Ifil2, se);
Iobr = imreconstruct(Ie, Ifil2);
figure;
imshow(Iobr), title('Opening-by-reconstruction (Iobr)')
Ioc = imclose(Io, se);
figure;
imshow(Ioc), title('Opening-closing (Ioc)')
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure;
imshow(Iobrcbr), title('Opening-closing by reconstruction (Iobrcbr)')
fgm = imregionalmax(Iobrcbr);
figure;
imshow(fgm), title('Regional maxima of opening-closing by reconstruction (fgm)')
I21 = Ifil2;
Ifil2(fgm) = 225;
figure;
imshow(I21), title('Regional maxima superimposed on original image (I21)')
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);
I3 = Ifil2;
I3(fgm4) = 225;
figure;
imshow(I3)
title('Modified regional maxima superimposed on original image (fgm4)')
bw = imbinarize(Iobrcbr);
figure;
imshow(bw), title('Thresholded opening-closing by reconstruction (bw)')
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure;
imshow(bgm), title('Watershed ridge lines (bgm)')
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);
I4 = Ifil2;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 225;
figure;
imshow(I4)
title('Markers and object boundaries superimposed on original image (I4)')
Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');figure
imshow(Lrgb)
title('Colored watershed label matrix (Lrgb)')
figure;
imshow(Ifil2)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
