clc
clear all
I=imread('x5.jpg');
r=graythresh(I);
I2=uint8(imcomplement(im2bw(I, r)));
imshow(I2)
Ifinal=I2.*I;
imshow(Ifinal);