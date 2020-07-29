a=imread('g_o.png');
a=rgb2gray(a);
figure();
imshow(a);
a=double(a);
mask1=[-1,0,1;-1,0,1;-1,0,1];
mask2=[-1,-1,-1;0,0,0;1,1,1];
mask3=[-1 -1 0; -1 0 1; 0 1 1];
mask4=[0 1 1; -1 0 1; -1 -1 0];
[x, y]=size(a);
b=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
for k=1:1:3
for l=1:1:3
b(i,j)=b(i,j)+mask1(k,l)*a(i+k-2,j+l-2);
end
end
end
end
b=uint8(b);
c=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
for k=1:1:3
for l=1:1:3
c(i,j)=c(i,j)+mask2(k,l)*a(i+k-2,j+l-2);
end
end
end
end
c=uint8(c);
e=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
for k=1:1:3
for l=1:1:3
e(i,j)=e(i,j)+mask3(k,l)*a(i+k-2,j+l-2);
end
end
end
end
e=uint8(e);
f=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
for k=1:1:3
for l=1:1:3
f(i,j)=f(i,j)+mask4(k,l)*a(i+k-2,j+l-2);
end
end
end
end
f=uint8(f);
d=zeros(x,y);
for i=2:1:x-1
for j=2:1:y-1
  d(i,j)=abs(b(i,j))+abs(c(i,j))+abs(e(i,j))+abs(f(i,j));  
end
end
figure();
imshow(d, []);