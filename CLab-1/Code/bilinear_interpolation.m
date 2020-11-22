function [img_new] = bilinear_interpolation(img,R) 
[r,c,d] = size(img); 
r = round(r*R); 
c = round(c*R); 
img_new = zeros(r,c,d,class(img));  
for i = 1:r 
    for j = 1:c 
        for n = 1:d 
            x = round(i/R); 
            y = round(j/R); 
            u = i/R-floor(i/R); 
            v = j/R-floor(j/R); 
            if i == r || j == c 
                img_new(i,j,n) = img(x,y,n); 
            else
                img_new(i,j,n) = u*v*img(x,y,n)+(1-u)*v*img(x+1,y,n)+u*(1-v)*img(x,y+1,n)+(1-u)*(1-v)*img(x+1,y+1,n);
            end
        end
    end
end
img_new=im2uint8(img_new);
