format rat
n=input('n=');
A=pascal(n);
B=pascal(n,1);%B=chol(A,'lower');
C=B.^2;
D=mod(C,2);
D;
D(:,:)=1-D(:,:);

figure;
imshow(D);
title('Narayana三角typeB模2图');