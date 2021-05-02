function feature = multiscale_sobel_feature(img, scale)

% initialize feature vector 
    feature = []; 
    
    for i = 1:scale
        
        % compute sobel feature use your sobel_feature.m 
        [magnitude, orientation] = sobel_feature(img);
%         f = magnitude;
        f = orientation;
        
        % concatenate feature vector 
        feature = cat(1, feature, f(:)); 
        
        % down-sample image by 2
        img = imresize(img, 1/2);

    end

end