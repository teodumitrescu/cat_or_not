function [w] = learn(X, y, lr, epochs)
  
  %initializez w cu numere random din [-0.1,0.1]
  w = -0.1 + (0.1+0.1).*rand(size(X,2)+1,1);
  batch_size = 64;
  
  %scalez coloanele lui x
  for i =1:size(X,2);
    X(:,i) = (X(:,i) - mean(X(:,i)))./std(X(1,i));
  endfor
  
  
  %formez X_tilde adaugand coloana de 1 la sfarsitul matricei X
  X_tilde = zeros(size(X,1),size(X,2)+1);
  X_tilde(:,1:size(X,2)) = X;
  X_tilde(:,size(X,2)+1) = 1;
  
  for epoch = 1:epochs
    
    %formez un vector de valori intregi random ce reprezinta indicii randurilor
    %din matricea X si elementul y aferent
    random_vector = randperm(size(X_tilde,1),batch_size);
    
    %initializez variabilele cu ajutorul vectorului de mai sus
    X_batch = X_tilde(random_vector,:);
    y_batch = y(random_vector,1);
    
    for i = 1:size(w)
      w(i) = w(i) - lr*(1/size(X,1))*sum((X_batch(1:batch_size,:)*w - y_batch(1:batch_size))'*X_batch(1:batch_size,1));
    endfor
  endfor
  
endfunction
