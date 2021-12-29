clc
clear all
close all
%population size 
p=50;
%number of pair of chromosomes requered for crossover 
c=25;
% number of chromoseome requered for mutaiion 
m=25;
% total number of generations
tg=1000;
% assign the first city 
Fc = 1;
% assign the last city
lc = 41;
%city location 

Data=[
1 40.00 50.00 
2 25.00 85.00 
3 22.00 75.00 
4 22.00 85.00 
5 20.00 80.00 
6 20.00 85.00 
7 18.00 75.00 
8 15.00 75.00 
9 15.00 80.00 
10 10.00 35.00 
11 10.00 40.00 
12 8.00 40.00 
13 8.00 45.00 
14 5.00 35.00 
15 5.00 45.00 
16 2.00 40.00 
17 0.00 40.00 
18 0.00 45.00 
19 44.00 5.00 
20 42.00 10.00
21 42.00 15.00 
22 40.00 5.00 
23 40.00 15.00 
24 38.00 5.00 
25 38.00 15.00 
26 35.00 5.00 
27 95.00 30.00 
28 95.00 35.00 
29 92.00 30.00 
30 90.00 35.00 
31 88.00 30.00 
32 88.00 35.00 
33 87.00 30.00 
34 85.00 25.00 
35 85.00 35.00 
36 67.00 85.00 
37 65.00 85.00 
38 65.00 82.00 
39 62.00 80.00
40 60.00 80.00 
41 60.00 85.00 


];

[x, y] = size(Data);
nc = x; % number of cities 
figure
title ('Blue - minimum red - Average');
xlabel('Generation')
ylabel('total travel distance')
hold on 


P=population(p,nc);
for i=1:tg
    P(p+1:p+c,:)=crossover(P,c);
    P(p+c+1:p+c+m,:)= mutation(P,m);
    E=evaluation(P,Data);
    [P, S]=selection(P,E,p);
    Mean(i) = sum(S)/p;
    Best(i)=sum(S)/p;
    plot(Mean(:),'r.'); drawnow
    hold on
    plot(Best(:),'b.'); drawnow
    
end
Min_total_distance=min(Best)
Optimal_solution=P(1,:)
[x1, y1] = size(Optimal_solution);
figure
title('Optimal Solution');
xlabel('X coordinate')
ylabel('Y coordinate')
hold on 

plot(Data(:,2),Data(:,3),'^r', 'MarkerSize',10,'LineWidth',2)
for i=1:x
    text(Data(i,2)+0.2,Data(i,3)+0.2,num2str(i), 'FontSize', 15);
end
Data2 = zeros(size(Data));
for i=1:y1
    Data2(i,:) = Data(Optimal_solution(i),:);
end
line(Data2(:,2),Data2(:,3),'LineStyle','-','LineWidth',2);