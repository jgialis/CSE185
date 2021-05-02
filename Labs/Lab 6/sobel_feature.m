% Compute gradient magnitude and orientation from Sobel filtering

function [magnitude, orientation] = sobel_feature(img)

    % horizontal edge 
        Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];

    % vertical edge 
        Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];

    % Sobel filtering
       sHy = imfilter(img, Hy);
       sHx = imfilter(img, Hx);

    % compute gradient magnitude and orientation 
        
        magnitude = sqrt((sHy.^2) + (sHx.^2)); 
        orientation = atan2(sHy, sHx);

end