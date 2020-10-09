function [x] = SST(A, b)
  
  %initializez cu zero vectorul de solutii
  numsol = size(A, 2);
  x = zeros(numsol,1);
  
  %incep rezolvarea de la ultimul element
  x(numsol) = b(numsol)/A(numsol,numsol);
  for i = (numsol-1):-1:1
    %fiecare solutie corespunzatoare randului pe care ma aflu se calculeaza
    %in functie de celelalte solutii cunoscute, prezente pe rand
    x(i) =( b(i) - A(i,(i+1):numsol)*x((i+1):numsol) )/A(i,i);
  end
 
endfunction
    