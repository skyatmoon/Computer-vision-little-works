 book=imread('book_page.jpg');
 yu=graythresh(book);
 %yt=graythresh(book)+0.1
 new_book=imbinarize(book,yu);
 xy=im2uint8(yu);
 figure(1);
 subplot(131),imshow(book);
 title("original image");
 subplot(132),imshow(new_book);
 title("binary image");
 subplot(133),imhist(book);
 hold on
 plot(153,4792,'rs');
 text(153,4792,[' threshold(' num2str(xy) ',' num2str(4792) ')']);
 title("                   histogram and threshold");
%7.1  7.2



 I =imread('book_page.jpg'); 
 I=im2double(I); 
 [M,N]=size(I);
 P = 2*M;
 Q = 2*N;
 I2 = zeros(P,Q);
 for i = 1:M
     for j =1:N 
         I2(i,j) = I(i,j); 
     end
 end
 I2=log(I2+1);  
 FI=fft2(I2);  
 rL=0.5; 
 rH=70; 
 c=0.1; 
 D0=30;
n1=floor(P/2);
n2=floor(Q/2);
 for u=1:P 
     for v=1:Q 
         D(u,v)=sqrt(((u-n1).^2+(v-n2).^2)); 
         H(u,v)=(rH-rL).*(1-exp(-c.*(D(u,v)^2./D0^2)))+rL; 
     end
 end
 H=ifftshift(H); 
 I3=ifft2(H.*FI); 
 I4=real(I3); 
 I5 =I4(1:M, 1:N); 
 I6=exp(I5)-1; 
 yu2=graythresh(-I6);
 image=logical(medfilt2(-(imbinarize(-I6,yu2)),[3,3]));
 figure(2),imshow(imcomplement(image),[]);
 %imwrite(imcomplement(image),"fff.jpg");
 
%7.3
image=imcomplement(image);
figure(3);
subplot(141),imshow(image,[]);
title("original binary image");
B=[0 1 0
    1 0 1
    0 1 0];
dilation=imdilate(image,B);
subplot(142),imshow(dilation,[]);
title("1st dilation");
dilation=imdilate(dilation,B);
subplot(143),imshow(dilation,[]);
title("2nd dilation");
dilation=imdilate(dilation,B);
subplot(144),imshow(dilation,[]);
title("3rd dilation");

figure(4);
subplot(141),imshow(image,[]);
title("original binary image");
s1=strel('disk',1);
s2=strel('disk',10);
s3=strel('disk',15);
erosion =imerode(image,s1);
subplot(142),imshow(erosion,[]);
title("disk=1 erosion");
erosion =imerode(image,s2);
subplot(143),imshow(erosion,[]);
title("disk=10 erosion");
erosion =imerode(image,s3);
subplot(144),imshow(erosion,[]);
title("disk=15 erosion");

figure(5);
s=strel('disk',5');
subplot(131),imshow(image,[]);
title("original binary image");
open=imopen(image,s);
subplot(132),imshow(open);
title("open image");
close=imclose(image,s);
subplot(133),imshow(close);
title("close image");
%7.4




% I=double(book);
% [M,N]=size(I);
% rL=1;
% rH=1;
% c=2;
% d0=10;
% I1=log(I+1);
% FI=fft2(I1);
% n1=floor(M/2);
% n2=floor(N/2);
% for i=1:M
%     for j=1:N
%         D(i,j)=((i-n1).^2+(j-n2).^2);
%         H(i,j)=(rH-rL).*(exp(c*(-D(i,j)./(d0^2))))+rL;
%     end
% end
% I2=ifft2(H.*FI);
% I3=real(exp(I2));
% figure(2);
% imshow(I3);



% src=imread('book_page.jpg');  
% [m,n,z] = size(src);  
% dst = zeros(m,n,z);  
% for i = 1:z  
%     ImChannel = log(double(src(:,:,i))+eps);  
%     dst(:,:,i)=retinex_frankle_mccann(ImChannel,4);   
%     dst(:,:,i)=exp(dst(:,:,i));  
%     a=min(min(dst(:,:,i)));  
%     b=max(max(dst(:,:,i)));  
%     dst(:,:,i)=((dst(:,:,i)-a)/(b-a))*255;       
% end  
% dst=uint8(dst); 
% yt=graythresh(dst);
% dst=imbinarize(dst,yt);
% figure(2);  
% imshow(dst);  

% I = imread('book_page.jpg');
% R = I(:, 1);
% [N1, M1] = size(R);
% R0 = double(R);
% Rlog = log(R0+1);
% Rfft2 = fft2(R0);
%  
% sigma = 250;
% F = fspecial('gaussian', [N1,M1], sigma);
% Efft = fft2(double(F));
%  
% DR0 = Rfft2.* Efft;
% DR = ifft2(DR0);
%  
% DRlog = log(DR +1);
% Rr = Rlog - DRlog;
% EXPRr = exp(Rr);
% MIN = min(min(EXPRr));
% MAX = max(max(EXPRr));
% EXPRr = (EXPRr - MIN)/(MAX - MIN);
% EXPRr = adapthisteq(EXPRr);
%  
% G = I(:, 2);
%  
% G0 = double(G);
% Glog = log(G0+1);
% Gfft2 = fft2(G0);
%  
% DG0 = Gfft2.* Efft;
% DG = ifft2(DG0);
%  
% DGlog = log(DG +1);
% Gg = Glog - DGlog;
% EXPGg = exp(Gg);
% MIN = min(min(EXPGg));
% MAX = max(max(EXPGg));
% EXPGg = (EXPGg - MIN)/(MAX - MIN);
% EXPGg = adapthisteq(EXPGg);
% result = cat(2, EXPRr, EXPGg);
% figure(2);
% imshow(result);
% 
% % R=book(:,1);
% % G=book(:,2);
% % im1=histeq(R);
% % im2=histeq(G);
% % add_image=histeq(book);
% 
% % g1=GetLocalHisteq(book(:,1));  
% % g2=GetLocalHisteq(book(:,2));  
% add_book=cat(2,g1,g2);  


%add_book=add_book + new_book;
% add_image=book;
%add_image=imcomplement(add_image);
%yt=graythresh(add_image);
%add_image=imbinarize(add_image,yt);
% filter1 = fspecial('gaussian', [7 7], 0.5);
% filter2 = fspecial('gaussian', [7 7], 1.6);
% high_pass = filter1 - filter2;
% log_img = log(1.0 + double(book));
% high_log_part = imfilter(log_img, high_pass, 'symmetric', 'conv');
% high_part = exp(high_log_part) - 1.0;
% minv = min(min(high_part));
% maxv = max(max(high_part));
% add_image = (high_part - minv) / (maxv - minv);
% 
% yt=graythresh(add_image);
% add_image=imbinarize(add_image,yt);
% %add_image=imcomplement(add_image);
% figure(2);
% imshow(add_image);


