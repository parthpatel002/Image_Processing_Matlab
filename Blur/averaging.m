a=imread('blur_o.png');
a=rgb2gray(a);
imshow(a);
a=double(a);
[x, y] = size(a);
% b = zeros(x, y); Zero Padding Case.
b = a;
masksize = 15;
mask=ones(masksize, masksize);
for i=1+floor(masksize/2):1:x-floor(masksize/2)
for j=1+floor(masksize/2):1:y-floor(masksize/2)
for k=1:1:masksize
for l=1:1:masksize
b(i,j)=b(i,j)+mask(k,l)*a(i+k-floor(masksize/2)-1,j+l-floor(masksize/2)-1);
end
end
b(i,j)=b(i,j)/(masksize*masksize);
end
end
b=uint8(b);
figure();
imshow(b);
imsave()
