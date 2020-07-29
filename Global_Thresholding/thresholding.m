clc;
clear all;
close all;
img = imread('cameraman.tif');
% img = rgb2gray(img);
[m, n] = size(img);
avg = mean(img(:));
% size(img(:)) is [m*n, 1]
% median(img(:))
% mode(img(:))
nwimg = ones(m, n);
for i = 1: m
for j= 1: n
if img(i,j) >= avg
nwimg(i,j) = 255;
else
nwimg(i,j) = 0;
end
end
end
imshow(nwimg);
whos;
fprintf("%d\n", 2);
disp([1, 2, 3, 4]);
enter = input("Press Enter to exit\n");



