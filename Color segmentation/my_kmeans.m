   function [labels]=my_kmeans(X, k)

[m, n, p] = size(X);
X = reshape(double(X), m*n, p);
rng('default');C = X(randperm(m*n, k), :);
J_prev = inf; J = []; tol = 1e-2;

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
