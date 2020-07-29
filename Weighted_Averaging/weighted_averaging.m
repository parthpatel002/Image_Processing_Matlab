a=imread('wa_o.png');
a=rgb2gray(a);
imshow(a);
a = double(a);
[m, n] = size(a);
mask = (1/20)*[1, 2, 1; 2, 8, 2 ; 1, 2, 1];
% mask = (1/56)*[5, 7, 5; 7, 8, 7; 5, 7, 5];
msk=3; % dimension of square mask
% b = zeros(m, n);
b = a;
mm = (msk-1)/2;
for i=1+(msk-1)/2: m-(msk-1)/2
  for j=1+(msk-1)/2: n-(msk-1)/2
    b(i, j) = sum(sum(mask.*a(i-mm:i+mm, j-mm:j+mm)));
    % subimg = mask.*a(i-mm:i+mm, j-mm:j+mm);
    % b(i, j) = sum(subimg(:));
  end
end
subplot(2,1,1); imshow(uint8(a));
subplot(2,1,2); imshow(uint8(b), []);