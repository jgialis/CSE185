% Josue Gialis
% ID: 100319761
% Fri Jan 29, 6:30:01 PM

% 1. Set green channel to zero, and save as green.jpg
    I = imread('01.jpg');
    I(:,:,2) = 0;
    figure, imshow(I);
    imwrite(I, 'green.jpg');


% 2. Convert image from RGB to gray scale without using
% built-in functions, and save as gray.jpg
    JJ = imread('01.jpg');
    R = JJ(:,:,1);
    G = JJ(:,:,2);
    B = JJ(:,:,3);
    YY = 0.3*R + 0.6*G + 0.1*B;
    figure, imshow(YY);
    imwrite(YY, 'gray.jpg');
   

% 3. Rotate 90 degrees, and save as rotate.jpg
    III = imread('01.jpg');
    JJJ = imrotate(III,90);
    figure, imshow(JJJ);
    imwrite(JJJ, 'rotate.jpg');


% 4. Crop the image given the upper left point
% (30, 100) and lower right point (270, 300)
% and save as crop.jpg
     IIII = imread('01.jpg');
     YYYY = imcrop(IIII,[30 100 270 300]);
     figure, imshow(YYYY);
     imwrite(YYYY, 'crop.jpg');
    
    
% 5. Horizontally flip the image, and save as flip.jpg
    IIIII = imread('01.jpg');
    YYYYY = flip(IIIII);
    figure, imshow(YYYYY);
    imwrite(YYYYY, 'flip.jpg');
    
    
% 6. Combine 4 images (01.jpg ~ 04.jpg) into one matrix
% with 2 x 2 grid and 10 pixels separations, and save as combine.jpg

    I1 = imread('01.jpg');
    I2 = imread('02.jpg');
    I3 = imread('03.jpg');
    I4 = imread('04.jpg');

    cWidth = 300 * 2 + 10;
    cHeight = 400 * 2 + 10;
    canvas = zeros(cWidth, cHeight, 3, 'uint8'); 
    canvas(1:300, 1:400, :) = I1;
    canvas(310:609, 1:400, :) = I2;
    canvas(1:300, 410:809, :) = I3;
    canvas(310:609, 410:809, :) = I4;
    imwrite(canvas, 'combine.jpg');
    figure, imshow(canvas);

 


% 7. Convert images (05.jpg and 06.jpg) to vectors,
% average them, and save as average.jpg
    im1 = imread('05.jpg');
    im2 = imread('06.jpg');
    im1 = im1(:);
    im2 = im2(:);
    avg = (im1 + im2)/2;
    avg = reshape(avg,375,1242,3);
    figure, imshow(avg);
    imwrite(avg, 'average.jpg');


  
    


