clc
clear all;

addpath(genpath(pwd));

I=imread('samplepad.jpg');

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

% 
% 
% [r, c, s]=size(I);
% class={'red', 'white'};
% nclass=2;
% distance=zeros(r, c);
% 
% distance (: ,:)=(I_ratio(:, :)-min(I_ratio));

% [value, label]=min(distance, [], 3);


%  sampleregion=zeros(r, c);

L = imsegkmeans(I,2)
B = labeloverlay(I,L);
imshow(B)

Mdl = fitcknn(I_ratio,'ClassNames',{'b','g'});