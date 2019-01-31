function M=grady(I)

%Calcul le gradient en y d'une image I
%conditions de Neumann
%Syntaxe: grady(I)

[m,n]=size(I);
M=zeros(m,n);

M(1:m,1:n-1)=-I(:,1:n-1)+I(:,2:n);
M(1:m,n)=zeros(m,1);

