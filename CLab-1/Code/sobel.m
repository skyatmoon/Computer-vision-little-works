function [img]=sobel(image)
[r,c] = size(image); 
dimg = double(image);
img = image; 
% s1=[-1 0 1
%     -2 0 2
%     -1 0 1];
% s2=[1 2 1
%     0 0 0
%     -1 -2 -1];
for j = 2:r-1  
    for i = 2:c-1  
       img(j,i)=sqrt((dimg(j-1,i+1)+2*dimg(j,i+1)+dimg(j+1,i+1)-dimg(j-1,i-1)-2*dimg(j,i-1)-dimg(j+1,i-1))^2+(dimg(j-1,i-1)+2*dimg(j-1,i)+dimg(j-1,i+1)-dimg(j+1,i-1)-2*dimg(j+1,i)-dimg(j+1,i+1))^2);
       img(j,i)=im2uint8(img(j,i));
       %k=atan((dimg(j-1,i-1)+2*dimg(j-1,i)+dimg(j-1,i+1)-dimg(j+1,i-1)-2*dimg(j+1,i)-dimg(j+1,i+1))/(dimg(j-1,i+1)+2*dimg(j,i+1)+dimg(j+1,i+1)-dimg(j-1,i-1)-2*dimg(j,i-1)-dimg(j+1,i-1)));
         if(img(j,i)<=45)
             img(j,i)=0;
         else
             img(j,i)=255;
         end
    end
end
img=im2uint8(img);
