%% Inicialização
clear ; close all; clc

%  carrega conjunto de dados de imagens
load ('datasetimages.mat')

% Utiliza a funcao displayData para apresentar o vetor de imagens
displayData(X(1:100, :));


%  normalização
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
Z = bsxfun(@rdivide, X_norm, sigma);


%  Rondando o PCA
[m, n] = size(Z);

U = zeros(n);
S = zeros(n);

R = (1/m)*Z'*Z;
[U, S, V] = svd(R);


%  Visualizacao dos 36 top autovetores encontrados
displayData(U(:, 1:36)');


% Projeção das imagens para o espaço próprio usando os k=100 vetores principais
K = 100;
Z = zeros(size(X, 1), K);
U_reduce = U(:,1:K);
Z = X*U_reduce;


% Visualizacao usando somento K=100 dimensoes
K = 100;
X_rec = zeros(size(Z, 1), size(U, 1));
       
for i=1:size(Z,1)
  v = Z(i, :)';
  for j=1:size(U(:, 1:K),1)
    X_rec(i,j)= v' * U(j, 1:K)';
  end
end


% Apresenta os dados
subplot(1, 2, 1);
displayData(X(1:100,:));
title('faces original');
axis square;

% Apresenta os dados reconstruido
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('faces recuperada');
axis square;


