format rat
clc;
clear;
% Narayana三角typeA型
% N(n,k)=1/n*C(n,k)*C(n,k-1);
n=input('n=');
k=n+1;
A=zeros(k,k);
for i=1:k
    for j=1:k
        if j==1
            A(i,j)=round(1);
        elseif i==j
            A(i,j)=round(1);
        elseif j<i&&j>1
            A(i,j)=round(1/i*nchoosek(sym(i),sym(j))*nchoosek(sym(i),sym(j-1)));
        end
    end
end
A
%输出矩阵
%%代码不够完善，不理解，举例为啥命令行窗口单独运行nchoosek(300,150)可以显示结果，但是矩阵中显示为*号
%这对结果是否有影响，好像是没有影响
