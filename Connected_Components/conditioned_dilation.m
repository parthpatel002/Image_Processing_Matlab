function f=conditioned_dilation(img,seed)
    iteration=0;
    newseed=dilation_intersection(img,seed);
    while sum(seed(:))~=sum(newseed(:))
        if mod(iteration,100)==0
            fprintf("%d ",iteration);
        end
        iteration = iteration+1;
        seed=newseed;
        newseed=dilation_intersection(img,seed);
    end
    fprintf("\n");
    f=newseed;
end