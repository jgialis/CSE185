function [output, match] = template_matching_SSD(img, template, threshold)

%Initialize output to img parameter
output = img;

for u = 1 + size(template,2) : size(img, 2) - size(template,2)
    for v = 1 + size(template,1) : size(img, 1) - size(template,1)

        x1 = u - floor(size(template,2)/2); x2 = u + floor(size(template,2)/2); 
        y1 = v - floor(size(template,1)/2); y2 = v + floor(size(template,1)/2);

        patch = img(y1:y2, x1:x2);

        % SSD 
        value = patch - template;
        value = sum(value .^2);
        output(v, u) = sum(value);

    end
end

match = (output < threshold);