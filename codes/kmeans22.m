clc
clear all
addpath(genpath(pwd));

I = imread('tc2.png');
I_original=flipud(fliplr(I));
I11=double(I(:,:, 1));
I22=double(I(:,:, 2));
I3=I(:,:, 3);
figure
imshow(I);
I=imcrop(I);
% I=histeq(I, 20);
imshow(I)
I1=double(I(:,:, 1));
I2=double(I(:,:, 2));
[r, c]=size(I);
c=c/3;

[R, C, o]=size(I_original);
I_ratio=zeros(r, c);
for i=1:r
    for j=1:c
            I_ratio(i, j)=double(I1(i, j)./I2(i, j));
    end
end
I_ratio2=zeros(R,C);
for i=1:R
    for j=1:C
            I_ratio2(i, j)=double(I11(i, j)./I22(i, j));
    end
end


T=multithresh(I_ratio)

I_mask=zeros(R,C);
for i=1:R
    for j=1:C
        if I_ratio2(i, j)>T
            I_mask(i, j)=1;
        else
            I_mask(i, j)=0;
        end
    end
end
figure (2)
imshow(I_mask)




% I_ratio2=zeros(r, c);
% P=(prctile(I_ratio, [75, 100]))
% for i=1:r
%     for j=1:c
%             I_ratio2(i, j)=I_ratio(i, j)>;
%     end
% end

% T = graythresh(I_ratio);
% I_ratio=im2uint8(I_ratio);
% x = double(I_ratio);
% [idx, center] = imsegkmeans(I_ratio,2);
% % Make binary image
% [nrow,ncol] = size(I);
% % labels = reshape(idx,nrow,ncol);
% BW = labels == 1;
% imshow(idx, [])
% I_ratio2=im2uint8(I_ratio);

% 
% [counts,x] = imhist(I_ratio2,2);
% stem(x,counts)
% T = otsuthresh(counts);
% 
% BW = imbinarize(I_ratio,T);
% figure
% imshow(BW, [])

% 
% 
% figure
% imshow(I);
% f=imrect;
% bw=createMask(f);

% he=(I);
% lab_he = rgb2lab(I);
% ab = lab_he(:,:,2:3);
% ab = im2single(ab);
% ab=histeq(I);
% ab=mat2gray(I_ratio);
% ab=im2uint8((ab));
ab=I;
nColors = 2;
% repeat the clustering 3 times to avoid local minima
[pixel_labels, centers] = imsegkmeans(ab,nColors, 'NumAttempts', 5);
mask1 = pixel_labels==1;
cluster1 = double(I .* uint8(mask1));
figure
imshow(cluster1)
title('Objects in Cluster 1');
mask2 = pixel_labels==2;
cluster2 = double(I .* uint8(mask2));
figure
imshow(cluster2)
title('Objects in Cluster 2');
TT=double(median(median((cluster2(:, :, 1))))/median(median((cluster2(:, :, 1)))))
multithresh(I)
I_mask=zeros(r, c);
for i=1:r
    for j=1:c
            I_mask(i, j)=(cluster2(i, j,1)./cluster2(i, j, 2))>TT;
    end
end
% imshow(I_mask);