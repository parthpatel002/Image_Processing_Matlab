% disp(func(2, 3));
% Create Image of 65x65 square
img = zeros(256,256);
for i=64:128
    for j=64:128
        img(i, j) = 255;
    end
end
figure();
imshow(img);
[m, n] = size(img);
B1 = [2 255 2; 0 255 255; 0 0 2];
B2 = [2 255 2; 255 255 0; 2 0 0];
B3 = [2 0 0; 255 255 0; 2 255 2];
B4 = [0 0 2; 0 255 255; 2 255 2];
B = [B1 B2 B3 B4];
img = [zeros(m, 1), img, zeros(m, 1)];
img = [zeros(1, n+2); img; zeros(1, n+2)];
result = zeros(m, n);
for i=2:1:m+1
    for j=2:1:n+1
        subimg = img(i-1:i+1, j-1:j+1);
        for k=1:3:10
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