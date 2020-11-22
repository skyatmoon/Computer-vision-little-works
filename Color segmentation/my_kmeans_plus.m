   function [labels]=my_kmeans_plus(X, k)
%    X=ab2;
%    k=5;

[m, n, p] = size(X);
X = reshape(double(X), m*n, p);
rng('default');C = X(randperm(m*n, k), :);
J_prev = inf; J = []; tol = 1e-2;

    
    % The k-means++ initialization.
%    C = X(:,1+round(rand*(size(X,2)-1)));
    %rng('default');
    C = X(1+round(rand*(size(X,1)-1)),:);
    labels = ones(1,size(X,1));
    for i = 2:k
        
        D = X-C(labels,:);
        D = cumsum(sqrt(dot(D,D,1)));
        D=D*rand;
%         if D(end) == 0, C(i:k,:) = X(ones(1,k-i+1),:); break; end
      %  F=find(D(end)-X<0);
        Dk=D;
        for f=1:m*n
            Dk=Dk-X(f,:);
            if (Dk(:,1)<=0) && (Dk(:,2)<=0) && (Dk(:,3)<=0)
                if C(i-1,:)==X(f,:)
                    Dk=Dk+D;
                    f=1;
                else
                break;
                end
            end
        end
        C(i,:) = X(f,:);
        
%         Q1=2*real(C*X');
%         Q2=dot(C',C',1)';
%          [~,labels] = max(bsxfun(@minus,Q1,Q2));
         T1=sum(X.^2, 2).*ones(1, i);
         T2=(sum(C.^2, 2).*ones(1, m*n))';
         T3=2*X*C';
         dist = T2+T1-T3 ;
         [~, labels] = max(dist, [], 2) ;
    end
    %     labels = ones(1,size(X,1));
while true
    dist = sum(X.^2, 2)*ones(1, k) + (sum(C.^2, 2)*ones(1, m*n))' - 2*X*C';
    [~, labels] = min(dist, [], 2) ;
    for j = 1:k
     %   C(j,:) = sum(X(j,:),2)/sum(j);
       C(j, :) = mean(X(labels == j , :));
    end
    J_cur = sum(sum((X - C(labels, :)).^2, 2));
    if norm(J_cur-J_prev, 'fro') < tol
        break;
    end
    J_prev = J_cur;
    

end
