% 2016A7PS0150P
% Patel Parth
clc;
clear all;
close all;
img = imread('For_asign1.jpg');
[m, n] = size(img);
nwimg = zeros(m, n);
for i = 1: m
    for j = 1: n
        if img(i, j) >= 75 && img(i, j) <= 150
            nwimg(i, j) = 255; 
        end
    end
end
imshow(nwimg);
imwrite(nwimg, '2016A7PS0150P_Enhanced_For_assignment1.jpg');
