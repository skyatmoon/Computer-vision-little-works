function [img_new] = nearest_neighbor(img,R) 
[r,c,d] = size(img); 
r = round(r*R); 
c = round(c*R);  
img_new = zeros(r,c,d,class(img));
for i = 1:r 
    for j = 1:c 
        for n = 1:d 
            x = round(i/R);
            y = round(j/R); 
            img_new(i,j,n) = img(x,y,n);
        end
    end
end
img_new=im2uint8(img_new);
