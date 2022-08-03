clc
clear all;

addpath(genpath(pwd));

I=imread('Image set\1.jpg');
% I=imrotate(I, 90);
imshow(I);

%%
% I4=I(:, :, 1)>1.1.*I(:, :, 2);
I4=I;
% I4=imadjust(I4);
imshow(I4);


% I5=im2bw(I4, .3);
% imshow(I5);
% I4=imcrop(I4);
% mask=im2bw(I4, .9);
% figure(4)
% imshow(mask)
% se = strel('disk',30);
% background = imopen(I4,se);
% imshow(background);
% 
% I8 = I4 - background;
% imshow(I8)
% I9=im2bw(I8);
% imshow(I9);

I4=histeq(I4);
sigma = 30;
Iflatfield = imflatfield(I4,sigma);
imshow(Iflatfield);
I_sharp=imsharpen(Iflatfield,'Radius',2,'Amount',1);
imshow(I_sharp);
I_histeq=im2bw(adapthisteq(Iflatfield), 0.3);
imshow(I_histeq);

I5=im2bw(I_histeq, 0.22);
% I5=imclearborder(I5, 4);
I5=imcomplement(I5);
imshow(I5);

% 
% [centers, radii, metric] = imfindcircles(I4,[3 100]);
% 
% centersStrong5 = centers(1:30,:); 
% radiiStrong5 = radii(1:30);
% metricStrong5 = metric(1:30);
% 
% viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');
% 
% 


% s = regionprops(I5,I4,{'Centroid','WeightedCentroid'});
% imshow(I4)
% title('Weighted (red) and Unweighted (blue) Centroids'); 
% hold on
% numObj = numel(s);
% for k = 1 : numObj
%     plot(s(k).WeightedCentroid(1), s(k).WeightedCentroid(2), 'r*')
%     plot(s(k).Centroid(1), s(k).Centroid(2), 'bo')
% end
% hold off



f=imrect;
bw = ((createMask(f)));
masking=imcomplement(mask).*bw;
figure(7);
imshow(masking);




props = regionprops(masking, I4, 'MeanIntensity');
meanIntensities = [props.MeanIntensity]



outI = uint8(masking).*I4;
figure (5)
imshow(outI)
SumPixelIntensity = sum(outI(:))


%%
I4=I(:, :, 2);
I4=imadjust(I4);
imshow(I4);


% I5=im2bw(I4, .3);
% imshow(I5);

mask=im2bw(I4, .9);
figure(4)
imshow(mask)
f=imrect;
bw = ((createMask(f)));
masking=imcomplement(mask).*bw;
props = regionprops(masking, I4, 'MeanIntensity');
meanIntensities = [props.MeanIntensity]


outI = uint8(masking, []).*I4;
figure (5)
imshow(outI)
SumPixelIntensity = sum(outI(:))

%%
% I2=rgb2gray(I);
% imshow(I2);
% 
I3=rgb2gray(I);
imshow(I3);
% I2=imcomplement(im2bw(I, .8));
% imshow(I2);
% 

% % f = imfreehand; 
% f=imrect;
% % Then draw the region using imfreehand tool
% bw = createMask(f);
% outI = bw.*I2;
% imshow(outI)
% numPixelsInsideRegion = sum(outI(:))
f=imrect;
bw = uint8(im2bw(createMask(f)));
figure(4)
imshow(bw)
outI = bw.*I3;
figure (5)
imshow(outI)
numPixelsInsideRegion = sum(outI(:))