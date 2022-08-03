


clc
clear all;

addpath(genpath(pwd));

he=imread('Image set\1.jpg');

lab_he = rgb2lab(he);

ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

imshow(pixel_labels,[])
title('Image Labeled by Cluster Index');
%% Clusters
% mask1 = pixel_labels==1;
% cluster1 = he .* uint8(mask1);
% imshow(cluster1)
% title('Objects in Cluster 1');

mask2 = pixel_labels==2;
cluster2 = he .* uint8(mask2);
imshow(cluster2)
title('Objects in Cluster 2');
% mask3 = pixel_labels==3;
% cluster3 = he .* uint8(mask3);
% imshow(cluster3)
% title('Objects in Cluster 3');
%%
% L = lab_he(:,:,1);
% L_red = L .* double(mask2);
% L_red = rescale(L_red);
% idx_light_red = imbinarize(nonzeros(L_red));
% 
% red_idx = find(mask2);
% mask_dark_red = mask2;
% mask_dark_red(red_idx(idx_light_red)) = 0;
% % 
% red_region = he .* uint8(mask_dark_red);
% imshow(red_region)
% title('Red region');
%% Weighted Centroids

BW=rgb2gray(cluster2);
imshow(BW)

mask=im2bw(BW, .2);
imshow(mask);


s = regionprops(mask,BW,{'Centroid','WeightedCentroid'});
imshow(BW)
title('Weighted (red) and Unweighted (blue) Centroids'); 
hold on
numObj = numel(s);
for k = 1 : numObj
    plot(s(k).WeightedCentroid(1), s(k).WeightedCentroid(2), 'r*')
    plot(s(k).Centroid(1), s(k).Centroid(2), 'bo')
end
hold off

