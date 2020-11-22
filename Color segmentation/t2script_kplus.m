img1=imread('peppers.png');
sc=255/65535;
img1=uint8(round(double(img1)*sc));
cform = makecform('srgb2lab'); 
img1=applycform(img1, cform); %to lab color style
nrows = size(img1,1); 
ncols = size(img1,2);
for i=1:nrows
    for j=1:ncols
        img1(i,j,4)=i;
    end
end
for i=1:nrows
    for j=1:ncols
        img1(i,j,5)=j;
    end
end
ab = double(img1(:,:,1:5));
ab2 = double(img1(:,:,1:3));

%X = reshape(ab,nrows*ncols,2)';
k=10;
[labels] = my_kmeans_plus(ab, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=10 xy Image');
k=10;
[labels] = my_kmeans_plus(ab2, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=10 no-xy Image');
k=5;
[labels] = my_kmeans_plus(ab2, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=5 no-xy Image');





img2=imread('mandm.png');
sc=255/65535;
img2=round(double(img2)*sc);
cform = makecform('srgb2lab'); 
img2=applycform(img2, cform); 
nrows = size(img2,1); 
ncols = size(img2,2);
for i=1:nrows
    for j=1:ncols
        img2(i,j,4)=i;
    end
end
for i=1:nrows
    for j=1:ncols
        img2(i,j,5)=j;
    end
end
ab = double(img2(:,:,1:5));
ab2 = double(img2(:,:,1:3));

%X = reshape(ab,nrows*ncols,2)';
k=10;
[labels] = my_kmeans_plus(ab, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=10 xy Image');
k=5;
[labels] = my_kmeans_plus(ab2, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=5 no-xy Image');
k=2;
[labels] = my_kmeans_plus(ab2, k); 
%[labels] = my_kmeans(X, k); 
pixel_labels = reshape(labels,nrows,ncols);
rgb_labels = label2rgb(pixel_labels);
figure, imshow(rgb_labels), title('k=2 no-xy Image');


