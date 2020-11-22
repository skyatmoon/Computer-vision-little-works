face=imread('face_01_u6693651.jpg');
noise_face=imnoise(face,'salt & pepper',0.1);
figure(1);
 subplot(221),imshow(noise_face);
 title("paper & salt noise image");
 
 subplot(222),imshow(midfiler(noise_face,3));
 title("my own midfiler");
 
 R=noise_face(:,:,1);
 R=medfilt2(R,[3,3]);
 G=noise_face(:,:,2);
 G=medfilt2(G,[3,3]);
 B=noise_face(:,:,3);
 B=medfilt2(B,[3,3]);
 subplot(223),imshow(cat(3,R,G,B));
 title("Matlab medfilt2(add R G B together)");
 
 gausfilter = fspecial('gaussian',[3,3],300);
 subplot(224),imshow(imfilter(noise_face, gausfilter,'replicate'));
 title("gausfilter ¦Ò=300");
%6.1
edge_face=rgb2gray(face);

figure(2);
subplot(131),imshow(edge_face);
title("original face");

subplot(132),imshow(sobel(edge_face));
title("my own sobel edge face")

subplot(133),imshow(edge(edge_face,'sobel'));
title("Matlab sobel edge face");
%6.2
