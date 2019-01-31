function M=div(px,py)

%calcul de la divergence d'un vecteur (px,py)
%px et py de meme taille
%condition de Dirichlet (de sorte que div=-(grad)^*)
%Syntaxe: div(px,py)

[m,n]=size(px);

M=zeros(m,n);
Mx=M;
My=M;

Mx(2:m-1,1:n)=px(2:m-1,1:n)-px(1:m-2,1:n);
Mx(1,:)=px(1,:);
Mx(m,:)=-px(m-1,:);

My(1:m,2:n-1)=py(1:m,2:n-1)-py(1:m,1:n-2);
My(:,1)=py(:,1);
My(:,n)=-py(:,n-1);

M=Mx+My;


