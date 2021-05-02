img1 = imread('fft.jpg');

% 
% H = fspecial('gaussian', 25, 7);
% 
% img1 = imfilter(img1, H);
%  
 


F = fft2(img1);
S=fftshift(log(1+abs(F)));
imshow(S,[]);