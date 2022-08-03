clc
clear all;

addpath(genpath(pwd));

I=imread('Image set\1.jpg');
imshow(I)

[row, col, val] = size(I);
I1=I(1:row/2, 1:col, 1:3);
I2=I(row/2:row, 1:col, 1:3);
I2_original=I2;


for j=1:18
    figure(j)
imshow(I)
h=imrect;
mask=createMask(h);
imshow(mask);

[row, col, val] = size(mask);
mask1=mask(1:row/2, 1:col);
mask2=mask(row/2:row, 1:col);
imshow(mask1);
imshow(mask2);

%%

%%
slider=51;

for i=1
figure(2)
imshow(mask1);
I1_1=I1(:, :, 1)>1.1.*I1(:, :, 2);
cropped1 = double(I1(:, :, 1)).*mask1.*double(I1_1);
% mask=circshift(mask1, slider, 2);
imshow(cropped1, []);
slider=51;
Cimage1=cropped1();
imshow(Cimage1, []);
sumpixelint1=sum(sum(Cimage1))/(225)
% figure(3)
imshow(cropped1, []);
end

[~, ~, v]=find(I2_original.*uint8(mask2));
v;
[~, ~, v_original]=find(I2_original);
v_original;
% .72.*double(median(v))./double(median(v_original))
% I2=im2bw(I2, .72.*double(median(v))./double(median(v_original)));
I2=im2bw(I2, .77);
imshow(I2);
% sumpixelint2=zeros(1, 18);

%%
slider=51;
for i=1
% figure(2)
imshow(mask2);
cropped2 = double(imcomplement(I2)).*double(mask2);
imshow(cropped2, []);
% mask=circshift(mask2, slider+6, 2);
slider=51;
Cimage2=cropped2;
imshow(Cimage2, []);
sumpixelint2(i)=sum(sum(Cimage2))
end


I_final=vertcat(uint8(Cimage1), im2uint8(Cimage2));
figure(j)
imshow(I_final);
end
% sumpixelint=sumpixelint./max(sumpixelint);
% plot(sumpixelint)
% 
% s=[289 45 141 299 123 285 247 0 0 0 0 0 0 0 0 0 0 0 0 ]
s=[0 0 0 19 15 0 0 126 247 376 238 252 355 289 116 65 0 119];
% plot(s)
