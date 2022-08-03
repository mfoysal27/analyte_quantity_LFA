clc
clear all;

addpath(genpath(pwd));

I=imread('Image set\1.jpg');
imshow(I);

%%
bw=I(:, :, 1)>1.1*I(:, :, 3);
imshow(bw);
f=imrect;
bw = ((createMask(f)));
masking=imcomplement(mask).*bw;
figure(7);
imshow(masking);

outI = uint8(masking).*I4;
figure (5)
imshow(outI)
SumPixelIntensity = sum(outI(:))
