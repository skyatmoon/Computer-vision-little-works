train_num = 144;
test_num = 11; 
trainpath = 'Yale-FaceA\trainingset2\'; 
testpath = 'Yale-FaceA\testset2\';
k=15;
train_filenames = dir([trainpath, '*.png']); % return a structure with filenames 
test_filenames = dir([testpath '*.png']); 

A = [];
for i = 1 :train_num
    filename = [trainpath train_filenames(i).name]; % filename in the list 
    a = imread(filename);
    B{i}=a;
    a=a(1:195*231);
    a=double(a);
    A = [A;a]; 
end

mean_face = mean(A,1);
show_face=reshape(mean_face,231,195);
figure,imshow(mat2gray(show_face));

A1 = A; 
for i = 1 :train_num
    A1(i,:) = A(i,:) - mean_face;
end
A1 = double(A1); %Peform PCA on the data matrix 

%不直接求a'a的特征值特征向量，而是采用SVD的方法，利用aa'的特征值特征向量来求a'a的特征值和向量
C = A1*A1';%求协方差矩阵
[V, S, D] = svd(C);
E = diag(S);
contribution = cumsum(E)./sum(E);%计算贡献率
Vk = V(:, 1:k);

eigenface = [];
for i = 1 : train_num
    mv = A1' * V(:,i);
    mv = mv/norm(mv); 
    eigenface = [eigenface mv]; 
end %Display the 15 eigenfaces figure;

temp =eigenface;
img_project=temp';
img_project2=A1'*Vk*Vk';
img_project2=img_project2';
for i = 1:k 
    im = img_project(i,:);
    im=reshape(im,231,195);
    figure(2),subplot(3,5,i); 
    im = imshow(mat2gray(im));
end %Project each training image onto the new space 

accu=0;
for t = 1 :test_num
    filename = [testpath test_filenames(t).name]; % filename in the list
%read the test image
    input_img = imread(filename); 
    temp=input_img;
    temp=temp(1:195*231);
    temp = double(temp) - mean_face; %calculate the similarity of the input to each training image
    
    %feature_vec = temp * img_project ;
    dist = [];
    for j= 1 :train_num 
        distance = norm(temp - A1(j,:))^2; 
        dist = [dist distance]; 
    end
    [dist_min, index] = sort(dist);
    num1 = index(1);
    num2 = index(2); 
    num3 = index(3);
    img1 = B{num1}; 
    img2 = B{num2};
    img3 = B{num3}; 
    img4 = mat2gray(reshape((img_project2(num1,:)+mean_face),231,195));
    img5 = mat2gray(reshape((img_project2(num2,:)+mean_face),231,195));
    img6 = mat2gray(reshape((img_project2(num3,:)+mean_face),231,195));
    figure; subplot(2,4,1); 
    imshow(input_img);
    title('Test image');
    subplot(2,4,2);
    imshow(img1);
    title('Original Recognition image1');
    subplot(2,4,3);
    imshow(img2);
    title('Original Recognition image1') ;
    subplot(2,4,4); 
    imshow(img3); 
    title('Original Recognition image1');
       subplot(2,4,6); 
    imshow(img4); 
    title('Reconstruction image3')
       subplot(2,4,7); 
    imshow(img5); 
    title('Reconstruction image3')
       subplot(2,4,8); 
    imshow(img6); 
    title('Reconstruction image3')
     class1=floor(index(1)/test_num)+1;
     class2=floor(index(2)/test_num)+1; 
     class3=floor(index(3)/test_num)+1; 
     if class1==class2 || class1==class3 || (class2==class3 && (class1==class2 || class1==class3)) 
         accu=accu+1; 
     end 
end
accuracy=accu/test_num;
