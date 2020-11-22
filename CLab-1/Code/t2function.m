
function [] = t2function(g)
gray=rgb2gray(g);
n_gray=imcomplement(gray);%imadjust(gray,[0;1],[1;0]);
%(1)
m_gray=flip(gray,2); 
%(2)
rgb=g;
rgb(:,:,2)=g(:,:,1);
rgb(:,:,1)=g(:,:,2);
%(3)
av_gray=gray;
av_m_gray=m_gray;
sum=av_gray+av_m_gray;
% sum=mean(sum,1);
% sum=mean(sum,2);
average_gray=sum/2;
average_gray=im2uint8(average_gray);
%(4)
add_gray=gray;
r=size(gray,1);
c=size(gray,2);
for i=1:r
    for j=1:c
    add_gray(i,j)=add_gray(i,j)+randi([-255,255]);    
    end
end
add_gray=im2uint8(mod((add_gray),255));
%(5)

subplot(241),imshow(g);
title("color original version");
subplot(242),imshow(gray);
title("gray original version");
subplot(243),imshow(n_gray);
title("negative version");
subplot(244),imshow(m_gray);
title("mirror version");
subplot(245),imshow(rgb);
title("color exchange version");
subplot(246),imshow(average_gray);
title("average version");
subplot(247),imshow(add_gray);
title("rand version");