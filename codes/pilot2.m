clc
clear all;

addpath(genpath(pwd));

I=imread('Image set\1.jpg');
% I=imrotate(I, 90);
imshow(I);


%%
% I4=I(:, :, 1)>1.1.*I(:, :, 2);
% I4=imadjust(I4);
I4=I(:, :, 1);
imshow(I4);
mask=I(:, :, 1)>1.1.*I(:, :, 2);
imshow(mask);


f=imrect;
bw = (createMask(f));
masking=(mask).*bw;
figure(7);
imshow(masking);
SumPixel=sum(masking(:));


props = regionprops(masking, I4, 'MeanIntensity');
meanIntensities = [props.MeanIntensity]



SumPixel=sum(masking);
outI = uint8(masking).*I4;
figure (5)
imshow(outI)
SumPixelIntensity = sum(outI(:))