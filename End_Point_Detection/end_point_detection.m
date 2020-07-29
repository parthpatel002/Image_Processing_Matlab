% img = imresize(img, 4);
% Create Image
img = zeros(256, 256);
for i=30:64
    img(i, 20) = 255;
end
for j=30:64
    img(20, j) = 255;
end
for i=30:64
    img(i, i+3) = 255;
end
for i=30:1:45
    img(i, 33) = 255;
end
[m, n] = size(img);
figure();
imshow(img);
B1 = [255 255 2; 2 2 2; 2 2 2];
B2 = [2 255 255; 2 2 2; 2 2 2];
B3 = [2 2 255; 2 2 255; 2 2 2];
B4 = [2 2 2; 2 2 255; 2 2 255];
B5 = [2 2 2; 2 2 2; 2 255 255];
B6 = [2 2 2; 2 2 2; 255 255 2];
B7 = [2 2 2; 255 2 2; 255 2 2];
B8 = [255 2 2; 255 2 2; 2 2 2];
B = [B1 B2 B3 B4 B5 B6 B7 B8];
img = [zeros(m, 1), img, zeros(m, 1)];
img = [zeros(1, n+2); img; zeros(1, n+2)];
result = zeros(m, n);
for i=2:1:m+1
    for j=2:1:n+1
        if img(i,j) ~= 255
            continue;
        end
        subimg = img(i-1:i+1, j-1:j+1);
        if sum(subimg(:)) == 2*255
            result(i-1,j-1) = 255;
            continue;
        elseif sum(subimg(:)) > 3*255
            continue;
        end
        for k=1:3:22
            mask = B(:,k:k+2);
            flag = 0;
            for x=1:1:3
                for y=1:1:3
                    if mask(x, y) == 2
                        continue;
                    end
                    if mask(x, y) ~= subimg(x, y)
                        flag = 1;
                        break;
                    end
                end
                if flag == 1
                    break;
                end
            end
            if flag == 0
                result(i-1,j-1) = 255;
                break;
            end
        end
    end
end
figure();
imshow(result);