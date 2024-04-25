clc
clear
% Narayana三角typeA型
% N(n,k)=1/n*C(n,k)*C(n,k-1);其中C（n,k)为二项式系数
n=input('n=');
k=n+1;
A=zeros(k,k);
for i=1:k
    for j=1:k
        if j==1
            A(i,j)=round(1);%N(n,n)=1,即A(k,k)=1，模2结果即为1
        elseif i==j
            A(i,j)=round(1);%模2结果即为1
        elseif j<i && j>1 
            A(i,j)=mod(round(1/i*nchoosek(sym(i),sym(j))*(nchoosek(sym(i),sym(j-1)))),2);
            %模2
        end
    end
end
A;
A(:,:)=1-A(:,:);
figure;
imagesc(A);
colormap('gray')
% 设置 x 和 y 轴刻度位置
xticks(1:size(A, 2));
yticks(1:size(A, 1));

% 设置 x 和 y 轴刻度标签
xticklabels(1:size(A, 2));
yticklabels(1:size(A, 1));
title('A型Narayana三角模2图' );