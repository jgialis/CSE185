img = im2double(imread('lena.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;
dsConst = 1/2;

% Gaussian Pyramid 
I = img;
H = fspecial('gaussian', hsize, sigma);

% for s = 1 : scale
%         
%     % Gaussian filter using gaussian kernel and built in filter function.
%     
%     img_gaussian = imfilter(I, H);
%     
%     % Save or show image 
%     imwrite(I, sprintf('Gaussian_scale%d.jpg', s)); 
%     figure, imshow(I);
%     
%     % Down-sampling using imresize
%     I = imresize(I, dsConst);
% end

% Laplacian Pyramid 
for s = 1 : scale

    % Gaussian filtering
    img_gaussian = imfilter(I, H);

    % Laplacian filtering
    I2 = I - img_gaussian; 
    
    % Save or show image
    imwrite(I2 + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    figure, imshow(I2);
    
    % Down-sampling 
    I = imresize(I, dsConst);
end








