function YY = crossover(X,n)
% X = population
% n = Number of chromosomes to be crossed
[x1 y1] = size(X);
Y = zeros(n,y1);
 
for z = 1:n
    B = X(randi(x1),:); % select parent chromosome
    r1 = 1 + randi(y1-1);
    C = B(1,1:r1);
    B(:,1:r1) = [];  % cut
    [x3 y3] = size(B);
    B(1,y3+1:y1) = C;
    Y(z,:) = B;
end
YY = Y;