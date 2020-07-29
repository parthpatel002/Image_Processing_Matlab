rc = input("Type the value of c ");
gamma = input("Type the value of gamma ");
img = imread('spinal_cord_1.png');
img = double(img);
[m,n]=size(img);
nwimg = zeros(m, n);
for i = 1: m
  for j = 1: n
    nwimg(i,j)= c*(img(i,j)^gamma);
  end
end

figure(1);
% Only for visual purpose, o.w. scale values using Normalisation.
imshow(nwimg,[]);

% Approximate method of scaling.
imwrite(uint8(nwimg),'spinal_cord_1_v1.bmp') 

% Scaling reqd. before storing the image using imwrite().
minima = min(nwimg(:));
maxima = max(nwimg(:));
diff = maxima-minima;
nwimg = 255*(nwimg-minima)/diff;
nwimg = uint8(nwimg);
figure(2);
imshow(nwimg);
imwrite(nwimg,'spinal_cord_1_v2.bmp')