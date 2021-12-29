function YY=evaluation(P, Data)

% P = population size 
% Data = city locations 
[x0 y0] = size(P);

for i = 1:x0
    A=P(i,:); %one chromosome
    B=zeros(size(A));
    for j1 = 1:y0-1
        [x1 y1]=find(Data(:,1)==A(1,j1));
        [x2 y2]=find(Data(:,1)==A(1,j1+1));
        B(1,j1)=sqrt((Data(x1,2)-Data(x2,2))^2+(Data(x1,3)-Data(x2,3))^2);
       
    end
    [x1 y1]=find(Data(:,1)==A(1,j1));
    [x2 y2]=find(Data(:,1)==A(1,j1+1));
  
    B(1,j1+1)=sqrt((Data(x1,2)-Data(x2,2))^2+(Data(x1,3)-Data(x2,3))^2);
    Y(1,i)=1/sum(B);
end 
YY=Y;
