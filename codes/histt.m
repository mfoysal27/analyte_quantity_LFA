clc
clear all


addpath(genpath(pwd))

% I=imread('pad_1.png');
% I=rgb2gray(I);
imshow(I);
% I1=histeq(I);
% imshow(I1);

[X, Y]=size(I(:, :, 1));
I_mask=zeros (X, Y);

for i=1:X
    for j=1:Y
        if I(i, j, 1)>=1.13.*I(i, j, 2)
            I_mask(i, j)=1;
        else
            I_mask(i, j)=0;
        end
    end
end

imshow(I_mask)


load(classA);
A=[6533 4774 3147 500 0]';
A=[0 500 3147 4774 6533]';
% A=[3468 3274 1281 294 0]';
A1=[6533 6105 6818 7558 5849;
   3517 4501 4774 5269 7154;
   4220 4248 3147 2348 2295;
   580 745 417 398 500;
   0 0 0 0 0]';
% A1=[3816 3468 3323 3257 3584;
%     2881 3274 3747 3373 2801;
%     2087 1281 848 1311 1002;
%     309 304 293 119 294;
%     0 0 0 0 0]';

% A1=[4738 3124 4282 5686 5007;
%     4341 2116 5571 3436 3442;
%     1511 1564 1583 1518 2337;
%     1336 1307 1180 1152 355
%    0 0 0 0 0]';

% A1=[3.82 3.91 3.86 3.79 3.81;
%     3.36 3.09 2.51 2.68 2.98;
%     2.17 2.02 1.97 2.26 1.90;
%     1.05 1.17 1.00 0.90 0.97;
%    0 0 0 0 0]'/5;
% A=[3.87 2.98 2.02 1 0]'/5;



% A_X=categorical({'a: 10 ng', 'b: 1 ng', 'c: 100 pg', 'd: 10 pg', 'e: 1 pg' });
% bar (A_X,A)
% plot(A)
AS=[5 4 3 2 1]';

xi = linspace(min(AS), max(AS), 120);                     % Evenly-Spaced Interpolation Vector
yi = interp1(AS, A, xi, 'pchip', 'extrap');


mdl = fitlm(AS, A,'quadratic');


% D=3791;
%          
% % ypred = predict(mdl,D)
 ypred = predict(mdl)
% if (ypred> 0 & ypred<1.5)
%     disp ('1 pg');
% elseif (ypred> 1.5 & ypred<2.5)
%     disp ('10 pg');
% elseif ypred> 2.5 & ypred<3.5
%     disp ('100 pg')
% elseif ypred> 3.5 & ypred<4.5
%     disp ('1 ng')
% else
%     disp ('10 ng')
% end



% plot(AS,A,'o-',AS,ypred,'x-')
% legend('Data','Predictions')
 boxplot(A1, AS)
 hold on
 plot(xi, yi, '-r');
  hold on
 plot(AS, ypred, 'bo-');
legend('Data Median Plot','Predictions')

xticks([1 2 3 4 5])
xticklabels({'10 fg','100 fg','1 pg','10 pg','100 pg'})
% md1=fitlm (A_X, A)

% B=[7047 5718 4146 3994 3791  664 0]
% plot(B)



Mdl = fitcecoc(A(:, 1),A(:, 2));

svmStruct = fitcsvm(A(:, 1), A(:, 2))

Mdl.SupportVectors


%% 8b
A1=[6533 6105 6818 7558 5849;
   3517 4501 4774 5269 7154;
   4220 4248 3147 2348 2295;
   580 745 417 398 500;
   0 0 0 0 0]';
B=[ 0 0 0 0 0;
    580 745 417 398 500;
    4220 4248 3147 2348 2295;
    3517 4501 4774 5269 7154;
    6553 6105 6818 7558 5849;]'
B1=[0 1 2 3 4];

boxplot(B, B1);
xticklabels({'10 fg','100 fg','1 pg','10 pg','100 pg'})

B_mean=[0 500 3147 4774 6533]';

bar(B1, B_mean);
xticklabels({'10 fg','100 fg','1 pg','10 pg','100 pg'})
xlabel('Analyte Quantity (fg)');
ylabel('Weighted Sum of Text Line Red Pixel Intensity');
