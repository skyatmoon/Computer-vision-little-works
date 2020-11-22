function [h,s,v]=cvRGB2HSV(r,g,b)
  r=double(r)/ 255; 
  g=double(g)/255; 
  b=double(b)/ 255; 
  si=size(r);
  r=r(:);
  g=g(:);
  b=b(:);
  
Cmax = max(max(r,g),b);
v= Cmax;
h = zeros(size(Cmax));
s= (Cmax - min(min(r,g),b));%s now is used as derta

h(~Cmax) = 0;
x = find(r == Cmax);
h(x) = mod((g(x) - b(x))./s(x),6);
x = find(g == Cmax);
h(x) = 2 + (b(x) - r(x))./s(x);
x = find(b == Cmax);
h(x) = 4 + (r(x) - g(x))./s(x);
h = h/6;%60бу


x = find(Cmax);
s(x) = (s(x)./Cmax(x));
s(~Cmax) = 0;

h = reshape(h,si);
s = reshape(s,si);
v = reshape(Cmax,si);
%H=acos(0.5*((r-g)+(r-b))/sqrt((r-g).^2+(r-b)*(g-b)+eps));
%S=1-3*(min(min(r,g),b)/(r+g+b+eps));
%V=(1/3)*(r+g+b);
%h=im2uint8(H);
%s=im2uint8(S);
%v=im2uint8(V);
%Conversion ways in class not work





