face = imread('face_01_u6693651.jpg');
I100=imcrop(rgb2gray(face),[348,89,325,391]);
imwrite(I100,'facecutt.jpg','jpg');
facecut= imread('facecutt.jpg','jpg');
facecut_resize=imresize(facecut,[512,512]);
figure(1);
subplot(121),imshow(face,'InitialMagnification','fit');
title("original version");
subplot(122),imshow(facecut_resize,'InitialMagnification','fit');
title("resized image");
%5.1

noise_face=imnoise(facecut_resize,'gaussian', 0, 30^2/255^2);
figure(2);
subplot(221),imshow(facecut_resize,'InitialMagnification','fit');
title("original image");
subplot(223),imhist(facecut_resize);
title("original image histogram");
subplot(222),imshow(noise_face,'InitialMagnification','fit');
title("noise image");
subplot(224),imhist(noise_face);
title("noise image histogram");
%5,2 & 5.3
[r,c]=size(noise_face);
outputimage = zeros(r, c);
figure(3);
gausfilter1 = fspecial('gaussian',[9,9],0.5);
subplot(251),imshow(myGaussfilter (noise_face, gausfilter1, outputimage));
title("My own function,考="+0.5);
subplot(256),imshow(imfilter(noise_face, gausfilter1,'replicate'));
title("Matlab function,考="+0.5);
gausfilter2 = fspecial('gaussian',[9,9],2);
subplot(252),imshow(myGaussfilter (noise_face, gausfilter2, outputimage));
title("考="+2);
subplot(257),imshow(imfilter(noise_face, gausfilter2,'replicate'));
title("考="+2);
gausfilter3 = fspecial('gaussian',[9,9],30);
subplot(253),imshow(myGaussfilter (noise_face, gausfilter3, outputimage));
title("考="+30);
subplot(2,5,8),imshow(imfilter(noise_face, gausfilter3,'replicate'));
title("考="+30);
gausfilter4 = fspecial('gaussian',[9,9],400);
subplot(254),imshow(myGaussfilter (noise_face, gausfilter4, outputimage));
title("考="+400);
subplot(2,5,9),imshow(imfilter(noise_face, gausfilter4,'replicate'));
title("考="+400);
gausfilter5 = fspecial('gaussian',[9,9],5000);
subplot(255),imshow(myGaussfilter (noise_face, gausfilter5, outputimage));
title("考="+5000);
subplot(2,5,10),imshow(imfilter(noise_face, gausfilter5,'replicate'));
title("考="+5000);
% 5.4 & 5.5




  
  
  
  
  
  
  
  
  
  
%  a=l_y1+g_y1;
%  b=k_y1;
%  c=l_y1+g_y1+g-k_y1-0.8*g;
%  d=l_y1+g_y1+0.4*g-k_y1;



















% gray_face=rgb2gray(face);
% graylevel=graythresh(gray_face);
% bw=imbinarize(gray_face,graylevel);
% [n1,n2]=size(bw);
% H=floor(n1/10);
% W=floor(n2/10);
% h1=1;
% h2=H;
% s=H*W;
% hi=H;
% wi=W;
% for i=1:10
%     w1=1;
%     w2=W;
%     for j=1:10
%         if(w1<=wi || w2>=9*W)||(h1<=hi || h2>=hi)
%             location=find(bw(h1:h2,w1:w2)==0);
%             [num,~]=size(location);
%             pr=num*100/s;
%             if pr<100
%                 bw(h1:h2,w1:w2)=0;
%             end
%         end
%         w1=w1+W;
%         w2=w2+W;
%     end
%     h1=h1+H;
%     h2=h2+H;
% end
% L=bwlabel(bw,8);
% BB=regionprops(L,'BoundingBox');
% Bd=cat(1,BB.BoundingBox);
% [Bdi,~]=size(Bd);
% mx=0;
% for k = 1:Bdi
%     p=Bd(k,3)*Bd(k,4);
%     if p>mx&&(Bd(k,3)/Bd(k,4))<1.8
%         mx=p;
%         j=k;
%     end
% end
% figure(1);
% imshow(gray_face);hold on;
% rectangle('Position',Bd(j,:),'EdgeColor','r','LineWidth',3);
