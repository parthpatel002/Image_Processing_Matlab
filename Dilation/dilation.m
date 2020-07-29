% Create Image of 65x65 square
img = zeros(256,256);
for i=64:128,
    for j=64:128,
        img(i, j) = 255;
    end
end
figure();
imshow(img);
% Symmetric Square Strel
strelSize = 31;
center = [15, 15];
h = (strelSize-1)/2;
[m, n] = size(img);
% Below 2 lines implement padding
IMG = [zeros(m, h), img, zeros(m, h)];
IMG = [zeros(h, n+(2*h)); IMG; zeros(h, n+(2*h))];
result = zeros(m, n);
for i=1+h:m+h
    for j=1+h:n+h
        subimg = IMG(i-h:i+h, j-h:j+h);
        % if (subimg(center(1),center(2)) == 255)
        %     result(i-h, j-h) = 255;
        %     continue;
        % end
        vals = subimg(:);
        [p, q] = size(vals); % q will always be 1
        for k= 1:p
            if vals(k) == 255,
                result(i-h, j-h) = 255;
                break;
            end
        end
    end
end
figure();
imshow(result);