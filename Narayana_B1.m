% Narayana三角typeB型
% N(n,k)=(C(n,k))^2,其中C（n,k)为二项式系数
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
            A(i,j)=round(nchoosek(sym(i-1),sym(j-1))*nchoosek(sym(i-1),sym(j-1)));
            %数值过大，显示不了
        end
    end
end
A%输出矩阵
