clc
clear all
addpath(genpath(pwd));
I=imread('samplepad.jpg');
% % imhist(I)
% % I1=rgb2gray(I);
% imhist(I1)
% I1=histeq(I1, [70 230]);
% % I1=rgb2gray(I1);
I1=double(I(:,:, 1));
I2=double(I(:,:, 2));
I3=I(:,:, 3);


[r, c]=size(I);
c=c/3;

I_ratio=zeros(r, c);
I_ratio2=zeros(r, c);
for i=1:r
    for j=1:c
            I_ratio(i, j)=double(I1(i, j)./I2(i, j));
    end
end

 T = graythresh(I_ratio)
% T=multithresh(I)
% T=1.13;
for i=1:r
    for j=1:c
            I_ratio2(i, j)=I_ratio(i, j)>T;
    end
end
imshow(I_ratio2(:, :, 1), []);
% I_final=uint8(I_mask);
% 
% imshow(I_mask, []);
% surf (I_mask)
% waterfall(I_mask)
% % imshow(I_final, []);
% 
%  R=double(I1(146, 180)/I2(146, 180));