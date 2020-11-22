function [image]=my_rotation(img,deg)
[r,c,d]=size(img); 
H=round(r*abs(cosd(deg))+c*abs(sind(deg))); 
W=round(c*abs(cosd(deg))+r*abs(sind(deg)));
image=zeros(H,W,d); 
L1=[1 0 0;0 -1 0;-0.5*W 0.5*H 1 ]; 
L2=[1 0 0;0 -1 0;0.5*c 0.5*r 1]; 
L3=[cosd(deg) -sind(deg) 0;sind(deg) cosd(deg) 0;0 0 1]; 
for i=1:W 
    for j=1:H 
        temp=[i j 1]*L1*L3*L2; 
        y=temp(1,2); 
        x=temp(1,1); 
        y=round(y);
        x=round(x); 
        if(x>=1&&x<=c)&&(y>=1&&y<=r) 
            image(j,i,:)=img(y,x,:); 
        end
    end
end
image=uint8(image);
