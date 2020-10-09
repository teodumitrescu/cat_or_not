function [w] = learn(X, y)
  
  %initializez w si formez X_tilde prin adaugarea coloanei de 1 la final
  w = zeros(size(X,2)+1,1);
  X_tilde = zeros(size(X,1),size(X,2)+1);
  X_tilde(:,1:size(X,2)) = X;
  X_tilde(:,size(X,2)+1) = 1;
  
  %aplic Householder si SST pentru a il gasi pe w
  [Q,R] = Householder(X_tilde);
  new = Q'*y;
  w = SST(R,new);

end
