function f=dilation_intersection(img,newseed)
    [m, n] = size(newseed);
    strelSize = 3;
    h = (strelSize-1)/2;
    newseed = [zeros(m, h), newseed, zeros(m, h)];
    newseed = [zeros(h, n+(2*h)); newseed; zeros(h, n+(2*h))];
    result = zeros(m, n);
    for i=1+h:m+h
        for j=1+h:n+h
            subimg = newseed(i-h:i+h, j-h:j+h);
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
    for i=1:m
        for j=1:n
            if result(i,j)==255 && img(i,j)~=255
                result(i,j)=0;
            end
        end
    end
    f=result;
end