clc;
clear;
% Narayana三角typeB型
% N(n,k)=(C(n,k))^2
n=input('n=');
k=n+1;
A=zeros(k,k);
for i=1:k
    for j=1:k
        if j==1
            A(i,j)=round(1);%C(n,0)=1,即A(k,1)=1
        elseif i==j
            A(i,j)=round(1);%C(n,n)=1,即A(k,k)=1
        elseif j<i&&j>1
            A(i,j)=round(mod(nchoosek(sym(i-1),sym(j-1)),2)*mod(nchoosek(sym(i-1),sym(j-1)),2));
            %为避免数值过大，精度有限的情况，先做模2结果，再进行相乘
        end
    end
end
A=mod(A,2);%模2结果
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
title('B型Narayana三角模2图' );