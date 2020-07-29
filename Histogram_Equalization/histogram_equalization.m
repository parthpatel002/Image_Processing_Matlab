a=imread('he_o.jpg');
figure;
imshow(a);
a=double(a);
[m, n]=size(a);
histo=zeros(1,256);
for i=1:1:m
for j=1:1:n
curpix=a(i,j);
histo(curpix+1)=histo(curpix+1)+1;
end
end
histo=histo/(m*n);
s=zeros(1,256);
s(1)=histo(1);
for i=2:1:256
s(i)=s(i-1)+histo(i);
end
%for i=1:1:256
%for j=1:1:i
%s(i)=s(i)+hist(j);
%end
%end
s=s*255;
b=zeros(m,n);
for i=1:1:m
for j=1:1:n
b(i,j)=s(a(i,j)+1);
end
end
b=uint8(b);
figure();
imshow(b);