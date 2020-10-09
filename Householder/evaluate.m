function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  
  %obtin matricea si vectorul de caracteristici ale setului de imagini
  [X,y] = preprocess(path_to_testset, histogram, count_bins);
  predicted_y = zeros(size(X,1),1);
  correct = 0;
  
  %il formez pe X_tlde prin adaugarea coloanei de 1
  X_tilde = zeros(size(X,1),size(X,2)+1);
  X_tilde(:,1:size(X,2)) = X;
  X_tilde(:,size(X,2)+1) = 1;

  %pentru fiecare poza, calculez predictia obtinuta cu ajutorul lui w
  %si numar cate predictii sunt corecte
  for i=1:size(X,1) 
    predicted_y(i,1) = w'*X_tilde(i,:)';
    
    if predicted_y(i,1)*y(i,1) >= 0
      correct++;
    endif
  endfor
  
  %calculez procentajul
  percentage = correct/size(y,1);

endfunction