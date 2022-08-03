clc
clear all

addpath(genpath(pwd))

I=imread('samplepad.jpg');
I1=I(:,:, 1);
I2=I(:,:, 2);
I3=I(:,:, 3);
imshow(I)

[r, c]=size(I);
c=c/3;

I_mask=zeros(r, c);
for i=1:r
    for j=1:c
        if I(i, j, 1)>1.0990.*I(i, j, 2)
            I_mask(i, j)=1;
        else
            I_mask(i, j)=0;
        end
    end
end
imshow(I_mask)

I_final=uint8(I_mask).*(I);
imshow(I_final, []);
Tr=min(I_final(I_final(:, :, 1)>0))
figure
I_c=imcrop(I_final);
sum(sum(I_c(I_c>Tr)))


%% grid
 [rows, columns, numberOfColorChannels] = size(I);
hold on;
lineSpacing = 20; % Whatever you want.
for row = 1 : 131 : 393
    line([1, columns], [row, row], 'Color', 'r', 'LineWidth', 1);
end
for col = 1 : 97 : columns
    line([col, col], [1, rows], 'Color', 'r', 'LineWidth', 1);
end