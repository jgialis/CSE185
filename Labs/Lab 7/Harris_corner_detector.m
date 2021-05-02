function [corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold)
    
	% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    % derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];
    
    % Step 1-Image Gradients: Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    Ix = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dx, 'replicate');
    Iy = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dy, 'replicate');
%     figure, imshow(Ix + 0.5);
%     figure, imshow(Iy + 0.5);

    %Step 2-Products of Gradients: Products of Gradients compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;

    %Step 3-Matrix M: Compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2, 'replicate'); 
    Syy = imfilter(Iyy, gaussian_kernel2, 'replicate');
    Sxy = imfilter(Ixy, gaussian_kernel2, 'replicate');
    
    %Step 4-Corner Response: Compute corner response from determine and trace
    detM = (Sxx .* Syy) - (Sxy .* Sxy);
    traceM = Sxx + Syy;
    R = detM - alpha * traceM.^2;
    figure, imagesc(R); colormap jet; colorbar; axis image;
    saveas(gcf,'baboon_R.png');
    % find corner map with R > R_threshold
    corner_map = R > R_threshold;
%     figure, imshow(corner_map);

    %Step 5-Non-maximum Suppression: Find local maxima of R
    local_maxima = imregionalmax(R);
%     figure, imshow(local_maxima)
    %Final corner map and corner x, y coordinates
    final_corner_map = corner_map & local_maxima;
%     figure, imshow(final_corner_map)
    


    [corner_y, corner_x] = find(final_corner_map);
%     
% imwrite(Ix + 0.5, 'checkboard_Ix.png');
% imwrite(Iy + 0.5, 'checkboard_Iy.png');
% imwrite(corner_map, 'checkboard_corner_map.png');
% imwrite( local_maxima, 'checkboard_local_maxima.png');
% imwrite(final_corner_map, 'checkboard_final_corner_map.png');

end
