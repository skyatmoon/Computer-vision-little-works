%%
% CLAB2 Task-1: Harris Corner Detector
% Your name (Your uniID)£ºu6693651
function []=functionharris(bw)
bw=imresize(bw,3);bw=im2double(bw); bw=imresize(bw,0.5);sigma = 2; thresh = 0.01; % Parameters, add more if needed
% Derivative masks
dx = [-1 0 1;-1 0 1; -1 0 1];
dy = dx'; % dx is the transpose matrix of dy
% compute x and y derivatives of image
Ix = conv2(bw,dx,'same');
Iy = conv2(bw,dy,'same'); 

g = fspecial('gaussian',max(1,fix(3*sigma)*2+1),sigma);%find the gaussian convolution kernel
Ix2 = conv2(Ix.^2,g,'same'); % x and x
Iy2 = conv2(Iy.^2,g,'same'); % y and y
Ixy = conv2(Ix.*Iy,g,'same'); % x and y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Compute the Harris Cornerness                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=size(bw,1);% find out the out put result's hight
c=size(bw,2);% find out the out put result's width
corner=zeros(r,c);% build a zero vector as the out put corner
R=zeros(r,c);%build a zero vector as the response

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Perform non-maximum suppression and             %
%       thresholding, return the N corner points        %
%       as an Nx2 matrix of x and y coordinates         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% compute M matrix and corner response
t=0;
for i = 1:r
    for j =1:c
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];% compute M matrix
        R(i,j) = det(M) - 0.06*(trace(M)^2);
        if R(i,j)> t %find out the max value to use as the threshold
            t = R(i,j);
        end
    end
end

% Find the maximum value in the 3x3 neighborhood.
%Only one intersection point is the largest point of the neighborhood in the neighborhood, and the point is considered to be the corner point.
% looks for a point that satisfies both the corner threshold and the maximum point in its 8 neighborhood as a corner point
for i = 7:r-7
   for j = 7:c-7
       if R(i,j) > thresh*t && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)%non-maximum suppression
           corner(i,j) = 1; %point the corner point by 1        
       else
           corner(i,j)=0;   %the other which is not the corner is 0
       end
   end
end
[x,y] = find(corner == 1); % find out the value 1 point is the result

%drawing the crner point on thw image
imshow(bw),
hold on
plot(y,x,'g.');
hold off


