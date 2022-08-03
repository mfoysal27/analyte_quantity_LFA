

clc
clear all;

addpath(genpath(pwd));

I=imread('Image set\1.jpg');
% I=imrotate(I, 90);
I_g=ones(size(I(:, :, 1)));

I_gg=(cat(3, I(:, :, 1)./255,I_g, I_g));
imshow(I_gg, [])


I=imcomplement(I(:, :, 2));
imshow(I);
I_mask=imread('Image set\mask2.jpg');
I_mask=imcomplement(I_mask);
I_mask=im2bw(I_mask);
imshow(I_mask);
% I=imrotate(I, 90);

outI = uint8(I_mask).*I;


figure (5)
imshow(outI)
while(1)
f=imrect;
bwmask=createMask(f);
out=uint8(bwmask).*outI;
% out=im2bw(out, .2);
% SumPixelIntensity = sum(out(:));
pixelvalues=sum(out(:)>0)
end