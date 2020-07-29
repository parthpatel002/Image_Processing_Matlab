img = imread("agt_o.jpg");
figure();
imshow(img);
img=double(img);
[m, n] = size(img);
epsilon = 0.1;
N1 = 0.0;
D1 = 0;
N2 = 0.0;
D2 = 0;
T = mean(img(:)); % Initial value of T
for i=1:m
    for j=1:n
        if img(i,j) <= T
            D1 = D1+1;
            N1 = N1+img(i, j);
        else
            D2 = D2+1;
            N2 = N2+img(i, j);
        end
    end
end
newT = ((N1/D1)+(N2/D2))/2;
fprintf("T:%f , newT:%f\n", T, newT);
while abs(newT-T) > epsilon
    T = newT;
    N1 = 0.0;
    D1 = 0;
    N2 = 0.0;
    D2 = 0;
    for i=1:m
        for j=1:n
            if img(i,j) <= T
                D1 = D1+1;
                N1 = N1+img(i, j);
            else
                D2 = D2+1;
                N2 = N2+img(i, j);
            end
        end
    end
    newT = ((N1/D1)+(N2/D2))/2;
    fprintf("T:%f , newT:%f\n", T, newT);
end
result = img;
for i=1:m
    for j=1:n
        if img(i,j) <= newT
            result(i,j)=0;
        else
            result(i,j)=255;
        end
    end
end
figure();
imshow(result);
