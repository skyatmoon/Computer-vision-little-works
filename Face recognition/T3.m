train_num = 135;
test_num = 10; 
trainpath = 'Yale-FaceA\trainingset\'; 
testpath = 'Yale-FaceA\testset\';
%file = 's*';  
k=15;
train_filenames = dir([trainpath, '*.png']); % return a structure with filenames 
test_filenames = dir([testpath '*.png']); 
%train_filenames = dir([trainpath file]); % return a structure with filenames 
%test_filenames = dir([testpath file]); 
A = [];
for i = 1 :train_num
    filename = [trainpath train_filenames(i).name]; % filename in the list 
    a = imread(filename);
   % a=imresize(a,[35,35]);
    B{i}=a;
    a=a(1:195*231);
    a=double(a);
    A = [A;a]; 
end
mean_face = mean(A,1);
show_face=reshape(mean_face,231,195);
%%show_face=uint8(show_face);
figure,imshow(mat2gray(show_face));
A1 = A; 
for i = 1 :train_num
    A1(i,:) = A(i,:) - mean_face;
end
A1 = double(A1);
%[ah,aw] = size(A1); %Peform PCA on the data matrix 
C =A1' * A1;
%[ch,cw] = size(C); %calculate the top 15 eigenvectors and eigenvalues 
[V,D] = eigs(C,k); %Compute the eigenfaces 
eigenface = [];
for i = 1 : k
    mv = A1 * V(:,i);
    mv = mv/norm(mv); 
    eigenface = [eigenface mv]; 
   % [eh,ew] = size(eigenface);
end %Display the 15 eigenfaces figure;
A2=A1';
temp = A2* eigenface;
%img_project = [];
img_project=temp';
for i = 1:k 
    im = img_project(i,:);
    im=reshape(im,231,195);
    figure(2),subplot(3,5,i); 
    im = imshow(mat2gray(im));%colormap('gray');
end %Project each training image onto the new space 

accu=0;
for t = 1 :test_num
    filename = [testpath test_filenames(t).name]; % filename in the list
%read the test image
    input_img = imread(filename); 
%[p,q] = size(input_img);
    temp=input_img;
 %   temp=imresize(temp,[35,35]);
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
%img1 = im2uint8(img1); 
    img2 = B{num2};
%img2 = im2uint8(img2);
    img3 = B{num3}; 
%img3 = im2uint8(img3); 
    figure; subplot(1,4,1); 
    imshow(input_img);
    title('Test image');
    subplot(1,4,2);
    imshow(img1);
    title('Recognition image1');
    subplot(1,4,3);
    imshow(img2);
    title('Recognition image2') ;
    subplot(1,4,4); 
    imshow(img3); 
    title('Recognition image3')
   %      if class1~=class2 && class1~=class3
%          class=class1; 
%      elseif class1==class2 
%          class=class2; 
%      elseif class1==class3 
%          class=class3;
%      end
  class1=floor(index(1)/test_num)+1;
     class2=floor(index(2)/test_num)+1; 
     class3=floor(index(3)/test_num)+1; 
     if class1==class2 && class1==class3 && class2==class3 
         accu=accu+1; 
     end 

end
accuracy=accu/10;
