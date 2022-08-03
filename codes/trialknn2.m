

clc
clear all
addpath(genpath(pwd));

I = imread('samplepad.jpg');
I1=double(I(:,:, 1));
I2=double(I(:,:, 2));
I3=I(:,:, 3);


[r, c]=size(I);
c=c/3;

I_ratio=zeros(r, c);
for i=1:r
    for j=1:c
            I_ratio(i, j)=double(I1(i, j)./I2(i, j));
    end
end



a = double(I(:, :, 1));
b = double(I(:, :, 2));
distance = zeros([size(a), 2]);
for count = 1:2
  distance(:,:,count) = ( ((I(:, :, 1)) - mean2(I(:, :, 1))).^2 + ...
                      ((I(:, :, 2)) - mean2(I(:, :, 2))).^2);
end
color_labels = 0:1;
[~,label] = min(distance,[],3);
label = color_labels(label);
rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(I), 2],'uint8');


% montage({segmented_images(:,:,:,4).*segmented_images(:,:,:,2)});
% title("Montage of Red, Green, Purple, Magenta, and Yellow Objects, and Background")
 montage({segmented_images(:,:,:,2)});
% imshow({segmented_images(:,:,:,4)});
for count = 1:2
  color = I;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

montage({segmented_images(:,:,:,2),segmented_images(:,:,:,1)});
title("Montage of Red, Green, Purple, Magenta, and Yellow Objects, and Background")
waterfall(distance(:, :, 2))


