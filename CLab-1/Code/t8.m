img=imread('she-rotate.jpg');
image=imresize(img,[512,512]);
figure(1);
subplot(231),imshow(image);
title("resized image");
subplot(232),imshow(my_rotation(image,-90));
title("-90 image");
subplot(233),imshow(my_rotation(image,-60));
title("-60 image");
subplot(234),imshow(my_rotation(image,-30));
title("-30 image");
subplot(235),imshow(my_rotation(image,30));
title("30 image");
subplot(236),imshow(my_rotation(image,60));
title("60 image");
%8.1
img=image;
[r,c,d] = size(img); 
r = round(r*0.5); 
c = round(c*0.5);  
img_new1 = zeros(r,c,d,class(img));
for i = 1:r 
    for j = 1:c 
        for n = 1:d 
            x = i/0.5;
            y = j/0.5; 
            img_new1(i,j,n) = img(x,y,n);
        end
    end
end
img_new1=im2uint8(img_new1);
figure(3);
subplot(131),imshow(image);
title("resized image");
subplot(132),imshow(img_new1);
title("forward image");


[r,c,d] = size(img); 
r = round(r*0.5); 
c = round(c*0.5); 
img_new2 = zeros(r,c,d,class(img));  
for i = 1:r 
    for j = 1:c 
        for n = 1:d 
            x = round(i/0.5); 
            y = round(j/0.5); 
            u = i/0.5-floor(i/0.5); 
            v = j/0.5-floor(j/0.5); 
            if i == r || j == c 
                img_new2(i,j,n) = img(x,y,n);
            else
            img_new2(i,j,n) = u*v*img(x,y,n)+(1-u)*v*img(x+1,y,n)+u*(1-v)*img(x,y+1,n)+(1-u)*(1-v)*img(x+1,y+1,n);
            end
        end
    end
end
img_new2=im2uint8(img_new2);
subplot(133),imshow(img_new2);
title("backwrd image");

%8.2
figure(2);
subplot(131),imshow(image);
title("resized image");
% T = AFFINE2D('affine',image);
% subplot(132),imshow(tformfwd(T,512,512));
subplot(132),imshow(nearest_neighbor(image,0.5));
title("nearest_neighbor");
subplot(133),imshow(bilinear_interpolation(image,0.5));
title("bilinear_interpolation");
%8.3