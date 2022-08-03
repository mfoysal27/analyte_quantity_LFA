clc
clear all

I=imread('tc1.png');


I2=rgb2lab(I);

imageinfo('tc1.png')

imshow(I2);
