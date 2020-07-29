img=imread('cc.png');
img=rgb2gray(img);
img=imresize(img,1/4);
[m,n]=size(img);
fprintf("m:%d n:%d", m, n);
threshold=mean(img(:));
for i=1:m
    for j=1:n
        if img(i,j) <= threshold
            img(i,j)=0;
        else
            img(i,j)=255;
        end
    end
end
figure();
imshow(img);
img=double(img);
mask=zeros(m,n);
count=1;
for i=1:m
    for j=1:n
        if img(i,j)==0
            continue;
        end
        if mask(i,j)~=0
            continue;
        end
        seed=zeros(m,n);
        seed(i,j)=255;
        seed = conditioned_dilation(img,seed);
        for x=1:m
            for y=1:n
                if seed(x,y)==255
                    mask(x,y)=count;
                end
            end
        end
        fprintf("Count: %d\n", count);
        count=count+1;
    end
end
for k=1:max(count-1,4)
    result=zeros(m,n);
    for x=1:m
        for y=1:n
            if mask(x,y)==k
                result(x,y)=255;
            end
        end
    end
    figure();
    imshow(result);
end