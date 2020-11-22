Palettes=imread('Palettes.png');
r=Palettes(:,:,1);
g=Palettes(:,:,2);
b=Palettes(:,:,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[h,s,v]=cvRGB2HSV(r,g,b);
[row,c]=size(h);
k=[];
k(1)=1;
count=2;
for i=1:c-2
  if i==1
      continue;
  elseif h(10,i-1)~=h(10,i) && h(10,i)==h(10,i+1)
      k(count)=i;
      count=count+1;
  elseif h(10,i)~=h(10,i+1) && h(10,i)==h(10,i-1)
      k(count)=i;
      count=count+1;  
  end   
end
k(count)=c;
for m=1:count/2
for i=1:row
    fx=k(m*2)-k(m*2-1);
    for j=1:fx
        result(i,j,m)=h(i,k(m*2-1)+j-1);
        RR(i,j)=h(i,k(m*2-1)+j-1);
    end
end
end
mm=mean(mean(h(:,:)));
f1=figure(1);
set(f1,'name',"!!!!!!The H values did by cvRGB2HSV()!!!!!!");
subplot(2,3,1),imshow(h(:,:));
title("the original H Value is:"+mm);
for i=1:count/2
figure(1);
subplot(2,3,i+1),imshow(result(:,:,i));
mmm=mean(mean(result(:,:,i)));
title(" color"+i+" H Value is:"+mmm);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[H,S,V]=cvRGB2HSV(r,g,b);
[row,c]=size(H);
k=[];
k(1)=1;
count=2;
for i=1:c-2
  if i==1
      continue;
  elseif H(10,i-1)~=H(10,i) && H(10,i)==H(10,i+1)
      k(count)=i;
      count=count+1;
  elseif H(10,i)~=H(10,i+1) && H(10,i)==H(10,i-1)
      k(count)=i;
      count=count+1;  
  end   
end
k(count)=c;
for m=1:count/2
for i=1:row
    fx=k(m*2)-k(m*2-1);
    for j=1:fx
        result(i,j,m)=H(i,k(m*2-1)+j-1);
        RR(i,j)=H(i,k(m*2-1)+j-1);
    end
end
end
mm=mean(mean(h(:,:)));
f1=figure(2);
set(f1,'name',"!!!!!!The H values did by Matlab rgb2hsv()!!!!!!");
subplot(2,3,1),imshow(h(:,:));
title("the original H Value is:"+mm);
for i=1:count/2
figure(2);
subplot(2,3,i+1),imshow(result(:,:,i));
mmm=mean(mean(result(:,:,i)));
title(" color"+i+" H Value is:"+mmm);
end

