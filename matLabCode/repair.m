function Y=repair(X,Fc,Lc)
[x y]= size(X);
A=zeroes(x,y);
for i=1:x
    B = X(i,:);
    [x1 y1] = find(B == Fc);
    B(:,y1)=[];
    [x2 y2] = find(B == Lc);
    B(:,y2)= []; 
    A(i,1) = Fc;
    A(i,2:y-1)=B;
    A(i,y)=Lc;
    
end
Y=A;
    