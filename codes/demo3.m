clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format short g;
format compact;
fontSize = 25;
%===============================================================================
% Get the name of the image the user wants to use.
% baseFileName = 'image1.png';
% Get the full filename, with path prepended.
folder = []; % Determine where demo folder is (works with all versions).
% fullFileName = fullfile(folder, baseFileName);
%===============================================================================
% Read in a demo image.
grayImage = imread('C:\Users\kamru\OneDrive - Texas Tech University\Desktop\Summer 19\KRIBB project\Image set\1.jpg');
% Get the dimensions of the image.
% numberOfColorChannels should be = 1 for a gray scale image, and 3 for an RGB color image.
[rows, columns, numberOfColorChannels] = size(grayImage)
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Use weighted sum of ALL channels to create a gray scale image.
%   grayImage = rgb2gray(grayImage);
  % ALTERNATE METHOD: Convert it to gray scale by taking only the green channel,
  % which in a typical snapshot will be the least noisy channel.
  grayImage = grayImage(:, :, 2); % Take green channel.
end
% Display the image.
subplot(2, 2, 1);
imshow(grayImage, []);
axis on;
axis image;
caption = sprintf('Original Gray Scale Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;
hp = impixelinfo();
% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
% set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')
drawnow;
% Create binary image of the black blobs from grayscale image.
binaryImage = im2bw(grayImage, .7);
% Get rid of the background.
binaryImage = imclearborder(binaryImage);
% Display the image.
subplot(2, 2, 2);
imshow(binaryImage, []);
axis on;
axis image;
title('Binary Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Label the blobs
[labeledImage, numBlobs] = bwlabel(binaryImage);
% Display the image.
subplot(2, 2, 2);
imshow(binaryImage, []);
axis on;
axis image;
title('Binary Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Let's assign each blob a different color to visually show the user the distinct blobs.
coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % pseudo random color labels
% coloredLabels is an RGB image.  We could have applied a colormap instead (but only with R2014b and later)
subplot(2, 2, 3);
imshow(coloredLabels);
axis on;
axis image; % Make sure image is not artificially stretched because of screen's aspect ratio.
caption = sprintf('Pseudo colored labels, from label2rgb().');
title(caption, 'FontSize', fontSize);
drawnow;
% Make measurements of bounding box.
props = regionprops(labeledImage, 'BoundingBox');
% Display the image.
subplot(2, 2, 4);
imshow(binaryImage, []);
axis on;
axis image;
title('Binary Image with Boxes', 'FontSize', fontSize, 'Interpreter', 'None');
% Display the bounding boxes around them.
hold on;
for k = 1 : numBlobs
  thisBoundingBox = props(k).BoundingBox
  rectangle('Position', thisBoundingBox, ...
    'EdgeColor', 'c', 'LineWidth', 2);
end