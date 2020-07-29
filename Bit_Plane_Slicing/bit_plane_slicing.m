a=imread('bps_o.jpg');
%a=rgb2gray(a);
imshow(a);
[x, y]=size(a);
size(a)
a=double(a);
for k=7:-1:0
b=zeros(x, y);
for i=1:1:x
for j=1:1:y
if bitand(2^k,a(i,j))==0
% We have bitor(234, 123)=251, bitcmp(uint8(0))=255, bitxor(234, 123)=145.
b(i,j)=0;
else
b(i,j)=255;
end
end
end
b=uint8(b);
size(b)
figure();
imshow(b);
end