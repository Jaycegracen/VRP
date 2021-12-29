function Y=population(n,nc)
% nc = number of cities
% n = pop size
B=zeros(n,nc);
for j=1:n
    A=1:1:nc;   
    [x y]=size(A);
    for i = 1:nc
        r = randi(y);
        B(j,i)=A(r);
        A(:,r) = [];
        [x y]=size(A);
    end
end
Y=B;