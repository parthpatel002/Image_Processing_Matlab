a=imread('mf_o.png');
a=rgb2gray(a);
imshow(a);
a=double(a);
b=a;
[x, y]=size(a);
for i=2:1:x-1
for j=2:1:y-1
img = a(i-1:i+1,j-1:j+1);
b(i,j)=median(img(:));
end
end
b=uint8(b);
figure;
imshow(b);
