a=imread('laplace_o.png');
a=rgb2gray(a);
imshow(a);
a=double(a);
mask=[-1,-1,-1;-1,8,-1;-1,-1,-1];
[x, y]=size(a);
b=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
for k=1:1:3
for l=1:1:3
b(i,j)=b(i,j)+mask(k,l)*a(i+k-2,j+l-2);
end
end
end
end
b=uint8(b);
figure;
imshow(b);
