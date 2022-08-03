clc
clear all;

addpath(genpath(pwd));

I1=imread('Image set\1.jpg');
I_original=I1;
% I1=rgb2hsv(I1);
% I1=I1(:, :, 2);
% I(:, :, 1)=I1(:, :, 1);
% I1=I;
% I1=I1(:, :, 1)- I1(:, :, 2)>6;
% surf(I1);


I4=edge(I1, 'canny');
I4=imfill(I4, 'holes');
se = strel('disk',1);
I5 = imerode(I4,se);
% centers=imfindcircles(I1, 2);
imshow(I5);
imshow(I1);
% I1=I1(:, :, 1)>I1(:, :, 2);
%  I1=I1(:, :, 2);
%  I1=I1(:, :, 1)>1.1*I1(:, :, 2);
% imshow(I1);
% bw=bwperim(I1);

%%
% h=imrect;
% mask=createMask(h);
% imshow(mask);
% %%
% slider=51;
% for i=1:18
% %     rect2=poly2mask(h);
% figure(2)
% imshow(mask);
% cropped = double(I).*mask;
% cropped=cropped.*double(I2);
% imshow(cropped);
% mask=circshift(mask, slider, 2);
% imshow(cropped, []);
% slider=51;
% Cimage=cropped();
% imshow(Cimage, []);
% sumpixelint=sum(sum(Cimage))/(225)
% % figure(3)
% % imshow(cropped.*double(I), []);
% end


% sigma=30;
% I1=imflatfield(I1, sigma);
% I1=histeq(I1);
% % I1=im2bw(I1);
% I1=imadjust(I1);
% % I1=imsharpen(I1,'Radius',1,'Amount',5);
% imshow(I1);
% I=I1;

% I=I1(:, :, 1);
% I2=I1(:, :, 1)>170;
I=I1;
[row, col, val] = size(I);
% I=I((1:row 1:col/2, 1:3);
% imshow(I);
I2=zeros(row/2, col, 3);
I2=I(row/2:row, 1:col, 1:3);
I2=im2bw(I2, .7);

% I2=I2(:, :, 1);
imshow(I2);
% surf(I2);
h=imrect;
mask=createMask(h);
imshow(mask);
% I2=adapthisteq(I2);
% I=zeros(size(I2));
% I(:, :, 1)=I2(:, :, 1);
% I2=rgb2gray(I);
% imshow(I2);
sumpixelint=zeros(1, 18);

%%
slider=51;
for i=1:18
%     rect2=poly2mask(h);
figure(2)
imshow(mask);

% sigma=30;
% I3=imflatfield(I, sigma);
% I3=histeq(I);
% I3=imsharpen(I,'Radius',1,'Amount',5);
% I3=adapthisteq(I);
% imshow(I3);

cropped = double(imcomplement(I2)).*double(mask);

% cropped=im2bw((cropped), .70);
% cropped=cropped(:, :, 1)>cropped(:, :, 2);
% cropped=cropped.*double(I2);
% cropped=imflatfield(cropped, 30);
% T=adaptthresh(cropped, .4, 'Statistic', 'gaussian');
% cropped = imbinarize(cropped,T);
% cropped = imbinarize(cropped, 'adaptive','ForegroundPolarity','dark','Sensitivity',0.9);
% Z=cropped(:, :)>.2;
% z=im2bw(cropped, T);
imshow(cropped, []);
surf(cropped)
I4=edge(cropped, 'sobel');
imshow(I4)
I4=imfill(I4);




mask=circshift(mask, slider+6, 2);
imshow(cropped, []);
slider=51;
Cimage=cropped;
imshow(Cimage, []);
% sumpixelint(i)=((255.*sum(sum(mask)))-sum(sum(Cimage)))/(63*929)
sumpixelint(i)=sum(sum(Cimage))
% figure(3)
% imshow(cropped.*double(I), []);
end
sumpixelint=sumpixelint./max(sumpixelint);
plot(sumpixelint)
% 
% s=[289 45 141 299 123 285 247 0 0 0 0 0 0 0 0 0 0 0 0 ]
s=[0 0 0 19 15 0 0 126 247 376 238 252 355 289 116 65 0 119];
plot(s)
