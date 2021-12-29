function Y = mutation(X,n)
% X = population
% n = number of chromosomes to be mutated
[x1 y1]=size(X);
Y=zeros(n,y1);
 
for z=1:n
    A=X(randi(x1),:); % select parent chromosome
    r1=1+randi(y1-1,1,2);
    while r1(1)==r1(2)
            r1=1+randi(y1-1,1,2);
    end
    B=A(1,r1(1));
    A(1,r1(1))=A(1,r1(2));
    A(1,r1(2))=B;
    Y(z,:)=A;
end
YY = Y;