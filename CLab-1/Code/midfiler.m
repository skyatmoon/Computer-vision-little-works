function [ image ] = midfiler( img, n )
    [ r, c ] = size(img);
    dimg = double(img);
    for i = 1: r-n+1
        for j = 1:c-n+1
            a = dimg( i:(i+n-1),  j:(j+n-1) );
            b = median(a(:));
            dimg( i+(n-1)/2,j+(n-1)/2 )=b;
        end
    end
    image = uint8(dimg);
end


% [r,c]=size(img);
% k=(n-1)*0.5;
% image=zeros(r,c,'uint8');
% d = zeros(r+2*k, c+2*k, 'double');
% for i=1:r-n+1
%     for j=1:c-n+1
%         
% %       a=d(i-k:i+k,j-k:j+k);%modle
% %  %     a=a(:);
% % %          a1=a(1:);     
% % %          for k=2:n
% % %              a1=[a1,a(k,:)];       
% % %          end                            %c->r
% %       b=median(a(:));
% %       image(i-k,j-k)=uint8(b);
% %       dimg(i+(n-1)*0.5,j+(n-1)*0.5)=b;%center
%     end
% end

