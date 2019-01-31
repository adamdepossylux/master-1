%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Chargement d’une image en Matlab:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



load gatlin2;
% -> L’image est chargee dans la variable X
%Autres images:
%load clown; load gatlin; load mandrill;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Visualisation:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imagesc(X);

colormap gray;

%pour voir l’image en niveaux de gris
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pour ouvrir une deuxieme figure:
%%%%%%%%%%%%%%%%%%%%%
figure(2)
colormap gray;
XX=imread('index.jpeg');
XX = rgb2gray(XX);
imshow(XX);
XX=double(XX);

figure(3)
filtre=bruitage_gaussien(XX,50);
imagesc(filtre);
colormap gray;

figure(4)

imb=bord(XX,50);
imagesc(imb);
colormap gray;

fitcha=chaleur(filtre,50,0.1);
imagesc(fitcha);
colormap gray;

function out = bruitage_gaussien(I,s)
[m,n]=size(I);
J=zeros(m,n);
%creation du bruiimb=bord(XX,50);

J=s*randn(m,n);
out=I+J;
end

function B=bord(A,d)
    %Extension d’une image A par reflexion (pour d pixels)
    %utile pour les conditions de Neumann
    %syntaxe: bord(A,d)
    [m,n]=size(A);
    % On cree la matrice B de la bonne taille
    M=m+2*d;
    N=n+2*d;colormap gray;
    B=zeros(M,N);
    B(d+1:M-d,d+1:N-d)=A;
    %On complete par reflexioncolormap gray;
    for i=1:m
        for j=1:d
            B(i+d,j)=A(i,d-j+1);
        end
    for j=N-d+1:N
        B(i+d,j)=A(i,n+N-j-d);
    end
    end
    for j=1:N
        for i=1:d
            B(i,j)=B(2*d-i+1,j);
        end
        for i=M-d+1:M
            B(i,j)=B(2*M-i-2*d,j);
        end
    end
end

function R=chaleur(A,T,dt)
    [m,n]=size(A);
    M=zeros(m,n);
    M=A;
    for i=1:T
        M=M+dt*div(gradx(M),grady(M));
    end
    R=M;
end



%boucle seulement en temporelle
% laplacien div(gradx(u),grady(u)))

