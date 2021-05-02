function [output, match] = template_matching_normcorr(img, template, threshold)

output = img;

for u = 1 + size(template,2) : size(img, 2) - size(template,2)
    for v = 1 + size(template,1) : size(img, 1) - size(template,1)

    x1 = u - floor(size(template,2)/2); x2 = u + floor(size(template,2)/2); 
    y1 = v - floor(size(template,1)/2); y2 = v + floor(size(template,1)/2);
    
    patch = I1(y1:y2, x1:x2);

    % Normalized Cross-Correlation 
    %Step 1: Convert the patch and template to vectors.
    vTemplate = mean(template(:));
    vPatch = mean(patch(:));
    
    %Step 2: Subtract their means.
    template = template(:) - vTemplate;
    patch = patch(:) - vPatch;
    
    %Step 3: Normalize their lengths to 1.
    vTemplate = template / (norm(template));
    vPatch = patch / (norm(patch));
    
    %Step 4: Final output is the result of the dot product of both:
    output(v, u) = dot(vTemplate, vPatch);
    end
end

match = (output > threshold);