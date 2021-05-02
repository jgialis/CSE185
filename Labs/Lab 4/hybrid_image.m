function img_merged = hybrid_image(img1, img2, ratio)
% % split img1 and img2 into low/high frequency maps
[lpm1, hpm1] = separate_frequency(img1, ratio);
[lpm2, hpm2] = separate_frequency(img2, ratio);

% % combine the low-frequency map of img1 with the high-frequency map of img2 
% img_merged = lpm1 + hpm2;
img_merged = lpm2 + hpm1;
end