close all;
clc;
I1=imread('Harris_1.jpg');
I1 = rgb2gray(I1);
%I1=imresize(I1,3);
I2=imread('Harris_3.jpg');
I2 = rgb2gray(I2);
%I2=imresize(I2,0.9);
I3=imread('Harris_4.jpg');
I3 = rgb2gray(I3);
%I3=imresize(I3,0.9);
I4=imread('Harris_1.pgm');
%I4 = rgb2gray(I4);
%I4=imresize(I4,0.9);
%[x1,y1]=functionharris(I1);
%[x2,y2]=functionharris(I2);
%[x3,y3]=functionharris(I3);
figure(1);
subplot(421),functionharris(I1),title('my own function');

C = corner(I1);
subplot(4,2,2),imshow(I1),title('matlab-corner'),
hold on
plot(C(:,1), C(:,2), 'r.');
hold off

subplot(423),functionharris(I2),title('my own function');

C = corner(I2);
subplot(4,2,4),imshow(I2),title('matlab-corner'),
hold on
plot(C(:,1), C(:,2), 'r.');
hold off

subplot(425),functionharris(I3),title('my own function');

C = corner(I3);
subplot(426),imshow(I3),title('matlab-corner'),
hold on
plot(C(:,1), C(:,2), 'r.');
hold off

subplot(427),functionharris(I4),title('my own function');

C = corner(I4);
subplot(428),imshow(I4),title('matlab-corner'),
hold on
plot(C(:,1), C(:,2), 'r.');
hold off
