img=imread('be_o.png');
img=rgb2gray(img);
[m, n] = size(img);
% Thresholding Original Image to make it Binary Image:
avg = mean(img(:));
for i=1:m
    for j=1:n
        if img(i,j) >= avg
            img(i,j) = 255;
        else
            img(i,j) = 0;
        end
    end
end
figure();
imshow(img);
% Symmetric Square Strel
strelSize = 3;
center = [1, 1];
h = (strelSize-1)/2;
% Below 2 lines implement padding
IMG = [zeros(m, h), img, zeros(m, h)];
IMG = [zeros(h, n+(2*h)); IMG; zeros(h, n+(2*h))];
result = ones(m, n);
for i=1+h:m+h
    for j=1+h:n+h
        subimg = IMG(i-h:i+h, j-h:j+h);
        vals = subimg(:);
        [p, q] = size(vals); % q will always be 1
        for k= 1:p
            if vals(k) == 0
                result(i-h, j-h) = 0;
                break;
            end
        end
    end
end
result = result*255;
boundary_img = zeros(m, n);
for i=1:m
    for j=1:n
        boundary_img(i,j) = img(i,j)-result(i,j);
    end
end
figure();
imshow(uint8(boundary_img));